if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

function WeightsWatcher.twoStats(text, pattern)
	local start, _, stat1, stat2 = string.find(text, pattern)
	if start then
		stat1 = WeightsWatcher.singleStat(stat1)
		stat2 = WeightsWatcher.singleStat(stat2)
		if stat1 and stat2 then
			return stat1 + stat2
		end
	end
end

function WeightsWatcher.damageRange(textL, textR)
	local stats
	local start, _, minimum, maximum = string.find(textL, "^(%d+) %- (%d+) damage$")
	if start then
		stats = WeightsWatcher.newStatTable()
		stats["minimum weapon damage"] = tonumber(minimum)
		stats["maximum weapon damage"] = tonumber(maximum)
	else
		local start, _, minimum, maximum, school = string.find(textL, "^(%d+) %- (%d+) (%a+) damage$")
		if start then
			stats = WeightsWatcher.newStatTable()
			stats["minimum wand " .. school .. " damage"] = tonumber(minimum)
			stats["maximum wand " .. school .. " damage"] = tonumber(maximum)
		else
			local start, _, minimum, maximum, school = string.find(textL, "^%+(%d+) %- (%d+) (%a+) damage$")
			if start then
				stats = WeightsWatcher.newStatTable()
				stats["minimum added " .. school .. " damage"] = tonumber(minimum)
				stats["maximum added " .. school .. " damage"] = tonumber(maximum)
			else
				local start, _, damage = string.find(textL, "^(%d+) damage$")
				if start then
					stats = WeightsWatcher.newStatTable()
					stats["minimum weapon damage"] = tonumber(damage)
					stats["maximum weapon damage"] = tonumber(damage)
				end
			end
		end
	end
	if stats and textR then
		local start, _, speed = string.find(textR, "^speed (%d+%.?%d*)$")
		if start then
			stats["speed"] = tonumber(speed)
		end
	end
	return stats
end

function WeightsWatcher.singleStat(text)
	for _, regex in ipairs(SingleStatLines) do
		if type(regex) == "table" then
			local pattern, func = unpack(regex)
			if string.find(text, pattern) then
				local stat = func(text, pattern)
				if stat then
					return stat
				end
			end
		else
			local start, _, name, value = string.find(text, regex)
			if start then
				return WeightsWatcher.newStatTable({[name] = tonumber(value)})
			end
		end
	end
end

function WeightsWatcher.singleStatValueOnly(text, pattern, name)
	local start, _, value = string.find(text, pattern)
	if start then
		return WeightsWatcher.newStatTable({[name] = tonumber(value)})
	end
end

function WeightsWatcher.statNumFirst(text, pattern)
	local start, _, value, name = string.find(text, pattern)
	if start then
		return WeightsWatcher.newStatTable({[name] = tonumber(value)})
	end
end

function WeightsWatcher.newStatTable(tbl)
	return setmetatable(tbl or {}, ww_normalStatsMetatable)
end

Preprocess = {
	{"|c[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]([^|]+)|r", "%1"},
	{" +$", ""},
}

ignoredInvalidStats = {
	"item level",
	"requires level",
	"all stats",
	"all resistances",
}

IgnoredLines = {
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
	-- Zone names
	"^alterac valley$",
	"^black temple$",
	"^blackrock depths$",
	"^blade's edge mountains$",
	"^isle of conquest$",
	"^karazhan$",
	"^shadowmoon valley",
	"^strand of the ancients$",
	"^tempest keep$",
	"^the battle for mount hyjal$",
	"^the black morass$",
	"^the oculus$",
	"^wintergrasp$",
	"^zul'aman$",
}

TempIgnoredLines = {
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

UnweightedLines = {
	"^%(%d%) set: ",
	"^set: ", -- In-game only?
	-- Some relics that boost stats for certain abilities only
	"^equip: increases the %a[%a ]+ of your %a[%a ]+ by ",
	-- Use effects that have a cooldown
	"cooldown",
	"chance t?on? ",
	"^use: .*enchants? ",
	"^equip: you",
	"^use: coats a weapon with poison ",
	"^equip: causes your ",
}

socketBonus = "^socket bonus: (.*)"

SocketLines = {
	"^(red) socket$",
	"^(yellow) socket$",
	"^(blue) socket$",
	"^(meta) socket$",
}

MultipleStatLines = {
	{"^([^,]+) and ([^,]+)$", WeightsWatcher.twoStats},
	-- currently used only by items 31864 and 31872
	{"^([^,]+) & ([^,]+)$", WeightsWatcher.twoStats},
	-- currently only used by item 28363
	{"^([^,]+), ([^,]+)$", WeightsWatcher.twoStats},
}

SingleStatLines = {
	{"^([+-]?%d+) (armor)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (agility)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (intellect)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (spirit)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (stamina)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (strength)$", WeightsWatcher.statNumFirst},
	{"^%((%d+%.?%d*) damage per second%)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "dps")
		end
	},
	-- Normal item stats
	{"^([+-]?%d+) mana every 5 seconds%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mp5")
		end},
	-- Random suffix enchants and socket bonuses
	{"^([+-]?%d+) mana every 5 sec%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mp5")
		end},
	{"^([+-]?%d+) mana per 5 seconds%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mp5")
		end},
	-- Socket bonuses
	{"^([+-]?%d+) mana per 5 sec%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mp5")
		end},
	{"^([+-]?%d+) (%a+ %a+ rating)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (%a+ rating)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (spell power)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (attack power)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (%a+ resistance)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (all resistances)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) resist all$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "all resistances")
		end},
	{"^([+-]?%d+) resistance to all schools of magic$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "all resistances")
		end},
	{"^(%d+) block$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "block value")
		end},
	{"^([+-]?%d+) (block value)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) health every 5 seconds%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "hp5")
		end},
	-- random suffix enchants
	{"^([+-]?%d+) health every 5 sec%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "hp5")
		end},
-- 	{"^([+-]?%d+) health per 5 seconds%.?$",
-- 		function(text, pattern)
-- 			return WeightsWatcher.singleStatValueOnly(text, pattern, "hp5")
-- 		end},
	-- Random suffix enchants
	{"^([+-]?%d+) health per 5 sec%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "hp5")
		end},
	{"^([+-]?%d+) (spell penetration)$", WeightsWatcher.statNumFirst},
	{"^adds (%d[%d%.]*) damage per second$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "dps")
		end},
	{"^([+-]?%d+) (ranged attack power)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (all stats)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) to (all stats)$", WeightsWatcher.statNumFirst},

	-- random suffix enchants
	{"^([+-]?%d+) (%a+ spell damage)$", WeightsWatcher.statNumFirst},
	-- Used only for random enchant id 1470
	{"^([+-]?%d+) resist shadow$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "shadow resistance")
		end},

	-- druid only
	{"^increases attack power by (%d+) in cat, bear, dire bear, and moonkin forms only%.$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "feral attack power")
		end},
}

ItemInfoLines = {
	"^binds ",
	"^unique",
	"^soulbound$",
	"^heroic$",
	"^quest item$",
}

DoubleSlotLines = {
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

SingleSlotLines = {
	"^finger$",
	"^back$",
	"^neck$",
	"^trinket$",
	"^held in off%-hand$",
	"^shirt$",
	"^tabard$",
}
