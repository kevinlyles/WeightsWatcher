if GetLocale() ~= "enUS" then
	return
end

ww_EffectHandlers = {
	ww_equipStats,
	ww_sockets,
	ww_generic,
	ww_socketBonuses,
	ww_food,
	ww_enchants,
	ww_elixirs,
	ww_fishing,
	ww_useEffects,
	ww_cooldownUseEffects,
	ww_stackingEquipEffects,
}

function WeightsWatcher.damageRange(textL, textR)
	local stats
	local start, _, minimum, maximum = string.find(textL, "^%+?(%d+) %- (%d+) %a* ?damage$")
	if start then
		stats = WeightsWatcher.newStatTable()
		maximum = tonumber(maximum)
		stats["average melee weapon damage"] = (minimum + maximum) / 2
		stats["maximum melee weapon damage"] = maximum
	else
		local start, _, damage = string.find(textL, "^(%d+) damage$")
		if start then
			stats = WeightsWatcher.newStatTable()
			damage = tonumber(damage)
			stats["average melee weapon damage"] = damage
			stats["maximum melee weapon damage"] = damage
		else
			-- item 7730
			local start, _, damage = string.find(textL, "^%+(%d+) frost damage$")
			if start then
				stats = WeightsWatcher.newStatTable()
				damage = tonumber(damage)
				stats["average melee weapon damage"] = damage
				stats["maximum melee weapon damage"] = damage
			end
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
	{"|c[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]([^|]+)|r", "%1"},
	{" +$", ""},
}

ww_ignoredInvalidStats = {
	"item level",
	"requires level",
	"all stats",
	"all resistances",
}

ww_IgnoredLines = {
	"^$",
	-- Reputation and materials requirements
	"^requires ",
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
	"^major glyph$",
	"^minor glyph$",
	-- Zone names
	"^alterac valley$",
	"^black temple$",
	"^blackrock depths$",
	"^blade's edge mountains$",
	"^dire maul$",
	"^drak'tharon keep$",
	"^grizzly hills$",
	"^icecrown citadel$",
	"^isle of conquest$",
	"^karazhan$",
	"^shadowmoon valley",
	"^sholazar basin$",
	"^strand of the ancients$",
	"^tempest keep$",
	"^the battle for mount hyjal$",
	"^the black morass$",
	"^the culling of stratholme$",
	"^the escape from durnholde$",
	"^the oculus$",
	"^utgarde pinnacle$",
	"^wintergrasp$",
	"^zul'aman$",
	"^zul'drak$",
}

ww_TempIgnoredLines = {
	"^item level %d+$",
	"^use: restores %d+ to %d+ %a+",
	"^use: teaches .* %(rank %d+%)%.$",
	"^%d+ slot ",
	"^use: heals %d+ damage over %d+ sec%.$",
	-- Profession patterns
	"^use: teaches you how to make ",
	"^use: teaches you how to cut ",
	"^use: teaches you how to craft ",
	"^use: teaches you how to sew ",
	"^use: teaches you how to cook ",
	"^use: teaches you how to forge ",
	"^use: teaches you how to transmute ",
	"^use: teaches you how to create ",
	"^use: teaches you how to bake ",
	"^use: teaches you how to be ",
	"^use: teaches you how to summon ",
	"^use: teaches you how to brew ",
	"^use: teaches you how to inscribe ",
	"^use: teaches you how to ride ",
	"^use: teaches you how to burn ",
	"^use: teaches you how to deep fry ",
	"^use: teaches you how to purify ",
	"^use: teaches you how to shatter ",
	"^use: teaches you how to smelt ",
	"^use: teaches you how to turn ",
}

ww_UnweightedLines = {
	"^%(%d%) set: ",
	"^set: ", -- In-game only?
	-- Some relics that boost stats for certain abilities only
	"^equip: increases the %a[%a ]+ of your %a[%a ]+ by ",
	-- Use effects that have a cooldown
	"cooldown",
	"chance t?on? ",
	"^use: .*enchants? ",
	"^equip: you",
	"^equip: causes your ",
}

ww_MultipleStatLines = {
	{"^([^,]+) and ([^,]+)$", WeightsWatcher.twoStats, {"cooldownUseEffect", "elixir", "enchant", "food", "generic", "useEffect"}},
	{"^([+-]?%d+ )(%a[%a ]+%a) and (%a[%a ]+%a)$", WeightsWatcher.multipleStatsOneNumber, {"elixir", "food"}},
	{"^([%a%d][%a%d ]+[%a%d]), ([%a%d][%a%d ]+[%a%d]),? and ([%a%d][%a%d ]+[%a%d])$",
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
	{"^(%a[%a ]+ rating )and (%a[%a ]+ rating )by( %d+)$",
		function(text, pattern, section)
			local start, _, stat1, stat2, value = string.find(text, pattern)
			if start then
				stat1 = WeightsWatcher.singleStat(stat1 .. "by" .. value, section)
				stat2 = WeightsWatcher.singleStat(stat2 .. "by" .. value, section)
				if stat1 and stat2 then
					return stat1.stats + stat2.stats
				else
					ww_unparsed_lines[text][pattern].parsedTo = {stat1, stat2}
				end
			end
		end,
		{"enchant"},
	},
	{"^(%a[%a ]+ )and (%a[%a ]+ )rating by( %d+)$",
		function(text, pattern, section)
			local start, _, stat1, stat2, value = string.find(text, pattern)
			if start then
				stat1 = WeightsWatcher.singleStat(stat1 .. "rating by" .. value, section)
				stat2 = WeightsWatcher.singleStat(stat2 .. "rating by" .. value, section)
				if stat1 and stat2 then
					return stat1.stats + stat2.stats
				else
					ww_unparsed_lines[text][pattern].parsedTo = {stat1, stat2}
				end
			end
		end,
		{"enchant"},
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
	{"^([+-]?%d+) mana and health every 5 seco?n?d?s?$",
		function(text, pattern)
			local start, _, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats["mp5"] = value
				stats["hp5"] = value
				return stats
			end
		end,
		{"enchant"},
	},
	{"^([+-]?%d+) health and mana every 5 seco?n?d?s?$",
		function(text, pattern)
			local start, _, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats["mp5"] = value
				stats["hp5"] = value
				return stats
			end
		end,
		{"enchant"},
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
	-- currently used only by items 31864 and 31872
	{"^([^,]+) & ([^,]+)$", WeightsWatcher.twoStats, {"generic"}},
	-- currently only used by item 28363
	{"^([^,]+), ([^,]+)$", WeightsWatcher.twoStats, {"generic"}},
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
}

ww_SingleStatLines = {
	{"^([+-]?%d+) (armor)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "generic", "useEffect"}},
	{"^([+-]?%d+) (agility)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "food", "generic", "socketBonus", "useEffect"}},
	{"^([+-]?%d+) (intellect)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "food", "generic", "socketBonus", "useEffect"}},
	{"^([+-]?%d+) (spirit)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (stamina)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "food", "generic", "socketBonus", "useEffect"}},
	{"^([+-]?%d+) (strength)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "food", "generic", "socketBonus", "useEffect"}},
	{"^([+-]?%d+) (health)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant"}},
	{"^([+-]?%d+) (mana)$", WeightsWatcher.statNumFirst, {"enchant"}},

	{"^(%a+ spell )power by ([+-]?%d+)$",
		function(text, pattern)
			local start, _, name, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[name .. "damage"] = tonumber(value)})
			end
		end,
		{"elixir", "enchant"},
	},
	{"^mount speed by ([+-]?%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mount speed (percent)")
		end,
		{"enchant", "equipEffect"},
	},
	{"^effective stealth level by (%d+)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "increased stealth")
		end,
		{"enchant", "equipEffect"},
	},
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

	-- profession skills
	{"^(fishing) by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant", "fishing", "generic", "useEffect"}},
	{"^(herbalism) by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant", "equipEffect"}},
	{"^(mining) by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant", "equipEffect"}},
	{"^(skinning) by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant", "equipEffect"}},

	{"^reduces? (%a[%a ]+) by (%d+)$",
		function(text, pattern, section)
			local start, _, name, value = string.find(text, pattern)
			if start then
				local stats = WeightsWatcher.parseStats("-" .. value .. " " .. name, section)
				if stats then
					return stats.stats
				end
			end
		end,
		{"useEffect"},
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
	-- Tends to eat other stats if not last
	-- TODO: split this into a separate function instead of recursing?
	{"^(%a+ ?%a+ ?%a+ ?%a+) by ([+-]?%d+%%?)$",
		function(text, pattern, section)
			local start, _, name, value = string.find(text, pattern)
			if start then
				local stats = parseStats(value .. " " .. name, section)
				if stats then
					return stats.stats
				end
			end
		end,
		{"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "useEffect"},
	},

	{"^reduce threat slightly$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["threat reduction (percent)"] = 2})
		end,
		{"generic"},
	},

	{"^%((%d+%.?%d*) damage per second%)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "melee dps")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) mana [ep]v?ery? 5 seco?n?d?s?%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mp5")
		end,
		{"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect"},
	},
	{"^([+-]?%d+) (%a[%a ]+ rating)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "useEffect"}},
	{"^([+-]?%d+) (attack power)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (spell power)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (%a+ resistances?)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "equipEffect", "food", "generic", "useEffect"}},
	{"^([+-]?%d+) resist all$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "all resistances")
		end,
		{"generic"},
	},
	{"^(%d+) block$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "block value")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) (block value)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "enchant", "equipEffect", "socketBonus"}},
	{"^([+-]?%d+) health [ep]v?ery? 5 seco?n?d?s?%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "hp5")
		end,
		{"cooldownUseEffect", "elixir", "equipEffect", "food", "generic", "useEffect"},
	},
	{"^([+-]?%d+) (spell penetration)$", WeightsWatcher.statNumFirst, {"enchant", "equipEffect", "generic"}},
	{"^adds (%d[%d%.]*) damage per second$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "melee dps")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) (ranged attack power)$", WeightsWatcher.statNumFirst, {"equipEffect", "generic"}},
	{"^([+-]?%d+) (all stats)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "elixir", "enchant", "food", "generic", "useEffect"}},
	{"^([+-]?%d+) to (all stats)$", WeightsWatcher.statNumFirst, {"generic"}},
	{"^([+-]?%d+) ranged damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "average ranged weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "maximum ranged weapon damage")
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
		{"equipEffect"},
	},

	-- random suffix enchants
	{"^([+-]?%d+) (%a+ spell damage)$", WeightsWatcher.statNumFirst, {"cooldownUseEffect", "generic"}},
	-- Used only for random enchant id 1470
	{"^([+-]?%d+) resist shadow$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "shadow resistance")
		end,
		{"generic"},
	},
	-- currently only used by random enchant id -55 (of the Nightmare)
	{"^([+-]?%d+) shadow damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "shadow spell damage")
		end,
		{"generic"},
	},

	-- druid only
	{"^increases attack power by (%d+) in cat, bear, dire bear, and moonkin forms only%.$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "feral attack power")
		end,
		{"generic"},
	},

	-- meta effects
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
	{"^(%d+)%% increased critical damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "critical damage (percent)")
		end,
		{"generic"},
	},
	{"^(%d+)%% increased critical healing effect$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "critical healing (percent)")
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
		{"enchant"},
	},
	{"^fear duration reduced by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "fear duration reduction (percent)")
		end,
		{"generic"},
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
	{"^minor run speed increase$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["minor run speed"] = 1})
		end,
		{"enchant", "equipEffect", "generic"},
	},
	{"^silence duration reduced by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "silence duration reduction (percent)")
		end,
		{"generic"},
	},
	{"^reduces snare/root duration by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "snare/root duration reduction (percent)")
		end,
		{"generic"},
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
	{"^stun duration reduced by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "stun duration reduction (percent)")
		end,
		{"generic"},
	},
	{"^(%d+)%% stun resistance$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "stun resist chance (percent)")
		end,
		{"generic"},
	},
	{"^(%d+)%% reduced threat$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "threat reduction (percent)")
		end,
		{"enchant", "generic"},
	},
}

ww_ItemInfoLines = {
	"^binds ",
	"^unique",
	"^soulbound$",
	"^heroic$",
	"^quest item$",
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
	"^relic$",
	"^thrown$",
	"^projectile$",
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
