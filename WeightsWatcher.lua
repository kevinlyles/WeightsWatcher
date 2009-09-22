if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

function WeightsWatcher:OnInitialize()
	SLASH_WEIGHTSWATCHER1="/ww"
	SLASH_WEIGHTSWATCHER2="/weightswatcher"
	SlashCmdList["WEIGHTSWATCHER"] =
		function(msg)
			commandHandler(msg)
		end
end

function commandHandler(msg)
	open_config()
end

function open_config()
	WeightsWatcherConfig:Show()
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

function WeightsWatcher:displayItemStats(tooltip, ttname)
	local itemType, ttleft, ttright, origTextL, textL, textR, pattern, func, stat, start
	local _, link = tooltip:GetItem()

	if link == nil then
		return
	end

	_, _, _, _, _, itemType, _, stackSize = GetItemInfo(link)
	if (IsEquippableItem(link) and itemType ~= "Container" and itemType ~= "Quiver") or (itemType == "Gem" and stackSize == 1) or (itemType == "Consumable") or (itemType == "Recipe") then
		-- Skip item name and "currently equipped"
		if getglobal(ttname .. "TextLeft1"):GetText() == CURRENTLY_EQUIPPED then
			start = 3
		else
			start = 2
		end
		for i = start, tooltip:NumLines() do
			ttleft = getglobal(ttname .. "TextLeft" .. i)
			ttright = getglobal(ttname .. "TextRight" .. i)
			origTextL = ttleft:GetText()
			textR = ttright:GetText()
			textL = WeightsWatcher:preprocess(origTextL)

			matched = false
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
						tooltip:AddDoubleLine(textL, textR)
						break
					end
				end
				if not matched then
					for _, regex in pairs(SingleSlotLines) do
						if string.find(textL, regex) then
							matched = true
							tooltip:AddLine(textL)
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
										tooltip:AddDoubleLine(unpack(stat))
									end
									matched = true
									break
								end
							end
						end
						if not matched then
							stat = WeightsWatcher:singleStat(textL)
							if stat then
								tooltip:AddDoubleLine(unpack(stat))
							else
								ttleft:SetText(origTextL .. " *")
							end
						end
					end
				end
			end
		end
		tooltip:Show()
	end
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
