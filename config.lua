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

local function showConfig(frame)
	if frame:IsVisible() then
		InterfaceOptionsFrameCancel:Click()
	else
		-- TODO: make this always open to the right section if possible
		InterfaceOptionsFrame_OpenToCategory(frame)
	end
end

function ww_weightsCommand()
	if InterfaceOptionsFrame:IsVisible() then
		InterfaceOptionsFrameCancel:Click()
	end
	if InterfaceOptionsFrame:IsVisible() then
		return
	end
	if ww_weights:IsVisible() then
		ww_weights:Hide()
	else
		ww_weights:Show()
	end
end

function ww_commandHandler(msg)
	if msg:find("^" .. L["config"]) then
		local frame = ww_config
		if msg:find(L["gems"]) then
			frame = ww_configGemOptions
		elseif msg:find(L["enchants"]) then
			frame = ww_configEnchantOptions
		elseif msg:find(L["display"]) then
			frame = ww_configDisplayOptions
		elseif msg:find(L["calculation"]) then
			frame = ww_configCalculationOptions
		end
		if ww_weights:IsVisible() then
			ww_weights:SmartHide(function()
					showConfig(frame)
				end
			)
		else
			showConfig(frame)
		end
	elseif msg == L["weights"] then
		ww_weightsCommand()
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

local function RepOptionsDropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
	ww_vars.options.enchants.considerRep = choice.value
	if choice.value == "Any" then
		ww_configEnchantOptions.considerBoa:Disable()
	else
		ww_configEnchantOptions.considerBoa:Enable()
	end
	WeightsWatcher.ResetEnchantCache()
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ww_RepOptionsDropDownInitialize(dropdown)
	local info = {}

	info.func = RepOptionsDropDownOnClick
	info.arg1 = dropdown
	for _, value in ipairs({ "High enough", "Neutral or better", "Any" }) do
		info.text = value
		info.value = value
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end

local function ProfessionOptionsDropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
	ww_vars.options.enchants.considerProfessions = choice.value
	WeightsWatcher.ResetEnchantCache()
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ww_ProfessionOptionsDropDownInitialize(dropdown)
	local info = {}

	info.func = ProfessionOptionsDropDownOnClick
	info.arg1 = dropdown
	for _, value in ipairs({ "High enough", "One or higher", "Any" }) do
		info.text = value
		info.value = value
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end

local function ShowEnhancementsWhenDropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
	ww_vars.options.tooltip.showEnhancementsWhen = choice.value
end

function ww_ShowEnhancementsWhenDropDownInitialize(dropdown)
	local info = {}

	info.func = ShowEnhancementsWhenDropDownOnClick
	info.arg1 = dropdown
	for _, value in ipairs({ "None applied", "Non-ideal applied", "Always" }) do
		info.text = value
		info.value = value
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end

local function okay()
	ww_config.originalOpts = nil
end

local function cancel()
	ww_vars.options = ww_config.originalOpts
	ww_config.originalOpts = nil
	WeightsWatcher.ResetTables()
end

function ww_loadConfig(self)
	local function refresh()
		local function refresh()
			ww_config.originalOpts = ww_config.originalOpts or ww_deepTableCopy(ww_vars.options)
		end

		self.version:SetText(string.format(ww_localization["CONF_WW_VER"], GetAddOnMetadata("WeightsWatcher", "Version")))
		self.accountVersion:SetText(string.format(ww_localization["CONF_ACCT_VER"], ww_vars.dataMajorVersion, ww_vars.dataMinorVersion))
		self.characterVersion:SetText(string.format(ww_localization["CONF_CHAR_VER"], ww_charVars.dataMajorVersion, ww_charVars.dataMinorVersion))
		self.contact:SetText(string.format(ww_localization["CONF_CONTACT"], "WeightsWatcher@gmail.com"))
		self.webpage:SetText(string.format(ww_localization["CONF_WEBPAGE"], "http://wowinterface.com/downloads/\n         info15289-WeightsWatcher.html"))
		self.description:SetText(ww_localization["CONF_DESC"])
		self.refresh = refresh
		self.refresh()
	end

	self.name = "WeightsWatcher"
	self.okay = okay
	self.cancel = cancel
	self.refresh = refresh
	InterfaceOptions_AddCategory(self)
end
