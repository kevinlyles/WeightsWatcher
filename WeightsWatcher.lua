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

function WeightsWatcher:OnEnable()
	self:SecureHook(GameTooltip, "SetAuctionItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetAuctionSellItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetBagItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetBuybackItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetGuildBankItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetInboxItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetInventoryItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetLootItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetLootRollItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetMerchantItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetQuestItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetQuestLogItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetSendMailItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetTradePlayerItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetTradeSkillItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	self:SecureHook(GameTooltip, "SetTradeTargetItem", function(self, ...) DisplayItemInfo(self, "GameTooltip", ...) end)
	-- Item link tooltips
	self:SecureHook(ItemRefTooltip, "SetHyperlink", function(self, ...) DisplayItemInfo(self, "ItemRefTooltip", ...) end)
	-- Secondary and tertiary comparison tooltips
	self:SecureHook(ShoppingTooltip1, "SetHyperlinkCompareItem", function(self, ...) DisplayItemInfo(self, "ShoppingTooltip1", ...) end)
	self:SecureHook(ShoppingTooltip2, "SetHyperlinkCompareItem", function(self, ...) DisplayItemInfo(self, "ShoppingTooltip2", ...) end)
end

function WeightsWatcher:OnDisable()
	self:Unhook(GameTooltip, "SetAuctionItem")
	self:Unhook(GameTooltip, "SetAuctionSellItem")
	self:Unhook(GameTooltip, "SetBagItem")
	self:Unhook(GameTooltip, "SetBuybackItem")
	self:Unhook(GameTooltip, "SetGuildBankItem")
	self:Unhook(GameTooltip, "SetInboxItem")
	self:Unhook(GameTooltip, "SetInventoryItem")
	self:Unhook(GameTooltip, "SetLootItem")
	self:Unhook(GameTooltip, "SetLootRollItem")
	self:Unhook(GameTooltip, "SetMerchantItem")
	self:Unhook(GameTooltip, "SetQuestItem")
	self:Unhook(GameTooltip, "SetQuestLogItem")
	self:Unhook(GameTooltip, "SetSendMailItem")
	self:Unhook(GameTooltip, "SetTradePlayerItem")
	self:Unhook(GameTooltip, "SetTradeSkillItem")
	self:Unhook(GameTooltip, "SetTradeTargetItem")
	self:unhook(ItemRefTooltip, "SetHyperlink")
	self:Unhook(ShoppingTooltip1, "SetHyperlinkCompareItem")
	self:Unhook(ShoppingTooltip2, "SetHyperlinkCompareItem")
end

function DisplayItemInfo(tooltip, ttname)
	local itemType, ttline, origText, text, pattern, func, stat, start, name, value
	local _, link = tooltip:GetItem()

	if link == nil then
		return
	end

	_, _, _, _, _, itemType, _, stackSize = GetItemInfo(link)
	if IsEquippableItem(link) or (itemType == "Gem" and stackSize == 1) then
		-- Skip item name and "currently equipped"
		if getglobal(ttname .. "TextLeft1"):GetText() == CURRENTLY_EQUIPPED then
			start = 3
		else
			start = 2
		end
		for i = start, tooltip:NumLines() do
			ttline = getglobal(ttname .. "TextLeft" .. i)
			origText = ttline:GetText()
			text = WeightsWatcher:preprocess(origText)

			matched = false
			for _, regex in pairs(ProcessedLines) do
				if type(regex) == "table" then
					pattern, func = unpack(regex)
					if string.find(text, pattern) then
						stat = func(text, pattern)
						if stat then
							tooltip:AddDoubleLine(unpack(stat))
							matched = true
							break
						end
					end
				else
					start, _, name, value = string.find(text, regex)
					if start then
						tooltip:AddDoubleLine(name, value)
						matched = true
						break
					end
				end
			end
			if not matched then
				ttline:SetText(origText .. " *")
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
