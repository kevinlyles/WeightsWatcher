if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

ww_itemCache = {}
ww_bareItemCache = {}
ww_weightCache = {}
ww_weightIdealCache = {}

function WeightsWatcher:OnInitialize()
	local tempVars

	SLASH_WEIGHTSWATCHER1="/ww"
	SLASH_WEIGHTSWATCHER2="/weightswatcher"
	SlashCmdList["WEIGHTSWATCHER"] =
		function(msg)
			commandHandler(msg)
		end

	tempVars = WeightsWatcher:Upgrade("account")
	if tempVars then
		ww_vars = tempVars
	else
		-- TODO: disable the addon
	end
-- 	print("WeightsWatcher: be sure to restore the default weights if you want the new default weights.")
	tempVars = WeightsWatcher:Upgrade("character")
	if tempVars then
		ww_charVars = tempVars
	else
		-- TODO: disable the addon
	end
	initializeWeightsConfig()
end

currentHooks = {}

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
end

function WeightsWatcher:OnDisable()
	for _, hook in currentHooks do
		self:Unhook(unpack(hook))
	end
end

function WeightsWatcher:cacheItemStats(link)
	-- Stats: normal stats, sockets, socket bonus, gem-given stats, whether the socket bonus is active, ideal gems, ideal gems ignoring socket bonuses
	local normalStats, sockets, socketBonusStat, socketBonusActive, gemStats, bestGems, bestGemsIgnoreSocket

	_, itemId, _, gemId1, gemId2, gemId3, gemId4, suffixId, uniqueId, linkLevel = strsplit(":", link)
	-- Strip color codes
	linkLevel = strsplit("|", linkLevel)
	bareLink = strjoin(":", "item", itemId, "0:0:0:0:0", suffixId, uniqueId, linkLevel)

	if ww_bareItemCache[bareLink] then
		normalStats, sockets, socketBonusStat = unpack(ww_bareItemCache[bareLink])
	else
		normalStats, sockets, socketBonusStat = WeightsWatcher:getItemStats(bareLink)
		ww_bareItemCache[bareLink] = {normalStats, sockets, socketBonusStat}
	end

	if ww_itemCache[link] then
		socketBonusActive, gemStats = unpack(ww_itemCache[link])
	else
		gemStats = WeightsWatcher:getGemStats({gemId1, gemId2, gemId3, gemId4})

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

		ww_itemCache[link] = {socketBonusActive, gemStats}
	end

	for _, class in ipairs(ww_charVars.activeWeights) do
		if ww_vars.weightsList[class] then
			if not ww_weightCache[class] then
				ww_weightCache[class] = {}
			end
			for _, weight in pairs(ww_charVars.activeWeights[class]) do
				if ww_vars.weightsList[class][weight] then
					if not ww_weightCache[class][weight] then
						ww_weightCache[class][weight] = {}
					end
					if not ww_weightCache[class][weight][link] then
						ww_weightCache[class][weight][link] = WeightsWatcher:calculateWeight(normalStats, socketBonusActive, socketBonusStat, gemStats, ww_vars.weightsList[class][weight])
					end
				end
			end
		end
	end

	if #(sockets) > 0 then
		for _, class in ipairs(ww_charVars.activeWeights) do
			if ww_vars.weightsList[class] then
				if not ww_weightIdealCache[class] then
					ww_weightIdealCache[class] = {}
				end
				for _, weight in pairs(ww_charVars.activeWeights[class]) do
					if ww_vars.weightsList[class][weight] then
						if not ww_weightIdealCache[class][weight] then
							ww_weightIdealCache[class][weight] = {}
						end

						if not ww_weightIdealCache[class][weight][bareLink] then
							ww_weightIdealCache[class][weight][bareLink] = {}

							bestGems = {}
							bestGemsIgnoreSocket = {}
							socketBonusActive = true
							for _, stat in pairs(sockets) do
								local gemId, _, gemIdIgnoreSocket = WeightsWatcher:bestGemsForSocket(stat, socketBonusStat, ww_vars.weightsList[class][weight], ww_vars.options.gemQualityLimit)
								if gemIdIgnoreSocket ~= 0 then
									if not WeightsWatcher:matchesSocket(GemIds[gemIdIgnoreSocket][1], stat) then
										socketBonusActive = false
									end
									if gemId ~= 0 then
										table.insert(bestGems, gemId)
									end
									table.insert(bestGemsIgnoreSocket, gemIdIgnoreSocket)
								end
							end
							gemStats = WeightsWatcher:getGemStats(bestGems)
							gemStatsIgnoreSockets = WeightsWatcher:getGemStats(bestGemsIgnoreSocket)
							local weightVal, weightValIgnoreSockets
							weightVal = WeightsWatcher:calculateWeight(normalStats, true, socketBonusStat, gemStats, ww_vars.weightsList[class][weight])
							weightValIgnoreSockets = WeightsWatcher:calculateWeight(normalStats, socketBonusActive, socketBonusStat, gemStatsIgnoreSockets, ww_vars.weightsList[class][weight])

							if weightVal < weightValIgnoreSockets then
								weightVal = weightValIgnoreSockets
								gemStats = gemStatsIgnoreSockets
							end
							ww_weightIdealCache[class][weight][bareLink].gemStats = gemStats
							ww_weightIdealCache[class][weight][bareLink].score = weightVal
						end
					end
				end
			end
		end
	end

	return bareLink
end

function WeightsWatcher:displayItemStats(tooltip, ttname)
	local link, bareLink, itemType, stackSize, sockets, gemStats
	local stat, value, string
	local _, playerClass = UnitClass("player")

	_, link = tooltip:GetItem()
	if link == nil then
		return
	end

	_, _, _, _, _, itemType, _, stackSize = GetItemInfo(link)
	if (IsEquippableItem(link) and itemType ~= "Container" and itemType ~= "Quiver") or (itemType == "Gem" and stackSize == 1) or (itemType == "Consumable") or (itemType == "Recipe") then
		bareLink = WeightsWatcher:cacheItemStats(link)

		if keyDetectors[ww_vars.options.tooltip.showWeights]() then
			tooltip:AddLine("Current Weights:")
			for _, class in ipairs(ww_charVars.activeWeights) do
				if ww_vars.weightsList[class] then
					for _, weight in pairs(ww_charVars.activeWeights[class]) do
						if ww_vars.weightsList[class][weight] then
							string = "  " .. weight
							if ww_vars.options.tooltip.showClassNames == "Always" or (ww_vars.options.tooltip.showClassNames == "Others" and class ~= playerClass) then
								string = string .. " - " .. classNames[class]
							end
							tooltip:AddDoubleLine(string, string.format("%.3f", ww_weightCache[class][weight][link]))
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
									string = "  " .. weight
									if ww_vars.options.tooltip.showClassNames == "Always" or (ww_vars.options.tooltip.showClassNames == "Others" and class ~= playerClass) then
										string = string .. " - " .. classNames[class]
									end
									tooltip:AddDoubleLine(string, string.format("%.3f", ww_weightIdealCache[class][weight][bareLink].score))
									if keyDetectors[ww_vars.options.tooltip.showIdealGems]() then
										gemStats = ww_weightIdealCache[class][weight][bareLink].gemStats
										for _, gem in ipairs(gemStats) do
											tooltip:AddDoubleLine("    Using " .. gem[2] .. " (" .. gem[1] .. ")", " ")
											if keyDetectors[ww_vars.options.tooltip.showIdealGemStats]() then
												for _, stat in ipairs(gem[4]) do
													stat, value = unpack(stat)
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
						if ww_vars.options.tooltip.showIdealGems then
							tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showIdealGems .. " to show ideal gems>")
						end
					elseif not ww_vars.options.tooltip.hideHints and not keyDetectors[ww_vars.options.tooltip.showIdealGemStats]() then
						if ww_vars.options.tooltip.showIdealGemStats then
							tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showIdealGemStats .. " to show ideal gem stats>")
						end
					end
				elseif not ww_vars.options.tooltip.hideHints and ww_vars.options.tooltip.showIdealWeights then
					tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showIdealWeights .. " to show ideal weights>")
				end
			end
		elseif not ww_vars.options.tooltip.hideHints and ww_vars.options.tooltip.showWeights then
			tooltip:AddLine("<Press " .. ww_vars.options.tooltip.showWeights .. " to show weights>")
		end
		tooltip:Show()
	end
end

function WeightsWatcher:bestGemsForSocket(socketColor, socketBonusStat, weightScale, qualityLimit)
	local bestGem, bestWeight, bestGemIgnoreSocket, bestWeightIgnoreSocket, gemId, gemStats, socketBonusActive, weight = 0, 0, 0, 0

	for gemId, gemStats in pairs(GemIds) do
		if not qualityLimit or gemStats[3] <= qualityLimit then
			socketBonusActive = WeightsWatcher:matchesSocket(gemStats[1], socketColor)
			-- Meta sockets don't ever hold anything but meta gems
			if socketBonusActive or (gemStats[1] ~= "Meta" and socketColor ~= "Meta") then
				weight = WeightsWatcher:calculateWeight({}, socketBonusActive, nil, {gemStats}, weightScale)
				if socketBonusActive then
					if bestGem == 0 or weight > bestWeight then
						bestGem = gemId
						bestWeight = weight
					end
				end
				if bestGemIgnoreSocket == 0 or weight > bestWeightIgnoreSocket then
					bestGemIgnoreSocket = gemId
					bestWeightIgnoreSocket = weight
				end
			end
		end
	end
	return bestGem, bestWeight, bestGemIgnoreSocket, bestWeightIgnoreSocket
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

	for _, value in pairs(normalStats) do
		weight = weight + WeightsWatcher:getWeight(value, weightsScale)
	end
	if socketBonusActive and socketBonusStat then
		weight = weight + WeightsWatcher:getWeight(socketBonusStat, weightsScale)
	end
	for _, value in pairs(gemStats) do
		for _, value in pairs(value[4]) do
			weight = weight + WeightsWatcher:getWeight(value, weightsScale)
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

function WeightsWatcher:getWeight(stat, weightsScale)
	local name, value = unpack(stat)
	name = string.lower(name)
	if weightsScale[name] then
		return weightsScale[name] * value
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
	local normalStats, socketList, socketBonusStat = {}, {}
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
							table.insert(normalStats, {"Slot", textL})
							table.insert(normalStats, {"Subslot", textR})
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
								table.insert(normalStats, {"Slot", textL})
								break
							end
						end
						if not matched then
							for _, regex in pairs(MultipleStatLines) do
								pattern, func = unpack(regex)
								if string.find(textL, pattern) then
									statsList = func(textL, textR)
									if statsList then
										for _, stat in pairs(statsList) do
											table.insert(normalStats, stat)
										end
										matched = true
										break
									end
								end
							end
							if not matched then
								stat = WeightsWatcher:singleStat(textL)
								if stat then
									table.insert(normalStats, stat)
								end
							end
						end
					end
				end
			end
		end
	end
	if ranged then
		for _, stat in ipairs(normalStats) do
			if stat[1] == "DPS" then
				stat[1] = "Ranged DPS"
			end
		end
	end
	return normalStats, socketList, socketBonusStat
end

function WeightsWatcher:preprocess(text)
	local pattern, replacement

	for _, regex in pairs(Preprocess) do
		pattern, replacement = unpack(regex)
		if string.find(text, pattern) then
			text = gsub(text, pattern, replacement)
		end
	end

	return text
end
