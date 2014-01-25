function ww_load(self)
	self:RegisterEvent("ADDON_LOADED")
end

function ww_event(self, event, ...)
	if event == "ADDON_LOADED" and ... == "WeightsWatcher" then
		self:OnInitialize()
		self:UnregisterEvent("ADDON_LOADED")
	end
end

function ww_setHiddenTooltipOwner(self)
	self:SetOwner(WorldFrame, "ANCHOR_NONE")
end
