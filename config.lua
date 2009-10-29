if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

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
			if ww_config.rightPanel:IsShown() then
				configSelectWeight(ww_config.rightPanel.weightFrame)
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

--opens a new config pane to edit stat weights
function configSelectWeight(weightFrame)
	local empty

	ww_config.rightPanel.weightFrame = weightFrame
	ww_config.rightPanel.statList = ww_vars.weightsList[weightFrame.category.class][weightFrame.name]

	-- Fills the right panel with the current weight's stats
	configResetWeight()

	for _, categoryFrame in ipairs(ww_config.rightPanel.scrollFrame.categories) do
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

	ww_config.rightPanel.header:SetText(weightFrame.name)
	ww_config.rightPanel:Show()
end

function configResetWeight()
	local value

	for _, frame in pairs(ww_config.rightPanel.scrollFrame.stats) do
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

	for _, frame in pairs(ww_config.rightPanel.scrollFrame.stats) do
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
		for _, classFrame in ipairs(ww_config.leftPanel.scrollFrame.categories) do
			if classFrame.position > weight.category.position then
				classFrame.position = classFrame.position - 1
			end
		end
		table.remove(ww_config.leftPanel.scrollFrame.shown, weight.category.position + weight.position)
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
		for _, classFrame in ipairs(ww_config.leftPanel.scrollFrame.categories) do
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
					table.insert(ww_config.leftPanel.scrollFrame.shown, classFrame.position + position, weightFrame)
					for _, class in ipairs(ww_config.leftPanel.scrollFrame.categories) do
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

	createScrollableTieredList(classes, ww_config.leftPanel.scrollFrame, ww_config.leftPanel.scrollContainer, "ww_weightFrame", 20)

	local _, class = UnitClass("player")
	for _, classFrame in ipairs(ww_config.leftPanel.scrollFrame.categories) do
		classFrame.class = revClassLookup[classFrame.text:GetText()]
		if classFrame.class ~= class then
			classFrame.text:Click()
		end
	end
end

function loadStatButtons()
	local stats = {}

	createScrollableTieredList(trackedStats, ww_config.rightPanel.scrollFrame, ww_config.rightPanel.scrollContainer, "ww_statFrame", 20)

	for _, categoryFrame in ipairs(ww_config.rightPanel.scrollFrame.categories) do
		local children = {categoryFrame:GetChildren()}
		for i, statFrame in ipairs(children) do
			if statFrame.name then
				table.insert(stats, statFrame)
				statFrame.statName = string.lower(statFrame.name)
			end
		end
	end

	ww_config.rightPanel.scrollFrame.stats = stats
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
	for i, category in ipairs(template) do
		--for each category print the header and then the print the list of stats
		categoryFrame = CreateFrame("Frame", category, scrolledFrame, "ww_categoryFrame")
		categoryFrame.text:SetText(category)
		categoryFrame.name = category
		categoryFrame.length = 1
		if i == 1 then
			categoryFrame:SetPoint("TOPLEFT")
		else
			categoryFrame:SetPoint("TOPLEFT", scrollFrame.categories[i - 1], "BOTTOMLEFT")
		end
		categoryFrame.text:SetScript("OnClick",
			function(self)
				toggleCollapse(self:GetParent(), scrollFrame, elementHeight,
					function()
						scrollFrame:GetScript("OnShow")(scrollFrame)
					end)
			end)
		table.insert(scrollFrame.categories, categoryFrame)
		table.insert(scrollFrame.shown, categoryFrame.text)
		categoryFrame.position = #(scrollFrame.shown)
		for j, element in ipairs(template[category]) do
			elementFrame = CreateFrame("Frame", element, scrollFrame.categories[i], elementType)
			elementFrame.position = j
			elementFrame.category = categoryFrame
			elementFrame.text:SetText(element)
			elementFrame.name = element
			elementFrame:SetPoint("TOPLEFT", 0, -elementHeight * j)
			table.insert(scrollFrame.shown, elementFrame)
			categoryFrame.length = categoryFrame.length + 1
		end

		categoryFrame:SetHeight(elementHeight * categoryFrame.length)
		categoryFrame.collapsed = false
	end
end

function toggleCollapse(categoryFrame, scrollFrame, elementHeight, scrollBarUpdateFunction)
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
		categoryFrame:SetHeight(20 * categoryFrame.length)
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
