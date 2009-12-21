if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

StaticPopupDialogs["WW_CONFIRM_DISCARD_CHANGES"] = {
	text = "You have unsaved changes for this weight.",
	button1 = "Discard",
	button3 = "Save",
	button2 = "Cancel",
	OnAccept = function(self, func)
			func()
		end,
	OnAlt = function(self, func)
			configSaveWeight()
			func()
		end,
	showAlert = true,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
}

StaticPopupDialogs["WW_CONFIRM_WEIGHT_DELETE"] = {
	text = "Are you sure you want to delete the %s weight named \"%s\"?",
	button1 = "Delete",
	button2 = "Cancel",
	OnAccept = function()
			deleteWeight()
		end,
	showAlert = true,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
}

StaticPopupDialogs["WW_CONFIRM_RESTORE_DEFAULTS"] = {
	text = "Are you sure you want to restore default weights?\n\nWeights whose names are white will be overwritten (the others will be left as they are).",
	button1 = "Restore Defaults",
	button2 = "Cancel",
	OnAccept = function()
			for _, class in ipairs(defaultVars.weightsList) do
				for _, weight in ipairs(defaultVars.weightsList[class]) do
					setWeight(class, weight, defaultVars.weightsList[class][weight])
					ww_weightCache[class][weight] = nil
					ww_weightIdealCache[class][weight] = nil
				end
			end
			if ww_weights.rightPanel:IsShown() then
				configSelectWeight(ww_weights.rightPanel.weightFrame)
			end
		end,
	showAlert = true,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
}

StaticPopupDialogs["WW_WEIGHT_EXISTS"] = {
	text = "The %s weight named \"%s\" already exists.  Pick a different name.",
	button1 = "Okay",
	enterClicksFirstButton = true,
	showAlert = true,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
}

-- initializes weights config frames and variables
function initializeWeightsConfig()
	loadClassButtons()
	loadStatButtons()
end

function validateNumber(newChar, newText)
	if string.find(newChar, "^%d$") then
		return true
	elseif newChar == '.' then
		local first = newText:find("%.", 1, true)
		local second = newText:find("%.", first + 1, true)
		if not second then
			return true
		end
	elseif newChar == '-' then
		if not string.find(newText, "%-", 2) then
			return true
		end
	end
	return false
end

function scrollBarUpdate(scrollFrame, scrolledFrame, buttonHeight, initialOffset, numShown)
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
function changeFocus(currentStatFrame)
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

function configDiscardChanges(func)
	if ww_weights.rightPanel:IsShown() and ww_weights.rightPanel.changedStats then
		for _, _ in pairs(ww_weights.rightPanel.changedStats) do
			local popup = StaticPopup_Show("WW_CONFIRM_DISCARD_CHANGES")
			popup.data = func
			return
		end
	end
	func()
end

function selectWeight(class, name)
	for _, classFrame in ipairs(ww_weights.leftPanel.scrollFrame.categories) do
		if classFrame.class == class then
			local children = {classFrame:GetChildren()}
			configSelectWeight(children[classFrame:GetNumChildren()])
			break
		end
	end
end

--opens a new config pane to edit stat weights
function configSelectWeight(weightFrame)
	local empty

	if ww_weights.rightPanel.weightFrame then
		ww_weights.rightPanel.weightFrame.text.highlightFrame:Hide()
	end
	weightFrame.text.highlightFrame:Show()

	ww_weights.rightPanel.weightFrame = weightFrame
	ww_weights.rightPanel.statList = ww_vars.weightsList[weightFrame.category.class][weightFrame.name]
	ww_weights.rightPanel.changedStats = {}

	-- Fills the right panel with the current weight's stats
	configResetWeight()

	for _, categoryFrame in ipairs(ww_weights.rightPanel.scrollFrame.categories) do
		empty = true
		for _, statFrame in ipairs({categoryFrame:GetChildren()}) do
			if statFrame.statName then
				if statFrame.statValue:GetText() ~= "" then
					empty = false
					break
				end
			end
		end
		if (categoryFrame.collapsed and not empty) or (not categoryFrame.collapsed and empty) then
			categoryFrame.text:Click()
		end
	end

	ww_weights.rightPanel.header:SetText(weightFrame.category.name .. " - " .. weightFrame.name)
	ww_weights.rightPanel:Show()
end

function configResetWeight()
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
	end

	ww_weights.rightPanel.changedStats = {}
	ww_weights.rightPanel.saveButton:Disable()
	ww_weights.rightPanel.resetButton:Disable()
end

function configDeleteWeight()
	StaticPopup_Show("WW_CONFIRM_WEIGHT_DELETE", ww_weights.rightPanel.weightFrame.category.name, ww_weights.rightPanel.weightFrame.name)
end

function configSaveWeight()
	local number
	local weightFrame = ww_weights.rightPanel.weightFrame

	-- The weight is changing, clear any cached info
	ww_weightCache[weightFrame.category.class][weightFrame.name] = nil
	ww_weightIdealCache[weightFrame.category.class][weightFrame.name] = nil

	for statValue, statName in pairs(ww_weights.rightPanel.changedStats) do
		number = statValue:GetNumber()
		if number == 0 then
			number = nil
		end
		ww_weights.rightPanel.statList[statName] = number
	end

	ww_weights.rightPanel.changedStats = {}
	ww_weights.rightPanel.saveButton:Disable()
	ww_weights.rightPanel.resetButton:Disable()
end

function deleteWeight()
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

function configNewWeight(class, weight, statList)
	configDiscardChanges(function()
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
				statList = {}
			end
			ww_newWeight.statList = statList
		end)
end

function setWeight(class, weight, statList)
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
				if defaultVars.weightsList[class] and defaultVars.weightsList[class][weight] then
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
	ww_vars.weightsList[class][weight] = deepTableCopy(statList)
end

--loads the various class buttons onto the config frame
function loadClassButtons()
	local classes, revClassLookup, newClass = {}, {}

	for i, class in ipairs(ww_vars.weightsList) do
		newClass = classNames[class]
		revClassLookup[newClass] = class
		classes[i] = newClass
		classes[newClass] = {}
		for j, name in ipairs(ww_vars.weightsList[class]) do
			classes[newClass][j] = name
		end
	end

	createScrollableTieredList(classes, ww_weights.leftPanel.scrollFrame, ww_weights.leftPanel.scrollContainer, "ww_weightFrame", 22)

	for _, classFrame in ipairs(ww_weights.leftPanel.scrollFrame.categories) do
		classFrame.class = revClassLookup[classFrame.text:GetText()]
		local used = (classFrame.class == WeightsWatcher.playerClass)
		for i, weightFrame in ipairs({classFrame:GetChildren()}) do
			if weightFrame.name then
				if ww_charVars.activeWeights[classFrame.class] then
					for _, weight in ipairs(ww_charVars.activeWeights[classFrame.class]) do
						used = true
						if weight == weightFrame.name then
							weightFrame.checkButton:SetChecked(true)
							break
						end
					end
				end
				if defaultVars.weightsList[classFrame.class] and defaultVars.weightsList[classFrame.class][weightFrame.name] then
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

function loadStatButtons()
	local stats = {}

	createScrollableTieredList(trackedStats, ww_weights.rightPanel.scrollFrame, ww_weights.rightPanel.scrollContainer, "ww_statFrame", 22)

	for _, categoryFrame in ipairs(ww_weights.rightPanel.scrollFrame.categories) do
		local children = {categoryFrame:GetChildren()}
		for i, statFrame in ipairs(children) do
			if statFrame.name then
				table.insert(stats, statFrame)
				statFrame.statName = string.lower(statFrame.name)
			end
		end
	end

	ww_weights.rightPanel.scrollFrame.stats = stats
end

-- Creates a tiered list that can be scrolled
-- template is a table of key-value pairs with keys as the categories and values as a table of elements
-- scrollFrame is the scrollframe that controls scrolledFrame
-- NOTE: scrollFrame must have an OnShow handler that updates the scrollbar
-- scrolledFrame is the frame that will hold everything
-- elementType is the element template type
-- elementHeight is the height of each element
function createScrollableTieredList(template, scrollFrame, scrolledFrame, elementType, elementHeight)
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
			elementFrame.text:SetText(element)
			elementFrame.name = template[category][element] or element
			elementFrame:SetPoint("TOPLEFT", 0, -elementHeight * j)
			table.insert(scrollFrame.shown, elementFrame)
			categoryFrame.length = categoryFrame.length + 1
		end

		categoryFrame:SetHeight(elementHeight * categoryFrame.length)
		categoryFrame.collapsed = false
	end
end

function toggleCollapse(categoryFrame, scrollFrame)
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

function ClassDropDownInitialize(dropdown)
	local info = {}

	info.func = DropDownOnClick
	info.arg1 = dropdown
	for class, name in pairs(classNames) do
		info.text = name
		info.value = class
		info.checked = nil
		UIDropDownMenu_AddButton(info)
	end
end

function ClassDropDownOnShow(dropdown)
	UIDropDownMenu_Initialize(dropdown, ClassDropDownInitialize);
	UIDropDownMenu_SetSelectedValue(dropdown, WeightsWatcher.playerClass)
end

function DropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
end
