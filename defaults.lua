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
		"mastery rating",
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
			"melee critical strike rating",
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
	dataMinorVersion = 25,
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
			ww_specNames["Unholy"],
			[ww_specNames["Blood"]] = {
				["melee dps"] = 500,
				["stamina"] = 100,
				["mastery rating"] = 100,
				["defense rating"] = 90,
				["agility"] = 69,
				["dodge rating"] = 50,
				["parry rating"] = 43,
				["expertise rating"] = 38,
				["strength"] = 31,
				["critical strike rating"] = 22,
				["melee critical strike rating"] = 22,
				["armor"] = 18,
				["haste rating"] = 16,
				["hit rating"] = 16,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Frost"]] = {
				["strength"] = 100,
				["melee dps"] = 100,
				["hit rating"] = 43,
				["expertise rating"] = 41,
				["haste rating"] = 37,
				["mastery rating"] = 35,
				["attack power"] = 32,
				["critical strike rating"] = 26,
				["melee critical strike rating"] = 26,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Unholy"]] = {
				["strength"] = 100,
				["melee dps"] = 100,
				["hit rating"] = 25,
				["haste rating"] = 25,
				["attack power"] = 23,
				["expertise rating"] = 21,
				["critical strike rating"] = 20,
				["melee critical strike rating"] = 20,
				["mastery rating"] = 8,
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
				["mastery rating"] = 100,
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
				["melee dps"] = 151,
				["agility"] = 100,
				["strength"] = 78,
				["feral attack power"] = 37,
				["attack power"] = 37,
				["mastery rating"] = 35,
				["haste rating"] = 32,
				["expertise rating"] = 29,
				["hit rating"] = 28,
				["critical strike rating"] = 28,
				["melee critical strike rating"] = 28,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Feral Tank"]] = {
				["stamina"] = 100,
				["armor"] = 75,
				["agility"] = 48,
				["dodge rating"] = 41,
				["mastery rating"] = 16,
				["critical strike rating"] = 13,
				["melee critical strike rating"] = 13,
				["strength"] = 10,
				["expertise rating"] = 10,
				["health"] = 7,
				["feral attack power"] = 5,
				["attack power"] = 5,
				["hit rating"] = 5,
				["haste rating"] = 1,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Restoration"]] = {
				["spell power"] = 100,
				["mastery rating"] = 100,
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
				["mastery rating"] = 100,
				["agility"] = 58,
				["critical strike rating"] = 40,
				["ranged critical strike rating"] = 40,
				["intellect"] = 37,
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
				["mastery rating"] = 100,
				["agility"] = 74,
				["critical strike rating"] = 57,
				["ranged critical strike rating"] = 57,
				["intellect"] = 39,
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
				["mastery rating"] = 100,
				["agility"] = 76,
				["critical strike rating"] = 42,
				["ranged critical strike rating"] = 42,
				["intellect"] = 35,
				["haste rating"] = 31,
				["ranged haste rating"] = 31,
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
				["mastery rating"] = 100,
				["haste rating"] = 54,
				["arcane spell damage"] = 49,
				["spell power"] = 49,
				["critical strike rating"] = 37,
				["spell critical strike rating"] = 37,
				["intellect"] = 34,
				["frost spell damage"] = 24,
				["fire spell damage"] = 24,
				["spirit"] = 14,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Fire"]] = {
				["intellect"] = 100,
				["hit rating"] = 82,
				["spell hit rating"] = 82,
				["spell power"] = 68,
				["fire spell damage"] = 68,
				["critical strike rating"] = 52,
				["spell critical strike rating"] = 52,
				["mastery rating"] = 37,
				["haste rating"] = 35,
--				["frost spell damage"] = 23,
--				["arcane spell damage"] = 23,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Frost"]] = {
				["hit rating"] = 100,
				["spell hit rating"] = 100,
				["mastery rating"] = 100,
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
				["mastery rating"] = 100,
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
				["mastery rating"] = 100,
				["agility"] = 60,
				["expertise rating"] = 59,
				["dodge rating"] = 55,
				["parry rating"] = 30,
				["strength"] = 16,
				["armor"] = 8,
				triggers = {
					harmfulSpell = true,
					meleeDamage = true,
				}
			},
			[ww_specNames["Retribution"]] = {
				["strength"] = 100,
				["melee dps"] = 100,
				["attack power"] = 45,
				["hit rating"] = 35,
				["expertise rating"] = 22,
				["haste rating"] = 18,
				["critical strike rating"] = 16,
				["mastery rating"] = 9,
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
				["intellect"] = 100,
				["spirit"] = 80,
				["spell power"] = 19,
				["critical strike rating"] = 11,
				["spell critical strike rating"] = 11,
				["haste rating"] = 10,
				["mastery rating"] = 6,
				triggers = {
					helpfulSpell = true,
				}
			},
			[ww_specNames["Holy"]] = {
				["mastery rating"] = 100,
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
				["mastery rating"] = 100,
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
				["melee dps"] = 100,
				["agility"] = 100,
				["hit rating"] = 67,
				["mastery rating"] = 50,
				["haste rating"] = 46,
				["expertise rating"] = 42,
				["critical strike rating"] = 35,
				["melee critical strike rating"] = 35,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Combat"]] = {
				["melee dps"] = 100,
				["agility"] = 100,
				["hit rating"] = 70,
				["expertise rating"] = 59,
				["haste rating"] = 56,
				["critical strike rating"] = 35,
				["melee critical strike rating"] = 35,
				["mastery rating"] = 33,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Subtlety"]] = {
				["melee dps"] = 100,
				["agility"] = 100,
				["hit rating"] = 40,
				["haste rating"] = 37,
				["expertise rating"] = 33,
				["critical strike rating"] = 31,
				["melee critical strike rating"] = 31,
				["mastery rating"] = 20,
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
				["mastery rating"] = 100,
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
				["melee dps"] = 124,
				["agility"] = 100,
				["hit rating"] = 60,
				["expertise rating"] = 48,
				["mastery rating"] = 44,
				["strength"] = 42,
				["attack power"] = 40,
				["intellect"] = 36,
				["spell power"] = 36,
				["critical strike rating"] = 28,
				["melee critical strike rating"] = 28,
				["haste rating"] = 16,
				triggers = {
					harmfulSpell = true,
					meleeDamage = true,
				}
			},
			[ww_specNames["Restoration"]] = {
				["intellect"] = 100,
				["spell power"] = 83,
				["spirit"] = 75,
				["haste rating"] = 67,
				["critical strike rating"] = 58,
				["spell critical strike rating"] = 58,
				["mastery rating"] = 42,
				["stamina"] = 8,
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
				["intellect"] = 100,
				["spell power"] = 81,
				["hit rating"] = 52,
				["spell hit rating"] = 52,
				["haste rating"] = 43,
				["critical strike rating"] = 32,
				["spell critical strike rating"] = 32,
				["mastery rating"] = 30,
				["stamina"] = 1,
--				["shadow spell damage"] = 72,
--				["fire spell damage"] = 36,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Demonology"]] = {
				["intellect"] = 100,
				["spell power"] = 79,
				["hit rating"] = 63,
				["spell hit rating"] = 63,
				["haste rating"] = 40,
				["critical strike rating"] = 35,
				["spell critical strike rating"] = 35,
				["mastery rating"] = 31,
				["stamina"] = 1,
--				["fire spell damage"] = 45,
--				["shadow spell damage"] = 45,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Destruction"]] = {
				["intellect"] = 100,
				["spell power"] = 77,
				["hit rating"] = 64,
				["spell hit rating"] = 64,
				["haste rating"] = 36,
				["critical strike rating"] = 34,
				["spell critical strike rating"] = 34,
				["mastery rating"] = 100,
				["stamina"] = 1,
--				["fire spell damage"] = 47,
--				["shadow spell damage"] = 23,
				triggers = {
					harmfulSpell = true,
				}
			},
		},
		["WARRIOR"] = {
			ww_specNames["Arms"],
			ww_specNames["Fury"],
			ww_specNames["Protection"],
			[ww_specNames["Arms"]] = {
				["strength"] = 100,
				["mastery rating"] = 100,
				["hit rating"] = 90,
				["expertise rating"] = 85,
				["critical strike rating"] = 80,
				["melee critical strike rating"] = 80,
				["agility"] = 65,
				["haste rating"] = 50,
				["armor"] = 2,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Fury"]] = {
				["expertise rating"] = 100,
				["mastery rating"] = 100,
				["strength"] = 82,
				["critical strike rating"] = 66,
				["melee critical strike rating"] = 66,
				["agility"] = 53,
				["hit rating"] = 48,
				["haste rating"] = 36,
				["armor"] = 5,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Protection"]] = {
				["stamina"] = 100,
				["mastery rating"] = 100,
				["dodge rating"] = 90,
				["agility"] = 67,
				["strength"] = 48,
				["expertise rating"] = 19,
				["hit rating"] = 10,
				["critical strike rating"] = 7,
				["melee critical strike rating"] = 7,
				["armor"] = 6,
				["haste rating"] = 1,
				triggers = {
					meleeDamage = true,
				}
			},
		},
	},
	options = {
		gems = {
			qualityLimit = 10,
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
			showZeroScores = false,
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
