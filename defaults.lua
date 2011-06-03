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
				"critical damage (percent)",
				"threat reduction (percent)",
			},
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
		"dodge rating",
		"health",
		"hp5",
		"parry rating",
		"stamina",
		ww_statCategories["Enchant/Meta Gem Effects"],
		[ww_statCategories["Enchant/Meta Gem Effects"]] = {
			"armor (percent)",
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
		"mending",
		"mongoose",
		"power torrent",
		"spellsurge",
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
	dataMinorVersion = 0,
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
				["intellect"] = 100,
				["spell power"] = 100,
				["spirit"] = 90,
				["haste rating"] = 90,
				["hit rating"] = 90,
				["spell hit rating"] = 90,
				["mastery rating"] = 80,
				["critical strike rating"] = 70,
				["spell critical strike rating"] = 70,
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Feral DPS"]] = {
				["melee dps"] = 151,
				["agility"] = 100,
				["strength"] = 78,
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
				["attack power"] = 5,
				["hit rating"] = 5,
				["haste rating"] = 1,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Restoration"]] = {
				["intellect"] = 100,
				["spell power"] = 95,
				["spirit"] = 90,
				["mastery rating"] = 80,
				["haste rating"] = 70,
				["critical strike rating"] = 60,
				["spell critical strike rating"] = 60,
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
				["agility"] = 100,
				["ranged dps"] = 100,
				["hit rating"] = 80,
				["ranged hit rating"] = 80,
				["critical strike rating"] = 60,
				["ranged critical strike rating"] = 60,
				["mastery rating"] = 40,
				["haste rating"] = 20,
				["ranged haste rating"] = 20,
				triggers = {
					rangedDamage = true,
				}
			},
			[ww_specNames["Marksmanship"]] = {
				["agility"] = 100,
				["ranged dps"] = 100,
				["hit rating"] = 80,
				["ranged hit rating"] = 80,
				["critical strike rating"] = 60,
				["ranged critical strike rating"] = 60,
				["haste rating"] = 60,
				["ranged haste rating"] = 60,
				["mastery rating"] = 40,
				triggers = {
					rangedDamage = true,
				}
			},
			[ww_specNames["Survival"]] = {
				["agility"] = 100,
				["ranged dps"] = 100,
				["hit rating"] = 80,
				["ranged hit rating"] = 80,
				["critical strike rating"] = 60,
				["ranged critical strike rating"] = 60,
				["haste rating"] = 40,
				["ranged haste rating"] = 40,
				["mastery rating"] = 20,
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
				["spell power"] = 100,
				["intellect"] = 100,
				["hit rating"] = 80,
				["spell hit rating"] = 80,
				["haste rating"] = 50,
				["critical strike rating"] = 45,
				["spell critical strike rating"] = 45,
				["mastery rating"] = 40,
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
				triggers = {
					harmfulSpell = true,
				}
			},
			[ww_specNames["Frost"]] = {
				["intellect"] = 100,
				["spell power"] = 100,
				["hit rating"] = 80,
				["spell hit rating"] = 80,
				["mastery rating"] = 70,
				["haste rating"] = 50,
				["critical strike rating"] = 45,
				["spell critical strike rating"] = 45,
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
				["haste rating"] = 80,
				["spirit"] = 50,
				["mastery rating"] = 50,
				["spell power"] = 50,
				["critical strike rating"] = 25,
				["spell critical strike rating"] = 25,
				triggers = {
					helpfulSpell = true,
				}
			},
			[ww_specNames["Protection"]] = {
				["stamina"] = 100,
				["mastery rating"] = 90,
				["dodge rating"] = 80,
				["parry rating"] = 80,
				["hit rating"] = 70,
				["expertise rating"] = 60,
				["strength"] = 50,
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
				["intellect"] = 100,
				["spirit"] = 95,
				["haste rating"] = 85,
				["mastery rating"] = 80,
				["critical strike rating"] = 30,
				["spell critical strike rating"] = 30,
				triggers = {
					helpfulSpell = true,
				}
			},
			[ww_specNames["Shadow"]] = {
				["intellect"] = 100,
				["spell power"] = 79,
				["haste rating"] = 50,
				["critical strike rating"] = 40,
				["spell critical strike rating"] = 40,
				["mastery rating"] = 38,
				["hit rating"] = 37,
				["spell hit rating"] = 37,
				["spirit"] = 37,
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
				["spell power"] = 80,
				["intellect"] = 80,
				["mastery rating"] = 75,
				["haste rating"] = 75,
				["critical strike rating"] = 40,
				["spell critical strike rating"] = 40,
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
				["mastery rating"] = 29,
				["stamina"] = 1,
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
				["hit rating"] = 90,
				["expertise rating"] = 85,
				["critical strike rating"] = 80,
				["melee critical strike rating"] = 80,
				["mastery rating"] = 70,
				["haste rating"] = 50,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Fury"]] = {
				["strength"] = 100,
				["expertise rating"] = 90,
				["hit rating"] = 90,
				["critical strike rating"] = 80,
				["melee critical strike rating"] = 80,
				["mastery rating"] = 70,
				["haste rating"] = 50,
				triggers = {
					meleeDamage = true,
				}
			},
			[ww_specNames["Protection"]] = {
				["stamina"] = 100,
				["mastery rating"] = 90,
				["parry rating"] = 85,
				["dodge rating"] = 80,
				["expertise rating"] = 70,
				["hit rating"] = 65,
				["strength"] = 60,
				["critical strike rating"] = 50,
				["melee critical strike rating"] = 50,
				triggers = {
					meleeDamage = true,
				}
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
