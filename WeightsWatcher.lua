if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

currentHooks = {}

ww_normalStatsMetatable = {
	-- Allows us to skip the nil check
	__index = function()
		return 0
	end,
	__add = function(tbl1, tbl2)
		local tbl = setmetatable({}, ww_normalStatsMetatable)

		if tbl ~= nil then
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
				if not gemStats[i] or not WeightsWatcher.matchesSocket(gemStats[i][1], sockets[i]) then
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
		local itemStats = ww_bareItemCache[splitItemLink(key)]
		local normalStats = itemStats.normalStats
		local socketBonusStat = itemStats.socketBonusStat
		itemStats = ww_itemCache[key]
		local socketBonusActive = itemStats.socketBonusActive
		local gemStats = itemStats.gemStats

		tbl[key] = WeightsWatcher.calculateWeight(normalStats, socketBonusActive, socketBonusStat, gemStats, tbl.weight)
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
			if bestGems.blueScore > bestGems.overallScore then
				bestGems.overall = bestGems.blue
				bestGems.overallScore = bestGems.blueScore
			end
			if bestGems.yellowScore > bestGems.overallScore then
				bestGems.overall = bestGems.yellow
				bestGems.overallScore = bestGems.yellowScore
			end
			tbl.bestGems = bestGems
			return bestGems
		end

		local gemId, gemIdIgnoreSocket, weightVal, weightValIgnoreSockets, bestGems, bestGemsIgnoreSocket
		local itemStats = ww_bareItemCache[key]
		local normalStats = itemStats.normalStats
		local sockets = itemStats.sockets
		local socketBonusStat = itemStats.socketBonusStat
		local socketBonusWeight = 0
		if socketBonusStat then
			for stat, value in pairs(socketBonusStat) do
				socketBonusWeight = socketBonusWeight + (tbl.weight[stat] or 0) * value
			end
		end
		local breakSocketColors = ww_vars.options.gems.breakSocketColors or (not ww_vars.options.gems.neverBreakSocketColors and socketBonusWeight <= 0)

		bestGems, bestGemsIgnoreSocket = {}, {}
		gemScore, gemScoreIgnoreSocket = 0, 0
		for _, color in pairs(sockets) do
			gemId = tbl.bestGems[color]
			-- TODO: get rid of the if check?
			if #(gemId) > 0 then
				table.insert(bestGems, gemId)
				gemScore = gemScore + tbl.bestGems[color .. "Score"]
			end
			if breakSocketColors and color ~= "meta" then
				gemIdIgnoreSocket = tbl.bestGems.overall
				if #(gemIdIgnoreSocket) > 0 then
					table.insert(bestGemsIgnoreSocket, gemIdIgnoreSocket)
					gemScoreIgnoreSocket = gemScoreIgnoreSocket + tbl.bestGems.overallScore
				end
			end
		end
		gemStats = WeightsWatcher.getGemStats(bestGems)
		weightVal = WeightsWatcher.calculateWeight(normalStats, true, socketBonusStat, gemStats, tbl.weight)
		if breakSocketColors then
			gemStatsIgnoreSockets = WeightsWatcher.getGemStats(bestGemsIgnoreSocket)
			weightValIgnoreSockets = WeightsWatcher.calculateWeight(normalStats, false, socketBonusStat, gemStatsIgnoreSockets, tbl.weight)

			if weightVal < weightValIgnoreSockets then
				weightVal = weightValIgnoreSockets
				gemStats = gemStatsIgnoreSockets
			end
		end

		tbl[key] = {
			gemStats = gemStats,
			score = weightVal,
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
	ww_ignored_lines = setmetatable({}, metatable)
	ww_temp_ignored_lines = setmetatable({}, metatable)
	ww_unparsed_items = setmetatable({}, metatable)
	ww_unweighted_lines = setmetatable({}, metatable)
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

	initializeWeightsConfig()

	SLASH_WEIGHTSWATCHER1="/ww"
	SLASH_WEIGHTSWATCHER2="/weightswatcher"
	SlashCmdList["WEIGHTSWATCHER"] =
		function(msg)
			commandHandler(msg)
		end
end

StaticPopupDialogs["WW_INVALID_ACCOUNT_DATA"] = {
	text = "Invalid account data found.  You can:                  \n       - Disable WeightsWatcher and reload your UI\n- Load the default settings                          \n\nWARNING: loading the default account settings will erase all weights and options you had set.",
	button1 = "Load Defaults",
	button2 = "Disable WeightsWatcher",
	OnAccept = function(self, func)
			if not upgradeData("character", "ww_charVars") then
				return
			end
			initializeWeightsConfig()
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
	text = "Invalid character data found.  You can:               \n       - Disable WeightsWatcher and reload your UI\n- Load the default settings                          \n\nLoading the default character settings will not affect your saved weights.",
	button1 = "Load Defaults",
	button2 = "Disable WeightsWatcher",
	OnAccept = function(self, func)
			ww_charVars = copyDefaultCharVars()
			initializeWeightsConfig()
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

function upgradeData(dataType, varsName)
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

function splitItemLink(link)
	local _, itemId, _, gemId1, gemId2, gemId3, gemId4, suffixId, uniqueId, linkLevel = strsplit(":", link)
	-- Strip color codes
	linkLevel = strsplit("|", linkLevel)
	bareLink = strjoin(":", "item", itemId, "0:0:0:0:0", suffixId, uniqueId, linkLevel)

	return bareLink, {{gemId1}, {gemId2}, {gemId3}, {gemId4}}
end

local function checkForTitansGrip()
	if WeightsWatcher.playerClass ~= "WARRIOR" then
		return false
	end
	local name, _, _, _, rank = GetTalentInfo(2, 27, false, false)
	if name == "Titan's Grip" then
		return rank == 1
	end
	-- Minor rearranging of the tree
	for i = 1, GetNumTalents(2, false, false) do
		name, _, _, _, rank = GetTalentInfo(2, i, false, false)
		if name == "Titan's Grip" then
			return rank == 1
		end
	end
	-- Major rearranging of the tree
	for i = 1, GetNumTalentTabs(false, false) do
		for j = 1, GetNumTalents(2, false, false) do
			name, _, _, _, rank = GetNumTalents(i, j, false, false)
			if name == "Titan's Grip" then
				return rank == 1
			end
		end
	end
	return false
end

local function checkForDualWield()
	local function checkForDualWield()
		local name, _, _, _, rank = GetTalentInfo(2, 20, false, false)
		if name == "Dual Wield" then
			return rank == 1
		end
		-- Minor rearranging of the tree
		for i = 1, GetNumTalents(2, false, false) do
			name, _, _, _, rank = GetTalentInfo(2, i, false, false)
			if name == "Dual Wield" then
				return rank == 1
			end
		end
		-- Major rearranging of the tree
		for i = 1, GetNumTalentTabs(false, false) do
			for j = 1, GetNumTalents(i, false, false) do
				name, _, _, _, rank = GetNumTalents(i, j, false, false)
				if name == "Dual Wield" then
					return rank == 1
				end
			end
		end
		return false
	end

	local class = WeightsWatcher.playerClass
	if class == "ROGUE" or class == "DEATHKNIGHT" then
		return true
	elseif (class == "HUNTER" or class == "WARRIOR") and level >= 20 then
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

	if checkForTitansGrip() and (compareSubslot == "axe" or compareSubslot == "mace" or compareSubslot == "sword") then
		if currentSlot == "two-hand" then
			currentSlot = "one-hand"
		end
		if compareSlot == "two-hand" then
			compareSlot = "one-hand"
		end
		if compareSlot2 == "two-hand" then
			compareSlot2 = "one-hand"
		end
	end

	if currentSlot == "two-hand" then
		return "both"
	elseif currentSlot == "main hand" then
		if compareSlot then
			return "1"
		else
			return "empty"
		end
	elseif currentSlot == "off hand" or currentSlot == "held in off-hand" then
		if compareSlot == "two-hand" then
			return "1"
		elseif compareSlot2 then
			return "2"
		else
			return "empty"
		end
	elseif currentSlot == "one-hand" then
		if checkForDualWield() then
			if compareSlot and compareSlot2 then
				return "worst"
			end
			return "empty"
		else
			return "1"
		end
	elseif currentSlot == "finger" or currentSlot == "trinket" then
		if compareSlot and compareSlot2 then
			return "worst"
		end
		return "empty"
	else
		return "1"
	end
end

local function computeDifference(compareMethod, compareScore, compareScore2, currentScore)
	if compareMethod == "empty" then
		return currentScore
	elseif compareMethod == "1" then
		if compareScore then
			return currentScore - compareScore
		else
			return currentScore
		end
	elseif compareMethod == "2" then
		if compareScore2 then
			return currentScore - compareScore2
		else
			return currentScore
		end
	elseif compareMethod == "both" then
		if compareScore then
			if compareScore2 then
				return currentScore - (compareScore + compareScore2)
			else
				return currentScore - compareScore
			end
		else
			if compareScore2 then
				return currentScore - compareScore2
			else
				return currentScore
			end
		end
	elseif compareMethod == "worst" then
		if compareScore then
			if compareScore2 then
				if compareScore < compareScore2 then
					return currentScore - compareScore
				else
					return currentScore - compareScore2
				end
			else
				return currentScore - compareScore
			end
		else
			if compareScore2 then
				return currentScore - compareScore2
			else
				return currentScore
			end
		end
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
	["head"] = "HeadSlot",
	["shoulder"] = "ShoulderSlot",
	["chest"] = "ChestSlot",
	["wrist"] = "WristSlot",
	["hands"] = "HandsSlot",
	["waist"] = "WaistSlot",
	["legs"] = "LegsSlot",
	["feet"] = "FeetSlot",
	["main hand"] = {"MainHandSlot", "SecondaryHandSlot"},
	["off hand"] = {"MainHandSlot", "SecondaryHandSlot"},
	["one-hand"] = {"MainHandSlot", "SecondaryHandSlot"},
	["two-hand"] = {"MainHandSlot", "SecondaryHandSlot"},
	["relic"] = "RangedSlot",
	["ranged"] = "RangedSlot",
	["thrown"] = "RangedSlot",
	["projectile"] = "AmmoSlot",
	["neck"] = "NeckSlot",
	["back"] = "BackSlot",
	["shirt"] = "ShirtSlot",
	["tabard"] = "TabardSlot",
	["finger"] = {"Finger0Slot", "Finger1Slot"},
	["trinket"] = {"Trinket0Slot", "Trinket1Slot"},
	["held in off-hand"] = {"MainHandSlot", "SecondaryHandSlot"},
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
	if (IsEquippableItem(link) and itemType ~= "Container" and itemType ~= "Quiver") or (itemType == "Gem" and stackSize == 1) or (itemType == "Consumable") or (itemType == "Recipe") then
		bareLink = splitItemLink(link)

		showWeights = keyDetectors[ww_vars.options.tooltip.showWeights]()
		showIdealWeights = keyDetectors[ww_vars.options.tooltip.showIdealWeights]()
		showIdealGems = keyDetectors[ww_vars.options.tooltip.showIdealGems]()
		showIdealGemStats = keyDetectors[ww_vars.options.tooltip.showIdealGemStats]()
		showAlternateGems = keyDetectors[ww_vars.options.tooltip.showAlternateGems]()

		if ttname == "GameTooltip" and ww_vars.options.tooltip.showDifferences then
			local currentSlot, compareSlot, compareSlot2, currentSubslot, compareSubslot, compareSubslot2
			currentSlot = ww_bareItemCache[bareLink].nonStats["slot"]
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

		if showWeights then
			sockets = ww_bareItemCache[bareLink].sockets

			for _, class in ipairs(ww_charVars.activeWeights) do
				if ww_vars.weightsList[class] then
					for _, weight in pairs(ww_charVars.activeWeights[class]) do
						if ww_vars.weightsList[class][weight] then
							local currentScore = ww_weightCache[class][weight][link]
							local compareScore, compareScore2, compareBareScore, compareBareScore2
							str = weight
							if ww_vars.options.tooltip.showClassNames == "Always" or (ww_vars.options.tooltip.showClassNames == "Others" and class ~= WeightsWatcher.playerClass) then
								str = str .. " - " .. classNames[class]
							end
							if compareLink then
								compareScore = ww_weightCache[class][weight][compareLink]
								if showIdealWeights and #(sockets) == 0 then
									compareBareScore = ww_weightIdealCache[class][weight][compareBareLink].score
									if compareScore < compareBareScore then
										compareScore = compareBareScore
									end
								end
							end
							if compareLink2 then
								compareScore2 = ww_weightCache[class][weight][compareLink2]
								if showIdealWeights and #(sockets) == 0 then
									compareBareScore2 = ww_weightIdealCache[class][weight][compareBareLink2].score
									if compareScore2 < compareBareScore2 then
										compareScore2 = compareBareScore2
									end
								end
							end
							compareScore = computeDifference(compareMethod, compareScore, compareScore2, currentScore)
							tooltip:AddDoubleLine(str, string.format(colorizeDifferences(compareScore), currentScore, compareScore))
							if #(sockets) > 0 and showIdealWeights then
								local currentScore = ww_weightIdealCache[class][weight][bareLink].score
								local compareScore, compareScore2
								if compareBareLink then
									compareScore = ww_weightIdealCache[class][weight][compareBareLink].score
								end
								if compareBareLink2 then
									compareScore2 = ww_weightIdealCache[class][weight][compareBareLink2].score
								end
								compareScore = computeDifference(compareMethod, compareScore, compareScore2, currentScore)
								tooltip:AddDoubleLine("  Ideally-gemmed:", string.format(colorizeDifferences(compareScore), currentScore, compareScore))
								if showIdealGems then
									gemStats = ww_weightIdealCache[class][weight][bareLink].gemStats
									for _, gems in ipairs(gemStats) do
										for i, gem in ipairs(gems) do
											if #(gems) > 1 then
												tooltip:AddDoubleLine("    (Option " .. i .. "/" .. #(gems) .. ") " .. gem[2] .. " (" .. gem[1] .. ")", " ")
												alternateGemsExist = true
											else
												tooltip:AddDoubleLine("    Using " .. gem[2] .. " (" .. gem[1] .. ")", " ")
											end
											if showIdealGemStats then
												for stat, value in pairs(gem[3]) do
													tooltip:AddDoubleLine("      " .. statNames[stat] .. ": " .. value, " ")
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
			if rawget(ww_unparsed_lines, textL) or rawget(ww_unweighted_lines, textL) then
				ttleft:SetText(origTextL .. " |cffff0000*|r")
				numUnweightedEffects = numUnweightedEffects + 1
			end
		end
		if numUnweightedEffects > 0 then
			tooltip:AddLine("|cffff0000* indicates unweighted effects|r (" .. numUnweightedEffects .. " total)")
		end

		if not ww_vars.options.tooltip.hideHints then
			if showWeights then
				if not ww_vars.options.tooltip.hideHints and #(sockets) > 0 then
					if not showIdealWeights then
						if ww_vars.options.tooltip.showIdealWeights ~= "Never" then
							tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showIdealWeights .. " to show ideally-gemmed weights>")
						end
					elseif not showIdealGems then
						if ww_vars.options.tooltip.showIdealGems ~= "Never" then
							tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showIdealGems .. " to show ideal gems>")
						end
					else
						if not showIdealGemStats then
							if ww_vars.options.tooltip.showIdealGemStats ~= "Never" then
								tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showIdealGemStats .. " to show ideal gem stats>")
							end
						end
						if not showAlternateGems and alternateGemsExist then
							if ww_vars.options.tooltip.showAlternateGems ~= "Never" then
								tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showAlternateGems .. " to show alternate ideal gems>")
							end
						end
					end
				end
			elseif ww_vars.options.tooltip.showWeights ~= "Never" then
				tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showWeights .. " to show weights>")
			end
		end

		tooltip:Show()
	end
end

function WeightsWatcher.bestGemForSocket(socketColor, weightScale, qualityLimit)
	local bestGem, bestWeight, weight = {}, 0
	if not qualityLimit then
		qualityLimit = #(GemIds["Normal"])
	end

	for gemSource, gems in pairs(GemIds) do
		if ww_vars.options.gems.sources[gemSource] then
			for gemType, gems in pairs(gems) do
				if ww_vars.options.gems.types[gemType] then
					for quality = qualityLimit, 1, -1 do
						if gems[quality] then
							for gemId, gemStats in pairs(gems[quality]) do
								if WeightsWatcher.matchesSocket(gemStats[1], socketColor) then
									weight = WeightsWatcher.calculateWeight({}, true, nil, {{gemStats}}, weightScale)
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

function WeightsWatcher.matchesSocket(gemId, socketColor)
	local gemColor

	if type(gemId) == "number" then
		local gemInfo = WeightsWatcher.GemInfo(gemId)
		if gemInfo then
			gemColor = gemInfo.info[1]
		else
			print("WeightsWatcher: Unrecognized GemId: " .. gemId)
			return false
		end
	elseif type(gemId) == "string" then
		gemColor = gemId
	end

	if socketColor == "red" then
		if gemColor == "red" or gemColor == "orange" or gemColor == "purple" or gemColor == "prismatic" then
			return true
		end
	elseif socketColor == "blue" then
		if gemColor == "blue" or gemColor == "green" or gemColor == "purple" or gemColor == "prismatic" then
			return true
		end
	elseif socketColor == "yellow" then
		if gemColor == "yellow" or gemColor == "orange" or gemColor == "green" or gemColor == "prismatic" then
			return true
		end
	elseif socketColor == "meta" then
		if gemColor == "meta" then
			return true
		end
	else
		print("Warning: Unrecognized socket color: " .. socketColor)
	end
	return false
end

function WeightsWatcher.calculateWeight(normalStats, socketBonusActive, socketBonusStat, gemStats, weightsScale)
	local weight = 0

	for stat, value in pairs(normalStats) do
		weight = weight + WeightsWatcher.getWeight(stat, value, weightsScale)
	end
	if socketBonusActive and socketBonusStat then
		for stat, value in pairs(socketBonusStat) do
			weight = weight + WeightsWatcher.getWeight(stat, value, weightsScale)
		end
	end
	for _, gems in pairs(gemStats) do
		local maxWeight = 0
		for _, gemInfo in pairs(gems) do
			local weight = 0
			for stat, value in pairs(gemInfo[3]) do
				weight = weight + WeightsWatcher.getWeight(stat, value, weightsScale)
			end
			if weight > maxWeight then
				maxWeight = weight
			end
		end
		weight = weight + maxWeight
	end
	if ww_vars.options.tooltip.normalizeWeights == true then
		local total = 0

		for _, value in pairs(weightsScale) do
			total = total + abs(value)
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
	if weightsScale[stat] then
		return weightsScale[stat] * value
	else
		return 0
	end
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
					print("WeightsWatcher: Unhandled gemId " .. gemId)
				end
				-- Ensures gems line up with their sockets
				table.insert(innerStatTable, {"None", "N/A", {}})
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

function WeightsWatcher.parseLine(textL, textR, link)
	local start, _, value = string.find(textL, socketBonus)
	if start then
		local socketBonusStat = WeightsWatcher.singleStat(value)
		if socketBonusStat then
			return nil, nil, nil, socketBonusStat
		end
	end
	for _, regex in ipairs(SocketLines) do
		local start, _, value = string.find(textL, regex)
		if start then
			return nil, nil, value
		end
	end
	for _, regex in ipairs(IgnoredLines) do
		if string.find(textL, regex) then
			ww_ignored_lines[textL][regex] = true
			return
		end
	end
	for _, regex in ipairs(TempIgnoredLines) do
		if string.find(textL, regex) then
			ww_temp_ignored_lines[textL][regex] = true
			return
		end
	end
	for _, regex in ipairs(ItemInfoLines) do
		if string.find(textL, regex) then
			return nil, {[textL] = true}
		end
	end
	for _, regex in ipairs(DoubleSlotLines) do
		if string.find(textL, regex) then
			local nonStats = {}
			nonStats["slot"] = textL
			nonStats["subslot"] = textR
			return nil, nonStats
		end
	end
	for _, regex in ipairs(SingleSlotLines) do
		if string.find(textL, regex) then
			return nil, {["slot"] = textL}
		end
	end
	local stats = WeightsWatcher.damageRange(textL, textR)
	if stats then
		return stats
	end
	for _, regex in ipairs(MultipleStatLines) do
		local pattern, func = unpack(regex)
		if string.find(textL, pattern) then
			local stats = func(textL, pattern)
			if stats then
				return stats
			end
		end
	end
	local stat = WeightsWatcher.singleStat(textL)
	if stat then
		return stat
	end
	for _, regex in ipairs(UnweightedLines) do
		if string.find(textL, regex) then
			ww_unweighted_lines[textL][regex] = true
			return
		end
	end
	ww_unparsed_lines[textL] = true
end

function WeightsWatcher.getItemStats(link)
	local textL, textR, pattern, func, start
	local normalStats, nonStats, socketList, socketBonusStat = WeightsWatcher.newStatTable(), {}, {}
	local ranged = false

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

		local stats, unStats, socket, socketBonus = WeightsWatcher.parseLine(textL, textR, link)

		if stats then
			normalStats = normalStats + stats
		end
		if unStats then
			for name, value in pairs(unStats) do
				nonStats[name] = value
			end
		end
		if socket then
			table.insert(socketList, socket)
		end
		if socketBonus then
			socketBonusStat = socketBonus
		end
	end

	if nonStats["slot"] == "ranged" or nonStats["slot"] == "projectile" then
		normalStats["ranged dps"] = rawget(normalStats, "dps")
		normalStats["dps"] = nil
	end

	return {
		normalStats = normalStats,
		nonStats = nonStats,
		sockets = socketList,
		socketBonusStat = socketBonusStat,
	}
end

function WeightsWatcher.preprocess(text)
	for _, regex in ipairs(Preprocess) do
		local pattern, replacement = unpack(regex)
		if string.find(text, pattern) then
			text = string.gsub(text, pattern, replacement)
		end
	end

	return text
end
