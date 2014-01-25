function ww_configShowWeights(self)
	self.label:SetText(ww_localization["SHOW_WTS"])
	self.dropdown:SetText("showWeights")
end

function ww_configShowIdealWeights(self)
	self.label:SetText(ww_localization["SHOW_IDEAL_WTS"])
	self.dropdown:SetText("showIdealWeights")
end

function ww_configShowEnhancements(self)
	self.label:SetText(ww_localization["SHOW_IDEAL_ENHANCEMENTS"])
	self.dropdown:SetText("showEnhancements")
end

function ww_configShowAlternateEnhancements(self)
	self.label:SetText(ww_localization["SHOW_ALT_IDEAL_ENHANCEMENTS"])
	self.dropdown:SetText("showAlternateEnhancements")
end

function ww_configShowEnhancementStats(self)
	self.label:SetText(ww_localization["SHOW_IDEAL_ENHANCEMENT_STATS"])
	self.dropdown:SetText("showEnhancementStats")
end

function ww_configShowDebugInfo(self)
	self.label:SetText(ww_localization["SHOW_DEBUG"])
	self.dropdown:SetText("showDebugInfo")
end

function ww_configShowEnhancementsWhenDropdownLoad(self)
	UIDropDownMenu_Initialize(self, ww_ShowEnhancementsWhenDropDownInitialize)
	UIDropDownMenu_SetSelectedValue(self, ww_vars.options.tooltip.showEnhancementsWhen)
end

function ww_configShowEnhancementsWhenLabel(self)
	self.label:SetText(ww_localization["SHOW_ENHANCEMENTS_WHEN"])
end

function ww_configHideTooltipHintsClick(self)
	if self:GetChecked() then
		ww_vars.options.tooltip.hideHints = true
	else
		ww_vars.options.tooltip.hideHints = false
	end
end

local function shouldBeChecked()
	return ww_vars.options.tooltip.hideHints
end

function ww_configHideTooltipHintsLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["HIDE_HINTS_TT"]
	self:SetText(ww_localization["HIDE_HINTS"])
end

function ww_configShowClassNamesDropdownLoad(self)
	UIDropDownMenu_Initialize(self, ww_ShowClassNameDropDownInitialize)
	UIDropDownMenu_SetSelectedValue(self, ww_vars.options.tooltip.showClassNames)
end

function ww_configShowClassNamesLabel(self)
	self.label:SetText(ww_localization["SHOW_CLASS"])
end

function ww_configShowZeroScoresClick(self)
	if self:GetChecked() then
		ww_vars.options.tooltip.showZeroScores = true
	else
		ww_vars.options.tooltip.showZeroScores = false
	end
end

local function shouldBeChecked()
	return ww_vars.options.tooltip.showZeroScores
end

function ww_configShowZeroScoresLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["SHOW_ZEROES_TT"]
	self:SetText(ww_localization["SHOW_ZEROES"])
end

function ww_configShowDifferencesClick(self)
	if self:GetChecked() then
		ww_vars.options.tooltip.showDifferences = true
	else
		ww_vars.options.tooltip.showDifferences = false
	end
end

local function shouldBeChecked()
	return ww_vars.options.tooltip.showDifferences
end

function ww_configShowDifferencesLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["SHOW_DIFF_TT"]
	self:SetText(ww_localization["SHOW_DIFF"])
end

function ww_configNormalizeWeightsClick(self)
	if self:GetChecked() then
		ww_vars.options.tooltip.normalizeWeights = true
	else
		ww_vars.options.tooltip.normalizeWeights = false
	end
end

local function shouldBeChecked()
	return ww_vars.options.tooltip.normalizeWeights
end

function ww_configNormalizeWeightsLoad(self)
	self.shouldBeChecked = shouldBeChecked
	self.ttText = ww_localization["NORMALIZE_TT"]
	self:SetText(ww_localization["NORMALIZE"])
end

local function default()
	ww_vars.options.tooltip = ww_defaultVars.options.tooltip
	ww_weightCache = setmetatable({}, ww_weightCacheMetatable)
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ww_configDisplayLoad(self)
	local checkBoxes = {
		hideHints = self.hideTooltipHints,
		showZeroScores = self.showZeroScores,
		showDifferences = self.showDifference,
		normalizeWeights = self.normalizeWeights,
	}

	local function refresh()
		ww_refreshCheckBoxes(checkBoxes)
	end

	self.header:SetText(ww_localization["DISPLAY_OPTS"])
	self.name = ww_localization["DISPLAY_NAME"]
	self.parent = "WeightsWatcher"
	self.default = default
	self.refresh = refresh
	InterfaceOptions_AddCategory(self)
end
