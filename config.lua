if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

function commandHandler(msg)
	if msg == "config" then
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
	elseif msg == "weights" then
		ww_config:Hide()
		if ww_config:IsShown() then
			return
		end
		if ww_weights:IsVisible() then
			ww_weights:Hide()
		else
			ww_weights:Show()
		end
	elseif msg == "version" then
		print("WeightsWatcher version: 1.1b8")
		print("  Account data version: " .. ww_vars.dataMajorVersion .. "." .. ww_vars.dataMinorVersion)
		print("  Character data version: " .. ww_charVars.dataMajorVersion .. "." .. ww_charVars.dataMinorVersion)
	else
		printHelp()
	end
end

function printHelp()
	print("WeightsWatcher help:")
	print("Type /weightswatcher <arg> (or /ww <arg>)")
	print("  config      opens the main configuration window")
	print("  weights   opens the weights configuration window")
	print("  version    displays version information")
	print("  help         displays this message")
end

function GemQualityDropDownInitialize(dropdown)
	local info = {}

	info.func = GemQualityDropDownOnClick
	info.arg1 = dropdown
	for num, name in ipairs(gemQualityNames) do
		info.text = name
		info.value = num
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end

function GemQualityDropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
	ww_vars.options.gems.qualityLimit = choice.value
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ModifierKeyDropDownInitialize(dropdown)
	local info = {}

	info.func = ModifierKeyDropDownOnClick
	info.arg1 = dropdown
	for _, value in ipairs(keyDetectors) do
		info.text = value
		info.value = value
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end

function ModifierKeyDropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
	ww_vars.options.tooltip[dropdown:GetText()] = choice.value
end

function ShowClassNameDropDownInitialize(dropdown)
	local info = {}

	info.func = ShowClassNameDropDownOnClick
	info.arg1 = dropdown
	for _, value in ipairs(classNameOptions) do
		info.text = classNameOptions[value]
		info.value = value
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end

function ShowClassNameDropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
	ww_vars.options.tooltip.showClassNames = choice.value
end
