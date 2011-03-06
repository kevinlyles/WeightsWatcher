local L = ww_localization

local function printHelp()
	print(L["HELP_TEXT_HEADER"])
	print(L["HELP_TEXT_GENERAL"])
	print(L["HELP_TEXT_CONFIG"])
	print(L["HELP_TEXT_WEIGHTS"])
	print(L["HELP_TEXT_VERSION"])
	print(L["HELP_TEXT_HELP"])
	print(L["HELP_TEXT_BUGS"])
end

function ww_commandHandler(msg)
	if msg == L["config"] then
		ww_weights:Hide()
		-- TODO: make this work better with the confirmDiscardChanges dialog
		if ww_weights:IsShown() then
			return
		end
		if ww_config:IsVisible() then
			ww_config:Hide()
		else
			ww_config:Show()
		end
	elseif msg == L["weights"] then
		ww_config:Hide()
		if ww_config:IsShown() then
			return
		end
		if ww_weights:IsVisible() then
			ww_weights:Hide()
		else
			ww_weights:Show()
		end
	elseif msg == L["version"] then
		print(string.format(L["WW_VERSION"], GetAddOnMetadata("WeightsWatcher", "Version")))
		print(string.format(L["ACCT_VERSION"], ww_vars.dataMajorVersion, ww_vars.dataMinorVersion))
		print(string.format(L["CHAR_VERSION"], ww_charVars.dataMajorVersion, ww_charVars.dataMinorVersion))
	else
		printHelp()
	end
end

local function GemQualityDropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
	ww_vars.options.gems.qualityLimit = choice.value
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ww_GemQualityDropDownInitialize(dropdown)
	local info = {}

	info.func = GemQualityDropDownOnClick
	info.arg1 = dropdown
	for num, name in ipairs(ww_gemQualityNames) do
		info.text = name
		info.value = num
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end

local function ModifierKeyDropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
	ww_vars.options.tooltip[dropdown:GetText()] = choice.value
end

function ww_ModifierKeyDropDownInitialize(dropdown)
	local info = {}

	info.func = ModifierKeyDropDownOnClick
	info.arg1 = dropdown
	for _, value in ipairs(ww_keyDetectors) do
		info.text = ww_dropdownOptions[value]
		info.value = value
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end

local function ShowClassNameDropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
	ww_vars.options.tooltip.showClassNames = choice.value
end

function ww_ShowClassNameDropDownInitialize(dropdown)
	local info = {}

	info.func = ShowClassNameDropDownOnClick
	info.arg1 = dropdown
	for _, value in ipairs(ww_classNameOptions) do
		info.text = ww_dropdownOptions[value]
		info.value = value
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end
