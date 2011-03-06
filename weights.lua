local L = ww_localization

-- TODO: localize this function?
	-- probably not, lua doesn't seem to be localized
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
	if numShown > #(scrolledFrame.shown) then
		numShown = #(scrolledFrame.shown)
	end
	if offset > #(scrolledFrame.shown) - numShown then
		offset = #(scrolledFrame.shown) - numShown
	end
	if offset < 0 then
		offset = 0
	end
	FauxScrollFrame_Update(scrollFrame, #(scrolledFrame.shown), numShown, buttonHeight * 5)
	scrolledFrame:SetPoint("TOPLEFT", 0, initialOffset + buttonHeight * offset)
	for i = 1, offset do
		scrolledFrame.shown[i]:Hide()
	end
	for i = offset + 1, offset + numShown do
		scrolledFrame.shown[i]:Show()
	end
	for i = offset + numShown + 1, #(scrolledFrame.shown) do
		scrolledFrame.shown[i]:Hide()
	end
end

--moves the editbox focus to the next available edit box
function ww_changeFocus(currentStatFrame)
	local frame, offset, looped, direction
	local elements = ww_weights.rightPanel.scrollContainer.shown
	local position = currentStatFrame.position

	if IsShiftKeyDown() then
		direction = -1
	else
		direction = 1
	end
	repeat
		position = position + direction
		if not elements[position] then
			if looped then
				return
			end
			looped = true
			if direction < 0 then
				position = #(elements)
			else
				position = 1
			end
		end
	until elements[position].statName

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
	for _, classFrame in ipairs(ww_weights.leftPanel.scrollContainer.elements) do
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

	local function isEmpty(frame)
		local empty = true

		if frame.elements then
			if frame.collapsed then
				frame.text:Click()
			end
			for _, element in ipairs(frame.elements) do
				if element.name then
					local subElementEmpty = isEmpty(element)
					if empty then
						empty = subElementEmpty
					end
				end
			end
			if empty ~= frame.collapsed then
				frame.text:Click()
			end
		else
			if frame.active then
				return not frame.active:GetChecked()
			else
				return frame.statValue:GetText() == ""
			end
		end

		return empty
	end

	for _, frame in ipairs(ww_weights.rightPanel.scrollContainer.elements) do
		isEmpty(frame)
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
			value = ww_weights.rightPanel.statList and ww_weights.rightPanel.statList[statName]
			if not value then
				value = ""
			end
			statValue:SetText(value)
		end
	end
	if ww_weights.rightPanel.changedTriggers then
		for triggerCheckButton, trigger in pairs(ww_weights.rightPanel.changedTriggers) do
			changed = true
			triggerCheckButton:SetChecked(ww_weights.rightPanel.statList and ww_weights.rightPanel.statList.triggers[trigger])
		end
	end
	if not changed then
		for _, frame in pairs(ww_weights.rightPanel.scrollContainer.stats) do
			if frame.statName then
				value = ww_weights.rightPanel.statList and ww_weights.rightPanel.statList[frame.statName]
				if not value then
					value = ""
				end
				frame.statValue:SetText(value)
			end
		end
		for _, frame in pairs(ww_weights.rightPanel.scrollContainer.triggers) do
			if frame.active then
				frame.active:SetChecked(ww_weights.rightPanel.statList and ww_weights.rightPanel.statList.triggers[frame.active:GetText()])
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

	local collapsed = weight.category.collapsed
	if collapsed then
		weight.category.elements[1]:Click()
	end

	weight.category.length = weight.category.length - weight.length
	local found = false
	for _, weightFrame in ipairs(weight.category.elements) do
		if weightFrame.relativePosition and weightFrame.relativePosition > weight.relativePosition then
			weightFrame.position = weightFrame.position - 1
			weightFrame.relativePosition = weightFrame.relativePosition - 1
			if not found then
				weightFrame:ClearAllPoints()
				for i = 1, weight:GetNumPoints() do
					weightFrame:SetPoint(weight:GetPoint(i))
				end
				found = true
			end
		end
	end
	for _, classFrame in ipairs(ww_weights.leftPanel.scrollContainer.elements) do
		if classFrame.position > weight.category.position then
			classFrame.position = classFrame.position - 1
		end
	end
	table.remove(ww_weights.leftPanel.scrollContainer.shown, weight.position)
	weight.category:SetHeight(22 * weight.category.length)
	table.remove(weight.category.elements, weight.relativePosition)
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
	if collapsed then
		weight.category.elements[1]:Click()
	end
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
	if not ww_vars.weightsList[class][weight] then
		local found = false
		for _, classFrame in ipairs(ww_weights.leftPanel.scrollContainer.elements) do
			if found then
				classFrame.position = classFrame.position + 1
				for _, weightFrame in ipairs(classFrame.elements) do
					if weightFrame.position then
						weightFrame.position = weightFrame.position + 1
					end
				end
			elseif classFrame.class == class then
				local weightFrame = CreateFrame("Frame", nil, classFrame, "ww_weightFrame")
				weightFrame.relativePosition = classFrame.length + 1
				weightFrame.position = classFrame.position + classFrame.length
				weightFrame.category = classFrame
				weightFrame.text:SetText(weight)
				weightFrame.name = weight
				weightFrame.length = 1
				if #(classFrame.elements) == 1 then
					weightFrame:SetPoint("TOPLEFT", 20, -22 * classFrame.length)
				else
					weightFrame:SetPoint("TOP", classFrame.elements[#(classFrame.elements)], "BOTTOM")
					weightFrame:SetPoint("LEFT", 20, 0)
				end
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
					table.insert(ww_weights.leftPanel.scrollContainer.shown, classFrame.position + weightFrame.relativePosition - 1, weightFrame)
					for _, class in ipairs(ww_weights.leftPanel.scrollContainer.elements) do
						if class.position > classFrame.position then
							class.position = class.position + 1
						end
					end
				end
				table.insert(classFrame.elements, weightFrame)
				found = true
			end
		end
		table.insert(ww_vars.weightsList[class], weight)
		ww_weights.leftPanel.scrollFrame:GetScript("OnShow")(ww_weights.leftPanel.scrollFrame)
	end
	ww_vars.weightsList[class][weight] = ww_deepTableCopy(statList)
end

-- returns the number of elements created
local function createSublist(template, containingFrame, categoryType, defaultElementType, elementHeight, nameTable, elements, shown, hOffset)
	local numElements, frame, elementType = 0
	local elementsOffset = #(elements)

	for i, element in ipairs(template) do
		elementType = template[element]
		if type(elementType) == "table" then
			-- create another sublist
			frame = CreateFrame("Frame", nil, containingFrame, categoryType)
			frame.text:SetText(element)
			frame.name = element
			frame.collapsed = false
			table.insert(shown, frame.text)
			frame.elements = {frame.text}
			frame.position = #(shown)
			local numSubElements = createSublist(elementType, frame, categoryType, defaultElementType, elementHeight, nameTable, frame.elements, shown, 20)
			frame.length = numSubElements + 1
			numElements = numElements + numSubElements
		else
			if type(elementType) == "string" then
				-- make an element with the type specified
				frame = CreateFrame("Frame", nil, containingFrame, elementType)
				if elementType == "ww_triggerFrame" then
					if ww_stackingEquipEffects then
						frame.active:SetText(element)
					else
						frame:Hide()
						frame:SetParent(nil)
						frame = nil
					end
				end
			elseif elementType == nil then
				-- make a defaultElementType element
				frame = CreateFrame("Frame", nil, containingFrame, defaultElementType)
			else
				-- error
				frame = nil
			end
			if frame then
				frame.text:SetText(nameTable[element])
				frame.name = element
				frame.length = 1
				table.insert(shown, frame)
				frame.position = #(shown)
			end
		end

		if frame then
			if i + elementsOffset == 1 then
				frame:SetPoint("TOPLEFT", hOffset, 0)
			else
				frame:SetPoint("TOP", elements[i + elementsOffset - 1], "BOTTOM")
				frame:SetPoint("LEFT", hOffset, 0)
			end
			table.insert(elements, frame)
			frame.relativePosition = #(elements)
			frame:SetHeight(elementHeight * frame.length)

			numElements = numElements + 1
		else
			elementsOffset = elementsOffset - 1
		end
	end

	return numElements
end

-- TODO: update the notes here
-- Creates a tiered list that can be scrolled
-- template is a table of key-value pairs with text keys as the categories their values as a template, and numeric keys's values as items
-- scrollFrame is the scrollframe that controls scrolledFrame
-- NOTE: scrollFrame must have an OnShow handler that updates the scrollbar
-- scrolledFrame is the frame that will hold everything
-- elementType is the element template type
-- elementHeight is the height of each element
-- nameTable is a table that will return the display name for each item and category name
-- hOffset is the initial horizontal offset
local function createScrollableTieredList(template, scrollFrame, scrolledFrame, categoryType, elementType, elementHeight, nameTable, hOffset)
	local categoryFrame, elementFrame

	scrolledFrame.elements = {}
	scrolledFrame.shown = {}
	scrolledFrame.elementHeight = elementHeight
	scrolledFrame.scrollFrame = scrollFrame

	createSublist(template, scrolledFrame, categoryType, elementType, elementHeight, nameTable, scrolledFrame.elements, scrolledFrame.shown, hOffset or 0)
end

--loads the various class buttons onto the config frame
local function loadClassButtons()
	local classes, revClassLookup = {}, {}
	local metatable = {
		__index = function(tbl, key)
			return key
		end
	}

	for i, class in ipairs(ww_vars.weightsList) do
		local newClass = ww_classDisplayNames[class]
		revClassLookup[newClass] = class
		classes[i] = newClass
		classes[newClass] = {}
		for j, name in ipairs(ww_vars.weightsList[class]) do
			classes[newClass][j] = name
		end
	end

	createScrollableTieredList(classes, ww_weights.leftPanel.scrollFrame, ww_weights.leftPanel.scrollContainer, "ww_classFrame", "ww_weightFrame", 22, setmetatable({}, metatable))

	for _, classFrame in ipairs(ww_weights.leftPanel.scrollContainer.elements) do
		classFrame.class = revClassLookup[classFrame.text:GetText()]
		local used = (classFrame.class == WeightsWatcher.playerClass)
		for i, weightFrame in ipairs({classFrame:GetChildren()}) do
			if weightFrame.name then
				weightFrame.category = classFrame
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

-- NOTE: in the following functions, the following conditions hold:
--		elements contains the shown direct children of the given frame
--		shown is the global list of shown elements
--		you can use {GetChildren()} to get a list of all direct children
--		length is changed alongside shown
--		elements of the collapsing frame (but not of its children) is changed alongside shown
--		position is the global position (within shown)

local function insertRecursive(shown, elements, start)
	local offset = 0

	for i, element in ipairs(elements) do
		if element.name then
			local position = start + i + offset - 1
			if element.elements then
				table.insert(shown, position, element.text)
				offset = offset + element.length - 1
				insertRecursive(shown, element.elements, position)
			else
				table.insert(shown, position, element)
			end
		end
	end

	return offset
end

local function removeRecursive(shown, elements, start)
	local offset = 0

	for i, element in ipairs(elements) do
		if element.name then
			table.remove(shown, start)
			if element.elements then
				offset = offset + element.length - 1
				removeRecursive(shown, element.elements, start)
				element.text:Hide()
			else
				element:Hide()
			end
		end
	end

	return offset
end

function ww_toggleCollapse(frame)
	local scrolledFrame = frame
	while scrolledFrame and not scrolledFrame.shown do
		scrolledFrame = scrolledFrame:GetParent()
	end
	if frame.collapsed then
		local lengthChange = insertRecursive(scrolledFrame.shown, {frame:GetChildren()}, frame.position)
		for _, element in ipairs({frame:GetChildren()}) do
			if element.name then
				table.insert(frame.elements, element)
			end
		end
		lengthChange = #(frame.elements) + lengthChange - 1
		frame.length = frame.length + lengthChange
		frame.collapsed = false
		frame:SetHeight(scrolledFrame.elementHeight * frame.length)
		local parent = frame:GetParent()
		while parent.length do
			parent.length = parent.length + lengthChange
			parent:SetHeight(scrolledFrame.elementHeight * parent.length)
			parent = parent:GetParent()
		end
	else
		local lengthChange = removeRecursive(scrolledFrame.shown, frame.elements, frame.position + 1)
		lengthChange = #(frame.elements) + lengthChange - 1
		frame.length = frame.length - lengthChange
		frame.elements = {frame.text}
		frame.collapsed = true
		frame:SetHeight(scrolledFrame.elementHeight)
		local parent = frame:GetParent()
		while parent.length do
			parent.length = parent.length - lengthChange
			parent:SetHeight(scrolledFrame.elementHeight * parent.length)
			parent = parent:GetParent()
		end
	end
	for i, element in ipairs(scrolledFrame.shown) do
		if element.position then
			element.position = i
		else
			element:GetParent().position = i
		end
	end
	scrolledFrame.scrollFrame:GetScript("OnShow")(scrolledFrame.scrollFrame)
end

local function loadStatButtons()
	local metatable = {
		__index = function(tbl, key)
			local text = ww_statDisplayNames[ww_localizedStats[key]]
			if not text and ww_stackingEquipEffects then
				text = ww_triggerDisplayNames[key]
			end
			return text
		end
	}

	createScrollableTieredList(ww_trackedStats, ww_weights.rightPanel.scrollFrame, ww_weights.rightPanel.scrollContainer, "ww_categoryFrame", "ww_statFrame", 22, setmetatable({}, metatable), 5)

	local stats, triggers = {}, {}
	for _, element in ipairs(ww_weights.rightPanel.scrollContainer.shown) do
		if element.name then
			if element.active then
				table.insert(triggers, element)
			else
				table.insert(stats, element)
				element.statName = element.name
			end
		end
	end

	ww_weights.rightPanel.scrollContainer.stats = stats
	ww_weights.rightPanel.scrollContainer.triggers = triggers
end

-- initializes weights config frames and variables
function ww_initializeWeightsConfig()
	loadClassButtons()
	loadStatButtons()
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
