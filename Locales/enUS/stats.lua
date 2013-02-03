local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

ww_localizedStats = {
	["agility"] = "agility",
	["all resistances"] = "all resistances",
	["all stats"] = "all stats",
	["arcane resistance"] = "arcane resistance",
	["arcane spell damage"] = "arcane spell damage",
	["armor"] = "armor",
	["armor (percent)"] = "armor (percent)",
	["armor from items (percent)"] = "armor from items (percent)",
	["attack power"] = "attack power",
	["attack power against undead"] = "attack power against undead",
	["avalanche"] = "avalanche",
	["average damage dealt on block"] = "average damage dealt on block",
	["average melee weapon damage"] = "average melee weapon damage",
	["average ranged weapon damage"] = "average ranged weapon damage",
	["battlemaster"] = "battlemaster",
	["berserking"] = "berserking",
	["black magic"] = "black magic",
	["blade ward"] = "blade ward",
	["block"] = "block",
	["block value (percent)"] = "block value (percent)",
	["blood draining"] = "blood draining",
	["chance to increase physical haste"] = "chance to increase physical haste",
	["chance to increase spell haste"] = "chance to increase spell haste",
	["chance to restore health on hit"] = "chance to restore health on hit",
	["chance to restore mana on spellcast"] = "chance to restore mana on spellcast",
	["chance to stun target"] = "chance to stun target",
	["colossus"] = "colossus",
	["critical effect (percent)"] = "critical effect (percent)",
	["critical strike"] = "critical strike",
	["crusader"] = "crusader",
	["damage absorption (2% chance)"] = "damage absorption (2% chance)",
	["damage absorption (5% chance)"] = "damage absorption (5% chance)",
	["dancing steel"] = "dancing steel",
	["darkglow embroidery"] = "darkglow embroidery",
	["deathfrost"] = "deathfrost",
	["demonslaying"] = "demonslaying",
	["disarm duration reduction (percent)"] = "disarm duration reduction (percent)",
	["dodge"] = "dodge",
	["elemental force"] = "elemental force",
	["elemental slayer"] = "elemental slayer",
	["executioner"] = "executioner",
	["expertise"] = "expertise",
	["disorient resist chance (percent)"] = "disorient resist chance (percent)",
	["fear duration reduction (percent)"] = "fear duration reduction (percent)",
	["fear resist chance (percent)"] = "fear resist chance (percent)",
	["fiery blaze"] = "fiery blaze",
	["fiery weapon"] = "fiery weapon",
	["fire resistance"] = "fire resistance",
	["fire spell damage"] = "fire spell damage",
	["fishing"] = "fishing",
	["frost resistance"] = "frost resistance",
	["frost spell damage"] = "frost spell damage",
	["ghost iron shield spike"] = "ghost iron shield spike",
	["giant slayer"] = "giant slayer",
	["gnomish x-ray scope"] = "gnomish x-ray scope",
	["goblin glider"] = "goblin glider",
	["haste"] = "haste",
	["health"] = "health",
	["heartsong"] = "heartsong",
	["herbalism"] = "herbalism",
	["hit"] = "hit",
-- 	["holy resistance"] = "holy resistance",
	["holy spell damage"] = "holy spell damage",
	["hp5"] = "hp5",
	["hurricane"] = "hurricane",
	["icebreaker"] = "icebreaker",
	["icy chill"] = "icy chill",
	["incendiary fireworks launcher"] = "incendiary fireworks launcher",
	["increased stealth"] = "increased stealth",
	["intellect"] = "intellect",
	["item level"] = "item level",
	["jade spirit"] = "jade spirit",
	["landslide"] = "landslide",
	["lifestealing"] = "lifestealing",
	["lifeward"] = "lifeward",
	["lightweave embroidery"] = "lightweave embroidery",
	["lord blastington's scope of doom"] = "lord blastington's scope of doom",
	["mana"] = "mana",
	["mana (percent)"] = "mana (percent)",
	["mastery"] = "mastery",
	["maximum melee weapon damage"] = "maximum melee weapon damage",
	["maximum ranged weapon damage"] = "maximum ranged weapon damage",
	["melee critical strike"] = "melee critical strike",
	["melee damage to beasts"] = "melee damage to beasts",
	["melee damage to elementals"] = "melee damage to elementals",
	["melee dps"] = "melee dps",
	["melee weapon speed"] = "melee weapon speed",
	["mending"] = "mending",
	["mining"] = "mining",
	["minor run speed"] = "minor run speed",
	["mirror scope"] = "mirror scope",
	["mongoose"] = "mongoose",
	["mount speed (percent)"] = "mount speed (percent)",
	["mp5"] = "mp5",
	["nature resistance"] = "nature resistance",
	["nature spell damage"] = "nature spell damage",
	["parry"] = "parry",
	["parry (percent)"] = "parry (percent)",
	["phase fingers"] = "phase fingers",
	["power torrent"] = "power torrent",
	["prismatic socket"] = "prismatic socket",
	["pvp power"] = "pvp power",
	["pvp resilience"] = "pvp resilience",
	["pyrium shield spike"] = "pyrium shield spike",
	["ranged attack power"] = "ranged attack power",
	["ranged critical strike"] = "ranged critical strike",
	["ranged dps"] = "ranged dps",
	["ranged haste"] = "ranged haste",
	["ranged hit"] = "ranged hit",
	["ranged weapon speed"] = "ranged weapon speed",
-- 	["requires level"] = "requires level",
-- 	["resilience"] = "resilience",
	["river's song"] = "river's song",
	["rune of cinderglacier"] = "rune of cinderglacier",
	["rune of razorice"] = "rune of razorice",
	["rune of the fallen crusader"] = "rune of the fallen crusader",
	["shadow resistance"] = "shadow resistance",
	["shadow spell damage"] = "shadow spell damage",
	["silence duration reduction (percent)"] = "silence duration reduction (percent)",
	["skinning"] = "skinning",
	["snare/root duration reduction (percent)"] = "snare/root duration reduction (percent)",
	["sometimes heal on your crits"] = "sometimes heal on your crits",
	["spell critical strike"] = "spell critical strike",
	["spell damage taken reduction (percent)"] = "spell damage taken reduction (percent)",
	["spell hit"] = "spell hit",
	["spell penetration"] = "spell penetration",
	["spell power"] = "spell power",
	["spell reflect (percent)"] = "spell reflect (percent)",
	["spellsurge"] = "spellsurge",
	["spirit"] = "spirit",
	["stamina"] = "stamina",
	["stamina (percent)"] = "stamina (percent)",
	["strength"] = "strength",
	["stun duration reduction (percent)"] = "stun duration reduction (percent)",
	["stun resist chance (percent)"] = "stun resist chance (percent)",
	["swordguard embroidery"] = "swordguard embroidery",
	["synapse springs"] = "synapse springs",
	["threat (percent)"] = "threat (percent)",
	["threat reduction (percent)"] = "threat reduction (percent)",
	["unholy weapon"] = "unholy weapon",
	["watergliding jets"] = "watergliding jets",
	["weapon damage (percent)"] = "weapon damage (percent)",
	["weapon damage vs undead (percent)"] = "weapon damage vs undead (percent)",
	["windsong"] = "windsong",
	["windwalk"] = "windwalk",
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
	[ww_localizedStats["armor (percent)"]] = "Armor (Percent)",
	[ww_localizedStats["armor from items (percent)"]] = "Armor from Items (Percent)",
	[ww_localizedStats["attack power against undead"]] = "Attack Power Against Undead",
	[ww_localizedStats["attack power"]] = "Attack Power",
	[ww_localizedStats["avalanche"]] = "Avalanche",
	[ww_localizedStats["average damage dealt on block"]] = "Average Damage Dealt on Block",
	[ww_localizedStats["average melee weapon damage"]] = "Average Melee Weapon Damage",
	[ww_localizedStats["average ranged weapon damage"]] = "Average Ranged Weapon Damage",
	[ww_localizedStats["battlemaster"]] = "Battlemaster",
	[ww_localizedStats["berserking"]] = "Berserking",
	[ww_localizedStats["black magic"]] = "Black Magic",
	[ww_localizedStats["blade ward"]] = "Blade Ward",
	[ww_localizedStats["block"]] = "Block",
	[ww_localizedStats["block value (percent)"]] = "Block Value (Percent)",
	[ww_localizedStats["blood draining"]] = "Blood Draining",
	[ww_localizedStats["chance to increase physical haste"]] = "Chance to Increase Physical Haste",
	[ww_localizedStats["chance to increase spell haste"]] = "Chance to Increase Spell Haste",
	[ww_localizedStats["chance to restore health on hit"]] = "Chance to Restore Health on Hit",
	[ww_localizedStats["chance to restore mana on spellcast"]] = "Chance to Restore Mana on Spellcast",
	[ww_localizedStats["chance to stun target"]] = "Chance to Stun Target",
	[ww_localizedStats["colossus"]] = "Colossus",
	[ww_localizedStats["critical effect (percent)"]] = "Critical Effect (Percent)",
	[ww_localizedStats["critical strike"]] = "Critical Strike",
	[ww_localizedStats["crusader"]] = "Crusader",
	[ww_localizedStats["damage absorption (2% chance)"]] = "Damage Absorption (2% Chance)",
	[ww_localizedStats["damage absorption (5% chance)"]] = "Damage Absorption (5% Chance)",
	[ww_localizedStats["dancing steel"]] = "Dancing Steel",
	[ww_localizedStats["darkglow embroidery"]] = "Darkglow Embroidery",
	[ww_localizedStats["deathfrost"]] = "Deathfrost",
	[ww_localizedStats["demonslaying"]] = "Demonslaying",
	[ww_localizedStats["disarm duration reduction (percent)"]] = "Disarm Duration Reduction (Percent)",
	[ww_localizedStats["dodge"]] = "Dodge",
	[ww_localizedStats["expertise"]] = "Expertise",
	[ww_localizedStats["disorient resist chance (percent)"]] = "Disorient Resist Chance (Percent)",
	[ww_localizedStats["elemental force"]] = "Elemental Force",
	[ww_localizedStats["elemental slayer"]] = "Elemental Slayer",
	[ww_localizedStats["executioner"]] = "Executioner",
	[ww_localizedStats["fear duration reduction (percent)"]] = "Fear Duration Reduction (Percent)",
	[ww_localizedStats["fear resist chance (percent)"]] = "Fear Resist Chance (Percent)",
	[ww_localizedStats["fiery blaze"]] = "Fiery Blaze",
	[ww_localizedStats["fiery weapon"]] = "Fiery Weapon",
	[ww_localizedStats["fire resistance"]] = "Fire Resistance",
	[ww_localizedStats["fire spell damage"]] = "Fire Spell Damage",
	[ww_localizedStats["fishing"]] = "Fishing",
	[ww_localizedStats["frost resistance"]] = "Frost Resistance",
	[ww_localizedStats["frost spell damage"]] = "Frost Spell Damage",
	[ww_localizedStats["ghost iron shield spike"]] = "Ghost Iron Shield Spike",
	[ww_localizedStats["giant slayer"]] = "Giant Slayer",
	[ww_localizedStats["gnomish x-ray scope"]] = "Gnomish X-Ray Scope",
	[ww_localizedStats["goblin glider"]] = "Goblin Glider",
	[ww_localizedStats["haste"]] = "Haste",
	[ww_localizedStats["health"]] = "Health",
	[ww_localizedStats["heartsong"]] = "Heartsong",
	[ww_localizedStats["herbalism"]] = "Herbalism",
	[ww_localizedStats["hit"]] = "Hit",
-- 	[ww_localizedStats["holy resistance"]] = "Holy Resistance",
	[ww_localizedStats["holy spell damage"]] = "Holy Spell Damage",
	[ww_localizedStats["hp5"]] = "HP5",
	[ww_localizedStats["hurricane"]] = "Hurricane",
	[ww_localizedStats["icebreaker"]] = "Icebreaker",
	[ww_localizedStats["icy chill"]] = "Icy Chill",
	[ww_localizedStats["incendiary fireworks launcher"]] = "Incendiary Fireworks Launcher",
	[ww_localizedStats["increased stealth"]] = "Increased Stealth",
	[ww_localizedStats["intellect"]] = "Intellect",
	[ww_localizedStats["item level"]] = "Item Level",
	[ww_localizedStats["jade spirit"]] = "Jade Spirit",
	[ww_localizedStats["landslide"]] = "Landslide",
	[ww_localizedStats["lifestealing"]] = "Lifestealing",
	[ww_localizedStats["lifeward"]] = "Lifeward",
	[ww_localizedStats["lightweave embroidery"]] = "Lightweave Embroidery",
	[ww_localizedStats["lord blastington's scope of doom"]] = "Lord Blastington's Scope of Doom",
	[ww_localizedStats["mana"]] = "Mana",
	[ww_localizedStats["mana (percent)"]] = "Mana (Percent)",
	[ww_localizedStats["mastery"]] = "Mastery",
	[ww_localizedStats["maximum melee weapon damage"]] = "Maximum Melee Weapon Damage",
	[ww_localizedStats["maximum ranged weapon damage"]] = "Maximum Ranged Weapon Damage",
	[ww_localizedStats["melee critical strike"]] = "Melee Critical Strike",
	[ww_localizedStats["melee damage to beasts"]] = "Melee Damage to Beasts",
	[ww_localizedStats["melee damage to elementals"]] = "Melee Damage to Elementals",
	[ww_localizedStats["melee dps"]] = "Melee DPS",
	[ww_localizedStats["melee weapon speed"]] = "Melee Weapon Speed",
	[ww_localizedStats["mending"]] = "Mending",
	[ww_localizedStats["mining"]] = "Mining",
	[ww_localizedStats["minor run speed"]] = "Minor Run Speed",
	[ww_localizedStats["mirror scope"]] = "Mirror Scope",
	[ww_localizedStats["mongoose"]] = "Mongoose",
	[ww_localizedStats["mount speed (percent)"]] = "Mount Speed (Percent)",
	[ww_localizedStats["mp5"]] = "MP5",
	[ww_localizedStats["nature resistance"]] = "Nature Resistance",
	[ww_localizedStats["nature spell damage"]] = "Nature Spell Damage",
	[ww_localizedStats["parry"]] = "Parry",
	[ww_localizedStats["parry (percent)"]] = "Parry (percent)",
	[ww_localizedStats["phase fingers"]] = "Phase Fingers",
	[ww_localizedStats["power torrent"]] = "Power Torrent",
	[ww_localizedStats["prismatic socket"]] = "Prismatic Socket",
	[ww_localizedStats["pvp power"]] = "PvP Power",
	[ww_localizedStats["pvp resilience"]] = "PvP Resilience",
	[ww_localizedStats["pyrium shield spike"]] = "Pyrium Shield Spike",
	[ww_localizedStats["ranged attack power"]] = "Ranged Attack Power",
	[ww_localizedStats["ranged critical strike"]] = "Ranged Critical Strike",
	[ww_localizedStats["ranged dps"]] = "Ranged DPS",
	[ww_localizedStats["ranged haste"]] = "Ranged Haste",
	[ww_localizedStats["ranged hit"]] = "Ranged Hit",
	[ww_localizedStats["ranged weapon speed"]] = "Ranged Weapon Speed",
-- 	[ww_localizedStats["requires level"]] = "Requires Level",
-- 	[ww_localizedStats["resilience"]] = "Resilience",
	[ww_localizedStats["river's song"]] = "River's Song",
	[ww_localizedStats["rune of cinderglacier"]] = "Rune of Cinderglacier",
	[ww_localizedStats["rune of razorice"]] = "Rune of Razorice",
	[ww_localizedStats["rune of the fallen crusader"]] = "Rune of the Fallen Crusader",
	[ww_localizedStats["shadow resistance"]] = "Shadow Resistance",
	[ww_localizedStats["shadow spell damage"]] = "Shadow Spell Damage",
	[ww_localizedStats["silence duration reduction (percent)"]] = "Silence Duration Reduction (Percent)",
	[ww_localizedStats["skinning"]] = "Skinning",
	[ww_localizedStats["snare/root duration reduction (percent)"]] = "Snare/Root Duration Reduction (Percent)",
	[ww_localizedStats["sometimes heal on your crits"]] = "Sometimes Heal on your Crits",
	[ww_localizedStats["spell critical strike"]] = "Spell Critical Strike",
	[ww_localizedStats["spell damage taken reduction (percent)"]] = "Spell Damage Taken Reduction (Percent)",
	[ww_localizedStats["spell hit"]] = "Spell Hit",
	[ww_localizedStats["spell penetration"]] = "Spell Penetration",
	[ww_localizedStats["spell power"]] = "Spell Power",
	[ww_localizedStats["spell reflect (percent)"]] = "Spell Reflect (Percent)",
	[ww_localizedStats["spellsurge"]] = "Spellsurge",
	[ww_localizedStats["spirit"]] = "Spirit",
	[ww_localizedStats["stamina"]] = "Stamina",
	[ww_localizedStats["stamina (percent)"]] = "Stamina (percent)",
	[ww_localizedStats["strength"]] = "Strength",
	[ww_localizedStats["stun duration reduction (percent)"]] = "Stun Duration Reduction (Percent)",
	[ww_localizedStats["stun resist chance (percent)"]] = "Stun Resist Chance (Percent)",
	[ww_localizedStats["swordguard embroidery"]] = "Swordguard Embroidery",
	[ww_localizedStats["synapse springs"]] = "Synapse Springs",
	[ww_localizedStats["threat (percent)"]] = "Threat (Percent)",
	[ww_localizedStats["threat reduction (percent)"]] = "Threat Reduction (Percent)",
	[ww_localizedStats["unholy weapon"]] = "Unholy Weapon",
	[ww_localizedStats["watergliding jets"]] = "Watergliding Jets",
	[ww_localizedStats["weapon damage (percent)"]] = "Weapon Damage (Percent)",
	[ww_localizedStats["weapon damage vs undead (percent)"]] = "Weapon Damage vs Undead (Percent)",
	[ww_localizedStats["windsong"]] = "Windsong",
	[ww_localizedStats["windwalk"]] = "Windwalk",
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
	["Individual Enchants"] = "Individual Enchants",
}
