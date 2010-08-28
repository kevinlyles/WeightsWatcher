local L = ww_localization

local currentHooks = {}

local function splitItemLink(link)
	local _, itemId, _, gemId1, gemId2, gemId3, gemId4, suffixId, uniqueId, linkLevel = strsplit(":", link)
	-- Strip color codes
	linkLevel = strsplit("|", linkLevel)
	bareLink = strjoin(":", "item", itemId, "0:0:0:0:0", suffixId, uniqueId, linkLevel)

	return bareLink, {{gemId1}, {gemId2}, {gemId3}, {gemId4}}
end

ww_normalStatsMetatable = {
	-- Allows us to skip the nil check
	__index = function()
		return 0
	end,
	__add = function(tbl1, tbl2)
		local tbl = setmetatable({}, ww_normalStatsMetatable)

		if tbl1 ~= nil then
			for k, v in pairs(tbl1) do
				tbl[k] = v
			end
		end
		if tbl2 ~= nil then
			for k, v in pairs(tbl2) do
				tbl[k] = tbl[k] + v
			end
		end

		return tbl
	end,
}

ww_bareItemCacheMetatable = {
	__index = function(tbl, key)
		tbl[key] = WeightsWatcher.getItemStats(key)
		return tbl[key]
	end,
}

ww_itemCacheMetatable = {
	__index = function(tbl, key)
		local gemStats, socketBonusActive
		local bareLink, gems = splitItemLink(key)
		local sockets = ww_bareItemCache[bareLink].sockets

		gemStats = WeightsWatcher.getGemStats(gems)

		-- Removes gems in crafted sockets from consideration
		for i = #(sockets) + 1, #(gemStats) do
			table.remove(gemStats)
		end

		if #(sockets) > 0 then
			socketBonusActive = true
			for i = 1, #(sockets) do
				if not gemStats[i] or not WeightsWatcher.matchesSocket(gemStats[i][1][1], ww_englishSocketColors[sockets[i]]) then
					socketBonusActive = false
					break
				end
			end
		else
			socketBonusActive = false
		end

		tbl[key] = {
			socketBonusActive = socketBonusActive,
			gemStats = gemStats
		}

		return tbl[key]
	end,
}

ww_weightCacheWeightMetatable = {
	__index = function(tbl, key)
		tbl[key] = WeightsWatcher.calculateWeight(ww_bareItemCache[splitItemLink(key)], ww_itemCache[key], tbl.weight)
		return tbl[key]
	end,
}

ww_weightCacheClassMetatable = {
	__index = function(tbl, key)
		tbl[key] = setmetatable({}, ww_weightCacheWeightMetatable)
		tbl[key].weight = tbl.class[key]
		return tbl[key]
	end,
}

ww_weightCacheMetatable = {
	__index = function(tbl, key)
		tbl[key] = setmetatable({}, ww_weightCacheClassMetatable)
		tbl[key].class = ww_vars.weightsList[key]
		return tbl[key]
	end,
}

ww_weightIdealCacheWeightMetatable = {
	__index = function(tbl, key)
		if key == "bestGems" then
			local bestGems = {}

			bestGems.red, bestGems.redScore = WeightsWatcher.bestGemForSocket("red", tbl.weight, ww_vars.options.gems.qualityLimit)
			bestGems.yellow, bestGems.yellowScore = WeightsWatcher.bestGemForSocket("yellow", tbl.weight, ww_vars.options.gems.qualityLimit)
			bestGems.blue, bestGems.blueScore = WeightsWatcher.bestGemForSocket("blue", tbl.weight, ww_vars.options.gems.qualityLimit)
			bestGems.meta, bestGems.metaScore = WeightsWatcher.bestGemForSocket("meta", tbl.weight, ww_vars.options.gems.qualityLimit)

			bestGems.overall = bestGems.red
			bestGems.overallScore = bestGems.redScore
			if bestGems.overallScore < bestGems.blueScore then
				bestGems.overall = bestGems.blue
				bestGems.overallScore = bestGems.blueScore
			end
			if bestGems.overallScore < bestGems.yellowScore then
				bestGems.overall = bestGems.yellow
				bestGems.overallScore = bestGems.yellowScore
			end
			tbl.bestGems = bestGems

			return bestGems
		end

		local itemStats = ww_bareItemCache[key]
		local socketBonusWeight = WeightsWatcher.calculateWeight({normalStats = {}, socketBonusStat = itemStats.socketBonusStat}, {socketBonusActive = socketBonusActive, gemStats = {}}, tbl.weight)
		local breakSocketColors = ww_vars.options.gems.breakSocketColors or (not ww_vars.options.gems.neverBreakSocketColors and socketBonusWeight <= 0)

		local socketBonusActive = true
		local bestGems, bestGemsIgnoreSocket = {}, {}
		local gemScore, gemScoreIgnoreSocket = socketBonusWeight, 0
		for _, color in pairs(itemStats.sockets) do
			color = ww_englishSocketColors[color]
			table.insert(bestGems, tbl.bestGems[color])
			gemScore = gemScore + tbl.bestGems[color .. "Score"]
			if breakSocketColors and color ~= "meta" then
				table.insert(bestGemsIgnoreSocket, tbl.bestGems.overall)
				gemScoreIgnoreSocket = gemScoreIgnoreSocket + tbl.bestGems.overallScore
			end
		end
		gemStats = WeightsWatcher.getGemStats(bestGems)
		if breakSocketColors then
			if gemScore < gemScoreIgnoreSocket then
				socketBonusActive = false
				gemScore = gemScoreIgnoreSocket
				gemStats = WeightsWatcher.getGemStats(bestGemsIgnoreSocket)
			end
		end

		tbl[key] = {
			gemStats = gemStats,
			score = WeightsWatcher.calculateWeight(itemStats, {socketBonusActive = socketBonusActive, gemStats = gemStats}, tbl.weight),
		}
		return tbl[key]
	end,
}

ww_weightIdealCacheClassMetatable = {
	__index = function(tbl, key)
		tbl[key] = setmetatable({}, ww_weightIdealCacheWeightMetatable)
		tbl[key].weight = tbl.class[key]
		return tbl[key]
	end,
}

ww_weightIdealCacheMetatable = {
	__index = function(tbl, key)
		tbl[key] = setmetatable({}, ww_weightIdealCacheClassMetatable)
		tbl[key].class = ww_vars.weightsList[key]
		return tbl[key]
	end,
}

ww_bareItemCache = setmetatable({}, ww_bareItemCacheMetatable)
ww_itemCache = setmetatable({}, ww_itemCacheMetatable)
ww_weightCache = setmetatable({}, ww_weightCacheMetatable)
ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)

local function loadGeneralInfo()
	local _, class = UnitClass("player")
	WeightsWatcher.playerClass = class

	local slotList = {
		"AmmoSlot",
		"BackSlot",
		"ChestSlot",
		"FeetSlot",
		"Finger0Slot",
		"Finger1Slot",
		"HandsSlot",
		"HeadSlot",
		"LegsSlot",
		"MainHandSlot",
		"NeckSlot",
		"RangedSlot",
		"SecondaryHandSlot",
		"ShirtSlot",
		"ShoulderSlot",
		"TabardSlot",
		"Trinket0Slot",
		"Trinket1Slot",
		"WaistSlot",
		"WristSlot",
	}

	WeightsWatcher.slotList = {}

	local slotNum
	for _, slotName in ipairs(slotList) do
		local slotNum = GetInventorySlotInfo(slotName)
		WeightsWatcher.slotList[slotNum] = slotName
		WeightsWatcher.slotList[slotName] = slotNum
	end
end

function WeightsWatcher.ResetTables()
	local metatable = {}
	metatable.__index = function(tbl, key)
		tbl[key] = setmetatable({}, metatable)
		return tbl[key]
	end

	ww_unparsed_lines = setmetatable({}, metatable)
	ww_handle_effects_unparsed_lines = setmetatable({}, metatable)
	ww_ignored_lines = setmetatable({}, metatable)
	ww_temp_ignored_lines = setmetatable({}, metatable)
	ww_unweighted_lines = setmetatable({}, metatable)
end

local function upgradeData(dataType, varsName)
	local tempVars

	tempVars = WeightsWatcher.Upgrade(dataType)
	if tempVars then
		_G[varsName] = tempVars
		return true
	else
		WeightsWatcher.Broken(dataType)
		return false
	end
end

local function initializeAfterDataUpgrade()
	ww_initializeParser()

	ww_initializeWeightsConfig()

	SLASH_WEIGHTSWATCHER1 = L["/ww"]
	SLASH_WEIGHTSWATCHER2 = L["/weightswatcher"]
	SlashCmdList["WEIGHTSWATCHER"] =
		function(msg)
			ww_commandHandler(msg)
		end
end

function WeightsWatcher.OnInitialize()
	loadGeneralInfo()

	WeightsWatcher.ResetTables()

	if not upgradeData("account", "ww_vars") then
		return
	end
	if not upgradeData("character", "ww_charVars") then
		return
	end

	initializeAfterDataUpgrade()
end

StaticPopupDialogs["WW_INVALID_ACCOUNT_DATA"] = {
	text = L["INVALID_ACCT_DATA"],
	button1 = L["Load Defaults"],
	button2 = L["Disable WeightsWatcher"],
	OnAccept = function(self, func)
			ww_vars = copyDefaultAccountVars()
			if not upgradeData("character", "ww_charVars") then
				return
			end
			initializeAfterDataUpgrade()
		end,
	OnCancel = function(self, func)
			DisableAddOn("WeightsWatcher")
			ReloadUI()
		end,
	showAlert = true,
	timeout = 0,
	whileDead = true,
	hideOnEscape = false,
}

StaticPopupDialogs["WW_INVALID_CHARACTER_DATA"] = {
	text = L["INVALID_CHAR_DATA"],
	button1 = L["Load Defaults"],
	button2 = L["Disable WeightsWatcher"],
	OnAccept = function(self, func)
			ww_charVars = copyDefaultCharVars()
			initializeAfterDataUpgrade()
		end,
	OnCancel = function(self, func)
			DisableAddOn("WeightsWatcher")
			ReloadUI()
		end,
	showAlert = true,
	timeout = 0,
	whileDead = true,
	hideOnEscape = false,
}

function WeightsWatcher.Broken(dataType)
	if dataType == "account" then
		StaticPopup_Show("WW_INVALID_ACCOUNT_DATA")
	elseif dataType == "character" then
		StaticPopup_Show("WW_INVALID_CHARACTER_DATA")
	else
		DisableAddOn("WeightsWatcher")
		ReloadUI()
	end
end

function WeightsWatcher.HookTooltip(objectName, funcName)
	local object = getglobal(objectName)
	WeightsWatcher:SecureHook(object, funcName, function(self, ...) WeightsWatcher.displayItemStats(self, objectName, ...) end)
	table.insert(currentHooks, {object, func})
end

function WeightsWatcher.OnEnable()
	WeightsWatcher.HookTooltip("GameTooltip", "SetAuctionItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetAuctionSellItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetBagItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetBuybackItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetExistingSocketGem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetGuildBankItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetHyperlink")
	WeightsWatcher.HookTooltip("GameTooltip", "SetInboxItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetInventoryItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetLootItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetLootRollItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetMerchantItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetQuestItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetQuestLogItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetSendMailItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetSocketGem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetTradePlayerItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetTradeSkillItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetTradeTargetItem")
	WeightsWatcher.HookTooltip("GameTooltip", "SetTrainerService")
	-- Item link tooltips
	WeightsWatcher.HookTooltip("ItemRefTooltip", "SetHyperlink")
	-- Secondary and tertiary comparison tooltips
	WeightsWatcher.HookTooltip("ShoppingTooltip1", "SetExistingSocketGem")
	WeightsWatcher.HookTooltip("ShoppingTooltip1", "SetHyperlinkCompareItem")
	WeightsWatcher.HookTooltip("ShoppingTooltip1", "SetInventoryItem")
	WeightsWatcher.HookTooltip("ShoppingTooltip2", "SetExistingSocketGem")
	WeightsWatcher.HookTooltip("ShoppingTooltip2", "SetHyperlinkCompareItem")
	WeightsWatcher.HookTooltip("ShoppingTooltip2", "SetInventoryItem")
	if AtlasLootTooltip then
		WeightsWatcher.HookTooltip("AtlasLootTooltip", "SetHyperlink")
	end
end

function WeightsWatcher.OnDisable()
	for _, hook in currentHooks do
		self:Unhook(unpack(hook))
	end
	currentHooks = {}
end

local function checkForTitansGrip()
	if WeightsWatcher.playerClass ~= "WARRIOR" then
		return false
	end
	local name, _, _, _, rank = GetTalentInfo(2, 27, false, false)
	if name == L["Titan's Grip"] then
		return rank == 1
	end
	-- Minor rearranging of the tree
	for i = 1, GetNumTalents(2, false, false) do
		name, _, _, _, rank = GetTalentInfo(2, i, false, false)
		if name == L["Titan's Grip"] then
			return rank == 1
		end
	end
	-- Major rearranging of the tree
	for i = 1, GetNumTalentTabs(false, false) do
		for j = 1, GetNumTalents(2, false, false) do
			name, _, _, _, rank = GetNumTalents(i, j, false, false)
			if name == L["Titan's Grip"] then
				return rank == 1
			end
		end
	end
	return false
end

local function checkForDualWield()
	local function checkForDualWield()
		local name, _, _, _, rank = GetTalentInfo(2, 20, false, false)
		if name == L["Dual Wield"] then
			return rank == 1
		end
		-- Minor rearranging of the tree
		for i = 1, GetNumTalents(2, false, false) do
			name, _, _, _, rank = GetTalentInfo(2, i, false, false)
			if name == L["Dual Wield"] then
				return rank == 1
			end
		end
		-- Major rearranging of the tree
		for i = 1, GetNumTalentTabs(false, false) do
			for j = 1, GetNumTalents(i, false, false) do
				name, _, _, _, rank = GetNumTalents(i, j, false, false)
				if name == L["Dual Wield"] then
					return rank == 1
				end
			end
		end
		return false
	end

	local class = WeightsWatcher.playerClass
	if class == "ROGUE" or class == "DEATHKNIGHT" then
		return true
	elseif (class == "HUNTER" or class == "WARRIOR") and UnitLevel("player") >= 20 then
		return true
	elseif class == "SHAMAN" then
		return checkForDualWield()
	end
	return false
end

local function determineCompareMethod(currentSlot, compareSlot, compareSlot2, currentSubslot, compareSubslot, compareSubslot2)
	if not compareSlot and not compareSlot2 then
		return "empty"
	end

	if checkForTitansGrip() and (compareSubslot == ww_localizedSlotNames["axe"] or compareSubslot == ww_localizedSlotNames["mace"] or compareSubslot == ww_localizedSlotNames["sword"]) then
		if currentSlot == ww_localizedSlotNames["two-hand"] then
			currentSlot = ww_localizedSlotNames["one-hand"]
		end
		if compareSlot == ww_localizedSlotNames["two-hand"] then
			compareSlot = ww_localizedSlotNames["one-hand"]
		end
		if compareSlot2 == ww_localizedSlotNames["two-hand"] then
			compareSlot2 = ww_localizedSlotNames["one-hand"]
		end
	end

	if currentSlot == ww_localizedSlotNames["two-hand"] then
		return "both"
	elseif currentSlot == ww_localizedSlotNames["main hand"] then
		return "1"
	elseif currentSlot == ww_localizedSlotNames["off hand"] or currentSlot == ww_localizedSlotNames["held in off-hand"] then
		if compareSlot == ww_localizedSlotNames["two-hand"] then
			return "1"
		else
			return "2"
		end
	elseif currentSlot == ww_localizedSlotNames["one-hand"] then
		if compareSlot == ww_localizedSlotNames["two-hand"] then
			return "1"
		elseif checkForDualWield() then
			return "worst"
		else
			return "1"
		end
	elseif currentSlot == ww_localizedSlotNames["finger"] or currentSlot == ww_localizedSlotNames["trinket"] then
		return "worst"
	else
		return "1"
	end
end

local function computeDifference(compareMethod, compareScore, compareScore2, currentScore)
	if compareMethod == "empty" then
		return currentScore
	elseif compareMethod == "1" then
		return currentScore - (compareScore or 0)
	elseif compareMethod == "2" then
		return currentScore - (compareScore2 or 0)
	elseif compareMethod == "both" then
		return currentScore - ((compareScore or 0) + (compareScore2 or 0))
	elseif compareMethod == "worst" then
		return currentScore - math.min(compareScore or 0, compareScore2 or 0)
	end
end

local function colorizeDifferences(difference)
	if difference then
		if difference < 0 then
			return "%.3f (|cffff0000%+.3f|r)"
		elseif difference > 0 then
			return "%.3f (|cff00ff00%+.3f|r)"
		else
			return "%.3f (%+.3f)"
		end
	else
		return "%.3f"
	end
end

local slotConversion = {
	[ww_localizedSlotNames["head"]] = "HeadSlot",
	[ww_localizedSlotNames["shoulder"]] = "ShoulderSlot",
	[ww_localizedSlotNames["chest"]] = "ChestSlot",
	[ww_localizedSlotNames["wrist"]] = "WristSlot",
	[ww_localizedSlotNames["hands"]] = "HandsSlot",
	[ww_localizedSlotNames["waist"]] = "WaistSlot",
	[ww_localizedSlotNames["legs"]] = "LegsSlot",
	[ww_localizedSlotNames["feet"]] = "FeetSlot",
	[ww_localizedSlotNames["main hand"]] = {"MainHandSlot", "SecondaryHandSlot"},
	[ww_localizedSlotNames["off hand"]] = {"MainHandSlot", "SecondaryHandSlot"},
	[ww_localizedSlotNames["one-hand"]] = {"MainHandSlot", "SecondaryHandSlot"},
	[ww_localizedSlotNames["two-hand"]] = {"MainHandSlot", "SecondaryHandSlot"},
	[ww_localizedSlotNames["relic"]] = "RangedSlot",
	[ww_localizedSlotNames["ranged"]] = "RangedSlot",
	[ww_localizedSlotNames["thrown"]] = "RangedSlot",
	[ww_localizedSlotNames["projectile"]] = "AmmoSlot",
	[ww_localizedSlotNames["neck"]] = "NeckSlot",
	[ww_localizedSlotNames["back"]] = "BackSlot",
	[ww_localizedSlotNames["shirt"]] = "ShirtSlot",
	[ww_localizedSlotNames["tabard"]] = "TabardSlot",
	[ww_localizedSlotNames["finger"]] = {"Finger0Slot", "Finger1Slot"},
	[ww_localizedSlotNames["trinket"]] = {"Trinket0Slot", "Trinket1Slot"},
	[ww_localizedSlotNames["held in off-hand"]] = {"MainHandSlot", "SecondaryHandSlot"},
}

function WeightsWatcher.displayItemStats(tooltip, ttname)
	local link, bareLink, itemType, stackSize, sockets, gemStats
	local stat, value, str, formatStr
	local compareLink, compareBareLink, compareLink2, compareBareLink2, compareMethod
	local showWeights, showIdealWeights, showIdealGems, showIdealGemStats, showAlternateGems
	local alternateGemsExist = false

	_, link = tooltip:GetItem()
	if link == nil then
		return
	end

	_, _, _, _, _, itemType, _, stackSize = GetItemInfo(link)
	if (IsEquippableItem(link) and itemType ~= L["Container"] and itemType ~= L["Quiver"]) or (itemType == L["Gem"] and stackSize == 1) or (itemType == L["Consumable"]) or (itemType == L["Recipe"]) then
		bareLink = splitItemLink(link)
		local bareItemInfo = ww_bareItemCache[bareLink]

		showDebugInfo = ww_keyDetectors[ww_vars.options.tooltip.showDebugInfo]()
		showWeights = ww_keyDetectors[ww_vars.options.tooltip.showWeights]()
		showIdealWeights = ww_keyDetectors[ww_vars.options.tooltip.showIdealWeights]()
		showIdealGems = ww_keyDetectors[ww_vars.options.tooltip.showIdealGems]()
		showIdealGemStats = ww_keyDetectors[ww_vars.options.tooltip.showIdealGemStats]()
		showAlternateGems = ww_keyDetectors[ww_vars.options.tooltip.showAlternateGems]()

		if ttname ~= "ShoppingTooltip1" and ttname ~= "ShoppingTooltip2" and ww_vars.options.tooltip.showDifferences then
			local currentSlot, compareSlot, compareSlot2, currentSubslot, compareSubslot, compareSubslot2
			currentSlot = bareItemInfo.nonStats["slot"]
			if currentSlot and currentSlot ~= 0 then
				currentSubslot = ww_bareItemCache[bareLink].nonStats["subslot"]
				local compareSlots = slotConversion[currentSlot]
				if type(compareSlots) == "string" then
					compareLink = GetInventoryItemLink("player", WeightsWatcher.slotList[compareSlots])
				else
					compareLink = GetInventoryItemLink("player", WeightsWatcher.slotList[compareSlots[1]])
					compareLink2 = GetInventoryItemLink("player", WeightsWatcher.slotList[compareSlots[2]])
				end
				if compareLink then
					compareBareLink = splitItemLink(compareLink)
					compareSlot = ww_bareItemCache[compareBareLink].nonStats["slot"]
					compareSubslot = ww_bareItemCache[compareBareLink].nonStats["subslot"]
				end
				if compareLink2 then
					compareBareLink2 = splitItemLink(compareLink2)
					compareSlot2 = ww_bareItemCache[compareBareLink2].nonStats["slot"]
					compareSubslot2 = ww_bareItemCache[compareBareLink2].nonStats["subslot"]
				end
				compareMethod = determineCompareMethod(currentSlot, compareSlot, compareSlot2, currentSubslot, compareSubslot, compareSubslot2)
			end
		end

		local start, ttleft, origTextL, textL
		local numUnweightedEffects = 0
		-- Skip item name and "currently equipped"
		if WeightsWatcherHiddenTooltipTextLeft1:GetText() == CURRENTLY_EQUIPPED then
			start = 3
		else
			start = 2
		end

		for i = start, tooltip:NumLines() do
			ttleft = getglobal(ttname .. "TextLeft" .. i)
			origTextL = ttleft:GetText()
			textL = WeightsWatcher.preprocess(origTextL:lower())
			if rawget(ww_unparsed_lines, textL) then
				if showDebugInfo then
					ttleft:SetText(string.format("%s |cffff00ff(U)|r", string.gsub(origTextL, "(.)([\r\n]\+)", "%1 |cffff00ff(U)|r%2")))
				else
					ttleft:SetText(string.format("%s |cffff0000*|r", string.gsub(origTextL, "(.)([\r\n]\+)", "%1 |cffff0000*|r%2")))
				end
				numUnweightedEffects = numUnweightedEffects + 1
			elseif rawget(ww_ignored_lines, textL) then
				if showDebugInfo then
					ttleft:SetText(string.format("%s |cffffff00(I)|r", string.gsub(origTextL, "(.)([\r\n]\+)", "%1 |cffffff00(I)|r%2")))
				end
			elseif rawget(ww_temp_ignored_lines, textL) then
				if showDebugInfo then
					ttleft:SetText(string.format("%s |cffffff00(TI)|r", string.gsub(origTextL, "(.)([\r\n]\+)", "%1 |cffffff00(TI)|r%2")))
				end
			elseif rawget(ww_unweighted_lines, textL) then
				ttleft:SetText(string.format("%s |cffff0000*|r", string.gsub(origTextL, "(.)([\r\n]\+)", "%1 |cffff0000*|r%2")))
				numUnweightedEffects = numUnweightedEffects + 1
			end
		end
		if numUnweightedEffects > 0 then
			tooltip:AddLine(string.format(L["UNWEIGHTED_HINT"], numUnweightedEffects))
		end

		if showDebugInfo then
			for name, value in pairs(bareItemInfo.nonStats) do
				if value == true then
					tooltip:AddLine(name)
				else
					if name == "slot" or name == "subslot" then
						tooltip:AddDoubleLine(name, ww_slotDisplayNames[ww_englishSlotNames[value]])
					else
						tooltip:AddDoubleLine(name, value)
					end
				end
			end
			for name, value in pairs(bareItemInfo.normalStats) do
				tooltip:AddDoubleLine(ww_statDisplayNames[name], value)
			end
			if #(bareItemInfo.useEffects) > 0 then
				tooltip:AddLine(L["Use effects:"])
				for _, useEffect in pairs(bareItemInfo.useEffects) do
					tooltip:AddLine(string.format(L["DURATION_COOLDOWN_FORMAT"], useEffect.duration, useEffect.cooldown))
					tooltip:AddLine(string.format(L["INDENTED_STRING_FORMAT"], "Stats:"))
					for stat, value in pairs(useEffect.stats) do
						tooltip:AddDoubleLine(string.format(L["DOUBLY_INDENTED_STRING_FORMAT"], ww_statDisplayNames[stat]), value)
					end
				end
			end
			if #(bareItemInfo.stackingEquipEffects) > 0 then
				tooltip:AddLine(L["Stacking equip effects:"])
				for _, effect in pairs(bareItemInfo.stackingEquipEffects) do
					tooltip:AddDoubleLine(string.format(L["EFFECT_STAT_FORMAT"], effect.value, ww_statDisplayNames[effect.stat]), string.format(L["EFFECT_STACKS_FORMAT"], effect.numStacks))
					for trigger in pairs(effect.triggers) do
						tooltip:AddLine(string.format(L["TRIGGER_FORMAT"], ww_triggerDisplayNames[trigger]))
					end
				end
			end

			local itemInfo = ww_itemCache[link]

			if #(bareItemInfo.sockets) > 0 then
				tooltip:AddLine(L["Sockets:"])
				for _, stat in pairs(bareItemInfo.sockets) do
					tooltip:AddLine(string.format(L["INDENTED_STRING_FORMAT"], ww_socketColorDisplayNames[stat]))
				end
				if bareItemInfo.socketBonusStat then
					if itemInfo.socketBonusActive then
						tooltip:AddDoubleLine(L["Socket Bonus:"], L["Active"])
					else
						tooltip:AddDoubleLine(L["Socket Bonus:"], L["Inactive"])
					end
					for name, value in pairs(bareItemInfo.socketBonusStat) do
						tooltip:AddDoubleLine(string.format(L["INDENTED_STRING_FORMAT"], ww_statDisplayNames[name]), value)
					end
				end
				if #(itemInfo.gemStats) > 0 then
					tooltip:AddLine(L["Gem Stats:"])
					for _, gems in pairs(itemInfo.gemStats) do
						for _, gem in ipairs(gems) do
							tooltip:AddLine(string.format(L["GEM_NAME_COLOR_FORMAT"], ww_gemDisplayNames[gem[2]], ww_gemColorDisplayNames[gem[1]]))
							for stat, value in pairs(gem[3]) do
								tooltip:AddDoubleLine(string.format(L["DOUBLY_INDENTED_STRING_FORMAT"], ww_statDisplayNames[stat]), value)
							end
						end
					end
				end
			end
		end

		if showWeights then
			for _, class in ipairs(ww_charVars.activeWeights) do
				if ww_vars.weightsList[class] then
					for _, weight in pairs(ww_charVars.activeWeights[class]) do
						if ww_vars.weightsList[class][weight] then
							local currentScore = ww_weightCache[class][weight][link]
							local compareScore, compareScore2, compareBareScore, compareBareScore2
							str = weight
							if ww_vars.options.tooltip.showClassNames == "Always" or (ww_vars.options.tooltip.showClassNames == "Others" and class ~= WeightsWatcher.playerClass) then
								str = string.format(L["WEIGHT_CLASS_FORMAT"], str, ww_classDisplayNames[class])
							end
							if compareLink then
								compareScore = ww_weightCache[class][weight][compareLink]
								if showIdealWeights and #(bareItemInfo.sockets) == 0 then
									compareBareScore = ww_weightIdealCache[class][weight][compareBareLink].score
									if compareScore < compareBareScore then
										compareScore = compareBareScore
									end
								end
							end
							if compareLink2 then
								compareScore2 = ww_weightCache[class][weight][compareLink2]
								if showIdealWeights and #(bareItemInfo.sockets) == 0 then
									compareBareScore2 = ww_weightIdealCache[class][weight][compareBareLink2].score
									if compareScore2 < compareBareScore2 then
										compareScore2 = compareBareScore2
									end
								end
							end
							compareScore = computeDifference(compareMethod, compareScore, compareScore2, currentScore)
							tooltip:AddDoubleLine(str, string.format(colorizeDifferences(compareScore), currentScore, compareScore))
							if #(bareItemInfo.sockets) > 0 and showIdealWeights then
								local currentScore = ww_weightIdealCache[class][weight][bareLink].score
								local compareScore, compareScore2
								if compareBareLink then
									compareScore = ww_weightIdealCache[class][weight][compareBareLink].score
								end
								if compareBareLink2 then
									compareScore2 = ww_weightIdealCache[class][weight][compareBareLink2].score
								end
								compareScore = computeDifference(compareMethod, compareScore, compareScore2, currentScore)
								tooltip:AddDoubleLine(L["  Ideally-gemmed:"], string.format(colorizeDifferences(compareScore), currentScore, compareScore))
								if showIdealGems then
									gemStats = ww_weightIdealCache[class][weight][bareLink].gemStats
									for _, gems in ipairs(gemStats) do
										for i, gem in ipairs(gems) do
											if #(gems) > 1 then
												tooltip:AddDoubleLine(string.format(L["MULTIPLE_GEM_FORMAT"], i, #(gems), ww_gemDisplayNames[gem[2]], ww_gemColorDisplayNames[gem[1]]), " ")
												alternateGemsExist = true
											else
												tooltip:AddDoubleLine(string.format(L["SINGLE_GEM_FORMAT"], ww_gemDisplayNames[gem[2]], ww_gemColorDisplayNames[gem[1]]), " ")
											end
											if showIdealGemStats then
												for stat, value in pairs(gem[3]) do
													tooltip:AddDoubleLine(string.format(L["TREBLY_INDENTED_STRING_FORMAT"], ww_statDisplayNames[stat]), value)
												end
											end
											if not showAlternateGems then
												break
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end

		if not ww_vars.options.tooltip.hideHints then
			if showWeights then
				if not ww_vars.options.tooltip.hideHints and #(bareItemInfo.sockets) > 0 then
					if not showIdealWeights then
						if ww_vars.options.tooltip.showIdealWeights ~= "Never" then
							tooltip:AddLine(string.format(L["IDEAL_WTS_HINT"], ww_vars.options.tooltip.showIdealWeights))
						end
					elseif not showIdealGems then
						if ww_vars.options.tooltip.showIdealGems ~= "Never" then
							tooltip:AddLine(string.format(L["IDEAL_GEMS_HINT"], ww_vars.options.tooltip.showIdealGems))
						end
					else
						if not showIdealGemStats then
							if ww_vars.options.tooltip.showIdealGemStats ~= "Never" then
								tooltip:AddLine(string.format(L["IDEAL_GEM_STATS_HINT"], ww_vars.options.tooltip.showIdealGemStats))
							end
						end
						if not showAlternateGems and alternateGemsExist then
							if ww_vars.options.tooltip.showAlternateGems ~= "Never" then
								tooltip:AddLine(string.format(L["IDEAL_ALT_GEMS_HINT"], ww_vars.options.tooltip.showAlternateGems))
							end
						end
					end
				end
			elseif ww_vars.options.tooltip.showWeights ~= "Never" then
				tooltip:AddLine(string.format(L["WTS_HINT"], ww_vars.options.tooltip.showWeights))
			end
			if not showDebugInfo then
				if ww_vars.options.tooltip.showDebugInfo ~= "Never" then
					tooltip:AddLine(string.format(L["DEBUG_HINT"], ww_vars.options.tooltip.showDebugInfo))
				end
			end
		end

		tooltip:Show()
	end
end

function WeightsWatcher.bestGemForSocket(socketColor, weightScale, qualityLimit)
	local bestGem, bestWeight, weight = {}, 0
	if not qualityLimit then
		qualityLimit = #(ww_gems["Normal"])
	end

	for gemSource, gems in pairs(ww_gems) do
		if ww_vars.options.gems.sources[gemSource] then
			for gemType, gems in pairs(gems) do
				if ww_vars.options.gems.types[gemType] then
					for quality = qualityLimit, 1, -1 do
						if gems[quality] then
							for gemId, gemStats in pairs(gems[quality]) do
								if WeightsWatcher.matchesSocket(gemStats[1], socketColor) then
									weight = WeightsWatcher.calculateWeight({normalStats = {}}, {gemStats = {{gemStats}}}, weightScale)
									if #(bestGem) == 0 or weight > bestWeight then
										bestGem = {gemId}
										bestWeight = weight
									elseif weight == bestWeight then
										local duplicate = false
										for _, gem in pairs(bestGem) do
											if WeightsWatcher.GemInfo(gem).info[2] == gemStats[2] then
												duplicate = true
												break
											end
										end
										if not duplicate then
											table.insert(bestGem, gemId)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	return bestGem, bestWeight
end

local socketColors = {
	["blue"] = {
		["blue"] = true,
		["green"] = true,
		["prismatic"] = true,
		["purple"] = true,
	},
	["red"] = {
		["orange"] = true,
		["prismatic"] = true,
		["purple"] = true,
		["red"] = true,
	},
	["meta"] = {
		["meta"] = true,
	},
	["prismatic"] = {
		["blue"] = true,
		["green"] = true,
		["orange"] = true,
		["prismatic"] = true,
		["purple"] = true,
		["red"] = true,
		["yellow"] = true,
	},
	["yellow"] = {
		["green"] = true,
		["orange"] = true,
		["prismatic"] = true,
		["yellow"] = true,
	},
}

function WeightsWatcher.matchesSocket(gemId, socketColor)
	local gemColor

	if type(gemId) == "number" then
		local gemInfo = WeightsWatcher.GemInfo(gemId)
		if gemInfo then
			gemColor = gemInfo.info[1]
		else
			print(string.format(L["WARN_UNREC_GEMID"], gemId))
			-- TODO: use the getgeminfo api to parse the gem?
			return false
		end
	elseif type(gemId) == "string" then
		gemColor = gemId
	end

	if not socketColors[socketColor] then
		print(string.format(L["WARN_UNREC_SOCKET_COLOR"], socketColor))
		return false
	end

	return socketColors[socketColor][gemColor] == true
end

function WeightsWatcher.calculateWeight(bareItemStats, itemStats, weightsScale)
	local weight = 0

	for stat, value in pairs(bareItemStats.normalStats) do
		weight = weight + WeightsWatcher.getWeight(ww_englishStats[stat], value, weightsScale)
	end
	if itemStats.socketBonusActive and bareItemStats.socketBonusStat then
		for stat, value in pairs(bareItemStats.socketBonusStat) do
			weight = weight + WeightsWatcher.getWeight(stat, value, weightsScale)
		end
	end
	for _, gems in pairs(itemStats.gemStats) do
		local maxWeight = 0
		for _, gemInfo in pairs(gems) do
			local weight = 0
			for stat, value in pairs(gemInfo[3]) do
				weight = weight + WeightsWatcher.getWeight(ww_englishStats[stat], value, weightsScale)
			end
			if maxWeight < weight then
				maxWeight = weight
			end
		end
		weight = weight + maxWeight
	end
	if bareItemStats.useEffects then
		for _, useEffect in pairs(bareItemStats.useEffects) do
			local factor = useEffect.duration / useEffect.cooldown * ww_vars.options.useEffects.uptimeRatio
			for stat, value in pairs(useEffect.stats) do
				weight = weight + WeightsWatcher.getWeight(ww_englishStats[stat], value * factor, weightsScale)
			end
		end
	end
	if bareItemStats.stackingEquipEffects then
		for _, effect in ipairs(bareItemStats.stackingEquipEffects) do
			for trigger in pairs(effect.triggers) do
				if weightsScale.triggers[trigger] then
					weight = weight + WeightsWatcher.getWeight(ww_englishStats[effect.stat], effect.value * effect.numStacks, weightsScale)
					break
				end
			end
		end
	end
	if ww_vars.options.tooltip.normalizeWeights == true then
		local total = 0

		for _, value in pairs(weightsScale) do
			if type(value) == "number" then
				total = total + math.abs(value)
			end
		end
		if total == 0 then
			-- Avoids a divide by zero
			return 0
		end
		weight = weight / total
	end
	return weight
end

function WeightsWatcher.getWeight(stat, value, weightsScale)
	local weight = 0

	if weightsScale[stat] then
		weight = weightsScale[stat] * value
	elseif stat == "all stats" then
		for _, stat in pairs({"agility", "intellect", "spirit", "stamina", "strength"}) do
			weight = weight + WeightsWatcher.getWeight(stat, value, weightsScale)
		end
	elseif stat == "all resistances" then
		for _, school in pairs({"arcane", "fire", "frost", "nature", "shadow"}) do
			weight = weight + WeightsWatcher.getWeight(school .. " resistance", value, weightsScale)
		end
	end

	return weight
end

function WeightsWatcher.getGemStats(...)
	local gemInfo, stat, lastGem
	local statTable = {}
	lastGem = 0
	for _, gems in pairs(...) do
		local innerStatTable = {}
		for _, gemId in pairs(gems) do
			gemInfo = WeightsWatcher.GemInfo(gemId)
			if gemInfo then
				table.insert(innerStatTable, gemInfo.info)
			else
				if gemId ~= "0" then
					print(string.format(L["WARN_UNHAND_GEMID"], gemId))
					-- TODO: use getgeminfo to parse the gem itself?
				end
				-- Ensures gems line up with their sockets
				table.insert(innerStatTable, {"N/A", "None", {}})
			end
		end
		if #(innerStatTable) > 0 then
			table.insert(statTable, innerStatTable)
		end
		lastGem = #(statTable)
	end

	-- Removes extra empty gems
	for i = lastGem + 1, #(statTable) do
		table.remove(statTable)
	end
	return statTable
end

local function parseLineUnchecked(textL, textR, link)
	for _, regex in ipairs(ww_IgnoredLines) do
		if string.find(textL, regex) then
			ww_ignored_lines[textL][regex] = true
			return
		end
	end
	for _, regex in ipairs(ww_TempIgnoredLines) do
		if string.find(textL, regex) then
			ww_temp_ignored_lines[textL][regex] = true
			return
		end
	end
	for _, regex in ipairs(ww_ItemInfoLines) do
		if string.find(textL, regex) then
			return {info = {[textL] = true}}
		end
	end
	for _, regex in ipairs(ww_DoubleSlotLines) do
		if string.find(textL, regex) then
			local nonStats = {}
			nonStats["slot"] = textL
			nonStats["subslot"] = textR
			return {info = nonStats}
		end
	end
	for _, regex in ipairs(ww_SingleSlotLines) do
		if string.find(textL, regex) then
			return {info = {["slot"] = textL}}
		end
	end
	local stats = WeightsWatcher.damageRange(textL, textR)
	if stats then
		return {stats = stats}
	end

	for _, args in ipairs(ww_EffectHandlers) do
		local stats = WeightsWatcher.handleEffects(textL, unpack(args))
		if stats then
			if stats == true then
				return
			end
			return stats
		end
	end

	for _, regex in ipairs(ww_UnweightedLines) do
		if string.find(textL, regex) then
			ww_unweighted_lines[textL][regex] = true
			return
		end
	end

	ww_unparsed_lines[textL][link] = true
end

function WeightsWatcher.parseLine(textL, textR, link)
	local stats = parseLineUnchecked(textL, textR, link)

	if not stats then
		return
	end

	if stats.stats then
		for stat, value in pairs(stats.stats) do
			if not ww_statDisplayNames[stat] and not ww_ignoredInvalidStats[ww_englishStats[stat]] then
				return
			end
		end
	end
	if stats.info then
		for name, value in pairs(stats.info) do
			if (name == "slot" or name == "subslot") and not ww_slotDisplayNames[ww_englishSlotNames[value]] then
				return
			end
		end
	end
	if stats.socket then
		if not ww_socketColorDisplayNames[stats.socket] then
			return
		end
	end
	if stats.socketBonusStat then
		for stat, value in pairs(stats.socketBonusStat) do
			if not ww_statDisplayNames[stat] and not ww_ignoredInvalidStats[ww_englishStats[stat]] then
				return
			end
		end
	end
	if stats.useEffect then
		for stat, value in pairs(stats.useEffect.stats) do
			if not ww_statDisplayNames[stat] and not ww_ignoredInvalidStats[ww_englishStats[stat]] then
				return
			end
		end
	end
	if stats.stackingEquipEffects then
		for i, effect in ipairs(stats.stackingEquipEffects) do
			if not ww_statDisplayNames[effect.stat] and not ww_ignoredInvalidStats[ww_englishStats[effect.stat]] then
				return
			end
		end
	end

	return stats
end

local rangedConversions = {
	[ww_localizedStats["melee dps"]] = ww_localizedStats["ranged dps"],
	[ww_localizedStats["average melee weapon damage"]] = ww_localizedStats["average ranged weapon damage"],
	[ww_localizedStats["maximum melee weapon damage"]] = ww_localizedStats["maximum ranged weapon damage"],
	[ww_localizedStats["melee weapon speed"]] = ww_localizedStats["ranged weapon speed"],
}

function WeightsWatcher.getItemStats(link)
	local textL, textR, pattern, func, start
	local normalStats, nonStats, socketList, socketBonusStat, useEffects, stackingEquipEffects = WeightsWatcher.newStatTable(), {}, {}, WeightsWatcher.newStatTable(), {}, {}

	-- Populate hidden tooltip
	WeightsWatcherHiddenTooltip:ClearLines()
	WeightsWatcherHiddenTooltip:SetHyperlink(link)

	-- Skip item name and "currently equipped"
	if WeightsWatcherHiddenTooltipTextLeft1:GetText() == CURRENTLY_EQUIPPED then
		start = 3
	else
		start = 2
	end

	for i = start, WeightsWatcherHiddenTooltip:NumLines() do
		textL = WeightsWatcher.preprocess(getglobal("WeightsWatcherHiddenTooltipTextLeft" .. i):GetText():lower())
		textR = getglobal("WeightsWatcherHiddenTooltipTextRight" .. i):GetText()
		if textR then
			textR = textR:lower()
		end

		local stats = WeightsWatcher.parseLine(textL, textR, link)
		if stats then
			if stats.stats then
				normalStats = normalStats + stats.stats
			end
			if stats.info then
				for name, value in pairs(stats.info) do
					nonStats[name] = value
				end
			end
			if stats.socket then
				table.insert(socketList, stats.socket)
			end
			if stats.socketBonusStat then
				socketBonusStat = socketBonusStat + stats.socketBonusStat
			end
			if stats.useEffect then
				table.insert(useEffects, stats.useEffect)
			end
			if stats.stackingEquipEffects then
				for _, effect in ipairs(stats.stackingEquipEffects) do
					table.insert(stackingEquipEffects, effect)
				end
			end
		end
	end

	if nonStats["slot"] == ww_localizedSlotNames["ranged"] or nonStats["slot"] == ww_localizedSlotNames["thrown"] or nonStats["slot"] == ww_localizedSlotNames["projectile"] then
		for k, v in pairs(rangedConversions) do
			normalStats[v] = rawget(normalStats, k)
			normalStats[k] = nil
		end
	end

	return {
		normalStats = normalStats,
		nonStats = nonStats,
		sockets = socketList,
		socketBonusStat = socketBonusStat,
		useEffects = useEffects,
		stackingEquipEffects = stackingEquipEffects,
	}
end

function WeightsWatcher.preprocess(text)
	for _, regex in ipairs(ww_Preprocess) do
		local pattern, replacement = unpack(regex)
		if string.find(text, pattern) then
			text = string.gsub(text, pattern, replacement)
		end
	end

	return text
end
