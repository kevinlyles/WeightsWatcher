if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

ww_weightButtonTable = {}
ww_statFrameTable = {}

function commandHandler(msg)
	open_config()
end

--initializes config variables and frames
function initializeConfig()
	loadClassButtons()
	createStatFontStrings()
end

--display or hide the frame
function open_config()
	if ww_config:IsVisible() then
		ww_config:Hide()
	else
		ww_config:Show()
	end
end

function scrollBarUpdate()
	--since all buttons are relative to the first we need to adjust the position of the first to have the rest display within our frame
	local numShown, i = 29
	--scroll bar position
	local offset = FauxScrollFrame_GetOffset(ww_editWeight.scrollFrame)
	--let the scroll bar position update
	FauxScrollFrame_Update(ww_editWeight.scrollFrame, #(ww_statFrameTable), numShown, 100)
	offset = offset / 5
	if numShown > #(ww_statFrameTable) then
		numShown = #(ww_statFrameTable)
	end
	if offset > #(ww_statFrameTable) - numShown then
		offset = #(ww_statFrameTable) - numShown
	end

	--change the position of the stats frame based on the offset
	ww_editWeight.scrollContainer:SetPoint("TOPLEFT", 0, 20 * offset)

	--hide the stats that appear before the first button shown
	for i = 1, offset do
		ww_statFrameTable[i]:Hide()
	end
	--display those that fit in the window
	for i = offset + 1, offset + numShown do
		ww_statFrameTable[i]:Show()
	end
	--hide the stats after the window
	for i = offset + numShown + 1, #(ww_statFrameTable) do
		ww_statFrameTable[i]:Hide()
	end
end

--opens the right panel and loads the appropriate buttons
function configClassSelect(classType)
	local counter = 1
	--retrieve the list of weights and update any visible buttons to reflect the changes
	--NOTE: this approach is used to minimize memory leakage
	for weightName, _ in pairs(ww_vars.weightsList[classType]) do
		--if our previously created button table isn't big enough, add new buttons
		if #(ww_weightButtonTable) < counter then
			table.insert(ww_weightButtonTable, CreateFrame("Button", nil, ww_config.rightPanel, "ww_genericButton"))
			ww_weightButtonTable[counter]:SetPoint("TOPLEFT", 5, -5 - 20 * counter)
		end
		ww_weightButtonTable[counter]:SetText(weightName)
		ww_weightButtonTable[counter]:SetScript("OnClick",
			function()
				configWeightSelect(weightName)
			end)
		ww_weightButtonTable[counter]:Show()
		counter = counter + 1
	end
	--if we have any remaining buttons, hide them
	while counter <= #(ww_weightButtonTable) do
		ww_weightButtonTable[counter]:Hide()
		counter = counter + 1
	end
	ww_config.rightPanel.header:SetText(classNames[classType] .. " weights")
	ww_config.rightPanel:Show()
end

--opens a new config pane to edit stat weights
function configWeightSelect(selectedWeight)
	ww_editWeight:Show()
end

--loads the various class buttons onto the config frame
function loadClassButtons()
	--starting offset values for the button
	local i = 1
	--creates a button for each class available in weightsList
	for class, _ in pairs(ww_vars.weightsList) do
		local newButton = CreateFrame("Button", class, ww_config.leftPanel, "ww_genericButton")
		newButton:SetPoint("TOPLEFT", 5, 15 - i * 20)
		newButton:SetText(classNames[class])
		newButton:SetScript("OnClick",
			function()
				configClassSelect(class)
			end)
		i = i + 1
	end
end

--creates a list of fontStrings to display the stats
function createStatFontStrings()
	local i = 1
	for category, stats in pairs(trackedStats) do
		--for each category print the header and then the print the list of stats
		local newFrame = CreateFrame("Frame", category, ww_editWeight.scrollContainer, "ww_statFrame")
		newFrame.text:SetText(category)
		newFrame:SetPoint("TOPLEFT", ww_editWeight.scrollContainer, "TOPLEFT", -15, -20 * i)
		table.insert(ww_statFrameTable, newFrame)
		i = i + 1
		for _ , stat in pairs(stats) do
			newFrame = CreateFrame("Frame", stat, ww_editWeight.scrollContainer, "ww_statFrame")
			newFrame.text:SetText(stat)
			newFrame:SetPoint("TOPLEFT", ww_editWeight.scrollContainer, "TOPLEFT", 0, -20 * i)
			table.insert(ww_statFrameTable, newFrame)
			i = i + 1
		end
	end
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
