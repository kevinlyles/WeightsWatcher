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
	OnAccept = function(self, weight)
			deleteWeight(weight)
		end,
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
	ww_config.rightPanel.statList = ww_vars.weightsList[weightFrame.category.class][weightFrame.name]

	-- Fills the right panel with the current weight's stats
	configResetWeight(weightFrame)

	ww_config.rightPanel.header:SetText(weightFrame.name)
	ww_config.rightPanel.saveButton:SetScript("OnClick",
		function()
			configSaveWeight(weightFrame)
		end)
	ww_config.rightPanel.deleteButton:SetScript("OnClick",
		function()
			configDeleteWeight(weightFrame)
		end)
	ww_config.rightPanel.resetButton:SetScript("OnClick",
		function()
			configResetWeight(weightFrame)
		end)
	ww_config.rightPanel:Show()
end

function configResetWeight(weight)
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

function configDeleteWeight(weight)
	local confirm = StaticPopup_Show("WW_CONFIRM_WEIGHT_DELETE", weight.category.name, weight.name)
	-- Pass the things to delete, has to be done after the show call
	confirm.data = weight
end

function configSaveWeight(weight)
	local number

	for _, frame in pairs(ww_statFrameTable) do
		if frame.statName then
			number = frame.statValue:GetNumber()
			if number == 0 then
				number = nil
			end
			ww_vars.weightsList[weight.category.class][weight.name][frame.statName] = number
		end
	end
end

function deleteWeight(weight)
	local point, relativeTo, relativePoint, xOffset, yOffset

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

	ww_vars.weightsList[weight.category.class][weight.name] = nil
	ww_config.rightPanel:Hide()
	ww_config.leftPanel.scrollFrame:GetScript("OnShow")(ww_config.leftPanel.scrollFrame)
end

--loads the various class buttons onto the config frame
function loadClassButtons()
	local classes, revClassLookup = {}, {}

	for class, weights in pairs(ww_vars.weightsList) do
		revClassLookup[classNames[class]] = class
		class = classNames[class]
		classes[class] = {}
		for name, _ in pairs(weights) do
			table.insert(classes[class], name)
		end
	end

	createScrollableTieredList(classes, ww_config.leftPanel.scrollFrame, ww_config.leftPanel.scrollContainer, ww_classFrameTable, ww_weightFrameTable, "ww_elementFrame", 20)

	local _, class = UnitClass("player")
	for _, classFrame in ipairs(ww_classFrameTable) do
		classFrame.class = revClassLookup[classFrame.text:GetText()]
		if classFrame.class ~= class then
			toggleCollapse(classFrame, ww_classFrameTable, ww_weightFrameTable, 20,
				function()
					ww_config.leftPanel.scrollFrame:GetScript("OnShow")(ww_config.leftPanel.scrollFrame)
				end)
		end
		for i, weightFrame in ipairs({classFrame:GetChildren()}) do
			if i > 1 then
				weightFrame.text:SetScript("OnClick",
					function()
						configSelectWeight(weightFrame)
					end)
			end
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
	local i, categoryFrame, elementFrame = 1

	for category, elements in pairs(template) do
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
		for j, element in ipairs(elements) do
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
		i = i + 1
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

trackedStats = {
	["General"] = {
		"Stamina",
		"Critical Strike Rating",
		"Haste Rating",
		"Hit Rating",
		"Resilience Rating",
		"Health",
	},
	["Tanking"] = {
		"Defense Rating",
		"Dodge Rating",
		"Parry Rating",
		"Block Rating",
		"Block Value",
		"Armor",
		"HP5",
	},
	["Melee"] = {
		"Agility",
		"Attack Power",
		"Strength",
		"Armor Penetration Rating",
		"Expertise Rating",
		"Weapon DPS",
		"Minimum Weapon Damage",
		"Maximum Weapon Damage",
	},
	["Caster"] = {
		"Intellect",
		"MP5",
		"Spell Penetration",
		"Spell Power",
		"Spirit",
	},
	["Meta Gem Stats"] = {
		"Armor from Items Percent",
		"Block Value Percent",
		"Chance to Increase Melee/Ranged Attack Speed",
		"Chance to Increase Spell Cast Speed",
		"Chance to Restore Health on Hit",
		"Chance to Restore Mana on Spellcast",
		"Chance to Stun Target",
		"Critical Damage Percent",
		"Critical Healing Percent",
		"Fear Duration Reduction Percent",
		"Minor Run Speed",
		"Silence Duration Reduction Percent",
		"Snare/Root Duration Reduction Percent",
		"Sometimes Heal on your Crits",
		"Spell Damage Taken Reduction Percent",
		"Spell Reflect Percent",
		"Stun Duration Reduction Percent",
		"Stun Resistance Percent",
		"Threat Percent",
		"Threat Reduction Percent",
		"Weapon Damage (Not to be Confused with weapon dps)",
	},
	["Resistances"] = {
		"Arcane",
		"Fire",
		"Frost",
		"Holy",
		"Nature",
		"Shadow",
	},
}

classNames = {
	["DEATHKNIGHT"] = "Death Knight",
	["DRUID"] = "Druid",
	["HUNTER"] = "Hunter",
	["MAGE"] = "Mage",
	["PALADIN"] = "Paladin",
	["PRIEST"] = "Priest",
	["ROGUE"] = "Rogue",
	["SHAMAN"] = "Shaman",
	["WARLOCK"] = "Warlock",
	["WARRIOR"] = "Warrior",
}

defaultVars = {
	dataMajorVersion = 0,
	dataMinorVersion = 3,
	weightsList = {
		["DEATHKNIGHT"] = {
			["Blood DPS"] = {
				["dps"] = 361,
				["hit rating"] = 100,
				["strength"] = 97,
				["expertise rating"] = 64,
				["critical strike rating"] = 44,
				["armor penetration rating"] = 40,
				["attack power"] = 38,
				["haste rating"] = 22,
			},
			["Frost DPS"] = {
				["dps"] = 417,
				["hit rating"] = 100,
				["strength"] = 99,
				["expertise rating"] = 52,
				["critical strike rating"] = 50,
				["attack power"] = 42,
				["armor penetration rating"] = 32,
				["haste rating"] = 21,
			},
			["Unholy DPS"] = {
				["dps"] = 305,
				["hit rating"] = 100,
				["strength"] = 100,
				["expertise rating"] = 56,
				["critical strike rating"] = 46,
				["attack power"] = 41,
				["haste rating"] = 26,
				["armor penetration rating"] = 22,
			},
			["Tanking"] = {
				["dps"] = 432,
				["parry rating"] = 103,
				["hit rating"] = 100,
				["strength"] = 99,
				["defense rating"] = 88,
				["expertise rating"] = 71,
				["dodge rating"] = 63,
				["agility"] = 63,
				["stamina"] = 63,
				["critical strike rating"] = 50,
				["attack power"] = 42,
				["armor penetration rating"] = 32,
				["armor"] = 5,
			},
		},
		["DRUID"] = {
			["Balance"] = {
				["hit rating"] = 100,
				["haste rating"] = 46,
				["spell power"] = 46,
				["critical strike rating"] = 43,
				["intellect"] = 26,
				["mp5"] = 15,
				["spirit"] = 8,
			},
			["Feral DPS"] = {
				["strength"] = 100,
				["agility"] = 85,
				["expertise rating"] = 58,
				["hit rating"] = 58,
				["critical strike rating"] = 52,
				["feral attack power"] = 43,
				["attack power"] = 43,
				["armor penetration rating"] = 42,
				["haste rating"] = 40,
			},
			["Feral Tank"] = {
				["agility"] = 100,
				["defense rating"] = 72,
				["dodge rating"] = 70,
				["stamina"] = 65,
				["armor"] = 25,
				["expertise rating"] = 16,
				["strength"] = 10,
				["hit rating"] = 6,
				["haste rating"] = 5,
				["feral attack power"] = 4,
				["attack power"] = 4,
				["critical strike rating"] = 3,
			},
			["Restoration"] = {
				["mp5"] = 100,
				["spell power"] = 53,
				["spirit"] = 48,
				["intellect"] = 28,
				["critical strike rating"] = 14,
				["haste rating"] = 12,
			},
		},
		["HUNTER"] = {
			["Beast Mastery"] = {
				["dps"] = 134,
				["hit rating"] = 100,
				["intellect"] = 94,
				["agility"] = 59,
				["armor penetration rating"] = 54,
				["mp5"] = 48,
				["haste rating"] = 43,
				["attack power"] = 39,
				["critical strike rating"] = 37,
			},
			["Marksmanship"] = {
				["dps"] = 151,
				["intellect"] = 100,
				["hit rating"] = 90,
				["mp5"] = 70,
				["agility"] = 63,
				["armor penetration rating"] = 62,
				["haste rating"] = 59,
				["critical strike rating"] = 43,
				["attack power"] = 38,
			},
			["Survival"] = {
				["dps"] = 147,
				["intellect"] = 100,
				["hit rating"] = 93,
				["agility"] = 83,
				["mp5"] = 72,
				["haste rating"] = 70,
				["armor penetration rating"] = 66,
				["critical strike rating"] = 58,
				["attack power"] = 35,
			},
		},
		["MAGE"] = {
			["Arcane"] = {
				["hit rating"] = 100,
				["haste rating"] = 49,
				["arcane spell damage"] = 44,
				["spell power"] = 44,
				["intellect"] = 39,
				["critical strike rating"] = 34,
				["spirit"] = 14,
				["mp5"] = 9,
			},
			["Fire"] = {
				["hit rating"] = 100,
				["critical strike rating"] = 55,
				["fire spell damage"] = 49,
				["spell power"] = 49,
				["haste rating"] = 47,
				["intellect"] = 35,
				["mp5"] = 15,
			},
			["Frost"] = {
				["hit rating"] = 100,
				["frost spell damage"] = 50,
				["spell power"] = 50,
				["haste rating"] = 46,
				["critical strike rating"] = 33,
				["intellect"] = 21,
				["mp5"] = 13,
			},
		},
		["PALADIN"] = {
			["Holy"] = {
				["haste rating"] = 100,
				["spell power"] = 55,
				["critical strike rating"] = 36,
				["intellect"] = 29,
				["mp5"] = 15,
			},
			["Protection"] = {
				["defense rating"] = 100,
				["strength"] = 96,
				["agility"] = 88,
				["block rating"] = 80,
				["dodge rating"] = 79,
				["stamina"] = 76,
				["parry rating"] = 76,
				["expertise rating"] = 53,
				["block value"] = 52,
				["hit rating"] = 50,
				["attack power"] = 25,
				["critical strike rating"] = 23,
				["spell power"] = 20,
				["armor"] = 9,
			},
			["Retribution"] = {
				["strength"] = 100,
				["critical strike rating"] = 70,
				["armor penetration rating"] = 67,
				["agility"] = 67,
				["hit rating"] = 59,
				["expertise rating"] = 44,
				["haste rating"] = 38,
				["attack power"] = 38,
				["spell power"] = 12,
			},
		},
		["PRIEST"] = {
			["Discipline"] = {
				["mp5"] = 100,
				["intellect"] = 89,
				["spell power"] = 60,
				["critical strike rating"] = 36,
				["spirit"] = 32,
				["haste rating"] = 20,
			},
			["Holy"] = {
				["mp5"] = 100,
				["intellect"] = 69,
				["spell power"] = 60,
				["spirit"] = 52,
				["critical strike rating"] = 38,
				["haste rating"] = 31,
			},
			["Shadow"] = {
				["hit rating"] = 100,
				["shadow spell damage"] = 61,
				["spell power"] = 61,
				["critical strike rating"] = 50,
				["intellect"] = 43,
				["mp5"] = 27,
				["haste rating"] = 25,
				["spirit"] = 6,
			},
		},
		["ROGUE"] = {
			["All"] = {
				["agility"] = 100,
				["expertise rating"] = 100,
				["haste rating"] = 82,
				["hit rating"] = 82,
				["critical strike rating"] = 82,
				["armor penetration rating"] = 55,
				["strength"] = 50,
				["attack power"] = 46,
				["stamina"] = 1,
			},
		},
		["SHAMAN"] = {
			["Elemental"] = {
				["hit rating"] = 100,
				["spell power"] = 65,
				["haste rating"] = 40,
				["critical strike rating"] = 35,
				["intellect"] = 10,
			},
			["Enhancement"] = {
				["dps"] = 191,
				["hit rating"] = 100,
				["expertise rating"] = 84,
				["intellect"] = 55,
				["critical strike rating"] = 55,
				["agility"] = 55,
				["haste rating"] = 42,
				["strength"] = 36,
				["attack power"] = 33,
				["spell power"] = 30,
				["armor penetration rating"] = 26,
			},
			["Restoration"] = {
				["mp5"] = 100,
				["intellect"] = 87,
				["spell power"] = 76,
				["haste rating"] = 57,
				["critical strike rating"] = 34,
			},
		},
		["WARLOCK"] = {
			["Affliction"] = {
				["spell power"] = 100,
				["shadow spell damage"] = 88,
				["spirit"] = 74,
				["hit rating"] = 32,
				["haste rating"] = 25,
				["critical strike rating"] = 24,
				["mp5"] = 22,
				["intellect"] = 14,
				["fire spell damage"] = 13,
			},
			["Demonology"] = {
				["spell power"] = 100,
				["spirit"] = 96,
				["shadow spell damage"] = 86,
				["hit rating"] = 49,
				["haste rating"] = 37,
				["mp5"] = 33,
				["critical strike rating"] = 21,
				["fire spell damage"] = 15,
				["intellect"] = 12,
			},
			["Destruction"] = {
				["spell power"] = 100,
				["spirit"] = 56,
				["shadow spell damage"] = 55,
				["hit rating"] = 50,
				["haste rating"] = 48,
				["mp5"] = 48,
				["critical strike rating"] = 47,
				["fire spell damage"] = 46,
				["intellect"] = 45,
			},
		},
		["WARRIOR"] = {
			["DPS"] = {
				["expertise rating"] = 100,
				["attack power"] = 34,
				["armor penetration rating"] = 33,
				["strength"] = 22,
				["hit rating"] = 18,
				["critical strike rating"] = 18,
				["agility"] = 12,
				["haste rating"] = 3,
				["armor"] = 1,
			},
			["Protection"] = {
				["stamina"] = 100,
				["defense rating"] = 166,
				["dodge rating"] = 59,
				["expertise rating"] = 58,
				["agility"] = 53,
				["parry rating"] = 50,
				["block value"] = 22,
				["strength"] = 17,
				["hit rating"] = 7,
				["armor"] = 7,
				["critical strike rating"] = 5,
				["armor penetration rating"] = 5,
				["attack power"] = 3,
				["haste rating"] = 3,
			},
		},
	},
	options = {
		normalizeWeights = true,
		gemQualityLimit = 9,
	},
}

defaultCharVars = {
	dataMajorVersion = 0,
	dataMinorVersion = 1,
	activeWeights = {},
}
