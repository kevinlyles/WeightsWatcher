trackedStats = {
	[1] = "General",
	[2] = "Tanking",
	[3] = "Melee",
	[4] = "Caster",
	[5] = "Meta Gem Stats",
	[6] = "Resistances",
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
		"DPS",
		"Ranged DPS",
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
		"Armor from Items (Percent)",
		"Block Value (Percent)",
		"Chance to Increase Physical Haste",
		"Chance to Increase Spell Haste",
		"Chance to Restore Health on Hit",
		"Chance to Restore Mana on Spellcast",
		"Chance to Stun Target",
		"Critical Damage (Percent)",
		"Critical Healing (Percent)",
		"Fear Duration Reduction (Percent)",
		"Intellect (Percent)",
		"Mana (Percent)",
		"Minor Run Speed",
		"Silence Duration Reduction (Percent)",
		"Snare/Root Duration Reduction (Percent)",
		"Sometimes Heal on your Crits",
		"Spell Damage Taken Reduction (Percent)",
		"Spell Reflect (Percent)",
		"Stun Duration Reduction (Percent)",
		"Stun Resistance (Percent)",
		"Threat Reduction (Percent)",
		"Weapon Damage",
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

gemQualityNames = {
	[1] = "Burning Crusade common",
	[2] = "Burning Crusade uncommon",
	[3] = "Burning Crusade rare",
	[4] = "Burning Crusade epic",
	[5] = "Burning Crusade unique-equipped",
	[6] = "Wrath uncommon",
	[7] = "Wrath perfect uncommon",
	[8] = "Wrath rare",
	[9] = "Wrath epic",
	[10] = "Wrath unique-equipped",
	[11] = "Wrath jewelcrafter-only",
}

keyDetectors = {
	[1] = "Always",
	[2] = "Never",
	[3] = "Shift",
	[4] = "Control",
	[5] = "Alt",
	[6] = "Left Shift",
	[7] = "Right Shift",
	[8] = "Left Control",
	[9] = "Right Control",
	[10] = "Left Alt",
	[11] = "Right Alt",
	["Always"] = function() return true end,
	["Never"] = function() return false end,
	["Left Shift"] = IsLeftShiftKeyDown,
	["Right Shift"] = IsRightShiftKeyDown,
	["Shift"] = IsShiftKeyDown,
	["Left Alt"] = IsLeftAltKeyDown,
	["Right Alt"] = IsRightAltKeyDown,
	["Alt"] = IsAltKeyDown,
	["Left Control"] = IsLeftControlKeyDown,
	["Right Control"] = IsRightControlKeyDown,
	["Control"] = IsControlKeyDown,
}

classNameOptions = {
	[1] = "Always",
	[2] = "Others",
	[3] = "Never",
	["Always"] = "Always",
	["Others"] = "Other Classes",
	["Never"] = "Never",
}

defaultVars = {
	dataMajorVersion = 1,
	dataMinorVersion = 1,
	weightsList = {
		[1] = "DEATHKNIGHT",
		[2] = "DRUID",
		[3] = "HUNTER",
		[4] = "MAGE",
		[5] = "PALADIN",
		[6] = "PRIEST",
		[7] = "ROGUE",
		[8] = "SHAMAN",
		[9] = "WARLOCK",
		[10] = "WARRIOR",
		["DEATHKNIGHT"] = {
			[1] = "Blood DPS",
			[2] = "Frost DPS",
			[3] = "Unholy DPS",
			[4] = "Tank",
			["Blood DPS"] = {
				["dps"] = 360,
				["armor penetration rating"] = 100,
				["strength"] = 99,
				["hit rating"] = 91,
				["expertise rating"] = 90,
				["critical strike rating"] = 57,
				["haste rating"] = 55,
				["attack power"] = 36,
				["armor"] = 1,
			},
			["Frost DPS"] = {
				["dps"] = 337,
				["hit rating"] = 100,
				["strength"] = 97,
				["expertise rating"] = 81,
				["armor penetration rating"] = 61,
				["critical strike rating"] = 45,
				["attack power"] = 35,
				["haste rating"] = 28,
				["armor"] = 1,
			},
			["Unholy DPS"] = {
				["dps"] = 209,
				["strength"] = 100,
				["hit rating"] = 66,
				["expertise rating"] = 51,
				["haste rating"] = 48,
				["critical strike rating"] = 45,
				["attack power"] = 34,
				["armor penetration rating"] = 32,
				["armor"] = 1,
			},
			["Tank"] = {
				["dps"] = 419,
				["parry rating"] = 100,
				["hit rating"] = 97,
				["strength"] = 96,
				["defense rating"] = 85,
				["expertise rating"] = 69,
				["dodge rating"] = 61,
				["agility"] = 61,
				["stamina"] = 61,
				["critical strike rating"] = 49,
				["attack power"] = 41,
				["armor penetration rating"] = 31,
				["armor"] = 5,
			},
		},
		["DRUID"] = {
			[1] = "Balance",
			[2] = "Feral DPS",
			[3] = "Feral Tank",
			[4] = "Restoration",
			["Balance"] = {
				["hit rating"] = 100,
				["spell power"] = 66,
				["haste rating"] = 54,
				["critical strike rating"] = 43,
				["spirit"] = 22,
				["intellect"] = 22,
			},
			["Feral DPS"] = {
				["agility"] = 100,
				["armor penetration rating"] = 90,
				["strength"] = 80,
				["critical strike rating"] = 55,
				["expertise rating"] = 50,
				["hit rating"] = 50,
				["feral attack power"] = 40,
				["attack power"] = 40,
				["haste rating"] = 35,
			},
			["Feral Tank"] = {
				["agility"] = 100,
				["stamina"] = 75,
				["dodge rating"] = 65,
				["defense rating"] = 60,
				["expertise rating"] = 16,
				["strength"] = 10,
				["armor"] = 10,
				["hit rating"] = 8,
				["haste rating"] = 5,
				["feral attack power"] = 4,
				["attack power"] = 4,
				["critical strike rating"] = 3,
			},
			["Restoration"] = {
				["spell power"] = 100,
				["mp5"] = 73,
				["haste rating"] = 57,
				["intellect"] = 51,
				["spirit"] = 32,
				["critical strike rating"] = 11,
			},
		},
		["HUNTER"] = {
			[1] = "Beast Mastery",
			[2] = "Marksmanship",
			[3] = "Survival",
			["Beast Mastery"] = {
				["ranged dps"] = 213,
				["hit rating"] = 100,
				["agility"] = 58,
				["critical strike rating"] = 40,
				["intellect"] = 37,
				["attack power"] = 30,
				["armor penetration rating"] = 28,
				["haste rating"] = 21,
			},
			["Marksmanship"] = {
				["ranged dps"] = 379,
				["hit rating"] = 100,
				["agility"] = 74,
				["critical strike rating"] = 57,
				["armor penetration rating"] = 40,
				["intellect"] = 39,
				["attack power"] = 32,
				["haste rating"] = 24,
			},
			["Survival"] = {
				["ranged dps"] = 181,
				["hit rating"] = 100,
				["agility"] = 76,
				["critical strike rating"] = 42,
				["intellect"] = 35,
				["haste rating"] = 31,
				["attack power"] = 29,
				["armor penetration rating"] = 26,
			},
		},
		["MAGE"] = {
			[1] = "Arcane",
			[2] = "Fire",
			[3] = "Frost",
			["Arcane"] = {
				["hit rating"] = 100,
				["haste rating"] = 54,
				["arcane spell damage"] = 49,
				["spell power"] = 49,
				["critical strike rating"] = 37,
				["intellect"] = 34,
				["frost spell damage"] = 49,
				["fire spell damage"] = 49,
				["spirit"] = 14,
			},
			["Fire"] = {
				["hit rating"] = 100,
				["haste rating"] = 53,
				["fire spell damage"] = 46,
				["spell power"] = 46,
				["critical strike rating"] = 43,
				["frost spell damage"] = 23,
				["arcane spell damage"] = 23,
				["intellect"] = 13,
			},
			["Frost"] = {
				["hit rating"] = 100,
				["haste rating"] = 42,
				["frost spell damage"] = 39,
				["spell power"] = 39,
				["arcane spell damage"] = 19,
				["fire spell damage"] = 19,
				["critical strike rating"] = 19,
				["intellect"] = 6,
			},
		},
		["PALADIN"] = {
			[1] = "Holy",
			[2] = "Protection",
			[3] = "Retribution",
			["Holy"] = {
				["intellect"] = 100,
				["mp5"] = 88,
				["spell power"] = 58,
				["critical strike rating"] = 46,
				["haste rating"] = 35,
			},
			["Protection"] = {
				["stamina"] = 100,
				["dodge rating"] = 94,
				["block value"] = 86,
				["defense rating"] = 86,
				["expertise rating"] = 79,
				["agility"] = 76,
				["parry rating"] = 76,
				["hit rating"] = 58,
				["block rating"] = 52,
				["strength"] = 50,
				["armor"] = 6,
				["attack power"] = 6,
				["spell power"] = 4,
				["critical strike rating"] = 3,
			},
			["Retribution"] = {
				["dps"] = 470,
				["hit rating"] = 100,
				["strength"] = 80,
				["expertise rating"] = 66,
				["critical strike rating"] = 40,
				["attack power"] = 34,
				["agility"] = 32,
				["haste rating"] = 30,
				["armor penetration rating"] = 22,
				["spell power"] = 9,
			},
		},
		["PRIEST"] = {
			[1] = "Discipline",
			[2] = "Holy",
			[3] = "Shadow",
			["Discipline"] = {
				["spell power"] = 100,
				["mp5"] = 67,
				["intellect"] = 65,
				["haste rating"] = 59,
				["critical strike rating"] = 48,
				["spirit"] = 22,
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
				["shadow spell damage"] = 76,
				["spell power"] = 76,
				["critical strike rating"] = 54,
				["haste rating"] = 50,
				["spirit"] = 16,
				["intellect"] = 16,
			},
		},
		["ROGUE"] = {
			[1] = "Assassination",
			[2] = "Combat",
			[3] = "Subtlety",
			["Assassination"] = {
				["dps"] = 170,
				["agility"] = 100,
				["expertise rating"] = 87,
				["hit rating"] = 83,
				["critical strike rating"] = 81,
				["attack power"] = 65,
				["armor penetration rating"] = 65,
				["haste rating"] = 64,
				["strength"] = 55,
			},
			["Combat"] = {
				["dps"] = 220,
				["armor penetration rating"] = 100,
				["agility"] = 100,
				["expertise rating"] = 82,
				["hit rating"] = 80,
				["critical strike rating"] = 75,
				["haste rating"] = 73,
				["strength"] = 55,
				["attack power"] = 50,
			},
			["Subtlety"] = {
				["dps"] = 228,
				["expertise rating"] = 100,
				["agility"] = 100,
				["hit rating"] = 80,
				["armor penetration rating"] = 75,
				["critical strike rating"] = 75,
				["haste rating"] = 75,
				["strength"] = 55,
				["attack power"] = 50,
			},
		},
		["SHAMAN"] = {
			[1] = "Elemental",
			[2] = "Enhancement",
			[3] = "Restoration",
			["Elemental"] = {
				["hit rating"] = 100,
				["spell power"] = 60,
				["haste rating"] = 56,
				["critical strike rating"] = 40,
				["intellect"] = 11,
			},
			["Enhancement"] = {
				["dps"] = 135,
				["hit rating"] = 100,
				["expertise rating"] = 84,
				["agility"] = 55,
				["intellect"] = 55,
				["critical strike rating"] = 55,
				["haste rating"] = 42,
				["strength"] = 35,
				["attack power"] = 32,
				["spell power"] = 29,
				["armor penetration rating"] = 26,
			},
			["Restoration"] = {
				["mp5"] = 100,
				["intellect"] = 85,
				["spell power"] = 77,
				["critical strike rating"] = 62,
				["haste rating"] = 35,
			},
		},
		["WARLOCK"] = {
			[1] = "Affliction",
			[2] = "Demonology",
			[3] = "Destruction",
			["Affliction"] = {
				["hit rating"] = 100,
				["shadow spell damage"] = 72,
				["spell power"] = 72,
				["haste rating"] = 61,
				["critical strike rating"] = 38,
				["fire spell damage"] = 36,
				["spirit"] = 34,
				["intellect"] = 15,
			},
			["Demonology"] = {
				["hit rating"] = 100,
				["haste rating"] = 50,
				["fire spell damage"] = 45,
				["shadow spell damage"] = 45,
				["spell power"] = 45,
				["critical strike rating"] = 31,
				["spirit"] = 29,
				["intellect"] = 13,
			},
			["Destruction"] = {
				["hit rating"] = 100,
				["fire spell damage"] = 47,
				["spell power"] = 47,
				["haste rating"] = 46,
				["spirit"] = 26,
				["shadow spell damage"] = 23,
				["critical strike rating"] = 16,
				["intellect"] = 13,
			},
		},
		["WARRIOR"] = {
			[1] = "DPS",
			[2] = "Protection",
			["DPS"] = {
				["expertise rating"] = 100,
				["strength"] = 82,
				["critical strike rating"] = 66,
				["agility"] = 53,
				["armor penetration rating"] = 52,
				["hit rating"] = 48,
				["haste rating"] = 36,
				["attack power"] = 31,
				["armor"] = 5,
			},
			["Protection"] = {
				["stamina"] = 100,
				["dodge rating"] = 90,
				["defense rating"] = 86,
				["block value"] = 81,
				["agility"] = 67,
				["parry rating"] = 67,
				["block rating"] = 48,
				["strength"] = 48,
				["expertise rating"] = 19,
				["hit rating"] = 10,
				["armor penetration rating"] = 10,
				["critical strike rating"] = 7,
				["armor"] = 6,
				["haste rating"] = 1,
				["attack power"] = 1,
			},
		},
	},
	options = {
		breakSocketColors = true,
		neverBreakSocketColors = false,
		normalizeWeights = true,
		gemQualityLimit = 9,
		showClassNames = "Others",
		tooltip = {
			hideHints = false,
			showWeights = "Always",
			showIdealWeights = "Shift",
			showIdealGems = "Control",
			showIdealGemStats = "Always",
		},
	},
}

defaultCharVars = {
	dataMajorVersion = 1,
	dataMinorVersion = 0,
	activeWeights = {},
}
