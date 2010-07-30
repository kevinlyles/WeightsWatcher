local L = ww_localization

ww_trackedStats = {
	ww_statCategories["General"],
	ww_statCategories["Physical DPS"],
	ww_statCategories["Tanking"],
	ww_statCategories["Caster"],
	ww_statCategories["PVP"],
	ww_statCategories["Miscellaneous"],
	[ww_statCategories["General"]] = {
		"critical strike rating",
		"haste rating",
		ww_statCategories["DPS"],
		[ww_statCategories["DPS"]] = {
			"hit rating",
			ww_statCategories["Enchant/Meta Gem Effects"],
			[ww_statCategories["Enchant/Meta Gem Effects"]] = {
				"critical damage (percent)",
				"threat reduction (percent)",
			},
		},
	},
	[ww_statCategories["Physical DPS"]] = {
		"agility",
		"armor penetration rating",
		"attack power",
		"strength",
		ww_statCategories["Melee DPS"],
		ww_statCategories["Ranged DPS"],
		ww_statCategories["Enchant/Meta Gem Effects"],
		[ww_statCategories["Melee DPS"]] = {
			"feral attack power",
			"expertise rating",
			"melee dps",
			"average melee weapon damage",
			"maximum melee weapon damage",
			"melee weapon speed",
			"meleeDamage",
			["meleeDamage"] = "ww_triggerFrame",
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
		},
	},
	[ww_statCategories["Tanking"]] = {
		"armor",
		"block rating",
		"block value",
		"defense rating",
		"dodge rating",
		"health",
		"hp5",
		"parry rating",
		"stamina",
		ww_statCategories["Enchant/Meta Gem Effects"],
		[ww_statCategories["Enchant/Meta Gem Effects"]] = {
			"armor from items (percent)",
			"block value (percent)",
			"chance to restore health on hit",
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
				"critical healing (percent)",
				"mana (percent)",
			},
		},
		[ww_statCategories["Enchant/Meta Gem Effects"]] = {
			"chance to increase spell haste",
			"intellect (percent)",
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
			"holy resistance",
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
	dataMajorVersion = 1,
	dataMinorVersion = 21,
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
			ww_specNames["Blood DPS"],
			ww_specNames["Frost DPS"],
			ww_specNames["Unholy DPS"],
			ww_specNames["Tank"],
			[ww_specNames["Blood DPS"]] = {
				["melee dps"] = 360,
				["armor penetration rating"] = 100,
				["strength"] = 99,
				["hit rating"] = 91,
				["expertise rating"] = 90,
				["critical strike rating"] = 57,
				["haste rating"] = 55,
				["attack power"] = 36,
				["armor"] = 1,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Frost DPS"]] = {
				["melee dps"] = 337,
				["hit rating"] = 100,
				["strength"] = 97,
				["expertise rating"] = 81,
				["armor penetration rating"] = 61,
				["critical strike rating"] = 45,
				["attack power"] = 35,
				["haste rating"] = 28,
				["armor"] = 1,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Unholy DPS"]] = {
				["melee dps"] = 209,
				["strength"] = 100,
				["hit rating"] = 66,
				["expertise rating"] = 51,
				["haste rating"] = 48,
				["critical strike rating"] = 45,
				["attack power"] = 34,
				["armor penetration rating"] = 32,
				["armor"] = 1,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Tank"]] = {
				["melee dps"] = 419,
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
				triggers = {
					meleeDamage = true,
				}
			},
		},
		["DRUID"] = {
			ww_specNames["Balance"],
			ww_specNames["Feral DPS"],
			ww_specNames["Feral Tank"],
			ww_specNames["Restoration"],
			[ww_specNames["Balance"]] = {
				["hit rating"] = 100,
				["spell hit rating"] = 100,
				["spell power"] = 66,
				["haste rating"] = 54,
				["critical strike rating"] = 43,
				["spell critical strike rating"] = 43,
				["spirit"] = 22,
				["intellect"] = 22,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Feral DPS"]] = {
				["agility"] = 100,
				["armor penetration rating"] = 90,
				["strength"] = 80,
				["critical strike rating"] = 55,
				["expertise rating"] = 50,
				["hit rating"] = 50,
				["feral attack power"] = 40,
				["attack power"] = 40,
				["haste rating"] = 35,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Feral Tank"]] = {
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
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Restoration"]] = {
				["spell power"] = 100,
				["mp5"] = 73,
				["haste rating"] = 57,
				["intellect"] = 51,
				["spirit"] = 32,
				["critical strike rating"] = 11,
				["spell critical strike rating"] = 11,
				triggers = {
					helpfulSpell = true,
				}
			},
		},
		["HUNTER"] = {
			ww_specNames["Beast Mastery"],
			ww_specNames["Marksmanship"],
			ww_specNames["Survival"],
			[ww_specNames["Beast Mastery"]] = {
				["ranged dps"] = 213,
				["hit rating"] = 100,
				["ranged hit rating"] = 100,
				["agility"] = 58,
				["critical strike rating"] = 40,
				["ranged critical strike rating"] = 40,
				["intellect"] = 37,
				["attack power"] = 30,
				["ranged attack power"] = 30,
				["armor penetration rating"] = 28,
				["haste rating"] = 21,
				["ranged haste rating"] = 21,
				triggers = {
					rangedDamage = true,
				}
			},
			[ww_specNames["Marksmanship"]] = {
				["ranged dps"] = 379,
				["hit rating"] = 100,
				["ranged hit rating"] = 100,
				["agility"] = 74,
				["critical strike rating"] = 57,
				["ranged critical strike rating"] = 57,
				["armor penetration rating"] = 40,
				["intellect"] = 39,
				["attack power"] = 32,
				["ranged attack power"] = 32,
				["haste rating"] = 24,
				["ranged haste rating"] = 24,
				triggers = {
					rangedDamage = true,
				}
			},
			[ww_specNames["Survival"]] = {
				["ranged dps"] = 181,
				["hit rating"] = 100,
				["ranged hit rating"] = 100,
				["agility"] = 76,
				["critical strike rating"] = 42,
				["ranged critical strike rating"] = 42,
				["intellect"] = 35,
				["haste rating"] = 31,
				["ranged haste rating"] = 31,
				["attack power"] = 29,
				["ranged attack power"] = 29,
				["armor penetration rating"] = 26,
				triggers = {
					rangedDamage = true,
				}
			},
		},
		["MAGE"] = {
			ww_specNames["Arcane"],
			ww_specNames["Fire"],
			ww_specNames["Frost"],
			[ww_specNames["Arcane"]] = {
				["hit rating"] = 100,
				["spell hit rating"] = 100,
				["haste rating"] = 54,
				["arcane spell damage"] = 49,
				["spell power"] = 49,
				["critical strike rating"] = 37,
				["spell critical strike rating"] = 37,
				["intellect"] = 34,
				["frost spell damage"] = 49,
				["fire spell damage"] = 49,
				["spirit"] = 14,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Fire"]] = {
				["hit rating"] = 100,
				["spell hit rating"] = 100,
				["haste rating"] = 53,
				["fire spell damage"] = 46,
				["spell power"] = 46,
				["critical strike rating"] = 43,
				["spell critical strike rating"] = 43,
				["frost spell damage"] = 23,
				["arcane spell damage"] = 23,
				["intellect"] = 13,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Frost"]] = {
				["hit rating"] = 100,
				["spell hit rating"] = 100,
				["haste rating"] = 42,
				["frost spell damage"] = 39,
				["spell power"] = 39,
				["arcane spell damage"] = 19,
				["fire spell damage"] = 19,
				["critical strike rating"] = 19,
				["spell critical strike rating"] = 19,
				["intellect"] = 6,
				triggers = {
					harmfulSpell = true,
				}
			},
		},
		["PALADIN"] = {
			ww_specNames["Holy"],
			ww_specNames["Protection"],
			ww_specNames["Retribution"],
			[ww_specNames["Holy"]] = {
				["intellect"] = 100,
				["mp5"] = 88,
				["spell power"] = 58,
				["critical strike rating"] = 46,
				["spell critical strike rating"] = 46,
				["haste rating"] = 35,
				triggers = {
					helpfulSpell = true,
				}
			},
			[ww_specNames["Protection"]] = {
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
				triggers = {
					harmfulSpell = true,
					meleeDamage = true,
				}
			},
			[ww_specNames["Retribution"]] = {
				["melee dps"] = 470,
				["hit rating"] = 100,
				["strength"] = 80,
				["expertise rating"] = 66,
				["critical strike rating"] = 40,
				["attack power"] = 34,
				["agility"] = 32,
				["haste rating"] = 30,
				["armor penetration rating"] = 22,
				["spell power"] = 9,
				triggers = {
					harmfulSpell = true,
					meleeDamage = true,
				}
			},
		},
		["PRIEST"] = {
			ww_specNames["Discipline"],
			ww_specNames["Holy"],
			ww_specNames["Shadow"],
			[ww_specNames["Discipline"]] = {
				["spell power"] = 100,
				["mp5"] = 67,
				["intellect"] = 65,
				["haste rating"] = 59,
				["critical strike rating"] = 48,
				["spell critical strike rating"] = 48,
				["spirit"] = 22,
				triggers = {
					helpfulSpell = true,
				}
			},
			[ww_specNames["Holy"]] = {
				["mp5"] = 100,
				["intellect"] = 69,
				["spell power"] = 60,
				["spirit"] = 52,
				["critical strike rating"] = 38,
				["spell critical strike rating"] = 38,
				["haste rating"] = 31,
				triggers = {
					helpfulSpell = true,
				}
			},
			[ww_specNames["Shadow"]] = {
				["hit rating"] = 100,
				["spell hit rating"] = 100,
				["shadow spell damage"] = 76,
				["spell power"] = 76,
				["critical strike rating"] = 54,
				["spell critical strike rating"] = 54,
				["haste rating"] = 50,
				["spirit"] = 16,
				["intellect"] = 16,
				triggers = {
					harmfulSpell = true,
				}
			},
		},
		["ROGUE"] = {
			ww_specNames["Assassination"],
			ww_specNames["Combat"],
			ww_specNames["Subtlety"],
			[ww_specNames["Assassination"]] = {
				["melee dps"] = 170,
				["agility"] = 100,
				["expertise rating"] = 87,
				["hit rating"] = 83,
				["critical strike rating"] = 81,
				["attack power"] = 65,
				["armor penetration rating"] = 65,
				["haste rating"] = 64,
				["strength"] = 55,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Combat"]] = {
				["melee dps"] = 220,
				["armor penetration rating"] = 100,
				["agility"] = 100,
				["expertise rating"] = 82,
				["hit rating"] = 80,
				["critical strike rating"] = 75,
				["haste rating"] = 73,
				["strength"] = 55,
				["attack power"] = 50,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Subtlety"]] = {
				["melee dps"] = 228,
				["expertise rating"] = 100,
				["agility"] = 100,
				["hit rating"] = 80,
				["armor penetration rating"] = 75,
				["critical strike rating"] = 75,
				["haste rating"] = 75,
				["strength"] = 55,
				["attack power"] = 50,
				triggers = {
					meleeDamage = true,
				}
			},
		},
		["SHAMAN"] = {
			ww_specNames["Elemental"],
			ww_specNames["Enhancement"],
			ww_specNames["Restoration"],
			[ww_specNames["Elemental"]] = {
				["hit rating"] = 100,
				["spell hit rating"] = 100,
				["spell power"] = 60,
				["haste rating"] = 56,
				["critical strike rating"] = 40,
				["spell critical strike rating"] = 40,
				["intellect"] = 11,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Enhancement"]] = {
				["melee dps"] = 135,
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
				triggers = {
					harmfulSpell = true,
					meleeDamage = true,
				}
			},
			[ww_specNames["Restoration"]] = {
				["mp5"] = 100,
				["intellect"] = 85,
				["spell power"] = 77,
				["critical strike rating"] = 62,
				["spell critical strike rating"] = 62,
				["haste rating"] = 35,
				triggers = {
					helpfulSpell = true,
				}
			},
		},
		["WARLOCK"] = {
			ww_specNames["Affliction"],
			ww_specNames["Demonology"],
			ww_specNames["Destruction"],
			[ww_specNames["Affliction"]] = {
				["hit rating"] = 100,
				["spell hit rating"] = 100,
				["shadow spell damage"] = 72,
				["spell power"] = 72,
				["haste rating"] = 61,
				["critical strike rating"] = 38,
				["spell critical strike rating"] = 38,
				["fire spell damage"] = 36,
				["spirit"] = 34,
				["intellect"] = 15,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Demonology"]] = {
				["hit rating"] = 100,
				["spell hit rating"] = 100,
				["haste rating"] = 50,
				["fire spell damage"] = 45,
				["shadow spell damage"] = 45,
				["spell power"] = 45,
				["critical strike rating"] = 31,
				["spell critical strike rating"] = 31,
				["spirit"] = 29,
				["intellect"] = 13,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Destruction"]] = {
				["hit rating"] = 100,
				["spell hit rating"] = 100,
				["fire spell damage"] = 47,
				["spell power"] = 47,
				["haste rating"] = 46,
				["spirit"] = 26,
				["shadow spell damage"] = 23,
				["critical strike rating"] = 16,
				["spell critical strike rating"] = 16,
				["intellect"] = 13,
				triggers = {
					harmfulSpell = true,
				}
			},
		},
		["WARRIOR"] = {
			ww_specNames["DPS"],
			ww_specNames["Protection"],
			[ww_specNames["DPS"]] = {
				["expertise rating"] = 100,
				["strength"] = 82,
				["critical strike rating"] = 66,
				["agility"] = 53,
				["armor penetration rating"] = 52,
				["hit rating"] = 48,
				["haste rating"] = 36,
				["attack power"] = 31,
				["armor"] = 5,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Protection"]] = {
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
				triggers = {
					meleeDamage = true,
				}
			},
		},
	},
	options = {
		gems = {
			qualityLimit = 7,
			breakSocketColors = true,
			neverBreakSocketColors = false,
			types = {
				["Normal"] = true,
				["Unique-Equipped"] = false,
				["Jewelcrafter-Only"] = false,
			},
			sources = {
				["Vendor"] = true,
				["PVP-Vendor"] = false,
				["Crafted"] = true,
				["Procced"] = true,
				["Drop"] = false,
				["Quest"] = false,
			},
		},
		tooltip = {
			hideHints = false,
			normalizeWeights = true,
			showAlternateGems = "Alt",
			showClassNames = "Other Classes",
			showDebugInfo = "Never",
			showDifferences = true,
			showIdealGems = "Control",
			showIdealGemStats = "Always",
			showIdealWeights = "Shift",
			showWeights = "Always",
		},
		useEffects = {
			uptimeRatio = 0.8,
		}
	},
}

ww_defaultCharVars = {
	dataMajorVersion = 1,
	dataMinorVersion = 0,
	activeWeights = {},
}
