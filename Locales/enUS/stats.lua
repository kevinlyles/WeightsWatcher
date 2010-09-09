if GetLocale() ~= "enUS" then
	return
end

ww_localizedStats = {
	["agility"] = "agility",
	["all resistances"] = "all resistances",
	["all stats"] = "all stats",
	["arcane resistance"] = "arcane resistance",
	["arcane spell damage"] = "arcane spell damage",
	["armor"] = "armor",
	["armor from items (percent)"] = "armor from items (percent)",
	["armor penetration rating"] = "armor penetration rating",
	["attack power"] = "attack power",
	["average melee weapon damage"] = "average melee weapon damage",
	["average ranged weapon damage"] = "average ranged weapon damage",
	["block rating"] = "block rating",
	["block value"] = "block value",
	["block value (percent)"] = "block value (percent)",
	["chance to increase physical haste"] = "chance to increase physical haste",
	["chance to increase spell haste"] = "chance to increase spell haste",
	["chance to restore health on hit"] = "chance to restore health on hit",
	["chance to restore mana on spellcast"] = "chance to restore mana on spellcast",
	["chance to stun target"] = "chance to stun target",
	["critical damage (percent)"] = "critical damage (percent)",
	["critical healing (percent)"] = "critical healing (percent)",
	["critical strike rating"] = "critical strike rating",
	["defense rating"] = "defense rating",
	["disarm duration reduction (percent)"] = "disarm duration reduction (percent)",
	["dodge rating"] = "dodge rating",
	["expertise rating"] = "expertise rating",
	["disorient resist chance (percent)"] = "disorient resist chance (percent)",
	["fear duration reduction (percent)"] = "fear duration reduction (percent)",
	["fear resist chance (percent)"] = "fear resist chance (percent)",
	["feral attack power"] = "feral attack power",
	["fire resistance"] = "fire resistance",
	["fire spell damage"] = "fire spell damage",
	["fishing"] = "fishing",
	["frost resistance"] = "frost resistance",
	["frost spell damage"] = "frost spell damage",
	["haste rating"] = "haste rating",
	["health"] = "health",
	["herbalism"] = "herbalism",
	["hit rating"] = "hit rating",
	["holy resistance"] = "holy resistance",
	["holy spell damage"] = "holy spell damage",
	["hp5"] = "hp5",
	["increased stealth"] = "increased stealth",
	["intellect"] = "intellect",
	["intellect (percent)"] = "intellect (percent)",
	["item level"] = "item level",
	["mana"] = "mana",
	["mana (percent)"] = "mana (percent)",
	["mastery rating"] = "mastery rating",
	["maximum melee weapon damage"] = "maximum melee weapon damage",
	["maximum ranged weapon damage"] = "maximum ranged weapon damage",
	["melee dps"] = "melee dps",
	["melee weapon speed"] = "melee weapon speed",
	["mining"] = "mining",
	["minor run speed"] = "minor run speed",
	["mount speed (percent)"] = "mount speed (percent)",
	["mp5"] = "mp5",
	["nature resistance"] = "nature resistance",
	["nature spell damage"] = "nature spell damage",
	["parry rating"] = "parry rating",
	["prismatic socket"] = "prismatic socket",
	["ranged attack power"] = "ranged attack power",
	["ranged critical strike rating"] = "ranged critical strike rating",
	["ranged dps"] = "ranged dps",
	["ranged haste rating"] = "ranged haste rating",
	["ranged hit rating"] = "ranged hit rating",
	["ranged weapon speed"] = "ranged weapon speed",
	["requires level"] = "requires level",
	["resilience rating"] = "resilience rating",
	["shadow resistance"] = "shadow resistance",
	["shadow spell damage"] = "shadow spell damage",
	["silence duration reduction (percent)"] = "silence duration reduction (percent)",
	["skinning"] = "skinning",
	["snare/root duration reduction (percent)"] = "snare/root duration reduction (percent)",
	["sometimes heal on your crits"] = "sometimes heal on your crits",
	["spell critical strike rating"] = "spell critical strike rating",
	["spell damage taken reduction (percent)"] = "spell damage taken reduction (percent)",
	["spell hit rating"] = "spell hit rating",
	["spell penetration"] = "spell penetration",
	["spell power"] = "spell power",
	["spell reflect (percent)"] = "spell reflect (percent)",
	["spirit"] = "spirit",
	["stamina"] = "stamina",
	["strength"] = "strength",
	["stun duration reduction (percent)"] = "stun duration reduction (percent)",
	["stun resist chance (percent)"] = "stun resist chance (percent)",
	["threat (percent)"] = "threat (percent)",
	["threat reduction (percent)"] = "threat reduction (percent)",
}

ww_englishStats = {}
for k, v in pairs(ww_localizedStats) do
	ww_englishStats[v] = k
end

ww_statDisplayNames = {
	[ww_localizedStats["agility"]] = "Agility",
	[ww_localizedStats["all resistances"]] = "All Resistances",
	[ww_localizedStats["all stats"]] = "All Stats",
	[ww_localizedStats["arcane resistance"]] = "Arcane Resistance",
	[ww_localizedStats["arcane spell damage"]] = "Arcane Spell Damage",
	[ww_localizedStats["armor"]] = "Armor",
	[ww_localizedStats["armor from items (percent)"]] = "Armor from Items (Percent)",
	[ww_localizedStats["armor penetration rating"]] = "Armor Penetration Rating",
	[ww_localizedStats["attack power"]] = "Attack Power",
	[ww_localizedStats["average melee weapon damage"]] = "Average Melee Weapon Damage",
	[ww_localizedStats["average ranged weapon damage"]] = "Average Ranged Weapon Damage",
	[ww_localizedStats["block rating"]] = "Block Rating",
	[ww_localizedStats["block value"]] = "Block Value",
	[ww_localizedStats["block value (percent)"]] = "Block Value (Percent)",
	[ww_localizedStats["chance to increase physical haste"]] = "Chance to Increase Physical Haste",
	[ww_localizedStats["chance to increase spell haste"]] = "Chance to Increase Spell Haste",
	[ww_localizedStats["chance to restore health on hit"]] = "Chance to Restore Health on Hit",
	[ww_localizedStats["chance to restore mana on spellcast"]] = "Chance to Restore Mana on Spellcast",
	[ww_localizedStats["chance to stun target"]] = "Chance to Stun Target",
	[ww_localizedStats["critical damage (percent)"]] = "Critical Damage (Percent)",
	[ww_localizedStats["critical healing (percent)"]] = "Critical Healing (Percent)",
	[ww_localizedStats["critical strike rating"]] = "Critical Strike Rating",
	[ww_localizedStats["defense rating"]] = "Defense Rating",
	[ww_localizedStats["disarm duration reduction (percent)"]] = "Disarm Duration Reduction (Percent)",
	[ww_localizedStats["dodge rating"]] = "Dodge Rating",
	[ww_localizedStats["expertise rating"]] = "Expertise Rating",
	[ww_localizedStats["disorient resist chance (percent)"]] = "Disorient Resist Chance (Percent)",
	[ww_localizedStats["fear duration reduction (percent)"]] = "Fear Duration Reduction (Percent)",
	[ww_localizedStats["fear resist chance (percent)"]] = "Fear Resist Chance (Percent)",
	[ww_localizedStats["feral attack power"]] = "Feral Attack Power",
	[ww_localizedStats["fire resistance"]] = "Fire Resistance",
	[ww_localizedStats["fire spell damage"]] = "Fire Spell Damage",
	[ww_localizedStats["fishing"]] = "Fishing",
	[ww_localizedStats["frost resistance"]] = "Frost Resistance",
	[ww_localizedStats["frost spell damage"]] = "Frost Spell Damage",
	[ww_localizedStats["haste rating"]] = "Haste Rating",
	[ww_localizedStats["health"]] = "Health",
	[ww_localizedStats["herbalism"]] = "Herbalism",
	[ww_localizedStats["hit rating"]] = "Hit Rating",
	[ww_localizedStats["holy resistance"]] = "Holy Resistance",
	[ww_localizedStats["holy spell damage"]] = "Holy Spell Damage",
	[ww_localizedStats["hp5"]] = "HP5",
	[ww_localizedStats["increased stealth"]] = "Increased Stealth",
	[ww_localizedStats["intellect"]] = "Intellect",
	[ww_localizedStats["intellect (percent)"]] = "Intellect (Percent)",
	[ww_localizedStats["item level"]] = "Item Level",
	[ww_localizedStats["mana"]] = "Mana",
	[ww_localizedStats["mana (percent)"]] = "Mana (Percent)",
	[ww_localizedStats["mastery rating"]] = "Mastery Rating",
	[ww_localizedStats["maximum melee weapon damage"]] = "Maximum Melee Weapon Damage",
	[ww_localizedStats["maximum ranged weapon damage"]] = "Maximum Ranged Weapon Damage",
	[ww_localizedStats["melee dps"]] = "Melee DPS",
	[ww_localizedStats["melee weapon speed"]] = "Melee Weapon Speed",
	[ww_localizedStats["mining"]] = "Mining",
	[ww_localizedStats["minor run speed"]] = "Minor Run Speed",
	[ww_localizedStats["mount speed (percent)"]] = "Mount Speed (Percent)",
	[ww_localizedStats["mp5"]] = "MP5",
	[ww_localizedStats["nature resistance"]] = "Nature Resistance",
	[ww_localizedStats["nature spell damage"]] = "Nature Spell Damage",
	[ww_localizedStats["parry rating"]] = "Parry Rating",
	[ww_localizedStats["prismatic socket"]] = "Prismatic Socket",
	[ww_localizedStats["ranged attack power"]] = "Ranged Attack Power",
	[ww_localizedStats["ranged critical strike rating"]] = "Ranged Critical Strike Rating",
	[ww_localizedStats["ranged dps"]] = "Ranged DPS",
	[ww_localizedStats["ranged haste rating"]] = "Ranged Haste Rating",
	[ww_localizedStats["ranged hit rating"]] = "Ranged Hit Rating",
	[ww_localizedStats["ranged weapon speed"]] = "Ranged Weapon Speed",
	[ww_localizedStats["requires level"]] = "Requires Level",
	[ww_localizedStats["resilience rating"]] = "Resilience Rating",
	[ww_localizedStats["shadow resistance"]] = "Shadow Resistance",
	[ww_localizedStats["shadow spell damage"]] = "Shadow Spell Damage",
	[ww_localizedStats["silence duration reduction (percent)"]] = "Silence Duration Reduction (Percent)",
	[ww_localizedStats["skinning"]] = "Skinning",
	[ww_localizedStats["snare/root duration reduction (percent)"]] = "Snare/Root Duration Reduction (Percent)",
	[ww_localizedStats["sometimes heal on your crits"]] = "Sometimes Heal on your Crits",
	[ww_localizedStats["spell critical strike rating"]] = "Spell Critical Strike Rating",
	[ww_localizedStats["spell damage taken reduction (percent)"]] = "Spell Damage Taken Reduction (Percent)",
	[ww_localizedStats["spell hit rating"]] = "Spell Hit Rating",
	[ww_localizedStats["spell penetration"]] = "Spell Penetration",
	[ww_localizedStats["spell power"]] = "Spell Power",
	[ww_localizedStats["spell reflect (percent)"]] = "Spell Reflect (Percent)",
	[ww_localizedStats["spirit"]] = "Spirit",
	[ww_localizedStats["stamina"]] = "Stamina",
	[ww_localizedStats["strength"]] = "Strength",
	[ww_localizedStats["stun duration reduction (percent)"]] = "Stun Duration Reduction (Percent)",
	[ww_localizedStats["stun resist chance (percent)"]] = "Stun Resist Chance (Percent)",
	[ww_localizedStats["threat (percent)"]] = "Threat (Percent)",
	[ww_localizedStats["threat reduction (percent)"]] = "Threat Reduction (Percent)",
}

ww_statCategories = {
	["General"] = "General",
	["DPS"] = "DPS",
	["Tanking"] = "Tanking",
	["Physical DPS"] = "Physical DPS",
	["Melee DPS"] = "Melee DPS",
	["Ranged DPS"] = "Ranged DPS",
	["Caster"] = "Caster",
	["Caster DPS"] = "Caster DPS",
	["Healing"] = "Healing",
	["PVP"] = "PVP",
	["CC Resists/Reductions"] = "CC Resists/Reductions",
	["Resistances"] = "Resistances",
	["Professions"] = "Professions",
	["Miscellaneous"] = "Miscellaneous",
	["Enchant/Meta Gem Effects"] = "Enchant/Meta Gem Effects",
}
