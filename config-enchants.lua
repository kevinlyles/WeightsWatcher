local function enchantSourceOnClick(self, source)
	if self:GetChecked() then
		ww_vars.options.enchants.sources[source] = true
	else
		ww_vars.options.enchants.sources[source] = false
	end
	WeightsWatcher.ResetEnchantCache()
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ww_configEnchantsCraftedClick(self)
	enchantSourceOnClick(self, "Crafted")
end

local function shouldBeChecked()
	return ww_vars.options.enchants.sources["Crafted"]
end

function ww_configEnchantsCraftedLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_PC_ENCH_TT"]
	self:SetText(ww_localization["USE_PC_ENCH"])
end

function ww_configEnchantsPVPVendorClick(self)
	enchantSourceOnClick(self, "PVP-Vendor")
end

local function shouldBeChecked()
	return ww_vars.options.enchants.sources["PVP-Vendor"]
end

function ww_configEnchantsPVPVendorLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_PVPVP_ENCH_TT"]
	self:SetText(ww_localization["USE_PVPVP_ENCH"])
end

function ww_configEnchantsQuestClick(self)
	enchantSourceOnClick(self, "Quest")
end

local function shouldBeChecked()
	return ww_vars.options.enchants.sources["Quest"]
end

function ww_configEnchantsQuestLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_QR_ENCH_TT"]
	self:SetText(ww_localization["USE_QR_ENCH"])
end

function ww_configEnchantsVendorClick(self)
	enchantSourceOnClick(self, "Vendor")
end

local function shouldBeChecked()
	return ww_vars.options.enchants.sources["Vendor"]
end

function ww_configEnchantsVendorLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["USE_VP_ENCH_TT"]
	self:SetText(ww_localization["USE_VP_ENCH"])
end

function ww_configEnchantsConsiderRepShow(self)
	UIDropDownMenu_Initialize(self, ww_RepOptionsDropDownInitialize)
	UIDropDownMenu_SetSelectedValue(self, ww_vars.options.enchants.considerRep)
	if ww_vars.options.enchants.considerRep == "Any" then
		ww_configEnchantOptions.considerBoa:Disable()
	else
		ww_configEnchantOptions.considerBoa:Enable()
	end
end

function ww_configEnchantsConsiderRepLabel(self)
	self.label:SetText(ww_localization["USE_REP_ENCH"])
end

function ww_configEnchantsConsiderBoaClick(self)
	if self:GetChecked() then
		ww_vars.options.enchants.considerBoa = true
	else
		ww_vars.options.enchants.considerBoa = false
	end
	WeightsWatcher.ResetEnchantCache()
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ww_configEnchantsConsiderBoaLoad(self)
	self.shouldBeChecked = function() return ww_vars.options.enchants.considerBoa end
	self.ttText = ww_localization["USE_BTA_ENCH_TT"]
	self:SetText(ww_localization["USE_BTA_ENCH"])
end

function ww_configEnchantsConsiderProfessionsShow(self)
	UIDropDownMenu_Initialize(self, ww_ProfessionOptionsDropDownInitialize)
	UIDropDownMenu_SetSelectedValue(self, ww_vars.options.enchants.considerProfessions)
end

function ww_configEnchantsConsiderProfessionsLabel(self)
	self.label:SetText(ww_localization["USE_PROF_ENCH"])
end

local function default()
	ww_vars.options.enchants = ww_defaultVars.options.enchants
	WeightsWatcher.ResetEnchantCache()
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ww_configEnchantsLoad(self)
	local checkBoxes = {
		["Vendor"] = self.useVendorEnchants,
		["PVP-Vendor"] = self.usePVPVendorEnchants,
		["Crafted"] = self.useCraftedEnchants,
		["Quest"] = self.useQuestEnchants,
		["considerBoa"] = self.considerBoa,
	}

	local function refresh()
		ww_refreshCheckBoxes(checkBoxes)
	end

	self.header:SetText(ww_localization["IDEAL_ENCHANT_OPTS"])
	self.name = ww_localization["IDEAL_ENCHANT_NAME"]
	self.parent = "WeightsWatcher"
	self.default = default
	self.refresh = refresh
	InterfaceOptions_AddCategory(self)
end
