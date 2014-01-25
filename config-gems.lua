function ww_configGemsQualityDropdownLoad(self)
	UIDropDownMenu_SetWidth(self, 200, 15)
	ww_leftJustifyDropDownText(self)
end

function ww_configGemsQualityDropdownShow(self)
	UIDropDownMenu_Initialize(self, ww_GemQualityDropDownInitialize)
	UIDropDownMenu_SetSelectedValue(self, ww_vars.options.gems.qualityLimit)
end

function ww_configGemsQualityDropDownLabel(self)
	self.label:SetText(ww_localization["MAX_GEM_QUAL"])
	self:SetBackdropColor(1, 0, 0, 0.5)
end

local function gemTypeOnClick(self, type)
	if self:GetChecked() then
		ww_vars.options.gems.types[type] = true
	else
		ww_vars.options.gems.types[type] = false
	end
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ww_configGemsUEClick(self)
	gemTypeOnClick(self, "Unique-Equipped")
end

local function shouldBeChecked()
	return ww_vars.options.gems.types["Unique-Equipped"]
end

function ww_configGemsUELoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_UE_GEMS_TT"]
	self:SetText(ww_localization["USE_UE_GEMS"])
end

function ww_configGemsJCClick(self)
	gemTypeOnClick(self, "Jewelcrafter-Only")
end

local function shouldBeChecked()
	return ww_vars.options.gems.types["Jewelcrafter-Only"]
end

function ww_configGemsJCLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_JC_GEMS_TT"]
	self:SetText(ww_localization["USE_JC_GEMS"])
end

function ww_configGemsVendorClick(self)
	gemTypeOnClick(self, "Vendor")
end

local function shouldBeChecked()
	return ww_vars.options.gems.types["Vendor"]
end

function ww_configGemsVendorLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_VP_GEMS_TT"]
	self:SetText(ww_localization["USE_VP_GEMS"])
end

function ww_configGemsPVPVendorClick(self)
	gemTypeOnClick(self, "PVP-Vendor")
end

local function shouldBeChecked()
	return ww_vars.options.gems.types["PVP-Vendor"]
end

function ww_configGemsPVPVendorLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_PVPVP_GEMS_TT"]
	self:SetText(ww_localization["USE_PVPVP_GEMS"])
end

function ww_configGemsCraftedClick(self)
	if self:GetChecked() then
		ww_vars.options.gems.sources["Crafted"] = true
		self:GetParent().useProcGems:Enable()
	else
		ww_vars.options.gems.sources["Crafted"] = false
		self:GetParent().useProcGems:Disable()
	end
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

local function shouldBeChecked()
	return ww_vars.options.gems.types["Crafted"]
end

function ww_configGemsCraftedLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_PC_GEMS_TT"]
	self:SetText(ww_localization["USE_PC_GEMS"])
end

function ww_configGemsProcClick(self)
	gemTypeOnClick(self, "Procced")
end

local function shouldBeChecked()
	return ww_vars.options.gems.types["Procced"]
end

local function shouldBeEnabled()
	return ww_vars.options.gems.sources["Crafted"]
end

function ww_configGemsProcLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.shouldBeEnabled = shouldBeEnabled
	self.ttText = ww_localization["USE_P_GEMS_TT"]
	self:SetText(ww_localization["USE_P_GEMS"])
end

function ww_configGemsDropClick(self)
	gemTypeOnClick(self, "Drop")
end

local function shouldBeChecked()
	return ww_vars.options.gems.types["Drop"]
end

function ww_configGemsDropLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_D_GEMS_TT"]
	self:SetText(ww_localization["USE_D_GEMS"])
end

function ww_configGemsQuestClick(self)
	gemTypeOnClick(self, "Quest")
end

local function shouldBeChecked()
	return ww_vars.options.gems.types["Quest"]
end

function ww_configGemsQuestLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_QR_GEMS_TT"]
	self:SetText(ww_localization["USE_QR_GEMS"])
end

function ww_configGemsBreakSocketColorsClick(self)
	if self:GetChecked() then
		ww_vars.options.gems.breakSocketColors = false
		self:GetParent().alwaysObeySocketColors:Enable()
	else
		ww_vars.options.gems.breakSocketColors = true
		self:GetParent().alwaysObeySocketColors:Disable()
	end
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

local function shouldBeChecked()
	return not ww_vars.options.gems.breakSocketColors
end

function ww_configGemsBreakSocketColorsLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["MATCH_SOCKET_TT"]
	self:SetText(ww_localization["MATCH_SOCKET"])
end

function ww_configGemsNeverBreakSocketColorsClick(self)
	if self:GetChecked() then
		ww_vars.options.gems.neverBreakSocketColors = true
	else
		ww_vars.options.gems.neverBreakSocketColors = false
	end
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

local function shouldBeChecked()
	return ww_vars.options.gems.neverBreakSocketColors
end

local function shouldBeEnabled()
	return not ww_vars.options.gems.breakSocketColors
end

function ww_configGemsNeverBreakSocketColorsLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.shouldBeEnabled = shouldBeEnabled
	self.ttText = ww_localization["ALWAYS_MATCH_SOCKET_TT"]
	self:SetText(ww_localization["ALWAYS_MATCH_SOCKET"])
end

local function default()
	ww_vars.options.gems = ww_defaultVars.options.gems
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ww_configGemsLoad(self)
	local checkBoxes = {
		["Unique-Equipped"] = self.useUEGems,
		["Jewelcrafter-Only"] = self.useJCOnlyGems,
		["Vendor"] = self.useVendorGems,
		["PVP-Vendor"] = self.usePVPVendorGems,
		["Crafted"] = self.useCraftedGems,
		["Procced"] = self.useProcGems,
		["Drop"] = self.useDropGems,
		["Quest"] = self.useQuestGems,
		["obeySocketColors"] = self.obeySocketColors,
		["alwaysObeySocketColors"] = self.alwaysObeySocketColors,
	}

	local function refresh()
		ww_refreshCheckBoxes(checkBoxes)
	end

	self.header:SetText(ww_localization["IDEAL_GEM_OPTS"])
	self.name = ww_localization["IDEAL_GEM_NAME"]
	self.parent = "WeightsWatcher"
	self.default = default
	self.refresh = refresh
	InterfaceOptions_AddCategory(self)
end
