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
		tbl[key] = {WeightsWatcher:getItemStats(key)}
		return tbl[key]
	end,
}

ww_itemCacheMetatable = {
	__index = function(tbl, key)
		local gemStats, socketBonusActive
		local bareLink, gems = splitItemLink(key)
		local normalStats, sockets, socketBonusStat = unpack(ww_bareItemCache[bareLink])

		gemStats = WeightsWatcher:getGemStats(gems)

		-- Removes gems in crafted sockets from consideration
		for i = #(sockets) + 1, #(gemStats) do
			table.remove(gemStats)
		end

		if #(sockets) > 0 then
			socketBonusActive = true
			for i = 1, #(sockets) do
				if not gemStats[i] or not WeightsWatcher:matchesSocket(gemStats[i][1], sockets[i]) then
					socketBonusActive = false
					break
				end
			end
		else
			socketBonusActive = false
		end

		tbl[key] = {socketBonusActive, gemStats}
		return tbl[key]
	end,
}

ww_weightCacheWeightMetatable = {
	__index = function(tbl, key)
		local normalStats, socketBonusActive, socketBonusStat, gemStats
		local bareLink = splitItemLink(key)
		normalStats, _, socketBonusStat = unpack(ww_bareItemCache[bareLink])
		socketBonusActive, gemStats = unpack(ww_itemCache[key])

		tbl[key] = WeightsWatcher:calculateWeight(normalStats, socketBonusActive, socketBonusStat, gemStats, tbl.weight)
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
		if key == "weight" then
			return nil
		elseif key == "bestGems" then
			local redScore, yellowScore, blueScore, overallScore
			local bestGems = {}

			bestGems.Red, redScore = WeightsWatcher:bestGemForSocket("Red", tbl.weight, ww_vars.options.gemQualityLimit)
			bestGems.Yellow, yellowScore = WeightsWatcher:bestGemForSocket("Yellow", tbl.weight, ww_vars.options.gemQualityLimit)
			bestGems.Blue, blueScore = WeightsWatcher:bestGemForSocket("Blue", tbl.weight, ww_vars.options.gemQualityLimit)
			bestGems.Meta = WeightsWatcher:bestGemForSocket("Meta", tbl.weight, ww_vars.options.gemQualityLimit)
			bestGems.overall = bestGems.Red
			overallScore = redScore
			if blueScore > overallScore then
				bestGems.overall = bestGems.Blue
				overallScore = blueScore
			end
			if yellowScore > overallScore then
				bestGems.overall = bestGems.Yellow
			end
			tbl.bestGems = bestGems
			return bestGems
		end
		local gemId, gemIdIgnoreSocket, weightVal, weightValIgnoreSockets, bestGems, bestGemsIgnoreSocket
		local normalStats, sockets, socketBonusStat = unpack(ww_bareItemCache[key])

		bestGems = {}
		bestGemsIgnoreSocket = {}
		for _, color in pairs(sockets) do
			gemId = tbl.bestGems[color]
			if gemId ~= 0 then
				table.insert(bestGems, gemId)
			end
			if breakSocketColors then
				gemIdIgnoreSocket = tbl.bestGems.overall
				if gemIdIgnoreSocket ~= 0 then
					table.insert(bestGemsIgnoreSocket, gemIdIgnoreSocket)
				end
			end
		end
		gemStats = WeightsWatcher:getGemStats(bestGems)
		weightVal = WeightsWatcher:calculateWeight(normalStats, true, socketBonusStat, gemStats, tbl.weight)
		if breakSocketColors then
			gemStatsIgnoreSockets = WeightsWatcher:getGemStats(bestGemsIgnoreSocket)
			weightValIgnoreSockets = WeightsWatcher:calculateWeight(normalStats, false, socketBonusStat, gemStatsIgnoreSockets, tbl.weight)

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

function WeightsWatcher:OnInitialize()
	local tempVars

	SLASH_WEIGHTSWATCHER1="/ww"
	SLASH_WEIGHTSWATCHER2="/weightswatcher"
	SlashCmdList["WEIGHTSWATCHER"] =
		function(msg)
			commandHandler(msg)
		end

	if not upgradeData("account", "ww_vars") then
		return
	end
	if not upgradeData("character", "ww_charVars") then
		return
	end
	initializeWeightsConfig()
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

	tempVars = WeightsWatcher:Upgrade(dataType)
	if tempVars then
		_G[varsName] = tempVars
		return true
	else
		WeightsWatcher:Broken(dataType)
		return false
	end
end

function WeightsWatcher:Broken(dataType)
	if dataType == "account" then
		StaticPopup_Show("WW_INVALID_ACCOUNT_DATA")
	elseif dataType == "character" then
		StaticPopup_Show("WW_INVALID_CHARACTER_DATA")
	else
		DisableAddOn("WeightsWatcher")
		ReloadUI()
	end
end

function WeightsWatcher:HookTooltip(objectName, funcName)
	local object = getglobal(objectName)
	self:SecureHook(object, funcName, function(self, ...) WeightsWatcher:displayItemStats(self, objectName, ...) end)
	table.insert(currentHooks, {object, func})
end

function WeightsWatcher:OnEnable()
	WeightsWatcher:HookTooltip("GameTooltip", "SetAuctionItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetAuctionSellItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetBagItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetBuybackItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetExistingSocketGem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetGuildBankItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetHyperlink")
	WeightsWatcher:HookTooltip("GameTooltip", "SetInboxItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetInventoryItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetLootItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetLootRollItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetMerchantItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetQuestItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetQuestLogItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetSendMailItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetSocketGem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetTradePlayerItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetTradeSkillItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetTradeTargetItem")
	WeightsWatcher:HookTooltip("GameTooltip", "SetTrainerService")
	-- Item link tooltips
	WeightsWatcher:HookTooltip("ItemRefTooltip", "SetHyperlink")
	-- Secondary and tertiary comparison tooltips
	WeightsWatcher:HookTooltip("ShoppingTooltip1", "SetExistingSocketGem")
	WeightsWatcher:HookTooltip("ShoppingTooltip1", "SetHyperlinkCompareItem")
	WeightsWatcher:HookTooltip("ShoppingTooltip1", "SetInventoryItem")
	WeightsWatcher:HookTooltip("ShoppingTooltip2", "SetExistingSocketGem")
	WeightsWatcher:HookTooltip("ShoppingTooltip2", "SetHyperlinkCompareItem")
	WeightsWatcher:HookTooltip("ShoppingTooltip2", "SetInventoryItem")
	if AtlasLootTooltip then
		WeightsWatcher:HookTooltip("AtlasLootTooltip", "SetHyperlink")
	end
end

function WeightsWatcher:OnDisable()
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

	return bareLink, {gemId1, gemId2, gemId3, gemId4}
end

local function checkForTitansGrip()
	local _, class = UnitClass("player")
	if class ~= "WARRIOR" then
		return false
	end
	local name, _, _, _, rank = GetNumTalents(2, 27, false, false)
	if name == "Titan's Grip" then
		return rank == 1
	end
	-- Minor rearranging of the tree
	for i = 1, GetNumTalents(2, false, false) do
		name, _, _, _, rank = GetNumTalents(2, i, false, false)
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

local function determineCompareMethod(currentSlot, compareSlot, compareSlot2, currentSubslot, compareSubslot, compareSubslot2)
	if checkForTitansGrip() then
		if currentSlot == "Two-Hand" then
			currentSlot = "One-Hand"
		end
		if compareSlot == "Two-Hand" then
			compareSlot = "One-Hand"
		end
		if compareSlot2 == "Two-Hand" then
			compareSlot2 = "One-Hand"
		end
	end

	if currentSlot == "Two-Hand" then
		return "both"
	elseif currentSlot == "Main Hand" then
		if compareSlot2 == "Main Hand" or compareSlot2 == "Two-Hand" or compareSlot2 == "One-Hand" then
			return "2"
		elseif compareSlot == "Main Hand" or compareSlot == "Two-Hand" or compareSlot == "One-Hand" then
			return "1"
		end
	elseif currentSlot == "Off Hand" or currentSlot == "Held In Off-hand" then
		if compareSlot == "Off Hand" or compareSlot == "Held In Off-hand" or compareSlot == "Two-Hand" or (compareSlot == "One-Hand" and not compareSlot2) then
			return "1"
		end
	elseif currentSlot == "One-Hand" then
		if compareSlot == "Main Hand" or compareSlot == "One-Hand" or (compareSlot == "Off Hand" and compareSubslot ~= "Shield") then
			if compareSlot2 == "Main Hand" or compareSlot2 == "One-Hand" or (compareSlot2 == "Off Hand" and compareSubslot2 ~= "Shield") then
				return "worst"
			else
				return "1"
			end
		else
			if compareSlot2 == "Main Hand" or compareSlot2 == "One-Hand" or (compareSlot2 == "Off Hand" and compareSubslot2 ~= "Shield") then
				return "2"
			end
		end
	elseif currentSlot == "Finger" or currentSlot == "Trinket" then
		return "worst"
	else
		return "1"
	end
	return "none"
end

local function computeDifference(compareMethod, compareScore, compareScore2, currentScore)
	if compareMethod == "1" then
		if compareScore then
			return currentScore - compareScore
		end
	elseif compareMethod == "2" then
		if compareScore2 then
			return currentScore - compareScore2
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

function WeightsWatcher:displayItemStats(tooltip, ttname)
	local link, bareLink, itemType, stackSize, sockets, gemStats
	local stat, value, str, formatStr
	local compareLink, compareBareLink, compareLink2, compareBareLink2, compareMethod
	local _, playerClass = UnitClass("player")

	_, link = tooltip:GetItem()
	if link == nil then
		return
	end

	_, _, _, _, _, itemType, _, stackSize = GetItemInfo(link)
	if (IsEquippableItem(link) and itemType ~= "Container" and itemType ~= "Quiver") or (itemType == "Gem" and stackSize == 1) or (itemType == "Consumable") or (itemType == "Recipe") then
		bareLink = splitItemLink(link)

		if ttname == "GameTooltip" and ww_vars.options.tooltip.showDifferences then
			local currentSlot, compareSlot, compareSlot2, currentSubslot, compareSubslot, compareSubslot2
			currentSlot = ww_bareItemCache[bareLink][1]["Slot"]
			currentSubslot = ww_bareItemCache[bareLink][1]["Subslot"]
			_, compareLink = ShoppingTooltip1:GetItem()
			if compareLink then
				compareBareLink = splitItemLink(compareLink)
				compareSlot = ww_bareItemCache[compareBareLink][1]["Slot"]
				compareSubslot = ww_bareItemCache[compareBareLink][1]["Subslot"]
			end
			_, compareLink2 = ShoppingTooltip2:GetItem()
			if compareLink2 then
				compareBareLink2 = splitItemLink(compareLink2)
				compareSlot2 = ww_bareItemCache[compareBareLink2][1]["Slot"]
				compareSubslot2 = ww_bareItemCache[compareBareLink2][1]["Subslot"]
			end
			compareMethod = determineCompareMethod(currentSlot, compareSlot, compareSlot2, currentSubslot, compareSubslot, compareSubslot2)
		end

		if keyDetectors[ww_vars.options.tooltip.showWeights]() then
			tooltip:AddLine("Current Weights:")
			for _, class in ipairs(ww_charVars.activeWeights) do
				if ww_vars.weightsList[class] then
					for _, weight in pairs(ww_charVars.activeWeights[class]) do
						if ww_vars.weightsList[class][weight] then
							local currentScore = ww_weightCache[class][weight][link]
							local compareScore, compareScore2
							str = "  " .. weight
							if ww_vars.options.tooltip.showClassNames == "Always" or (ww_vars.options.tooltip.showClassNames == "Others" and class ~= playerClass) then
								str = str .. " - " .. classNames[class]
							end
							if compareLink then
								compareScore = ww_weightCache[class][weight][compareLink]
								if compareLink2 then
									compareScore2 = ww_weightCache[class][weight][compareLink2]
								end
								compareScore = computeDifference(compareMethod, compareScore, compareScore2, currentScore)
							end
							tooltip:AddDoubleLine(str, string.format(colorizeDifferences(compareScore), currentScore, compareScore))
						end
					end
				end
			end

			_, sockets, _ = unpack(ww_bareItemCache[bareLink])

			if #(sockets) > 0 then
				if keyDetectors[ww_vars.options.tooltip.showIdealWeights]() then
					tooltip:AddLine("Ideally Gemmed Weights:")
					for _, class in ipairs(ww_charVars.activeWeights) do
						if ww_vars.weightsList[class] then
							for _, weight in pairs(ww_charVars.activeWeights[class]) do
								if ww_vars.weightsList[class][weight] then
									local currentScore = ww_weightIdealCache[class][weight][bareLink].score
									local compareScore, compareScore2
									str = "  " .. weight
									if ww_vars.options.tooltip.showClassNames == "Always" or (ww_vars.options.tooltip.showClassNames == "Others" and class ~= playerClass) then
										str = str .. " - " .. classNames[class]
									end
									if compareBareLink then
										compareScore = ww_weightIdealCache[class][weight][compareBareLink].score
										if compareBareLink2 then
											compareScore2 = ww_weightIdealCache[class][weight][compareBareLink2].score
										end
										compareScore = computeDifference(compareMethod, compareScore, compareScore2, currentScore)
									end
									tooltip:AddDoubleLine(str, string.format(colorizeDifferences(compareScore), currentScore, compareScore))
									if keyDetectors[ww_vars.options.tooltip.showIdealGems]() then
										gemStats = ww_weightIdealCache[class][weight][bareLink].gemStats
										for _, gem in ipairs(gemStats) do
											tooltip:AddDoubleLine("    Using " .. gem[2] .. " (" .. gem[1] .. ")", " ")
											if keyDetectors[ww_vars.options.tooltip.showIdealGemStats]() then
												for stat, value in pairs(gem[4]) do
													tooltip:AddDoubleLine("      " .. stat .. ": " .. value, " ")
												end
											end
										end
									end
								end
							end
						end
					end
					if not ww_vars.options.tooltip.hideHints and not keyDetectors[ww_vars.options.tooltip.showIdealGems]() then
						if ww_vars.options.tooltip.showIdealGems ~= "Never" then
							tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showIdealGems .. " to show ideal gems>")
						end
					elseif not ww_vars.options.tooltip.hideHints and not keyDetectors[ww_vars.options.tooltip.showIdealGemStats]() then
						if ww_vars.options.tooltip.showIdealGemStats ~= "Never" then
							tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showIdealGemStats .. " to show ideal gem stats>")
						end
					end
				elseif not ww_vars.options.tooltip.hideHints and ww_vars.options.tooltip.showIdealWeights ~= "Never" then
					tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showIdealWeights .. " to show ideal weights>")
				end
			end
		elseif not ww_vars.options.tooltip.hideHints and ww_vars.options.tooltip.showWeights ~= "Never" then
			tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showWeights .. " to show weights>")
		end
		tooltip:Show()
	end
end

function WeightsWatcher:bestGemForSocket(socketColor, weightScale, qualityLimit)
	local bestGem, bestWeight, weight = 0, 0

	for gemId, gemStats in pairs(GemIds) do
		if not qualityLimit or gemStats[3] <= qualityLimit then
			-- Meta sockets don't ever hold anything but meta gems
			if  WeightsWatcher:matchesSocket(gemStats[1], socketColor) then
				weight = WeightsWatcher:calculateWeight({}, true, nil, {gemStats}, weightScale)
				if bestGem == 0 or weight > bestWeight then
					bestGem = gemId
					bestWeight = weight
				end
			end
		end
	end
	return bestGem, bestWeight
end

function WeightsWatcher:matchesSocket(gemColor, socketColor)
	if socketColor == "Red" then
		if gemColor == "Red" or gemColor == "Orange" or gemColor == "Purple" or gemColor == "Prismatic" then
			return true
		end
	elseif socketColor == "Blue" then
		if gemColor == "Blue" or gemColor == "Green" or gemColor == "Purple" or gemColor == "Prismatic" then
			return true
		end
	elseif socketColor == "Yellow" then
		if gemColor == "Yellow" or gemColor == "Orange" or gemColor == "Green" or gemColor == "Prismatic" then
			return true
		end
	elseif socketColor == "Meta" then
		if gemColor == "Meta" then
			return true
		end
	else
		print("Warning: Unrecognized socket color: " .. socketColor)
	end
	return false
end

function WeightsWatcher:calculateWeight(normalStats, socketBonusActive, socketBonusStat, gemStats, weightsScale)
	local weight, name, value = 0

	for name, value in pairs(normalStats) do
		weight = weight + WeightsWatcher:getWeight(name, value, weightsScale)
	end
	if socketBonusActive and socketBonusStat then
		for name, value in pairs(socketBonusStat) do
			weight = weight + WeightsWatcher:getWeight(name, value, weightsScale)
		end
	end
	for _, value in pairs(gemStats) do
		for name, value in pairs(value[4]) do
			weight = weight + WeightsWatcher:getWeight(name, value, weightsScale)
		end
	end
	if ww_vars.options.normalizeWeights == true then
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

function WeightsWatcher:getWeight(stat, value, weightsScale)
	stat = string.lower(stat)
	if weightsScale[stat] then
		return weightsScale[stat] * value
	else
		return 0
	end
end

function WeightsWatcher:getGemStats(...)
	local stats, stat, lastGem
	local statTable = {}
	lastGem = 0
	for _, gemId in pairs(...) do
		stats = GemIds[tonumber(gemId)]
		if stats then
			table.insert(statTable, stats)
			lastGem = #(statTable)
		else
			if gemId ~= "0" then
				print("WeightsWatcher: Unhandled gemId " .. gemId)
			end
			-- Ensures gems line up with their sockets
			table.insert(statTable, {"None", {}})
		end
	end

	-- Removes extra empty gems
	for i = lastGem + 1, #(statTable) do
		table.remove(statTable)
	end
	return statTable
end

function WeightsWatcher:getItemStats(link)
	local ttleft, ttright, origTextL, textL, textR, pattern, func, start
	local normalStats, socketList, socketBonusStat = setmetatable({}, ww_normalStatsMetatable), {}
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
		ttleft = getglobal("WeightsWatcherHiddenTooltipTextLeft" .. i)
		ttright = getglobal("WeightsWatcherHiddenTooltipTextRight" .. i)
		origTextL = ttleft:GetText()
		textR = ttright:GetText()
		textL = WeightsWatcher:preprocess(origTextL)

		matched = false
		start, _, value = string.find(textL, socketBonus)
		if start then
			matched = true
			socketBonusStat = WeightsWatcher:singleStat(value)
		end
		if not matched then
			for _, regex in pairs(SocketLines) do
				start, _, value = string.find(textL, regex)
				if start then
					matched = true
					table.insert(socketList, value)
					break
				end
			end
			if not matched then
				for _, regex in pairs(IgnoredLines) do
					if string.find(textL, regex) then
						matched = true
						break
					end
				end
				if not matched then
					for _, regex in pairs(DoubleSlotLines) do
						if string.find(textL, regex) then
							matched = true
							normalStats["Slot"] =  textL
							normalStats["Subslot"] = textR
							if textL == "Ranged" or textL == "Projectile" then
								ranged = true
							end
							break
						end
					end
					if not matched then
						for _, regex in pairs(SingleSlotLines) do
							if string.find(textL, regex) then
								matched = true
								normalStats["Slot"] =  textL
								break
							end
						end
						if not matched then
							for _, regex in pairs(MultipleStatLines) do
								pattern, func = unpack(regex)
								if string.find(textL, pattern) then
									statsList = func(textL, textR)
									if statsList then
										normalStats = normalStats + statsList
										matched = true
										break
									end
								end
							end
							if not matched then
								stat = WeightsWatcher:singleStat(textL)
								if stat then
									normalStats = normalStats + stat
								end
							end
						end
					end
				end
			end
		end
	end
	if ranged then
		normalStats["Ranged DPS"] = normalStats["DPS"]
		normalStats["DPS"] = nil
	end
	return normalStats, socketList, socketBonusStat
end

function WeightsWatcher:preprocess(text)
	for pattern, replacement in pairs(Preprocess) do
		if string.find(text, pattern) then
			text = gsub(text, pattern, replacement)
		end
	end

	return text
end
