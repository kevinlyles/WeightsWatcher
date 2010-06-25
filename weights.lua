local L = ww_localization

-- TODO: localize this function?
function ww_validateNumber(newChar, newText)
	if string.find(newChar, "^%d$") then
		return true
	elseif newChar == '.' then
		local first = newText:find(".", 1, true)
		local second = newText:find(".", first + 1, true)
		if not second then
			return true
		end
	elseif newChar == '-' then
		if not string.find(newText, "-", 2, true) then
			return true
		end
	end
	return false
end

function ww_scrollBarUpdate(scrollFrame, scrolledFrame, buttonHeight, initialOffset, numShown)
	local i
	local offset = FauxScrollFrame_GetOffset(scrollFrame)
	offset = offset / 5
	if numShown > #(scrollFrame.shown) then
		numShown = #(scrollFrame.shown)
	end
	if offset > #(scrollFrame.shown) - numShown then
		offset = #(scrollFrame.shown) - numShown
	end
	if offset < 0 then
		offset = 0
	end
	FauxScrollFrame_Update(scrollFrame, #(scrollFrame.shown), numShown, buttonHeight * 5)
	scrolledFrame:SetPoint("TOPLEFT", 0, initialOffset + buttonHeight * offset)
	for i = 1, offset do
		scrollFrame.shown[i]:Hide()
	end
	for i = offset + 1, offset + numShown do
		scrollFrame.shown[i]:Show()
	end
	for i = offset + numShown + 1, #(scrollFrame.shown) do
		scrollFrame.shown[i]:Hide()
	end
end

--moves the editbox focus to the next available edit box
function ww_changeFocus(currentStatFrame)
	local frame, offset
	local timesLooped = 0
	local elements = ww_weights.rightPanel.scrollFrame.shown
	local position = currentStatFrame.category.position + currentStatFrame.position

	if IsShiftKeyDown() then
		direction = -1
	else
		direction = 1
	end
	repeat
		position = position + direction
		if not elements[position] then
			if direction < 0 then
				position = #(elements)
			else
				position = 1
			end
			timesLooped = timesLooped + 1
		end
	until timesLooped == 2 or elements[position].statName

	if timesLooped == 2 then
		return
	end

	frame = elements[position]
	if frame then
		if not frame:IsShown() then
			if direction < 0 then
				offset = (position - 1) * 5
			else
				offset = (position - 22) * 5
			end
			FauxScrollFrame_SetOffset(ww_weights.rightPanel.scrollFrame, offset)
			ww_weights.rightPanel.scrollFrame:GetScript("OnVerticalScroll")(ww_weights.rightPanel.scrollFrame, offset * 22)
		end
		frame.statValue:SetFocus()
	end
end

function ww_configDiscardChanges(func)
	if ww_weights.rightPanel:IsShown() and ww_weights.rightPanel.changedStats then
		for _, _ in pairs(ww_weights.rightPanel.changedStats) do
			local popup = StaticPopup_Show("WW_CONFIRM_DISCARD_CHANGES")
			popup.data = func
			return
		end
	end
	func()
end

function ww_selectWeight(class, name)
	for _, classFrame in ipairs(ww_weights.leftPanel.scrollFrame.categories) do
		if classFrame.class == class then
			local children = {classFrame:GetChildren()}
			ww_configSelectWeight(children[classFrame:GetNumChildren()])
			break
		end
	end
end

--opens a new config pane to edit stat weights
function ww_configSelectWeight(weightFrame)
	if ww_weights.rightPanel.weightFrame then
		ww_weights.rightPanel.weightFrame.text.highlightFrame:Hide()
	end
	weightFrame.text.highlightFrame:Show()

	ww_weights.rightPanel.weightFrame = weightFrame
	ww_weights.rightPanel.statList = ww_vars.weightsList[weightFrame.category.class][weightFrame.name]
	ww_weights.rightPanel.changedStats = {}
	ww_weights.rightPanel.changedTriggers = {}

	-- Fills the right panel with the current weight's stats
	ww_configResetWeight()

	for _, categoryFrame in ipairs(ww_weights.rightPanel.scrollFrame.categories) do
		local empty = true
		if categoryFrame.name == L["Triggers"] then
			for _, triggerFrame in ipairs({categoryFrame:GetChildren()}) do
				if triggerFrame.active then
					if triggerFrame.active:GetChecked() then
						empty = false
						break
					end
				end
			end
		else
			for _, statFrame in ipairs({categoryFrame:GetChildren()}) do
				if statFrame.statName then
					if statFrame.statValue:GetText() ~= "" then
						empty = false
						break
					end
				end
			end
		end
		if (categoryFrame.collapsed and not empty) or (not categoryFrame.collapsed and empty) then
			categoryFrame.text:Click()
		end
	end

	ww_weights.rightPanel.header:SetText(string.format(L["CLASS_WEIGHT_HEADER_FORMAT"], weightFrame.category.name, weightFrame.name))
	ww_weights.rightPanel:Show()
end

function ww_configResetWeight()
	local value
	local changed = false

	if ww_weights.rightPanel.changedStats then
		for statValue, statName in pairs(ww_weights.rightPanel.changedStats) do
			changed = true
			value = ww_weights.rightPanel.statList[statName]
			if not value then
				value = ""
			end
			statValue:SetText(value)
		end
	end
	if ww_weights.rightPanel.changedTriggers then
		for triggerCheckButton, trigger in pairs(ww_weights.rightPanel.changedTriggers) do
			changed = true
			triggerCheckButton:SetChecked(ww_weights.rightPanel.statList.triggers[trigger])
		end
	end
	if not changed then
		for _, frame in pairs(ww_weights.rightPanel.scrollFrame.stats) do
			if frame.statName then
				value = ww_weights.rightPanel.statList[frame.statName]
				if not value then
					value = ""
				end
				frame.statValue:SetText(value)
			end
		end
		for _, categoryFrame in pairs(ww_weights.rightPanel.scrollFrame.categories) do
			if categoryFrame.name == L["Triggers"] then
				for _, triggerFrame in ipairs({categoryFrame:GetChildren()}) do
					if triggerFrame.active then
						triggerFrame.active:SetChecked(ww_weights.rightPanel.statList.triggers[triggerFrame.active:GetText()])
					end
				end
			end
		end
	end

	ww_weights.rightPanel.changedStats = {}
	ww_weights.rightPanel.changedTriggers = {}
	ww_weights.rightPanel.saveButton:Disable()
	ww_weights.rightPanel.resetButton:Disable()
end

function ww_configDeleteWeight()
	StaticPopup_Show("WW_CONFIRM_WEIGHT_DELETE", ww_weights.rightPanel.weightFrame.category.name, ww_weights.rightPanel.weightFrame.name)
end

function ww_configSaveWeight()
	local number
	local weightFrame = ww_weights.rightPanel.weightFrame

	-- The weight is changing, clear any cached info
	ww_weightCache[weightFrame.category.class][weightFrame.name] = nil
	ww_weightIdealCache[weightFrame.category.class][weightFrame.name] = nil

	if ww_weights.rightPanel.changedStats then
		for statValue, statName in pairs(ww_weights.rightPanel.changedStats) do
			number = tonumber(statValue:GetText())
			if number == 0 then
				number = nil
			end
			ww_weights.rightPanel.statList[statName] = number
		end
	end
	if ww_weights.rightPanel.changedTriggers then
		for triggerCheckButton, trigger in pairs(ww_weights.rightPanel.changedTriggers) do
			if triggerCheckButton:GetChecked() then
				ww_weights.rightPanel.statList.triggers[trigger] = true
			else
				ww_weights.rightPanel.statList.triggers[trigger] = nil
			end
		end
	end

	ww_weights.rightPanel.changedStats = {}
	ww_weights.rightPanel.changedTriggers = {}
	ww_weights.rightPanel.saveButton:Disable()
	ww_weights.rightPanel.resetButton:Disable()
end

local function deleteWeight()
	local point, relativeTo, relativePoint, xOffset, yOffset, removed
	local weight = ww_weights.rightPanel.weightFrame

	-- The weight is being deleted, clear any cached info
	if ww_weightCache[weight.category.class] then
		ww_weightCache[weight.category.class][weight.name] = nil
	end
	if ww_weightIdealCache[weight.category.class] then
		ww_weightIdealCache[weight.category.class][weight.name] = nil
	end

	weight.category.length = weight.category.length - 1
	for _, weightFrame in ipairs({weight.category:GetChildren()}) do
		if weightFrame.position and weightFrame.position > weight.position then
			weightFrame.position = weightFrame.position - 1
			for i = 1, weightFrame:GetNumPoints() do
				point, relativeTo, relativePoint, xOffset, yOffset = weightFrame:GetPoint(1)
				if point == "TOPLEFT" then
					weightFrame:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset + 22)
					break
				end
			end
		end
	end
	if not weight.category.collapsed then
		for _, classFrame in ipairs(ww_weights.leftPanel.scrollFrame.categories) do
			if classFrame.position > weight.category.position then
				classFrame.position = classFrame.position - 1
			end
		end
		table.remove(ww_weights.leftPanel.scrollFrame.shown, weight.category.position + weight.position)
		weight.category:SetHeight(22 * weight.category.length)
	end
	weight:Hide()
	weight:SetParent(nil)

	removed = false
	for i, name in ipairs(ww_vars.weightsList[weight.category.class]) do
		if removed then
			ww_vars.weightsList[weight.category.class][i - 1] = ww_vars.weightsList[weight.category.class][i]
			ww_vars.weightsList[weight.category.class][i] = nil
		elseif name == weight.name then
			ww_vars.weightsList[weight.category.class][i] = nil
			removed = true
		end
	end
	ww_vars.weightsList[weight.category.class][weight.name] = nil
	removed = false
	if ww_charVars.activeWeights[weight.category.class] then
		for i, name in ipairs(ww_charVars.activeWeights[weight.category.class]) do
			if removed then
				ww_charVars.activeWeights[weight.category.class][i - 1] = ww_charVars.activeWeights[weight.category.class][i]
				ww_charVars.activeWeights[weight.category.class][i] = nil
			elseif name == weight.name then
				ww_charVars.activeWeights[weight.category.class][i] = nil
				removed = true
			end
		end
	end
	ww_weights.rightPanel:Hide()
	ww_weights.leftPanel.scrollFrame:GetScript("OnShow")(ww_weights.leftPanel.scrollFrame)
end

function ww_configNewWeight(class, weight, statList)
	ww_configDiscardChanges(function()
			-- Need to call show first to re-initialize the dropdown
			ww_newWeight:Show()
			if class then
				UIDropDownMenu_SetSelectedValue(ww_newWeight.dropdown, class, false)
			end
			ww_newWeight.editBox:SetText("")
			if weight then
				ww_newWeight.editBox:SetText(weight)
			end
			if not statList then
				statList = {
					triggers = {}
				}
			end
			ww_newWeight.statList = statList
		end)
end

function ww_setWeight(class, weight, statList)
	local weightFrame, position

	if not ww_vars.weightsList[class][weight] then
		for _, classFrame in ipairs(ww_weights.leftPanel.scrollFrame.categories) do
			if classFrame.class == class then
				position = classFrame.length
				weightFrame = CreateFrame("Frame", weight, classFrame, "ww_weightFrame")
				weightFrame.position = position
				weightFrame.category = classFrame
				weightFrame.text:SetText(weight)
				weightFrame.name = weight
				weightFrame:SetPoint("TOPLEFT", 0, -22 * position)
				if ww_defaultVars.weightsList[class] and ww_defaultVars.weightsList[class][weight] then
					local fontString = weightFrame.text:GetFontString()
					fontString:SetTextColor(1, 1, 1)
					weightFrame.text:SetFontString(fontString)
				end
				classFrame.length = classFrame.length + 1
				if classFrame.collapsed then
					weightFrame:Hide()
				else
					classFrame:SetHeight(22 * classFrame.length)
					table.insert(ww_weights.leftPanel.scrollFrame.shown, classFrame.position + position, weightFrame)
					for _, class in ipairs(ww_weights.leftPanel.scrollFrame.categories) do
						if class.position > classFrame.position then
							class.position = class.position + 1
						end
					end
				end
				break
			end
		end
		table.insert(ww_vars.weightsList[class], weight)
		ww_weights.leftPanel.scrollFrame:GetScript("OnShow")(ww_weights.leftPanel.scrollFrame)
	end
	ww_vars.weightsList[class][weight] = ww_deepTableCopy(statList)
end

-- Creates a tiered list that can be scrolled
-- template is a table of key-value pairs with keys as the categories and values as a table of elements
-- scrollFrame is the scrollframe that controls scrolledFrame
-- NOTE: scrollFrame must have an OnShow handler that updates the scrollbar
-- scrolledFrame is the frame that will hold everything
-- elementType is the element template type
-- elementHeight is the height of each element
local function createScrollableTieredList(template, scrollFrame, scrolledFrame, elementType, elementHeight, nameTable)
	local categoryFrame, elementFrame

	scrollFrame.categories = {}
	scrollFrame.shown = {}
	scrollFrame.elementHeight = elementHeight
	for i, category in ipairs(template) do
		--for each category print the header and then the print the list of stats
		categoryFrame = CreateFrame("Frame", "WW_" .. category, scrolledFrame, "ww_categoryFrame")
		categoryFrame.text:SetText(category)
		categoryFrame.name = category
		categoryFrame.length = 1
		if i == 1 then
			categoryFrame:SetPoint("TOPLEFT")
		else
			categoryFrame:SetPoint("TOPLEFT", scrollFrame.categories[i - 1], "BOTTOMLEFT")
		end
		table.insert(scrollFrame.categories, categoryFrame)
		table.insert(scrollFrame.shown, categoryFrame.text)
		categoryFrame.position = #(scrollFrame.shown)
		for j, element in ipairs(template[category]) do
			elementFrame = CreateFrame("Frame", "WW_" .. element, scrollFrame.categories[i], elementType)
			elementFrame.position = j
			elementFrame.category = categoryFrame
			elementFrame.text:SetText(nameTable[element])
			elementFrame.name = element
			elementFrame:SetPoint("TOPLEFT", 0, -elementHeight * j)
			table.insert(scrollFrame.shown, elementFrame)
			categoryFrame.length = categoryFrame.length + 1
		end

		categoryFrame:SetHeight(elementHeight * categoryFrame.length)
		categoryFrame.collapsed = false
	end
end

--loads the various class buttons onto the config frame
local function loadClassButtons()
	local classes, revClassLookup, newClass = {}, {}
	local metatable = {
		__index = function(tbl, key)
			return key
		end
	}

	for i, class in ipairs(ww_vars.weightsList) do
		newClass = ww_classDisplayNames[class]
		revClassLookup[newClass] = class
		classes[i] = newClass
		classes[newClass] = {}
		for j, name in ipairs(ww_vars.weightsList[class]) do
			classes[newClass][j] = name
		end
	end

	createScrollableTieredList(classes, ww_weights.leftPanel.scrollFrame, ww_weights.leftPanel.scrollContainer, "ww_weightFrame", 22, setmetatable({}, metatable))

	for _, classFrame in ipairs(ww_weights.leftPanel.scrollFrame.categories) do
		classFrame.class = revClassLookup[classFrame.text:GetText()]
		local used = (classFrame.class == WeightsWatcher.playerClass)
		for i, weightFrame in ipairs({classFrame:GetChildren()}) do
			if weightFrame.name then
				if ww_charVars.activeWeights[classFrame.class] then
					for _, weight in ipairs(ww_charVars.activeWeights[classFrame.class]) do
						if weight == weightFrame.name then
							used = true
							weightFrame.checkButton:SetChecked(true)
							break
						end
					end
				end
				if ww_defaultVars.weightsList[classFrame.class] and ww_defaultVars.weightsList[classFrame.class][weightFrame.name] then
					local fontString = weightFrame.text:GetFontString()
					fontString:SetTextColor(1, 1, 1)
					weightFrame.text:SetFontString(fontString)
				end
			end
		end
		if not used then
			classFrame.text:Click()
		end
	end
end

local function loadStatButtons()
	local stats = {}
	local metatable = {
		__index = function(tbl, key)
			return ww_statDisplayNames[ww_localizedStats[key]]
		end
	}

	createScrollableTieredList(ww_trackedStats, ww_weights.rightPanel.scrollFrame, ww_weights.rightPanel.scrollContainer, "ww_statFrame", 22, setmetatable({}, metatable))

	for _, categoryFrame in ipairs(ww_weights.rightPanel.scrollFrame.categories) do
		if categoryFrame.name == L["Triggers"] then
			for i, trigger in ipairs(ww_triggerTypes) do
				local triggerFrame = CreateFrame("Frame", "WW_" .. trigger, categoryFrame, "ww_triggerFrame")
				triggerFrame.position = i
				triggerFrame.category = categoryFrame
				triggerFrame.text:SetText(ww_triggerDisplayNames[trigger])
				triggerFrame.active:SetText(trigger)
				triggerFrame.name = trigger
				triggerFrame:SetPoint("TOPLEFT", 0, -ww_weights.rightPanel.scrollFrame.elementHeight * i)
				table.insert(ww_weights.rightPanel.scrollFrame.shown, triggerFrame)
				categoryFrame.length = categoryFrame.length + 1
			end
			categoryFrame:SetHeight(ww_weights.rightPanel.scrollFrame.elementHeight * categoryFrame.length)
			categoryFrame.collapsed = false
		else
			local children = {categoryFrame:GetChildren()}
			for i, statFrame in ipairs(children) do
				if statFrame.name then
					table.insert(stats, statFrame)
					statFrame.statName = statFrame.name
				end
			end
		end
	end

	ww_weights.rightPanel.scrollFrame.stats = stats
end

-- initializes weights config frames and variables
function ww_initializeWeightsConfig()
	loadClassButtons()
	loadStatButtons()
end

function ww_toggleCollapse(categoryFrame, scrollFrame)
	if categoryFrame.length == 1 then
		return
	end
	if categoryFrame.collapsed then
		for i, stat in ipairs({categoryFrame:GetChildren()}) do
			if stat.name then
				table.insert(scrollFrame.shown, categoryFrame.position + i - 1, stat)
			end
		end
		for _, category in ipairs(scrollFrame.categories) do
			if category.position > categoryFrame.position then
				category.position = category.position + categoryFrame.length - 1
			end
		end
		categoryFrame.collapsed = false
		categoryFrame:SetHeight(scrollFrame.elementHeight * categoryFrame.length)
	else
		for _, stat in ipairs({categoryFrame:GetChildren()}) do
			if stat.name then
				stat:Hide()
				table.remove(scrollFrame.shown, categoryFrame.position + 1)
			end
		end
		for _, category in ipairs(scrollFrame.categories) do
			if category.position > categoryFrame.position then
				category.position = category.position - categoryFrame.length + 1
			end
		end
		categoryFrame.collapsed = true
		categoryFrame:SetHeight(scrollFrame.elementHeight)
	end
	scrollFrame:GetScript("OnShow")(scrollFrame)
end

local function DropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
end

function ww_ClassDropDownInitialize(dropdown)
	local info = {}

	info.func = DropDownOnClick
	info.arg1 = dropdown
	for class, name in pairs(ww_classDisplayNames) do
		info.text = name
		info.value = class
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end

StaticPopupDialogs["WW_CONFIRM_DISCARD_CHANGES"] = {
	text = L["WT_UNSAVED_CHANGES"],
	button1 = L["Discard"],
	button3 = L["Save"],
	button2 = L["Cancel"],
	OnAccept = function(self, func)
			func()
		end,
	OnAlt = function(self, func)
			ww_configSaveWeight()
			func()
		end,
	showAlert = true,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
}

StaticPopupDialogs["WW_CONFIRM_WEIGHT_DELETE"] = {
	text = L["WT_DELETE_CONFIRM"],
	button1 = L["Delete"],
	button2 = L["Cancel"],
	OnAccept = function()
			deleteWeight()
		end,
	showAlert = true,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
}

StaticPopupDialogs["WW_CONFIRM_RESTORE_DEFAULTS"] = {
	text = L["WT_RESTORE_DEFAULTS_CONFIRM"],
	button1 = L["Restore Defaults"],
	button2 = L["Cancel"],
	OnAccept = function()
			for _, class in ipairs(ww_defaultVars.weightsList) do
				for _, weight in ipairs(ww_defaultVars.weightsList[class]) do
					ww_setWeight(class, weight, ww_defaultVars.weightsList[class][weight])
					ww_weightCache[class][weight] = nil
					ww_weightIdealCache[class][weight] = nil
				end
			end
			if ww_weights.rightPanel:IsShown() then
				ww_configSelectWeight(ww_weights.rightPanel.weightFrame)
			end
		end,
	showAlert = true,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
}

StaticPopupDialogs["WW_WEIGHT_EXISTS"] = {
	text = L["WT_EXISTS"],
	button1 = L["Okay"],
	enterClicksFirstButton = true,
	showAlert = true,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
}
