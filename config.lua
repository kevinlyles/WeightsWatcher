if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

ww_weightButtonTable = {}
ww_categoryFrameTable = {}
ww_statFrameTable = {}
ww_classFrameTable = {}
ww_weightFrameTable = {}

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
	text = "Are you sure you want to restore default weights?  This will overwrite any weights with the default names (but leave others alone).",
	button1 = "Restore Defaults",
	button2 = "Cancel",
	OnAccept = function()
			for _, class in ipairs(defaultVars.weightsList) do
				for _, weight in ipairs(defaultVars.weightsList[class]) do
					setWeight(class, weight, defaultVars.weightsList[class][weight])
				end
			end
			ww_config.rightPanel:Hide()
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

function commandHandler(msg)
	open_config()
end

--initializes config variables and frames
function initializeConfig()
	loadClassButtons()
	loadStatButtons()
end

--display or hide the frame
function open_config()
	if ww_config:IsVisible() then
		ww_config:Hide()
	else
		ww_config:Show()
	end
end

function validateNumber(newChar, newText)
	if string.find(newChar, "^[0-9]$") then
		return true
	elseif newChar == '.' then
		local first = newText:find(".", 1, true)
		local second = newText:find(".", first + 1, true)
		if not second then
			return true
		end
	elseif newChar == '-' then
		if not string.find(newText, "-", 2) then
			return true
		end
	end
	return false
end

function scrollBarUpdate(scrollFrame, scrolledFrame, buttonTable, buttonHeight, initialOffset, numShown)
	local i
	local offset = FauxScrollFrame_GetOffset(scrollFrame)
	offset = offset / 5
	if numShown > #(buttonTable) then
		numShown = #(buttonTable)
	end
	if offset > #(buttonTable) - numShown then
		offset = #(buttonTable) - numShown
	end
	FauxScrollFrame_Update(scrollFrame, #(buttonTable), numShown, buttonHeight * 5)
	scrolledFrame:SetPoint("TOPLEFT", 0, initialOffset + buttonHeight * offset)
	for i = 1, offset do
		buttonTable[i]:Hide()
	end
	for i = offset + 1, offset + numShown do
		buttonTable[i]:Show()
	end
	for i = offset + numShown + 1, #(buttonTable) do
		buttonTable[i]:Hide()
	end
end

--opens a new config pane to edit stat weights
function configSelectWeight(weightFrame)
	ww_config.rightPanel.weightFrame = weightFrame
	ww_config.rightPanel.statList = ww_vars.weightsList[weightFrame.category.class][weightFrame.name]

	-- Fills the right panel with the current weight's stats
	configResetWeight()

	ww_config.rightPanel.header:SetText(weightFrame.name)
	ww_config.rightPanel:Show()
end

-- TODO: fix this for collapsed categories!
function configResetWeight()
	local value

	for _, frame in pairs(ww_statFrameTable) do
		if frame.statName then
			value = ww_config.rightPanel.statList[frame.statName]
			if not value then
				value = ""
			end
			frame.statValue:SetText(value)
		end
	end
end

function configDeleteWeight()
	StaticPopup_Show("WW_CONFIRM_WEIGHT_DELETE", ww_config.rightPanel.weightFrame.category.name, ww_config.rightPanel.weightFrame.name)
end

function configSaveWeight()
	local number

	for _, frame in pairs(ww_statFrameTable) do
		if frame.statName then
			number = frame.statValue:GetNumber()
			if number == 0 then
				number = nil
			end
			ww_config.rightPanel.statList[frame.statName] = number
		end
	end
end

function deleteWeight()
	local point, relativeTo, relativePoint, xOffset, yOffset, removed
	local weight = ww_config.rightPanel.weightFrame

	weight.category.length = weight.category.length - 1
	for _, weightFrame in ipairs({weight.category:GetChildren()}) do
		if weightFrame.position and weightFrame.position > weight.position then
			weightFrame.position = weightFrame.position - 1
			for i = 1, weightFrame:GetNumPoints() do
				point, relativeTo, relativePoint, xOffset, yOffset = weightFrame:GetPoint(1)
				if point == "TOPLEFT" then
					weightFrame:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset + 20)
					break
				end
			end
		end
	end
	if not weight.category.collapsed then
		for _, classFrame in ipairs(ww_classFrameTable) do
			if classFrame.position > weight.category.position then
				classFrame.position = classFrame.position - 1
			end
		end
		table.remove(ww_weightFrameTable, weight.category.position + weight.position)
		weight.category:SetHeight(20 * weight.category.length)
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
	ww_config.rightPanel:Hide()
	ww_config.leftPanel.scrollFrame:GetScript("OnShow")(ww_config.leftPanel.scrollFrame)
end

function configNewWeight(class, weight, statList)
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
end

function setWeight(class, weight, statList)
	local weightFrame, position

	if not ww_vars.weightsList[class][weight] then
		for _, classFrame in ipairs(ww_classFrameTable) do
			if classFrame.class == class then
				position = classFrame.length
				weightFrame = CreateFrame("Frame", weight, classFrame, "ww_weightFrame")
				weightFrame.position = position
				weightFrame.category = classFrame
				weightFrame.text:SetText(weight)
				weightFrame.name = weight
				weightFrame:SetPoint("TOPLEFT", 0, -20 * position)
				classFrame.length = classFrame.length + 1
				if classFrame.collapsed then
					weightFrame:Hide()
				else
					classFrame:SetHeight(20 * classFrame.length)
					table.insert(ww_weightFrameTable, classFrame.position + position, weightFrame)
					for _, class in ipairs(ww_classFrameTable) do
						if class.position > classFrame.position then
							class.position = class.position + 1
						end
					end
				end
				break
			end
		end
		table.insert(ww_vars.weightsList[class], weight)
		ww_config.leftPanel.scrollFrame:GetScript("OnShow")(ww_config.leftPanel.scrollFrame)
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

	createScrollableTieredList(classes, ww_config.leftPanel.scrollFrame, ww_config.leftPanel.scrollContainer, ww_classFrameTable, ww_weightFrameTable, "ww_weightFrame", 20)

	local _, class = UnitClass("player")
	for _, classFrame in ipairs(ww_classFrameTable) do
		classFrame.class = revClassLookup[classFrame.text:GetText()]
		if classFrame.class ~= class then
			classFrame.text:Click()
		end
	end
end

function loadStatButtons()
	createScrollableTieredList(trackedStats, ww_config.rightPanel.scrollFrame, ww_config.rightPanel.scrollContainer, ww_categoryFrameTable, ww_statFrameTable, "ww_statFrame", 20)

	for _, categoryFrame in ipairs(ww_categoryFrameTable) do
		local children = {categoryFrame:GetChildren()}
		for i, statFrame in ipairs(children) do
			if statFrame.name then
				statFrame.statName = string.lower(statFrame.name)
			end
		end
	end
end

-- Creates a tiered list that can be scrolled
-- template is a table of key-value pairs with keys as the categories and values as a table of elements
-- scrollFrame is the scrollframe that controls scrolledFrame
-- NOTE: scrollFrame's OnShow must update the scrollbar
-- scrolledFrame is the frame that will hold everything
-- categoryTable is the table that will hold the categories and their information
-- elementTable is the table that will hold the elements
-- elementType is the element template type
-- elementHeight is the height of each element
function createScrollableTieredList(template, scrollFrame, scrolledFrame, categoryTable, elementTable, elementType, elementHeight)
	local categoryFrame, elementFrame

	for i, category in ipairs(template) do
		--for each category print the header and then the print the list of stats
		categoryFrame = CreateFrame("Frame", category, scrolledFrame, "ww_categoryFrame")
		categoryFrame.text:SetText(category)
		categoryFrame.name = category
		categoryFrame.length = 1
		if i == 1 then
			categoryFrame:SetPoint("TOPLEFT")
		else
			categoryFrame:SetPoint("TOPLEFT", categoryTable[i - 1], "BOTTOMLEFT")
		end
		categoryFrame.text:SetScript("OnClick",
			function(self)
				toggleCollapse(self:GetParent(), categoryTable, elementTable, elementHeight,
					function()
						scrollFrame:GetScript("OnShow")(scrollFrame)
					end)
			end)
		table.insert(categoryTable, categoryFrame)
		table.insert(elementTable, categoryFrame.text)
		categoryFrame.position = #(elementTable)
		for j, element in ipairs(template[category]) do
			elementFrame = CreateFrame("Frame", element, categoryTable[i], elementType)
			elementFrame.position = j
			elementFrame.category = categoryFrame
			elementFrame.text:SetText(element)
			elementFrame.name = element
			elementFrame:SetPoint("TOPLEFT", 0, -elementHeight * j)
			table.insert(elementTable, elementFrame)
			categoryFrame.length = categoryFrame.length + 1
		end

		categoryFrame:SetHeight(elementHeight * categoryFrame.length)
		categoryFrame.collapsed = false
	end
end

function toggleCollapse(categoryFrame, categoryTable, elementTable, elementHeight, scrollBarUpdateFunction)
	if categoryFrame.length == 1 then
		return
	end
	if categoryFrame.collapsed then
		for i, stat in ipairs({categoryFrame:GetChildren()}) do
			if stat.name then
				table.insert(elementTable, categoryFrame.position + i - 1, stat)
			end
		end
		for _, category in ipairs(categoryTable) do
			if category.position > categoryFrame.position then
				category.position = category.position + categoryFrame.length - 1
			end
		end
		categoryFrame.collapsed = false
		categoryFrame:SetHeight(20 * categoryFrame.length)
	else
		for _, stat in ipairs({categoryFrame:GetChildren()}) do
			if stat.name then
				stat:Hide()
				table.remove(elementTable, categoryFrame.position + 1)
			end
		end
		for _, category in ipairs(categoryTable) do
			if category.position > categoryFrame.position then
				category.position = category.position - categoryFrame.length + 1
			end
		end
		categoryFrame.collapsed = true
		categoryFrame:SetHeight(20)
	end
	scrollBarUpdateFunction()
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
	local _, class = UnitClass("player")
	UIDropDownMenu_Initialize(dropdown, ClassDropDownInitialize);
	UIDropDownMenu_SetSelectedValue(dropdown, class)
end

function DropDownOnClick(choice, dropdown)
	UIDropDownMenu_SetSelectedValue(dropdown, choice.value, false)
end
