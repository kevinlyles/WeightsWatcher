local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

ww_EffectHandlers = {
	ww_equipStats,
	ww_sockets,
	ww_generic,
	ww_socketBonuses,
	ww_food,
	ww_enchant_items,
	ww_enchants,
	ww_elixirs,
	ww_fishing,
	ww_cooldownUseEffects,
	ww_useEffects,
	ww_stackingEquipEffects,
}

function WeightsWatcher.damageRange(textL, textR)
	local stats
	local start, _, minimum, maximum = string.find(textL, "^%+?(%d+%.?%d*) %- (%d+%.?%d*) %a* ?damage$")
	if start then
		stats = WeightsWatcher.newStatTable()
		maximum = tonumber(maximum)
		stats["average melee weapon damage"] = (minimum + maximum) / 2
		stats["maximum melee weapon damage"] = maximum
	else
		local start, _, damage = string.find(textL, "^(%d+) %a* ?damage$")
		if start then
			stats = WeightsWatcher.newStatTable()
			damage = tonumber(damage)
			stats["average melee weapon damage"] = damage
			stats["maximum melee weapon damage"] = damage
		end
	end
	if stats and textR then
		local start, _, speed = string.find(textR, "^speed (%d+%.?%d*)$")
		if start then
			stats["melee weapon speed"] = tonumber(speed)
		end
	end
	return stats
end

function WeightsWatcher.convertToSeconds(duration)
	local start, _, hours = string.find(duration, "^(%d+) ho?u?rs?$")
	if start then
		return hours * 3600
	end
	local start, _, minutes, seconds = string.find(duration, "^(%d+) minu?t?e?s? (%d+) seco?n?d?s?$")
	if start then
		return minutes * 60 + seconds
	end
	local start, _, minutes = string.find(duration, "^(%d+) minu?t?e?s?$")
	if start then
		return minutes * 60
	end
	local start, _, seconds = string.find(duration, "^(%d+) seco?n?d?s?$")
	if start then
		return tonumber(seconds)
	end
end

ww_Preprocess = {
	{"|c%x%x%x%x%x%x%x%x([^|]+)|r", "%1"},
	{"(%d+),(%d+)", "%1%2"},
	{" +$", ""},
}

ww_ignoredInvalidStats = {
	"requires level",
	"all stats",
	"all resistances",
}

ww_IgnoredLines = {
	"^$",
	"^upgrade level:",
	"^requires ", -- Reputation and materials requirements
	"^  [^ ]",
	"^%a[%a' -]+ %(%d/%d%)$",
	"^classes: ",
	"^\n",
	"^\".+\"$",
	"^races: ",
	"^duration: ",
	"^conjured item$",
	"^use: right click to ",
	"^this item begins a quest$",
	"^already known$",
	"^prime glyph$",
	"^major glyph$",
	"^minor glyph$",
	"^cogwheel$",
	"^<.*>$",
	"^mount$",
	"^ammo$",
	"^projectile$",
	"^relic$",
	"^thrown$",
	"^crystal of fear$",

	-- TODO: add these for ALL professions
	"^cooking ingredient$",
	"^crafting material$",
	"^locked$",
	"^prospectable$",

	-- Zone names
	"^ahn'kahet: the old kingdom$",
	"^ahn'qiraj$",
	"^alterac valley$",
	"^assault on zan'vess$",
	"^black temple$",
	"^blackrock depths$",
	"^blade's edge mountains$",
	"^coilfang: serpentshrine cavern$",
	"^crypt of forgotten kings$",
	"^dire maul$",
	"^drak'tharon keep$",
	"^ebon hold$",
	"^gilneas city$",
	"^grizzly hills$",
	"^icecrown citadel$",
	"^icecrown$",
	"^isle of conquest$",
	"^isle of thunder$",
	"^karazhan$",
	"^kezan$",
	"^kun%-lai summit$",
	"^molten front$",
	"^pursuing the black harvest$",
	"^ruins of ahn'qiraj$",
	"^shadowmoon valley",
	"^sholazar basin$",
	"^strand of the ancients$",
	"^stratholme$",
	"^tempest keep$",
	"^the battle for mount hyjal$",
	"^the black morass$",
	"^the culling of stratholme$",
	"^the escape from durnholde$",
	"^the oculus$",
	"^the wandering isle$",
	"^theramore's fall ?%(?h?%)?$",
	"^townlong steppes$",
	"^twilight highlands$",
	"^unga ingoo$",
	"^utgarde pinnacle$",
	"^violet hold$",
	"^wintergrasp$",
	"^zul'aman$",
	"^zul'drak$",
	"^zul'gurub$",

	--Promoted from temp ignore list
	"^%d+ slot ",
	-- Profession items
	"^use: teaches you how to [a-oq-z]%a+ ",
	"^use: teaches you how to p[a-df-z]%a+ ",
}

ww_TempIgnoredLines = {
	"^use: restores %d+ to %d+ %a+ over ",
	"^use: restores %d+ to %d+ %a+ and ",
	"^use: restores %d+ to %d+ %a+ every .* for ",
--	"^use: restores %d+ to %d+ %a+.[^0-9]*$",
	"^use: teaches .* %(rank %d+%)%.$",
	"^use: heals %d+ damage over %d+ sec%.$",
}

ww_UnweightedLines = {
	"^%(%d%) set: ",
	"^set: ", -- In-game only?
	-- Use effects that have a cooldown
	"cooldown",
	"chance t?on? ",
	"^use: .*enchants? ",
	"^equip: you",
	"^equip: causes your ",
	" at the cost of ",
}

ww_MultipleStatLines = {
	{"^([^,]+) and ([^,]+)$", WeightsWatcher.twoStats, {"cooldownUseEffect", "elixir", "enchant", "food", "generic", "useEffect"}},
	{"^([+-]?%d+ )(%a[%a ]+%a) and (%a[%a ]+%a)$", WeightsWatcher.multipleStatsOneNumber, {"elixir", "food"}},
	{"^([^,]+), ([^,]+),? and ([^,]+)$",
		function(text, pattern, section)
			local start, _, stat1, stat2, stat3 = string.find(text, pattern)
			if start then
				stat1 = WeightsWatcher.singleStat(stat1, section)
				stat2 = WeightsWatcher.singleStat(stat2, section)
				stat3 = WeightsWatcher.singleStat(stat3, section)
				if stat1 and stat2 and stat3 then
					return stat1.stats + stat2.stats + stat3.stats
				end
			end
		end,
		{"elixir", "enchant", "food", "useEffect"},
	},
	{"^(%a+) and (%a+) spell power by (%d+)$",
		function(text, pattern)
			local start, _, stat1, stat2, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[stat1 .. " spell damage"] = value
				stats[stat2 .. " spell damage"] = value
				return stats
			end
		end,
		{"enchant"},
	},
	{"^(%a[%a ]+) and (%a[%a ]+) by (%d+)$",
		function(text, pattern, section)
			local start, _, stat1, stat2, value = string.find(text, pattern)
			if start then
				stat1 = WeightsWatcher.singleStat(stat1 .. " by " .. value, section)
				stat2 = WeightsWatcher.singleStat(stat2 .. " by " .. value, section)
				if stat1 and stat2 then
					return stat1.stats + stat2.stats
				else
					ww_unparsed_lines[text][pattern].parsedTo = {stat1, stat2}
				end
			end
		end,
		{"elixir", "enchant"},
	},
	{"^(%a+), (%a+),? and (%a+) spell power by (%d+)$",
		function(text, pattern)
			local start, _, stat1, stat2, stat3, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[stat1 .. " spell damage"] = value
				stats[stat2 .. " spell damage"] = value
				stats[stat3 .. " spell damage"] = value
				return stats
			end
		end,
		{"elixir"},
	},
	{"^spell damage caused by (%a+), (%a+),? and (%a+) spells by up to (%d+)$",
		function(text, pattern)
			local start, _, stat1, stat2, stat3, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[stat1 .. " spell damage"] = value
				stats[stat2 .. " spell damage"] = value
				stats[stat3 .. " spell damage"] = value
				return stats
			end
		end,
		{"elixir"},
	},
	{"^resistance to (%a+), (%a+), (%a+), (%a+),? and (%a+) spells by (%d+)$",
		function(text, pattern)
			local start, _, school1, school2, school3, school4, school5, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[school1 .. " resistance"] = value
				stats[school2 .. " resistance"] = value
				stats[school3 .. " resistance"] = value
				stats[school4 .. " resistance"] = value
				stats[school5 .. " resistance"] = value
				return stats
			end
		end,
		{"cooldownUseEffect"},
	},
	{"^(%a+), (%a+), and (%a+) by (%d+)$",
		function(text, pattern)
			local start, _, stat1, stat2, stat3, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[stat1] = value
				stats[stat2] = value
				stats[stat3] = value
				return stats
			end
		end,
		{"enchant"},
	},
	-- item 38960
	{"^(%a+), (%a+), and (%a+) skills by (%d+)$",
		function(text, pattern)
			local start, _, stat1, stat2, stat3, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[stat1] = value
				stats[stat2] = value
				stats[stat3] = value
				return stats
			end
		end,
		{"enchant"},
	},
	{"^chance to resist (%a+) and (%a+) effects by (%d+)%%$",
		function(text, pattern)
			local start, _, effect1, effect2, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[effect1 .. " resist chance (percent)"] = value
				stats[effect2 .. " resist chance (percent)"] = value
				return stats
			end
		end,
		{"equipEffect"},
	},
}

ww_SingleStatLines = {
	{"^(item level) (%d+)$", WeightsWatcher.statNameFirst, {"generic"}},
	{"^([+-]?%d+) (armor)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "generic", "useEffect"}},
	{"^([+-]?%d+) (stamina)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "food", "generic", "socketBonus", "useEffect"}},
	{"^([+-]?%d+) (intellect)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (spell power)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (agility)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (strength)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (hit)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (critical strike)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (mastery)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (expertise)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (dodge)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (parry)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (haste)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (pvp power)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (pvp resilience)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^%(?(%d+%.?%d*) damage per second%)?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "melee dps")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) (attack power)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (spirit)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) mana [ep]v?ery? 5 seco?n?d?s?%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mp5")
		end,
		{"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect"},
	},
	-- druid only
	{"^increases attack power by (%d+) in cat, bear, dire bear, and moonkin forms only%.$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "feral attack power")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) (%a+ resistances?)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "useEffect"}},
	{"^([+-]?%d+) (block value)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "enchant", "equipEffect", "generic", "socketBonus"}},
	-- random suffix enchants
	{"^([+-]?%d+) (%a+ spell damage)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "generic"}},
	{"^([+-]?%d+) health [ep]v?ery? 5 seco?n?d?s?%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "hp5")
		end,
		{"cooldownUseEffect", "elixir", "equipEffect", "food", "generic", "useEffect"},
	},
	-- item 20130
	{"^([+-]?%d+) to ([+-]?%d+) health [ep]v?ery? 5 seco?n?d?s?%.?$",
		function(text, pattern)
			local start, _, minVal, maxVal = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({["hp5"] = tonumber((minVal + maxVal) / 2)})
			end
		end,
		{"cooldownUseEffect"},
	},
	{"^minor run speed increase$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["minor run speed"] = 1})
		end,
		{"enchant", "equipEffect", "generic"},
	},
	{"^([+-]?%d+) (health)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "useEffect"}},
	{"^(%d+) to (%d+) (health)$", WeightsWatcher.statRangeFirst, {"cooldownUseEffect", "elixir", "enchant", "useEffect"}},
	{"^(fishing) by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant", "fishing"}},
	{"^([+-]?%d+) (all stats)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "food", "generic", "useEffect"}},
	{"^(%a+ spell )power by ([+-]?%d+)$",
		function(text, pattern)
			local start, _, name, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[name .. "damage"] = tonumber(value)})
			end
		end,
		{"elixir", "enchant"},
	},
	{"^deals (%d+) to (%d+) damage every time you block$",
		function(text, pattern)
			local start, _, minimum, maximum = text:find(pattern)
			if start then
				return WeightsWatcher.newStatTable({["average damage dealt on block"] = (minimum + maximum) / 2})
			end
		end,
		{"enchant", "equipEffect"},
	},
	{"^deals (%d+%.?%d*) damage every time you block$",
		function(text, pattern)
			local start, _, value = text:find(pattern)
			if start then
				return WeightsWatcher.newStatTable({["average damage dealt on block"] = tonumber(value)})
			end
		end,
		{"enchant", "equipEffect"},
	},
	{"^([+-]?%d+) (mana)$", WeightsWatcher.statNumFirst, {"enchant", "elixir"}},
	{"^([+-]?%d+) ranged damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "average ranged weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "maximum ranged weapon damage")
		end,
		{"enchant"},
	},
	{"^([+-]?%d+) (ranged %a+ ?%a+)$", WeightsWatcher.statNumFirst, {"enchant", "equipEffect", "generic"}},
	{"^effective stealth level by (%d+)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "increased stealth")
		end,
		{"enchant", "equipEffect"},
	},
	{"^decreases? (%a[%a ]+) by (%d+)$",
		function(text, pattern, section)
			local start, _, name, value = string.find(text, pattern)
			if start then
				local stats = WeightsWatcher.parseStats("-" .. value .. " " .. name, section)
				if stats then
					return stats.stats
				end
			end
		end,
		{"elixir", "food", "useEffect"},
	},
	{"^mount speed by ([+-]?%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mount speed (percent)")
		end,
		{"enchant", "equipEffect"},
	},
	{"^(herbalism) by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant", "equipEffect"}},
	{"^(mining) by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant", "equipEffect"}},
	{"^(skinning) by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant", "equipEffect"}},
	{"^threat caused by (%d+)%%$",
		function(text, pattern)
			local start, _, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({["threat (percent)"] = value})
			end
		end,
		{"enchant"},
	},
	{"^prismatic socket$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"enchant"},
	},

	{"^chance to resist (%a+) effects by (%d+)%%$",
		function(text, pattern)
			local start, _, effect, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[effect .. " resist chance (percent)"] = tonumber(value)})
			end
		end,
		{"equipEffect", "generic"},
	},

	-- Tends to eat other stats if not last
	{"^(%a+ ?%a+ ?%a* ?%a+) by ([+-]?%d+%%?)$",
		function(text, pattern, section)
			local start, _, name, value = string.find(text, pattern)
			if start then
				local stats = WeightsWatcher.parseStats(value .. " " .. name, section)
				if stats then
					return stats.stats
				end
			end
		end,
		{"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "stackingEquipEffect", "useEffect"},
	},

	-- meta/enchant effects
	{"^(%d+)%% increased armor value from items$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "armor from items (percent)")
		end,
		{"generic"},
	},
	{"^([+-]?%d+)%% shield block value$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "block value (percent)")
		end,
		{"generic"},
	},
	{"^chance to increase melee/ranged attack speed$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["chance to increase physical haste"] = 1})
		end,
		{"generic"},
	},
	{"^chance to increase spell cast speed$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["chance to increase spell haste"] = 1})
		end,
		{"generic"},
	},
	{"^chance to restore health on hit$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^chance to restore mana on spellcast$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^chance to stun target$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^(%d+)%% increased critical effect$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "critical effect (percent)")
		end,
		{"generic"},
	},
	{"^(%a+/?%a* duration )reduced by (%d+)%%$",
		function(text, pattern)
			local start, _, name, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[name .. "reduction (percent)"] = tonumber(value)})
			end
		end,
		{"enchant", "equipEffect", "generic"},
	},
	{"^([+-]?%d+)%% intellect$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "intellect (percent)")
		end,
		{"generic"},
	},
	{"^([+-]?%d+)%% mana$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mana (percent)")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) melee damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "average melee weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "maximum melee weapon damage")
		end,
		{"enchant", "generic"},
	},
	{"^([+-]?%d+) physical damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "average melee weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "maximum melee weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "average ranged weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "maximum ranged weapon damage")
		end,
		{"enchant"},
	},
	{"^sometimes heal on your crits$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^reduce spell damage taken by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "spell damage taken reduction (percent)")
		end,
		{"generic"},
	},
	{"^(%d+)%% spell reflect$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "spell reflect (percent)")
		end,
		{"elixir", "generic"},
	},
	{"^(%d+)%% reduced threat$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "threat reduction (percent)")
		end,
		{"enchant", "generic"},
	},
	{"^has a (%d+%% chance) per hit of giving you (%d+) damage absorption$",
		function(text, pattern)
			local start, _, chance, damage = text:find(pattern)
			if start then
				return WeightsWatcher.newStatTable({["damage absorption (" .. chance .. ")"] = tonumber(damage)})
			end
		end,
		{"enchant"},
	},
	{"^([+-]?%d+) (%a+ damage to %a+)$", WeightsWatcher.statNumFirst, {"enchant"}},
	-- item 38981
	{"^([+-]?%d+) (attack power against undead)$", WeightsWatcher.statNumFirst, {"enchant"}},
	{"^chance on melee or ranged hit to gain capacitance$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^chance on spell damage to gain 30%% spell haste$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^chance on beneficial spell to make your spells cost no mana for 4 sec%.$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^chance on being hit to gain 20%% reduction to physical damage taken$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
}

ww_ItemInfoLines = {
	"^binds ",
	"^unique",
	"^soulbound$",
	"^heroic",
	"^quest item$",
	"^season ",
	"^raid finder$",
	"^thunderforged$",
	"^elite$",
}

ww_DoubleSlotLines = {
	"^head$",
	"^shoulder$",
	"^chest$",
	"^wrist$",
	"^hands$",
	"^waist$",
	"^legs$",
	"^feet$",
	"^two%-hand$",
	"^one%-hand$",
	"^main hand$",
	"^off hand$",
	"^ranged$",
}

ww_SingleSlotLines = {
	"^finger$",
	"^back$",
	"^neck$",
	"^trinket$",
	"^held in off%-hand$",
	"^shirt$",
	"^tabard$",
}
