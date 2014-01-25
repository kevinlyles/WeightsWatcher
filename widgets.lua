function ww_leftJustifyDropDownText(self)
	UIDropDownMenu_JustifyText(self, "LEFT")
end

function ww_initializeModifierKeyDropDown(self)
	UIDropDownMenu_Initialize(self, ww_ModifierKeyDropDownInitialize)
	UIDropDownMenu_SetSelectedValue(self, ww_vars.options.tooltip[self:GetText()])
end

local function setTextItem(self)
	if not self.text then
		self.text = _G[self:GetName() .. "Text"]
	end
end

function ww_showTooltip(self, text)
	GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
	GameTooltip:AddLine(text, 1, 1, 1)
	GameTooltip:Show()
end

function ww_hideTooltip()
	GameTooltip:Hide()
end

function ww_localizeText(self)
	self:SetText(ww_localization[self:GetText()])
end

function ww_checkButtonDisable(self)
	setTextItem(self)
	self.text:SetTextColor(0.5, 0.5, 0.5)
end

function ww_checkButtonEnable(self)
	setTextItem(self)
	self.text:SetTextColor(1, 0.82, 0)
end

function ww_checkButtonTooltipShow(self)
	if self.ttText then
		ww_showTooltip(self, self.ttText)
	end
end

function ww_checkButtonTooltipHide(self)
	if self.ttText then
		ww_hideTooltip()
	end
end

function ww_checkButtonShow(self)
	setTextItem(self)
	self.text:SetText(self:GetText())
end

local function setFontString(self, font)
	self:SetFontString(self:CreateFontString(nil, "OVERLAY", font))
end

local function setFontStringIndented(self, font)
	local fontString = self:CreateFontString(nil, "OVERLAY", font)
	fontString:SetPoint("LEFT", 20, 0)
	self:SetFontString(fontString)
end

function ww_normalFontString(self)
	setFontStringIndented(self, "GameFontNormal")
end

function ww_highlightFontString(self)
	setFontStringIndented(self, "GameFontHighlight")
end

function ww_defaultFontString(self)
	setFontString(self, "ww_defaultString")
end

function ww_editBoxTextInsets(self)
	self:SetTextInsets(5, 5, 0, 0)
end

function ww_clearFocus(self)
	self:ClearFocus()
end

function ww_refreshCheckBoxes(checkBoxes)
	for _, checkBox in pairs(checkBoxes) do
		checkBox:SetChecked(checkBox.shouldBeChecked())
		if checkBox.shouldBeEnabled then
			if checkBox.shouldBeEnabled() then
				checkBox:Enable()
			else
				checkBox:Disable()
			end
		end
	end
end
