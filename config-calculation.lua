function ww_uptimeRatioTextChanged(self)
	local text = self:GetText()
	if self:GetNumber() ~= 0 or text:match("^[0.]+$") or text == "" then
		self.number = text
		ww_vars.options.calculation.useEffectUptimeRatio = self:GetNumber() / 100
		ww_weightCache = setmetatable({}, ww_weightCacheMetatable)
		ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
	end
end

function ww_uptimeRatioOnChar(self, text)
	if ww_validateNumber(text, self:GetText()) then
		self.number = self:GetText()
		ww_vars.options.calculation.useEffectUptimeRatio = self:GetNumber() / 100
		ww_weightCache = setmetatable({}, ww_weightCacheMetatable)
		ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
	else
		local cursorPosition = self:GetCursorPosition() - 1
		self:SetText(self.number)
		self:SetCursorPosition(cursorPosition)
	end
end

function ww_uptimeRatioOnLoad(self)
	if ww_cooldownUseEffects then
		self.label:SetText(ww_localization["IDEAL_USE_UPTIME"])
	else
		self:SetParent(nil)
		self:Hide()
	end
end

local function default()
	ww_vars.options.calculation = ww_deepTableCopy(ww_defaultVars.options.calculation)
	ww_weightCache = setmetatable({}, ww_weightCacheMetatable)
	ww_weightIdealCache = setmetatable({}, ww_weightIdealCacheMetatable)
end

function ww_configCalculationOnLoad(self)
	local function refresh()
		self.useEffectUptimeRatio.ratio:SetText(ww_vars.options.calculation.useEffectUptimeRatio * 100)
	end

	self.title:SetText(ww_localization["CALC_OPTS"])
	self.name = ww_localization["CALC_NAME"]
	self.parent = "WeightsWatcher"
	self.default = default
	self.refresh = refresh
	InterfaceOptions_AddCategory(self)
end
