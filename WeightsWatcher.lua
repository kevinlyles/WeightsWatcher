local L = ww_localization

local currentHooks = {}

local function splitLink(link)
	local fullLink = link
	local bareLink
	-- Strip color codes, etc
	if link:find("|") then
		link = link:gsub(".*|H([^|]+)|h.*", "%1")
	end
	local linkType, Id, enchant, gemId1, gemId2, gemId3, gemId4, suffixId, uniqueId, linkLevel, reforgeInfo, upgradeInfo = strsplit(":", link)
	if linkType == "item" then
		bareLink = strjoin(":", linkType, Id, "0:0:0:0:0", suffixId, uniqueId, linkLevel, reforgeInfo, upgradeInfo)
		return bareLink, enchant, {{gemId1}, {gemId2}, {gemId3}, {gemId4}}
	end
end

local ww_bareItemCacheMetatable = {
	__index = function(tbl, key)
		tbl[key] = WeightsWatcher.getItemStats(key)
		return tbl[key]
	end,
}

local ww_itemCacheMetatable = {
	__index = function(tbl, key)
		local gemStats, socketBonusActive
		local bareLink, enchant, gems = splitLink(key)
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
			enchantStats = WeightsWatcher.enchantStats(enchant),
			gemStats = gemStats,
			socketBonusActive = socketBonusActive,
		}

		return tbl[key]
	end,
}

local ww_weightCacheWeightMetatable = {
	__index = function(tbl, key)
		tbl[key] = WeightsWatcher.calculateWeight(ww_bareItemCache[splitLink(key)], ww_itemCache[key], tbl.weight)
		return tbl[key]
	end,
}

local ww_weightCacheClassMetatable = {
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

local ww_weightIdealCacheWeightMetatable = {
	__index = function(tbl, key)
		if key == "bestGems" then
			tbl.bestGems = WeightsWatcher.bestGemsForWeight(tbl.weight)
			return tbl.bestGems
		end

		local itemStats = ww_bareItemCache[key]
		local socketBonusWeight = WeightsWatcher.calculateWeight({normalStats = {}, socketBonusStat = itemStats.socketBonusStat}, {socketBonusActive = true, gemStats = {}}, tbl.weight)
		local breakSocketColors = ww_vars.options.gems.breakSocketColors or (not ww_vars.options.gems.neverBreakSocketColors and socketBonusWeight <= 0)
		local idealGems = tbl.bestGems[itemStats.normalStats["item level"]]

		local socketBonusActive = true
		local bestGems, bestGemsIgnoreSocket = {}, {}
		local gemScore, gemScoreIgnoreSocket = socketBonusWeight, 0
		for _, color in pairs(itemStats.sockets) do
			color = ww_englishSocketColors[color]
			table.insert(bestGems, idealGems[color])
			gemScore = gemScore + idealGems[color .. "Score"]
			if breakSocketColors then
				if color ~= "meta" and color ~= "cogwheel" and color ~= "sha-touched" then
					color = "prismatic"
				end
				table.insert(bestGemsIgnoreSocket, idealGems[color])
				gemScoreIgnoreSocket = gemScoreIgnoreSocket + idealGems[color .. "Score"]
			end
		end
		local gemStats = WeightsWatcher.getGemStats(bestGems)
		if breakSocketColors then
			if gemScore < gemScoreIgnoreSocket then
				socketBonusActive = false
				gemScore = gemScoreIgnoreSocket
				gemStats = WeightsWatcher.getGemStats(bestGemsIgnoreSocket)
			end
		end

		local enchantStats
		for name, ids in pairs(ww_bestEnchantsCache[tbl.className][tbl.weightName][key]) do
			for _, id in ipairs(ids) do
				enchantStats = WeightsWatcher.enchantStats(id)
				break
			end
			if enchantStats then
				break
			end
		end

		tbl[key] = {
			gemStats = gemStats,
			score = WeightsWatcher.calculateWeight(itemStats, {socketBonusActive = socketBonusActive, enchantStats = enchantStats, gemStats = gemStats}, tbl.weight),
			socketBonusActive = socketBonusActive,
			socketBonusScore = socketBonusWeight,
		}
		return tbl[key]
	end,
}

local ww_weightIdealCacheClassMetatable = {
	__index = function(tbl, key)
		tbl[key] = setmetatable({}, ww_weightIdealCacheWeightMetatable)
		tbl[key].weight = tbl.class[key]
		tbl[key].className = tbl.className
		tbl[key].weightName = key
		return tbl[key]
	end,
}

ww_weightIdealCacheMetatable = {
	__index = function(tbl, key)
		tbl[key] = setmetatable({}, ww_weightIdealCacheClassMetatable)
		tbl[key].class = ww_vars.weightsList[key]
		tbl[key].className = key
		return tbl[key]
	end,
}

ww_bareItemCache = setmetatable({}, ww_bareItemCacheMetatable)
ww_itemCache = setmetatable({}, ww_itemCacheMetatable)
ww_weightCache = setmetatable({}, ww_weightCacheMetatable)
ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)

local normalizedStats = {
	"agility",
	"intellect",
	"stamina",
	"spirit",
	"strength",
	"health",
	"hp5",
	"mana",
	"mastery",
	"armor",
	"dodge",
	"parry",
	"resilience",
	"attack power",
	"critical strike",
	"expertise",
	"haste",
	"hit",
	"spell power",
	"melee dps",
	"average melee weapon damage",
	"maximum melee weapon damage",
	"melee weapon speed",
	"ranged dps",
	"average ranged weapon damage",
	"maximum ranged weapon damage",
	"ranged weapon speed",
	"arcane resistance",
	"fire resistance",
	"frost resistance",
-- 	"holy resistance",
	"nature resistance",
	"shadow resistance",
}

local ww_weightNormalizationCacheMetatable = {
	__index = function(tbl, key)
		local total = 0
		for _, stat in ipairs(normalizedStats) do
			if key[stat] then
				total = total + math.abs(key[stat])
			end
		end
		if total == 0 then
			-- Avoids a divide by zero
			total = 1
		end
		tbl[key] = total
		return total
	end
}

ww_weightNormalizationCache = setmetatable({}, ww_weightNormalizationCacheMetatable)

local function loadGeneralInfo()
	local _, class = UnitClass("player")
	WeightsWatcher.player = {}
	WeightsWatcher.player.class = class

	local slotList = {
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

	WeightsWatcher.ResetEnchantCache()
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

local function hookTooltip(objectName, funcName)
	local object = _G[objectName]
	hooksecurefunc(object, funcName, function(self, ...) WeightsWatcher.displayItemStats(self, objectName, ...) end)
end

local function populateProfessions()
	local professions = {}
	for _, idx in ipairs({ GetProfessions() }) do
		local name, _, rank = GetProfessionInfo(idx)
		if ww_professionsToTrack[name] then
			professions[name] = rank
		end
	end
	WeightsWatcher.player.professions = professions
	WeightsWatcher.ResetEnchantCache()
end

local function populateReputations()
	local rep = {}
	ExpandAllFactionHeaders()
	for i = 1, GetNumFactions() do
		local name, _, standingID, barMin, barMax, barValue, _, _, isHeader, _, hasRep = GetFactionInfo(i)
		if not isHeader or hasRep then
			if ww_factionsToTrack[name] then
				rep[name] = {
					level = standingID,
					min = barMin,
					max = barMax,
					value = barValue,
				}
			end
		end
	end
	WeightsWatcher.player.reputation = rep
	WeightsWatcher.ResetEnchantCache()
end

function WeightsWatcher:eventHandler(event, message, ...)
	if event == "PLAYER_LEVEL_UP" then
		WeightsWatcher.player.level = tonumber(message)
	elseif event == "CHAT_MSG_SKILL" then
		-- "Your skill in x has increased to y."
		local skill, level = message:match(L["PROF_SKILL_UP"])
		if skill then
			if WeightsWatcher.player.professions[skill] then
				WeightsWatcher.player.professions[skill] = tonumber(level)
				WeightsWatcher.ResetEnchantCache()
			end
		else
			skill = message:match(L["PROF_NEW"])
			if skill then
				if WeightsWatcher.player.professions[skill] then
					WeightsWatcher.player.professions[skill] = 1
					WeightsWatcher.ResetEnchantCache()
				end
			else
				populateProfessions()
			end
		end
	elseif event == "CHAT_MSG_COMBAT_FACTION_CHANGE" then
		-- "Reputation with X (in|de)creased by y."
		local faction, direction, reputation = message:match(L["REP_CHANGE"])
		if faction then
			if not WeightsWatcher.player.reputation then
				populateReputations()
				return
			end
			local rep = WeightsWatcher.player.reputation[faction]
			if not rep then
				return
			end
			reputation = tonumber(reputation)
			if direction == L["increased"] then
				rep.value = rep.value + reputation
				if rep.value > rep.max then
					while rep.level < #(ww_reputations) and ww_reputations[rep.level] <= rep.value do
						rep.level = rep.level + 1
					end
					rep.min = ww_reputations[rep.level - 1]
					rep.max = ww_reputations[rep.level]
					if rep.value >= rep.max then
						rep.value = rep.max - 1
					end
					WeightsWatcher.ResetEnchantCache()
				end
			else
				rep.value = rep.value - reputation
				if rep.value < rep.min then
					while rep.level > 0 and ww_reputations[rep.level - 1] > rep.value do
						rep.level = rep.level - 1
					end
					rep.min = ww_reputations[rep.level - 1]
					rep.max = ww_reputations[rep.level]
					if rep.value < rep.min then
						rep.value = rep.min
					end
					WeightsWatcher.ResetEnchantCache()
				end
			end
		else
			populateReputations()
		end
	elseif event == "SKILL_LINES_CHANGED" then
		populateProfessions()
	end
end

function WeightsWatcher.getRepLevel(faction)
	if not WeightsWatcher.player.reputation then
		populateReputations()
	end

	if not WeightsWatcher.player.reputation[faction] then
		return 0
	end

	return WeightsWatcher.player.reputation[faction].level
end

function WeightsWatcher.getSkillLevel(profession)
	return WeightsWatcher.player.professions[profession] or 0
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

	hookTooltip("GameTooltip", "SetAuctionItem")
	hookTooltip("GameTooltip", "SetAuctionSellItem")
	hookTooltip("GameTooltip", "SetBagItem")
	hookTooltip("GameTooltip", "SetBuybackItem")
	hookTooltip("GameTooltip", "SetExistingSocketGem")
	hookTooltip("GameTooltip", "SetGuildBankItem")
	hookTooltip("GameTooltip", "SetHyperlink")
	hookTooltip("GameTooltip", "SetInboxItem")
	hookTooltip("GameTooltip", "SetInventoryItem")
	hookTooltip("GameTooltip", "SetLootItem")
	hookTooltip("GameTooltip", "SetLootRollItem")
	hookTooltip("GameTooltip", "SetMerchantItem")
	hookTooltip("GameTooltip", "SetQuestItem")
	hookTooltip("GameTooltip", "SetQuestLogItem")
	hookTooltip("GameTooltip", "SetReforgeItem")
	hookTooltip("GameTooltip", "SetSendMailItem")
	hookTooltip("GameTooltip", "SetSocketGem")
	hookTooltip("GameTooltip", "SetTradePlayerItem")
	hookTooltip("GameTooltip", "SetTradeSkillItem")
	hookTooltip("GameTooltip", "SetTradeTargetItem")
	hookTooltip("GameTooltip", "SetTrainerService")
	-- Item link tooltips
	hookTooltip("ItemRefTooltip", "SetHyperlink")
	-- Secondary and tertiary comparison tooltips
	hookTooltip("ShoppingTooltip1", "SetExistingSocketGem")
	hookTooltip("ShoppingTooltip1", "SetHyperlinkCompareItem")
	hookTooltip("ShoppingTooltip1", "SetInventoryItem")
	hookTooltip("ShoppingTooltip2", "SetExistingSocketGem")
	hookTooltip("ShoppingTooltip2", "SetHyperlinkCompareItem")
	hookTooltip("ShoppingTooltip2", "SetInventoryItem")
	if AtlasLootTooltip then
		hookTooltip("AtlasLootTooltip", "SetHyperlink")
	end

	populateProfessions()
	WeightsWatcher.player.level = UnitLevel("player")

	WeightsWatcher:SetScript("OnEvent", WeightsWatcher.eventHandler)

	WeightsWatcher:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
	WeightsWatcher:RegisterEvent("CHAT_MSG_SKILL")
	WeightsWatcher:RegisterEvent("SKILL_LINES_CHANGED")
	WeightsWatcher:RegisterEvent("PLAYER_LEVEL_UP")
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
			ww_vars = ww_copyDefaultAccountVars()
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
			ww_charVars = ww_copyDefaultCharVars()
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

local function checkForTitansGrip()
	if WeightsWatcher.player.class == "WARRIOR" then
		return GetSpecialization() == 2 and WeightsWatcher.player.level >= 38
	end
	return false
end

local function checkForDualWield()
	local class = WeightsWatcher.player.class
	if class == "ROGUE" or class == "DEATHKNIGHT" or class == "HUNTER" then
		return true
	elseif class == "SHAMAN" or class == "WARRIOR" then
		return GetSpecialization() == 2
	elseif class == "MONK" then
		local spec = GetSpecialization()
		return spec == 1 or spec == 3
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

	-- ranged weapons are two-handers now
	if currentSlot == ww_localizedSlotNames["ranged"] then
		if currentSubslot == ww_localizedSlotNames["wand"] then
			currentSlot = ww_localizedSlotNames["main hand"]
		else
			currentSlot = ww_localizedSlotNames["two-hand"]
		end
	end
	if compareSlot == ww_localizedSlotNames["ranged"] then
		if compareSubslot == ww_localizedSlotNames["wand"] then
			compareSlot = ww_localizedSlotNames["main hand"]
		else
			compareSlot = ww_localizedSlotNames["two-hand"]
		end
	end
	if compareSlot2 == ww_localizedSlotNames["ranged"] then
		if compareSubslot2 == ww_localizedSlotNames["wand"] then
			compareSlot2 = ww_localizedSlotNames["main hand"]
		else
			compareSlot2 = ww_localizedSlotNames["two-hand"]
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

local weapons = {"MainHandSlot", "SecondaryHandSlot"}
local slotConversion = {
	[ww_localizedSlotNames["head"]] = "HeadSlot",
	[ww_localizedSlotNames["shoulder"]] = "ShoulderSlot",
	[ww_localizedSlotNames["chest"]] = "ChestSlot",
	[ww_localizedSlotNames["wrist"]] = "WristSlot",
	[ww_localizedSlotNames["hands"]] = "HandsSlot",
	[ww_localizedSlotNames["waist"]] = "WaistSlot",
	[ww_localizedSlotNames["legs"]] = "LegsSlot",
	[ww_localizedSlotNames["feet"]] = "FeetSlot",
	[ww_localizedSlotNames["main hand"]] = weapons,
	[ww_localizedSlotNames["off hand"]] = weapons,
	[ww_localizedSlotNames["one-hand"]] = weapons,
	[ww_localizedSlotNames["two-hand"]] = weapons,
	[ww_localizedSlotNames["ranged"]] = weapons,
	[ww_localizedSlotNames["neck"]] = "NeckSlot",
	[ww_localizedSlotNames["back"]] = "BackSlot",
	[ww_localizedSlotNames["shirt"]] = "ShirtSlot",
	[ww_localizedSlotNames["tabard"]] = "TabardSlot",
	[ww_localizedSlotNames["finger"]] = {"Finger0Slot", "Finger1Slot"},
	[ww_localizedSlotNames["trinket"]] = {"Trinket0Slot", "Trinket1Slot"},
	[ww_localizedSlotNames["held in off-hand"]] = weapons,
}

local function getCompareInfo(ttname, bareLink, bareItemInfo)
	if ttname ~= "ShoppingTooltip1" and ttname ~= "ShoppingTooltip2" and ww_vars.options.tooltip.showDifferences then
		local compareLink, compareBareLink, compareLink2, compareBareLink2
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
				compareBareLink = splitLink(compareLink)
				compareSlot = ww_bareItemCache[compareBareLink].nonStats["slot"]
				compareSubslot = ww_bareItemCache[compareBareLink].nonStats["subslot"]
			end
			if compareLink2 then
				compareBareLink2 = splitLink(compareLink2)
				compareSlot2 = ww_bareItemCache[compareBareLink2].nonStats["slot"]
				compareSubslot2 = ww_bareItemCache[compareBareLink2].nonStats["subslot"]
			end
			local compareMethod = determineCompareMethod(currentSlot, compareSlot, compareSlot2, currentSubslot, compareSubslot, compareSubslot2)
			return compareMethod, compareLink, compareBareLink, compareLink2, compareBareLink2
		end
	end
end

local function markTooltipLines(tooltip, ttname, showDebugInfo)
	local start, ttleft, origTextL, textL
	local numUnweightedEffects = 0
	-- Skip item name and "currently equipped"
	if WeightsWatcherHiddenTooltipTextLeft1:GetText() == CURRENTLY_EQUIPPED then
		start = 3
	else
		start = 2
	end

	local offset = 0
	for i = start, tooltip:NumLines() do
		while true do
			ttleft = _G[ttname .. "TextLeft" .. i + offset]
			if ttleft == nil then
				break
			end
			origTextL = ttleft:GetText()
			if origTextL == nil then
				offset = offset + 1
			else
				break
			end
		end
		if ttleft == nil or origTextL == nil then
			break
		end
		textL = WeightsWatcher.preprocess(origTextL:lower())
		if rawget(ww_unparsed_lines, textL) then
			if showDebugInfo then
				ttleft:SetText(string.format("%s |cffff00ff(U)|r", string.gsub(origTextL, "(.)([\r\n]+)", "%1 |cffff00ff(U)|r%2")))
			else
				ttleft:SetText(string.format("%s |cffff0000*|r", string.gsub(origTextL, "(.)([\r\n]+)", "%1 |cffff0000*|r%2")))
			end
			numUnweightedEffects = numUnweightedEffects + 1
		elseif rawget(ww_ignored_lines, textL) then
			if showDebugInfo then
				ttleft:SetText(string.format("%s |cffffff00(I)|r", string.gsub(origTextL, "(.)([\r\n]+)", "%1 |cffffff00(I)|r%2")))
			end
		elseif rawget(ww_temp_ignored_lines, textL) then
			if showDebugInfo then
				ttleft:SetText(string.format("%s |cffffff00(TI)|r", string.gsub(origTextL, "(.)([\r\n]+)", "%1 |cffffff00(TI)|r%2")))
			end
		elseif rawget(ww_unweighted_lines, textL) then
			ttleft:SetText(string.format("%s |cffff0000*|r", string.gsub(origTextL, "(.)([\r\n]+)", "%1 |cffff0000*|r%2")))
			numUnweightedEffects = numUnweightedEffects + 1
		end
	end
	if numUnweightedEffects > 0 then
		tooltip:AddLine(string.format(L["UNWEIGHTED_HINT"], numUnweightedEffects))
	end
end

local function addDebugInfo(tooltip, bareItemInfo, link)
	for name, value in pairs(bareItemInfo.nonStats) do
		if value == true then
			tooltip:AddLine(name)
		else
			if name == "slot" or name == "subslot" then
				tooltip:AddDoubleLine(name, ww_slotDisplayNames[value])
			else
				tooltip:AddDoubleLine(name, value)
			end
		end
	end
	for name, value in pairs(bareItemInfo.normalStats) do
		tooltip:AddDoubleLine(ww_statDisplayNames[name], ww_formatNum(value))
	end
	if #(bareItemInfo.useEffects) > 0 then
		tooltip:AddLine(L["Use effects:"])
		for _, useEffect in pairs(bareItemInfo.useEffects) do
			tooltip:AddLine(string.format(L["DURATION_COOLDOWN_FORMAT"], useEffect.duration, useEffect.cooldown))
			tooltip:AddLine(string.format(L["INDENTED_STRING_FORMAT"], "Stats:"))
			for stat, value in pairs(useEffect.stats) do
				tooltip:AddDoubleLine(string.format(L["DOUBLY_INDENTED_STRING_FORMAT"], ww_statDisplayNames[stat]), ww_formatNum(value))
			end
		end
	end
	if #(bareItemInfo.stackingEquipEffects) > 0 then
		tooltip:AddLine(L["Stacking equip effects:"])
		for _, effect in pairs(bareItemInfo.stackingEquipEffects) do
			tooltip:AddDoubleLine(ww_formatString(L["EFFECT_STAT_FORMAT"], effect.value, ww_statDisplayNames[effect.stat]), string.format(L["EFFECT_STACKS_FORMAT"], effect.numStacks))
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
				tooltip:AddDoubleLine(string.format(L["INDENTED_STRING_FORMAT"], ww_statDisplayNames[name]), ww_formatNum(value))
			end
		end
		if #(itemInfo.gemStats) > 0 then
			tooltip:AddLine(L["Gem Stats:"])
			for _, gems in pairs(itemInfo.gemStats) do
				for _, gem in ipairs(gems) do
					tooltip:AddLine(string.format(L["GEM_NAME_COLOR_FORMAT"], ww_gemDisplayNames[gem[2]] or "Unlocalized gem: " .. gem[2], ww_gemColorDisplayNames[gem[1]]))
					for stat, value in pairs(gem[3]) do
						tooltip:AddDoubleLine(string.format(L["DOUBLY_INDENTED_STRING_FORMAT"], ww_statDisplayNames[stat]), ww_formatNum(value))
					end
				end
			end
		end
	end

	if itemInfo.enchantStats then
		if itemInfo.enchantStats.name then
			tooltip:AddLine(L["Enchant Stats:"])
			for _, slot in ipairs(ww_slotsToCheck[bareItemInfo.nonStats.slot]) do
				local name = itemInfo.enchantStats.name[slot] or nil
				if name then
					if type(name) == "table" then
						name = ww_combineStrings(name)
					end
					tooltip:AddLine(string.format(L["INDENTED_STRING_FORMAT"], name))
					break
				end
			end
			for name, value in pairs(itemInfo.enchantStats.stats or {}) do
				tooltip:AddDoubleLine(string.format(L["DOUBLY_INDENTED_STRING_FORMAT"], ww_statDisplayNames[name]), ww_formatNum(value))
			end
		end
	end
end

local function addDifferenceLine(tooltip, leftText, score, currentScore)
	local difference = score - currentScore
	tooltip:AddDoubleLine(leftText, ww_formatString(colorizeDifferences(difference), score, difference))
end

local function addIdealGemInfo(tooltip, gemStats, showStats, showAlternates, currentGems, weightScale)
	local alternatesExist, changesExist = false, false
	for slot, gems in ipairs(gemStats.gems) do
		local alreadyApplied = false
		for i, gem in ipairs(gems) do
			if gem[2] == currentGems.gems[slot][1][2] then
				alreadyApplied = true
				break
			end
		end

		local forceDisplay = false
		if ww_vars.options.tooltip.showEnhancementsWhen == "Always" then
			forceDisplay = true
		elseif ww_vars.options.tooltip.showEnhancementsWhen == "None applied" then
			if currentGems.gems[slot][1][2] == "None" then
				forceDisplay = true
			else
				alreadyApplied = true
			end
		end

		if not alreadyApplied or forceDisplay then
			changesExist = true
			for i, gem in ipairs(gems) do
				local score = WeightsWatcher.calculateWeight({}, { gemStats = {{{ [3] = gem[3] }}} }, weightScale)
				local currentScore = WeightsWatcher.calculateWeight({}, { gemStats = {{{ [3] = currentGems.gems[slot][1][3] }}} }, weightScale)
				if #(gems) > 1 then
					addDifferenceLine(tooltip, string.format(L["MULTIPLE_GEM_FORMAT"], i, #(gems), ww_gemDisplayNames[gem[2]], ww_gemColorDisplayNames[gem[1]]), score, currentScore)
					alternatesExist = true
				else
					addDifferenceLine(tooltip, string.format(L["SINGLE_GEM_FORMAT"], ww_gemDisplayNames[gem[2]], ww_gemColorDisplayNames[gem[1]]), score, currentScore)
				end
				if showStats then
					for stat, value in pairs(gem[3]) do
						local weight = WeightsWatcher.getWeight(stat, value, weightScale)
						if ww_vars.options.tooltip.normalizeWeights then
							weight = weight / ww_weightNormalizationCache[weightScale]
						end
						tooltip:AddDoubleLine(ww_formatString(L["ENHANCEMENT_STAT_FORMAT"], value, ww_statDisplayNames[stat] or "Unlocalized: " .. stat), ww_formatString("%.3f", weight))
					end
				end
				if not showAlternates then
					break
				end
			end
		end
	end
	if changesExist and gemStats.socketBonusActive ~= currentGems.socketBonusActive then
		addDifferenceLine(tooltip, L["SOCKET_BONUS_FORMAT"], gemStats.socketBonusActive and gemStats.socketBonusScore or 0, currentGems.socketBonusActive and currentGems.socketBonusScore or 0)
	end
	return alternatesExist, changesExist
end

local function addIdealEnchantInfo(tooltip, enchants, showStats, showAlternates, currentEnchants, slot, weightScale)
	local count, displayCount = 0, 0
	local alreadyApplied = false
	local enchantsExist = false
	for name, ids in pairs(enchants) do
		count = count + #(ids)
		enchantsExist = true
		if not alreadyApplied then
			for _, slot in ipairs(ww_slotsToCheck[slot]) do
				if currentEnchants.name then
					if currentEnchants.name[slot] == name then
						alreadyApplied = true
						break
					elseif type(currentEnchants.name[slot]) == "table" then
						for _, curName in ipairs(currentEnchants.name[slot]) do
							if curName == name then
								alreadyApplied = true
								break
							end
						end
						if alreadyApplied then
							break
						end
					end
				end
			end
		end
	end
	if not enchantsExist then
		alreadyApplied = true
	end

	local forceDisplay = false
	if ww_vars.options.tooltip.showEnhancementsWhen == "Always" then
		forceDisplay = true
	elseif ww_vars.options.tooltip.showEnhancementsWhen == "None applied" then
		if currentEnchants.name == nil then
			forceDisplay = true
		else
			alreadyApplied = true
		end
	end

	local alternatesExist, changesExist = count > 1, false

	if not alreadyApplied or forceDisplay then
		changesExist = true
		for name, ids in pairs(enchants) do
			for i, id in ipairs(ids) do
				local enchantStats = WeightsWatcher.enchantStats(id)
				displayCount = displayCount + 1
				local score = WeightsWatcher.calculateWeight({}, { enchantStats = enchantStats }, weightScale)
				local currentScore = WeightsWatcher.calculateWeight({}, { enchantStats = currentEnchants }, weightScale)
				if alternatesExist then
					addDifferenceLine(tooltip, string.format(L["MULTIPLE_ENCHANT_FORMAT"], displayCount, count, name), score, currentScore)
				else
					addDifferenceLine(tooltip, string.format(L["SINGLE_ENCHANT_FORMAT"], name), score, currentScore)
				end
				if showStats then
					for stat, value in pairs(enchantStats.stats) do
						local weight = WeightsWatcher.getWeight(stat, value, weightScale)
						if ww_vars.options.tooltip.normalizeWeights then
							weight = weight / ww_weightNormalizationCache[weightScale]
						end
						tooltip:AddDoubleLine(ww_formatString(L["ENHANCEMENT_STAT_FORMAT"], value, ww_statDisplayNames[stat] or "Unlocalized: " .. stat), ww_formatString("%.3f", weight))
					end
				end
				if alternatesExist and not showAlternates then
					break
				end
			end
			if not showAlternates then
				break
			end
		end
	end

	return alternatesExist, changesExist
end

local function addEnhancementInfo(tooltip, enhancements, showStats, showAlternates, currentEnhancements, slot, weightScale)
	local alternatesExist, changesExist = false, false
	if enhancements.gems then
		local alternates, changes = addIdealGemInfo(tooltip, enhancements, showStats, showAlternates, currentEnhancements, weightScale)
		if alternates then
			alternatesExist = true
		end
		if changes then
			changesExist = true
		end
	end
	if enhancements.enchants then
		local alternates, changes = addIdealEnchantInfo(tooltip, enhancements.enchants, showStats, showAlternates, currentEnhancements.enchants, slot, weightScale)
		if alternates then
			alternatesExist = true
		end
		if changes then
			changesExist = true
		end
	end
	if not changesExist then
		tooltip:AddLine(string.format(L["DOUBLY_INDENTED_STRING_FORMAT"], "All enhancements already applied"))
	end
	return alternatesExist
end

function WeightsWatcher.displayItemStats(tooltip, ttname)
	local alternateEnhancementsExist = false

	local _, link = tooltip:GetItem()
	if link == nil then
		return
	end

	local _, _, _, _, _, itemType, _, stackSize = GetItemInfo(link)
	if (IsEquippableItem(link) and itemType ~= L["Container"] and itemType ~= L["Quiver"]) or (itemType == L["Gem"] and stackSize == 1) or (itemType == L["Consumable"]) or (itemType == L["Recipe"]) then
		local showDebugInfo = ww_keyDetectors[ww_vars.options.tooltip.showDebugInfo]()
		local weightsShown = showDebugInfo
		local showZeroScores = showDebugInfo or ww_vars.options.tooltip.showZeroScores

		if not showDebugInfo then
			for _, class in ipairs(ww_charVars.activeWeights) do
				if ww_vars.weightsList[class] then
					for _, weight in pairs(ww_charVars.activeWeights[class]) do
						if ww_vars.weightsList[class][weight] then
							if showZeroScores or ww_weightCache[class][weight][link] > 0 then
								weightsShown = true
								break
							end
						end
					end
				end
				if weightsShown then
					break
				end
			end
		end

		local bareLink = splitLink(link)
		local bareItemInfo = ww_bareItemCache[bareLink]

		if not weightsShown and not (bareItemInfo.nonStats.slot == ww_localizedSlotNames["trinket"] and #(bareItemInfo.sockets) > 0) then
			return
		end

		local showWeights = ww_keyDetectors[ww_vars.options.tooltip.showWeights]()
		local showIdealWeights = ww_keyDetectors[ww_vars.options.tooltip.showIdealWeights]()
		local showEnhancements = ww_keyDetectors[ww_vars.options.tooltip.showEnhancements]()
		local showEnhancementStats = ww_keyDetectors[ww_vars.options.tooltip.showEnhancementStats]()
		local showAlternateEnhancements = ww_keyDetectors[ww_vars.options.tooltip.showAlternateEnhancements]()

		local itemInfo = ww_itemCache[link]

		local compareMethod, compareLink, compareBareLink, compareLink2, compareBareLink2 = getCompareInfo(ttname, bareLink, bareItemInfo)

		markTooltipLines(tooltip, ttname, showDebugInfo)

		if showDebugInfo then
			addDebugInfo(tooltip, bareItemInfo, link)
		end

		if showWeights then
			local currentEnhancements = {
				gems = itemInfo.gemStats,
				socketBonusActive = itemInfo.socketBonusActive,
				enchants = itemInfo.enchantStats,
			}
			for _, class in ipairs(ww_charVars.activeWeights) do
				if ww_vars.weightsList[class] then
					for _, weight in pairs(ww_charVars.activeWeights[class]) do
						if ww_vars.weightsList[class][weight] then
							local currentScore = ww_weightCache[class][weight][link]
							if showZeroScores or currentScore > 0 or (bareItemInfo.nonStats.slot == ww_localizedSlotNames["trinket"] and #(bareItemInfo.sockets) > 0) then
								local compareScore, compareScore2
								local str = weight
								if ww_vars.options.tooltip.showClassNames == "Always" or (ww_vars.options.tooltip.showClassNames == "Others" and class ~= WeightsWatcher.player.class) then
									str = string.format(L["WEIGHT_CLASS_FORMAT"], str, ww_classDisplayNames[class])
								end
								if compareLink then
									compareScore = ww_weightCache[class][weight][compareLink]
								end
								if compareLink2 then
									compareScore2 = ww_weightCache[class][weight][compareLink2]
								end
								compareScore = computeDifference(compareMethod, compareScore, compareScore2, currentScore)
								tooltip:AddDoubleLine(str, ww_formatString(colorizeDifferences(compareScore), currentScore, compareScore))
								if showIdealWeights then
									local currentScore = ww_weightIdealCache[class][weight][bareLink].score
									local compareScore, compareScore2
									if compareBareLink then
										compareScore = ww_weightIdealCache[class][weight][compareBareLink].score
									end
									if compareBareLink2 then
										compareScore2 = ww_weightIdealCache[class][weight][compareBareLink2].score
									end
									compareScore = computeDifference(compareMethod, compareScore, compareScore2, currentScore)
									tooltip:AddDoubleLine(L["  Ideally-enhanced:"], ww_formatString(colorizeDifferences(compareScore), currentScore, compareScore))
									if showEnhancements then
										local enhancements = {
											gems = ww_weightIdealCache[class][weight][bareLink].gemStats,
											socketBonusActive = ww_weightIdealCache[class][weight][bareLink].socketBonusActive,
											socketBonusScore = ww_weightIdealCache[class][weight][bareLink].socketBonusScore,
											enchants = ww_bestEnchantsCache[class][weight][bareLink],
										}
										if addEnhancementInfo(tooltip, enhancements, showEnhancementStats, showAlternateEnhancements, currentEnhancements, bareItemInfo.nonStats.slot, ww_vars.weightsList[class][weight]) then
											alternateEnhancementsExist = true
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
				if not showIdealWeights then
					if ww_vars.options.tooltip.showIdealWeights ~= "Never" then
						tooltip:AddLine(string.format(L["IDEAL_WTS_HINT"], ww_vars.options.tooltip.showIdealWeights))
					end
				elseif not showEnhancements then
					if ww_vars.options.tooltip.showEnhancements ~= "Never" then
						tooltip:AddLine(string.format(L["IDEAL_ENHANCEMENTS_HINT"], ww_vars.options.tooltip.showEnhancements))
					end
				else
					if not showEnhancementStats then
						if ww_vars.options.tooltip.showEnhancementStats ~= "Never" then
							tooltip:AddLine(string.format(L["ENHANCEMENT_STATS_HINT"], ww_vars.options.tooltip.showEnhancementStats))
						end
					end
					if not showAlternateEnhancements and alternateEnhancementsExist then
						if ww_vars.options.tooltip.showAlternateEnhancements ~= "Never" then
							tooltip:AddLine(string.format(L["ALT_ENHANCEMENTS_HINT"], ww_vars.options.tooltip.showAlternateEnhancements))
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

function WeightsWatcher.bestGemsForWeight(weightScale)
	local metatable = {
		__index = function(tbl, key)
			if key > 0 then
				for i = key, 0, -1 do
					if rawget(tbl, i) then
						for j = i, key do
							tbl[j] = tbl[i]
						end
						return tbl[i]
					end
				end
			end
		end
	}
	local bestGems = setmetatable({}, metatable)

	local qualityLimit = ww_vars.options.gems.qualityLimit or #(ww_gemQualityNames)

	for _, ilvl in ipairs(ww_gemMinIlvls) do
		bestGems[ilvl] = {}
		for color in pairs(ww_localizedSocketColors) do
			bestGems[ilvl][color], bestGems[ilvl][color .. "Score"] = {}, 0
		end
	end
	for gemSource, gems in pairs(ww_gems) do
		if ww_vars.options.gems.sources[gemSource] then
			for gemType, gems in pairs(gems) do
				if ww_vars.options.gems.types[gemType] then
					for quality = qualityLimit, 1, -1 do
						for gemId, gemStats in pairs(gems[quality] or {}) do
							local weight = WeightsWatcher.calculateWeight({normalStats = {}}, {gemStats = {{gemStats}}}, weightScale)
							for socketColor in pairs(ww_localizedSocketColors) do
								if WeightsWatcher.matchesSocket(gemStats[1], socketColor) then
									for i = #(ww_gemMinIlvls), 1, -1 do
										local ilvl = ww_gemMinIlvls[i]
										if ilvl < WeightsWatcher.GemInfo(gemId).minIlvl then
											break
										end
										if weight > bestGems[ilvl][socketColor .. "Score"] then
											bestGems[ilvl][socketColor] = {gemId}
											bestGems[ilvl][socketColor .. "Score"] = weight
										elseif weight == bestGems[ilvl][socketColor .. "Score"] then
											local duplicate = false
											for _, gem in pairs(bestGems[ilvl][socketColor]) do
												if WeightsWatcher.GemInfo(gem).info[2] == gemStats[2] then
													duplicate = true
													break
												end
											end
											if not duplicate then
												table.insert(bestGems[ilvl][socketColor], gemId)
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
	end

	return bestGems
end

local socketColors = {
	["blue"] = {
		["blue"] = true,
		["green"] = true,
		["prismatic"] = true,
		["purple"] = true,
	},
	["cogwheel"] = {
		["cogwheel"] = true,
	},
	["sha-touched"] = {
		["sha-touched"] = true,
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
	["red"] = {
		["orange"] = true,
		["prismatic"] = true,
		["purple"] = true,
		["red"] = true,
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
			return false
		end
	elseif type(gemId) == "string" then
		gemColor = gemId
	end

	if not socketColors[socketColor] then
		return false
	end

	return socketColors[socketColor][gemColor] == true
end

function WeightsWatcher.calculateWeight(bareItemStats, itemStats, weightsScale)
	local weight = 0

	for stat, value in pairs(bareItemStats.normalStats or {}) do
		weight = weight + WeightsWatcher.getWeight(ww_englishStats[stat], value, weightsScale)
	end
	if itemStats.socketBonusActive and bareItemStats.socketBonusStat then
		for stat, value in pairs(bareItemStats.socketBonusStat) do
			weight = weight + WeightsWatcher.getWeight(stat, value, weightsScale)
		end
	end
	for _, gems in pairs(itemStats.gemStats or {}) do
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
	for stat, value in pairs((itemStats.enchantStats or {}).stats or {}) do
		weight = weight + WeightsWatcher.getWeight(ww_englishStats[stat], value, weightsScale)
	end
	for _, useEffect in pairs(bareItemStats.useEffects or {}) do
		local factor = useEffect.duration / useEffect.cooldown * ww_vars.options.calculation.useEffectUptimeRatio
		for stat, value in pairs(useEffect.stats) do
			weight = weight + WeightsWatcher.getWeight(ww_englishStats[stat], value * factor, weightsScale)
		end
	end
	for _, effect in ipairs(bareItemStats.stackingEquipEffects or {}) do
		for trigger in pairs(effect.triggers) do
			if weightsScale.triggers[trigger] then
				weight = weight + WeightsWatcher.getWeight(ww_englishStats[effect.stat], effect.value * effect.numStacks, weightsScale)
				break
			end
		end
	end
	if ww_vars.options.tooltip.normalizeWeights == true then
		weight = weight / ww_weightNormalizationCache[weightsScale]
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
			if (name == "slot" or name == "subslot") and not ww_slotDisplayNames[value] then
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

	if WeightsWatcherHiddenTooltip:NumLines() < 1 then
		return {}
	end

	-- Skip item name and "currently equipped"
	if WeightsWatcherHiddenTooltipTextLeft1:GetText() == CURRENTLY_EQUIPPED then
		start = 3
	else
		start = 2
	end

	for i = start, WeightsWatcherHiddenTooltip:NumLines() do
		textL = WeightsWatcher.preprocess(_G["WeightsWatcherHiddenTooltipTextLeft" .. i]:GetText():lower())
		textR = _G["WeightsWatcherHiddenTooltipTextRight" .. i]:GetText()
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

	if nonStats["slot"] == ww_localizedSlotNames["ranged"] then
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
