local L = ww_localization

ww_trackedStats = {
	ww_statCategories["General"],
	ww_statCategories["Physical DPS"],
	ww_statCategories["Tanking"],
	ww_statCategories["Caster"],
	ww_statCategories["PVP"],
	ww_statCategories["Miscellaneous"],
	ww_statCategories["Individual Enchants"],
	[ww_statCategories["General"]] = {
		"critical strike rating",
		"haste rating",
		"mastery rating",
		ww_statCategories["DPS"],
		[ww_statCategories["DPS"]] = {
			"hit rating",
			ww_statCategories["Enchant/Meta Gem Effects"],
			[ww_statCategories["Enchant/Meta Gem Effects"]] = {
--				"critical damage (percent)",
				"threat reduction (percent)",
			},
		},
		ww_statCategories["Enchant/Meta Gem Effects"],
		[ww_statCategories["Enchant/Meta Gem Effects"]] = {
			"critical effect (percent)",
		},
	},
	[ww_statCategories["Physical DPS"]] = {
		"agility",
		"attack power",
		"strength",
		ww_statCategories["Melee DPS"],
		ww_statCategories["Ranged DPS"],
		ww_statCategories["Enchant/Meta Gem Effects"],
		[ww_statCategories["Melee DPS"]] = {
			"expertise rating",
			"melee critical strike rating",
			"melee dps",
			"average melee weapon damage",
			"maximum melee weapon damage",
			"melee weapon speed",
			"meleeDamage",
			["meleeDamage"] = "ww_triggerFrame",
			ww_statCategories["Enchant/Meta Gem Effects"],
			[ww_statCategories["Enchant/Meta Gem Effects"]] = {
				"attack power against undead",
				"melee damage to beasts",
				"melee damage to elementals",
			},
		},
		[ww_statCategories["Ranged DPS"]] = {
			"ranged attack power",
			"ranged critical strike rating",
			"ranged dps",
			"ranged haste rating",
			"ranged hit rating",
			"average ranged weapon damage",
			"maximum ranged weapon damage",
			"ranged weapon speed",
			"rangedDamage",
			["rangedDamage"] = "ww_triggerFrame",
		},
		[ww_statCategories["Enchant/Meta Gem Effects"]] = {
			"chance to increase physical haste",
			"weapon damage (percent)",
			"weapon damage vs undead (percent)",
		},
	},
	[ww_statCategories["Tanking"]] = {
		"armor",
		"block rating",
		"dodge rating",
		"health",
		"hp5",
		"parry rating",
		"stamina",
		ww_statCategories["Enchant/Meta Gem Effects"],
		[ww_statCategories["Enchant/Meta Gem Effects"]] = {
			"armor (percent)",
			"armor from items (percent)",
			"average damage dealt on block",
			"block value (percent)",
			"chance to restore health on hit",
			"damage absorption (2% chance)",
			"damage absorption (5% chance)",
			"spell damage taken reduction (percent)",
			"threat (percent)",
		},
	},
	[ww_statCategories["Caster"]] = {
		"intellect",
		"spell critical strike rating",
		"spell power",
		"spirit",
		ww_statCategories["DPS"],
		ww_statCategories["Healing"],
		ww_statCategories["Enchant/Meta Gem Effects"],
		[ww_statCategories["DPS"]] = {
			"spell hit rating",
			"arcane spell damage",
			"fire spell damage",
			"frost spell damage",
			"holy spell damage",
			"nature spell damage",
			"shadow spell damage",
			"harmfulSpell",
			["harmfulSpell"] = "ww_triggerFrame",
		},
		[ww_statCategories["Healing"]] = {
			"mana",
			"mp5",
			"helpfulSpell",
			ww_statCategories["Enchant/Meta Gem Effects"],
			["helpfulSpell"] = "ww_triggerFrame",
			[ww_statCategories["Enchant/Meta Gem Effects"]] = {
				"chance to restore mana on spellcast",
--				"critical healing (percent)",
				"mana (percent)",
			},
		},
		[ww_statCategories["Enchant/Meta Gem Effects"]] = {
			"chance to increase spell haste",
-- 			"intellect (percent)",
		},
	},
	[ww_statCategories["PVP"]] = {
		"resilience rating",
		"spell penetration",
		ww_statCategories["Enchant/Meta Gem Effects"],
		[ww_statCategories["Enchant/Meta Gem Effects"]] = {
			"chance to stun target",
			"increased stealth",
			"minor run speed",
			"sometimes heal on your crits",
			ww_statCategories["CC Resists/Reductions"],
			[ww_statCategories["CC Resists/Reductions"]] = {
				"disarm duration reduction (percent)",
				"disorient resist chance (percent)",
				"fear duration reduction (percent)",
				"fear resist chance (percent)",
				"silence duration reduction (percent)",
				"snare/root duration reduction (percent)",
				"spell reflect (percent)",
				"stun duration reduction (percent)",
				"stun resist chance (percent)",
			},
		},
	},
	[ww_statCategories["Miscellaneous"]] = {
		"mount speed (percent)",
		ww_statCategories["Resistances"],
		ww_statCategories["Professions"],
		[ww_statCategories["Resistances"]] = {
			"arcane resistance",
			"fire resistance",
			"frost resistance",
-- 			"holy resistance",
			"nature resistance",
			"shadow resistance",
		},
		[ww_statCategories["Professions"]] = {
			"fishing",
			"herbalism",
			"mining",
			"skinning",
		},
	},
	[ww_statCategories["Individual Enchants"]] = {
		"avalanche",
		"battlemaster",
		"berserking",
		"black magic",
		"blade ward",
		"blood draining",
		"crusader",
		"darkglow embroidery",
		"deathfrost",
		"demonslaying",
		"elemental slayer",
		"executioner",
		"fiery blaze",
		"fiery weapon",
		"giant slayer",
		"gnomish x-ray scope",
		"heartsong",
		"hurricane",
		"icebreaker",
		"icy chill",
		"landslide",
		"lifestealing",
		"lifeward",
		"lightweave embroidery",
		"mending",
		"mongoose",
		"power torrent",
		"pyrium shield spike",
		"rune of cinderglacier",
		"rune of razorice",
		"rune of the fallen crusader",
		"spellsurge",
		"swordguard embroidery",
		"unholy weapon",
		"windwalk",
	},
}

if ww_stackingEquipEffects then
	ww_triggerTypes = {"meleeDamage", "rangedDamage", "harmfulSpell", "helpfulSpell"}
end

ww_keyDetectors = {
	"Always",
	"Never",
	"Shift",
	"Control",
	"Alt",
	"Left Shift",
	"Right Shift",
	"Left Control",
	"Right Control",
	"Left Alt",
	"Right Alt",
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

ww_classNameOptions = {
	"Always",
	"Other Classes",
	"Never",
}

ww_defaultVars = {
	dataMajorVersion = 2,
	dataMinorVersion = 1,
	weightsList = {
		"DEATHKNIGHT",
		"DRUID",
		"HUNTER",
		"MAGE",
		"PALADIN",
		"PRIEST",
		"ROGUE",
		"SHAMAN",
		"WARLOCK",
		"WARRIOR",
		["DEATHKNIGHT"] = {
			ww_specNames["Blood"],
			ww_specNames["Frost"],
			ww_specNames["Frost DW"],
			ww_specNames["Unholy"],
			ww_specNames["Unholy DW"],
			[ww_specNames["Blood"]] = {
				["mastery rating"] = 1.2,
				["dodge rating"] = 1,
				["parry rating"] = 1,
				["stamina"] = 0.65,
				["expertise rating"] = 0.4,
				["strength"] = 0.284,
				["hit rating"] = 0.2,
				["armor"] = 0.153,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Frost"]] = {
				["melee dps"] = 10.09,
				["strength"] = 2.83,
				["hit rating"] = 2.26,
				["expertise rating"] = 1.75,
				["haste rating"] = 1.4,
				["mastery rating"] = 1.37,
				["critical strike rating"] = 1.34,
				["attack power"] = 1,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Frost DW"]] = {
				["melee dps"] = (6.69 + 4.12) / 2,
				["strength"] = 3.08,
				["hit rating"] = 2.14,
				["haste rating"] = 1.58,
				["expertise rating"] = 1.51,
				["mastery rating"] = 1.33,
				["attack power"] = 1.12,
				["critical strike rating"] = 1.09,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Unholy"]] = {
				["melee dps"] = 5.91,
				["strength"] = 3.24,
				["hit rating"] = 2.67,
				["haste rating"] = 1.64,
				["mastery rating"] = 1.33,
				["critical strike rating"] = 1.26,
				["expertise rating"] = 0.98,
				["attack power"] = 0.82,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Unholy DW"]] = {
				["melee dps"] = (3.5 + 3.2) / 2,
				["strength"] = 3.1,
				["hit rating"] = 1.1,
				["haste rating"] = 1.01,
				["mastery rating"] = 0.9,
				["expertise rating"] = 0.82,
				["attack power"] = 0.79,
				["critical strike rating"] = 0.76,
				triggers = {
					meleeDamage = true,
				},
			},
		},
		["DRUID"] = {
			ww_specNames["Balance"],
			ww_specNames["Feral DPS"],
			ww_specNames["Feral Tank"],
			ww_specNames["Restoration"],
			[ww_specNames["Balance"]] = {
				["intellect"] = 2.97,
				["hit rating"] = 2.4,
				["spirit"] = 2.4,
				["spell power"] = 2.3,
				["haste rating"] = 2.15,
				["mastery rating"] = 1.45,
				["critical strike rating"] = 0.87,
				triggers = {
					harmfulSpell = true,
				},
			},
			[ww_specNames["Feral DPS"]] = {
				["melee dps"] = 6.604,
				["agility"] = 3.775,
				["strength"] = 1.445,
				["attack power"] = 1.376,
				["critical strike rating"] = 1.291,
				["haste rating"] = 1.291,
				["mastery rating"] = 1.291,
				["expertise rating"] = 1.24,
				["hit rating"] = 1.24,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Feral Tank"]] = {
				["agility"] = 1,
				["dodge rating"] = 0.88,
				["armor"] = 0.71,
				["mastery rating"] = 0.48,
				["stamina"] = 0.31,
				["expertise rating"] = 0.3,
				["critical strike rating"] = 0.28,
				["hit rating"] = 0.15,
				["strength"] = 0.126,
				["attack power"] = 0.12,
				["haste rating"] = 0.04,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Restoration"]] = {
				["intellect"] = 100,
				["spell power"] = 85,
				["spirit"] = 75,
				["haste rating"] = 65,
				["mastery rating"] = 60,
				["critical strike rating"] = 50,
				triggers = {
					helpfulSpell = true,
				},
			},
		},
		["HUNTER"] = {
			ww_specNames["Beast Mastery"],
			ww_specNames["Marksmanship"],
			ww_specNames["Survival"],
			[ww_specNames["Beast Mastery"]] = {
				["ranged dps"] = 5.03,
				["agility"] = 3.17,
				["hit rating"] = 2.58,
				["critical strike rating"] = 2.31,
				["haste rating"] = 1.37,
				["attack power"] = 1.2,
				["mastery rating"] = 0.73,
				triggers = {
					rangedDamage = true,
				},
			},
			[ww_specNames["Marksmanship"]] = {
				["ranged weapon speed"] = 11.78,
				["ranged dps"] = 7.68,
				["agility"] = 3.72,
				["hit rating"] = 3.49,
				["critical strike rating"] = 1.66,
				["haste rating"] = 1.61,
				["mastery rating"] = 1.38,
				["attack power"] = 1.19,
				triggers = {
					rangedDamage = true,
				},
			},
			[ww_specNames["Survival"]] = {
				["ranged weapon speed"] = 7.63,
				["ranged dps"] = 5.33,
				["agility"] = 3.33,
				["hit rating"] = 2.66,
				["haste rating"] = 1.5,
				["attack power"] = 1.04,
				["critical strike rating"] = 1.02,
				["mastery rating"] = 0.95,
				triggers = {
					rangedDamage = true,
				},
			},
		},
		["MAGE"] = {
			ww_specNames["Arcane"],
			ww_specNames["Fire"],
			ww_specNames["Frost"],
			[ww_specNames["Arcane"]] = {
				["intellect"] = 5.16,
				["hit rating"] = 3.21,
				["spell power"] = 2.8,
				["mastery rating"] = 1.4,
				["critical strike rating"] = 1.34,
				["haste rating"] = 1.28,
				triggers = {
					harmfulSpell = true,
				},
			},
			[ww_specNames["Fire"]] = {
				["intellect"] = 3.43,
				["hit rating"] = 2.72,
				["spell power"] = 2.57,
				["haste rating"] = 1.59,
				["critical strike rating"] = 1.55,
				["mastery rating"] = 1.3,
				triggers = {
					harmfulSpell = true,
				},
			},
			[ww_specNames["Frost"]] = {
				["intellect"] = 3.68,
				["hit rating"] = 3.08,
				["spell power"] = 2.66,
				["critical strike rating"] = 1.97,
				["haste rating"] = 1.61,
				["mastery rating"] = 1.43,
				triggers = {
					harmfulSpell = true,
				},
			},
		},
		["PALADIN"] = {
			ww_specNames["Holy"],
			ww_specNames["Protection"],
			ww_specNames["Retribution"],
			[ww_specNames["Holy"]] = {
				["intellect"] = 100,
				["spell power"] = 80,
				["spirit"] = 75,
				["haste rating"] = 40,
				["critical strike rating"] = 35,
				["mastery rating"] = 30,
				triggers = {
					helpfulSpell = true,
				},
			},
			[ww_specNames["Protection"]] = {
				["dodge rating"] = 1.23,
				["parry rating"] = 1.23,
				["mastery rating"] = 1,
				["stamina"] = 0.6,
				["strength"] = 0.349,
				["armor"] = 0.155,
				["expertise rating"] = 0.1,
				["hit rating"] = 0.05,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Retribution"]] = {
				["melee weapon speed"] = 18.848,
				["melee dps"] = 9,
				["strength"] = 2.33,
				["hit rating"] = 1.55 + 0.22,
				["expertise rating"] = 1.3,
				["mastery rating"] = 1.13,
				["attack power"] = 1,
				["critical strike rating"] = 0.98,
				["haste rating"] = 0.79,
				triggers = {
					harmfulSpell = true,
					meleeDamage = true,
				},
			},
		},
		["PRIEST"] = {
			ww_specNames["Discipline"],
			ww_specNames["Holy"],
			ww_specNames["Shadow"],
			[ww_specNames["Discipline"]] = {
				["intellect"] = 100,
				["spirit"] = 80,
				["spell power"] = 75,
				["mastery rating"] = 60,
				["haste rating"] = 50,
				["critical strike rating"] = 40,
				triggers = {
					helpfulSpell = true,
				},
			},
			[ww_specNames["Holy"]] = {
				["intellect"] = 100,
				["spirit"] = 80,
				["haste rating"] = 75,
				["spell power"] = 75,
				["mastery rating"] = 70,
				["critical strike rating"] = 50,
				triggers = {
					helpfulSpell = true,
				},
			},
			[ww_specNames["Shadow"]] = {
				["intellect"] = 3.54,
				["spell power"] = 2.72,
				["haste rating"] = 2,
				["hit rating"] = 1.92,
				["spirit"] = 1.92,
				["mastery rating"] = 1.84,
				["critical strike rating"] = 1.67,
				triggers = {
					harmfulSpell = true,
				},
			},
		},
		["ROGUE"] = {
			ww_specNames["Assassination"],
			ww_specNames["Combat"],
			ww_specNames["Subtlety"],
			[ww_specNames["Assassination"]] = {
				["agility"] = 2.6,
				["melee dps"] = (3.36 + 1.04) / 2,
				["hit rating"] = 1.1 + 0.65,
				["mastery rating"] = 1.3,
				["haste rating"] = 1.2,
				["expertise rating"] = 1.1,
				["attack power"] = 1,
				["critical strike rating"] = 0.9,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Combat"]] = {
				["melee dps"] = (4.97 + 1.15) / 2,
				["agility"] = 2.7,
				["hit rating"] = 1.65 + 0.3,
				["expertise rating"] = 1.65,
				["haste rating"] = 1.5,
				["mastery rating"] = 1.2,
				["attack power"] = 1,
				["critical strike rating"] = 0.9,
				["melee weapon speed"] = (4 + -9) / 2,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Subtlety"]] = {
				["agility"] = 3.6,
				["melee dps"] = (4 + 1) / 2,
				["hit rating"] = 1.15 + 0.25,
				["haste rating"] = 1.35,
				["attack power"] = 1.26,
				["expertise rating"] = 1.15,
				["critical strike rating"] = 1.1,
				["mastery rating"] = 0.9,
				triggers = {
					meleeDamage = true,
				},
			},
		},
		["SHAMAN"] = {
			ww_specNames["Elemental"],
			ww_specNames["Enhancement"],
			ww_specNames["Restoration"],
			[ww_specNames["Elemental"]] = {
				["intellect"] = 2.9,
				["spell power"] = 2.32,
				["hit rating"] = 1.74,
				["spirit"] = 1.74,
				["haste rating"] = 1.6,
				["mastery rating"] = 1.33,
				["critical strike rating"] = 1.02,
				triggers = {
					harmfulSpell = true,
				},
			},
			[ww_specNames["Enhancement"]] = {
				["melee dps"] = (4.34 + 3.96) / 2,
				["agility"] = 3.51,
				["hit rating"] = 2.15 + 1.3,
				["expertise rating"] = 2.15,
				["mastery rating"] = 1.73,
				["strength"] = 1.41,
				["attack power"] = 1.33,
				["critical strike rating"] = 1.26,
				["spell power"] = 1.06,
				["haste rating"] = 1.03,
				triggers = {
					harmfulSpell = true,
					meleeDamage = true,
				},
			},
			[ww_specNames["Restoration"]] = {
				["intellect"] = 100,
				["spirit"] = 90,
				["spell power"] = 75,
				["haste rating"] = 60,
				["mastery rating"] = 55,
				["critical strike rating"] = 40,
				triggers = {
					helpfulSpell = true,
				},
			},
		},
		["WARLOCK"] = {
			ww_specNames["Affliction"],
			ww_specNames["Demonology"],
			ww_specNames["Destruction"],
			[ww_specNames["Affliction"]] = {
				["intellect"] = 3.11,
				["spell power"] = 2.64,
				["hit rating"] = 1.65,
				["haste rating"] = 1.4,
				["critical strike rating"] = 1.15,
				["mastery rating"] = 1.15,
				triggers = {
					harmfulSpell = true,
				},
			},
			[ww_specNames["Demonology"]] = {
				["intellect"] = 3,
				["hit rating"] = 2.39,
				["spell power"] = 2.39,
				["haste rating"] = 1.5,
				["mastery rating"] = 1.38,
				["critical strike rating"] = 1.16,
				triggers = {
					harmfulSpell = true,
				},
			},
			[ww_specNames["Destruction"]] = {
				["intellect"] = 3.01,
				["spell power"] = 2.35,
				["haste rating"] = 1.54,
				["hit rating"] = 1.51,
				["critical strike rating"] = 1.21,
				["mastery rating"] = 0.75,
				triggers = {
					harmfulSpell = true,
				},
			},
		},
		["WARRIOR"] = {
			ww_specNames["Arms"],
			ww_specNames["Fury"],
			ww_specNames["Fury TG"],
			ww_specNames["Protection"],
			[ww_specNames["Arms"]] = {
				["melee dps"] = 10.57,
				["strength"] = 2.02,
				["hit rating"] = 2,
				["expertise rating"] = 1.46,
				["critical strike rating"] = 1.34,
				["mastery rating"] = 0.9,
				["attack power"] = 0.88,
				["haste rating"] = 0.8,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Fury"]] = {
				["melee dps"] = (5.21 + 3) / 2,
				["strength"] = 3.25,
				["hit rating"] = 3.2,
				["expertise rating"] = 2.29,
				["critical strike rating"] = 2.02,
				["attack power"] = 1.45,
				["haste rating"] = 1.33,
				["mastery rating"] = 1.24,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Fury TG"]] = {
				["melee dps"] = (5.91 + 2.7) / 2,
				["strength"] = 2.98,
				["expertise rating"] = 2.47,
				["hit rating"] = 2.47,
				["critical strike rating"] = 1.98,
				["mastery rating"] = 1.57,
				["haste rating"] = 1.37,
				["attack power"] = 1.36,
				triggers = {
					meleeDamage = true,
				},
			},
			[ww_specNames["Protection"]] = {
				["parry rating"] = 1.54,
				["dodge rating"] = 1.496,
				["mastery rating"] = 1,
				["stamina"] = 0.6,
				["strength"] = 0.437,
				["armor"] = 0.155,
				["expertise rating"] = 0.1,
				["hit rating"] = 0.05,
				triggers = {
					meleeDamage = true,
				},
			},
		},
	},
	options = {
		calculation = {
			useEffectUptimeRatio = 0.8,
		},
		enchants = {
			considerBoa = true,
			considerRep = "High enough",
			considerProfessions = "High enough",
			sources = {
				["Crafted"] = true,
				["PVP-Vendor"] = false,
				["Quest"] = false,
				["Vendor"] = true,
			},
		},
		gems = {
			breakSocketColors = true,
			neverBreakSocketColors = false,
			qualityLimit = 10,
			sources = {
				["Crafted"] = true,
				["Drop"] = false,
				["Procced"] = true,
				["PVP-Vendor"] = false,
				["Quest"] = false,
				["Vendor"] = true,
			},
			types = {
				["Jewelcrafter-Only"] = false,
				["Normal"] = true,
				["Unique-Equipped"] = false,
			},
		},
		tooltip = {
			hideHints = false,
			normalizeWeights = true,
			showAlternateEnhancements = "Alt",
			showClassNames = "Other Classes",
			showDebugInfo = "Never",
			showDifferences = true,
			showEnhancements = "Control",
			showEnhancementStats = "Always",
			showEnhancementsWhen = "Non-ideal applied",
			showIdealWeights = "Shift",
			showWeights = "Always",
			showZeroScores = false,
		},
	},
}

ww_defaultCharVars = {
	dataMajorVersion = 1,
	dataMinorVersion = 0,
	activeWeights = {},
}
