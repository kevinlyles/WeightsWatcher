if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

function commandHandler(msg)
	open_config()
end

--display or hide the frame
function open_config()
	if wwConfig:IsVisible() then
		wwConfig:Hide()
	else
		wwConfig:Show()
	end
end

function configClassSelect(classType)
	for name, _ in pairs(ww_vars.weightsList[classType]) do
		addWeightScale(name)
	end
end

function addWeightScale(name)
	print(name)
end

defaultVars = {
	dataMajorVersion = 0,
	dataMinorVersion = 1,
	weightsList = {
		["DEATHKNIGHT"] = {
			["Blood DPS"] = {
				["hit rating"] = 100,
				["strength"] = 97,
				["expertise rating"] = 64,
				["critical strike rating"] = 44,
				["armor penetration rating"] = 40,
				["attack power"] = 38,
				["haste rating"] = 22,
			},
			["Frost DPS"] = {
				["hit rating"] = 100,
				["strength"] = 99,
				["expertise rating"] = 52,
				["critical strike rating"] = 50,
				["attack power"] = 42,
				["armor penetration rating"] = 32,
				["haste rating"] = 21,
			},
			["Unholy DPS"] = {
				["hit rating"] = 100,
				["strength"] = 100,
				["expertise rating"] = 56,
				["critical strike rating"] = 46,
				["attack power"] = 41,
				["haste rating"] = 26,
				["armor penetration rating"] = 22,
			},
			["Tanking"] = {
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
				["spell power"] = 100,
				["critical strike rating"] = 95,
				["intellect"] = 59,
				["haste rating"] = 47,
				["mp5"] = 36,
				["spirit"] = 36,
			},
			["Holy"] = {
				["spell power"] = 100,
				["mp5"] = 93,
				["intellect"] = 88,
				["spirit"] = 85,
				["critical strike rating"] = 63,
				["haste rating"] = 51,
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
}

defaultCharVars = {
	dataMajorVersion = 0,
	dataMinorVersion = 1,
	activeWeights = {},
}
