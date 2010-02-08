if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

function WeightsWatcher.handleEffects(text, matchLines, ignoreLines, unweightedLines, preprocessLines, affixLines, section)
	local match = false
	for _, pattern in ipairs(matchLines) do
		if string.find(text, pattern) then
			match = true
			break
		end
	end
	if not match then
		return false
	end

	local origText = text

	for _, pattern in ipairs(ignoreLines) do
		if string.find(text, pattern) then
			ww_ignored_lines[text][pattern] = true
			return true
		end
	end
	for _, pattern in ipairs(unweightedLines) do
		if string.find(text, pattern) then
			ww_unweighted_lines[text][pattern] = true
			return true
		end
	end
	for _, regex in ipairs(preprocessLines) do
		local pattern, replacement = unpack(regex)
		if string.find(text, pattern) then
			text = string.gsub(text, pattern, replacement)
		end
	end
	for _, pattern in ipairs(affixLines) do
		if string.find(text, pattern) then
			text = string.gsub(text, pattern, "")
		end
		if text == "" then
			break
		end
	end
	if text == "" then
		ww_ignored_lines[origText] = true
		return true
	end
	local stat = WeightsWatcher.parseStats(text)
	if stat then
		return stat
	end
end

local FoodMatchLines = {
	"^use: restores .* over ",
	"^use: restores .* per seco?n?d? for ",
	"^use: restores .* every seco?n?d? for ",
	"^use: set out a %a+ feast ",
	" drunk",
	" drinker's desire ",
	" smooo+th",
}

local FoodIgnoreLines = {
	" must remain seated while %a+ing%.$",
	" usable only inside %a[%a ]+%.$",
	" %(%d+ min cooldown%)$",
	" nearby party members ",
	"can only be consumed underwater%.",
}

local FoodUnweightedLines = {
	" you will become well fed and can track ",
	" you are likely to grow in size%.",
	" discover the fortune hidden in your meal!$",
}

local FoodPreprocessLines = {
	{" of your (%a+) ", " %1 "},
	{" every seco?n?d? for ", " over "},
	{" per seco?n?d? for ", " over "},
	{", but decreases ", " and decreases "},
}

local FoodAffixes = {
	"^use: +",
	"^set out a great feast that will feed your party! +",
	"^set out a bountiful feast to feed a very hungry party%. +",
	"^restores %d+%%? %a+ over %d+ sec%. *",
	"^restores %d+%%? health and %d*%%? ?mana over %d+ sec%. *",
	"^restores %d+%%? health and %d*%%? ?mana every sec for %d+ sec%. *",
	"^restores %d+ %a+ over %d+ sec, but at a cost%. +",
	"^must remain seated while %a+ing%. +",
	"^if you spend at least %d+ seco?n?d?s? %a+ing you will become \"?well fed\"? and +",
	"^if you spend at least %d+ seco?n?d?s? %a+ing you will become enlightened and +",
	"^if you eat for %d+ seconds will +",
	"^gain +",
	"^also +",
	"^increases? +",
	"^your +",
	"^restores +",
	" +green means it's good!$",
	" +and gets you pretty drunk%.$",
	" +and gets you drunk to boot[%.!]$",
	" +standard alcohol%.$",
	" +strong alcohol%.$",
	" +also packs quite a kick%.%.%.$",
	" +smooo+th%.$",
	" +and increases the drinker's desire to converse%.$",
	" +for %d+ min%.?$",
	" +for %d+ hours?%.$",
}

local EquipStatsMatchLines = {
	"^equip: increases [^t].* by ",
	"^equip: increases your effective stealth level",
	"^equip: increases effective stealth level",
	"^equip: improves [^t].* by ",
	"^equip: restores ",
	"^equip: increases the block value of your shield by ",
	"^equip: [+-]?%d+ all resistances%.$",
	"^equip: [+-]?%d+ armor%.$",
}

local EquipStatsUnweightedLines = {
	" when fighting ",
	" spell power of ",
	" pet[' ]",
	" you kill a target ",
	" against ",
	" while ",
	" periodic damage done by ",
	" you use ",
}

local EquipStatsPreprocessLines = {
	{" effective stealth level%.$", " effective stealth level by 1."},
}

local EquipStatsAffixes = {
	"^equip: +",
	"^increases ",
	"^improves +",
	"^restores +",
	"^your +",
	" +does not work for players above level %d+%.$",
	"%.$",
}

EffectHandlers = {
	{EquipStatsMatchLines, {}, EquipStatsUnweightedLines, EquipStatsPreprocessLines, EquipStatsAffixes, "equipStats"},
	{FoodMatchLines, FoodIgnoreLines, FoodUnweightedLines, FoodPreprocessLines, FoodAffixes, "food"},
}

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

function WeightsWatcher.multipleStatsOneNumber(text, pattern)
	local start, _, value, stat1, stat2 = string.find(text, pattern)
	if start then
		stat1 = WeightsWatcher.singleStat(value .. stat1)
		stat2 = WeightsWatcher.singleStat(value .. stat2)
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

function WeightsWatcher.statNameFirst(text, pattern)
	local start, _, name, value = string.find(text, pattern)
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
	{"^([+-]?%d+ )(%a[%a ]+%a) and (%a[%a ]+%a)$", WeightsWatcher.multipleStatsOneNumber},
	{"^([%a%d][%a%d ]+[%a%d]), ([%a%d][%a%d ]+[%a%d]),? and ([%a%d][%a%d ]+[%a%d])$",
		function(text, pattern)
			local start, _, stat1, stat2, stat3 = string.find(text, pattern)
			if start then
				stat1 = WeightsWatcher.singleStat(stat1)
				stat2 = WeightsWatcher.singleStat(stat2)
				stat3 = WeightsWatcher.singleStat(stat3)
				if stat1 and stat2 and stat3 then
					return stat1 + stat2 + stat3
				else
					ww_unparsed_lines[text][pattern].parsedTo = {stat1, stat2, stat3}
				end
			end
		end},
	-- item 10779
	{"(%a[%a ]+) by (%d+), (%a[%a ]+) by (%d+),? and your normal health regeneration by (%d+)",
		function(text, pattern)
			local start, _, stat1, val1, stat2, val2, val3 = string.find(text, pattern)
			if start then
				local stats = WeightsWatcher.newStatTable()
				stats[stat1] = tonumber(val1)
				stats[stat2] = tonumber(val2)
				stats["hp5"] = tonumber(val3)
				return stats
			end
		end},
	-- currently used only by items 31864 and 31872
	{"^([^,]+) & ([^,]+)$", WeightsWatcher.twoStats},
	-- currently only used by item 28363
	{"^([^,]+), ([^,]+)$", WeightsWatcher.twoStats},
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
		end},
}

SingleStatLines = {
	{"^([+-]?%d+) ([^b]%a+)$", WeightsWatcher.statNumFirst},


	{"^the (block value) of your shield by (%d+)$", WeightsWatcher.statNameFirst},
	{"^shield (block rating) by ([+-]?%d+)$", WeightsWatcher.statNameFirst},
	{"^(all stats) are reduced by (%d+)$",
		function(text, pattern)
			local start, _, name, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[name] = -tonumber(value)})
			end
		end},
	{"^reduces (%a[%a ]+) by (%d+)$",
		function(text, pattern)
			local start, _, name, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[name] = -tonumber(value)})
			end
		end},
	{"^effective stealth level by (%d+)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "increased stealth")
		end},
	-- Tends to eat other stats if not last
	{"^(%a[%a ]+) by (%d+)$", WeightsWatcher.statNameFirst},


	{"^%((%d+%.?%d*) damage per second%)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "dps")
		end
	},
	{"^([+-]?%d+) mana %a+ 5 seco?n?d?s?%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mp5")
		end},
	{"^([+-]?%d+) (%a[%a ]+ rating)$", WeightsWatcher.statNumFirst},
	{"^([+-]?%d+) (%a+ power)$", WeightsWatcher.statNumFirst},
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
	{"^([+-]?%d+) health %a+ 5 seco?n?d?s?%.?$",
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

	{"^chance to resist (%a+) effects by (%d+)%%$",
		function(text, pattern)
			local start, _, effect, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[effect .. " resist chance (percent)"] = tonumber(value)})
			end
		end},

	-- random suffix enchants
	{"^([+-]?%d+) (%a+ spell damage)$", WeightsWatcher.statNumFirst},
	-- Used only for random enchant id 1470
	{"^([+-]?%d+) resist shadow$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "shadow resistance")
		end},
	-- currently only used by random enchant id -55 (of the Nightmare)
	{"^([+-]?%d+) shadow damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "shadow spell damage")
		end},

	-- druid only
	{"^increases attack power by (%d+) in cat, bear, dire bear, and moonkin forms only%.$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "feral attack power")
		end},

	-- meta effects
	{"^(%d+)%% increased armor value from items$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "armor from items (percent)")
		end},
	{"^([+-]?%d+)%% shield block value$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "block value (percent)")
		end},
	{"^chance to increase melee/ranged attack speed$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["chance to increase physical haste"] = 1})
		end},
	{"^chance to increase spell cast speed$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["chance to increase spell haste"] = 1})
		end},
	{"^chance to restore health on hit$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end},
	{"^chance to restore mana on spellcast$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end},
	{"^chance to stun target$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end},
	{"^(%d+)%% increased critical damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "critical damage (percent)")
		end},
	{"^(%d+)%% increased critical healing effect$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "critical healing (percent)")
		end},
	{"^fear duration reduced by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "fear duration reduction (percent)")
		end},
	{"^([+-]?%d+)%% intellect$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "intellect (percent)")
		end},
	{"^([+-]?%d+)%% mana$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mana (percent)")
		end},
	{"^([+-]?%d+) (melee damage)$", WeightsWatcher.statNumFirst},
	{"^minor run speed increase$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["minor run speed"] = 1})
		end},
	{"^silence duration reduced by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "silence duration reduction (percent)")
		end},
	{"^reduces snare/root duration by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "snare/root duration reduction (percent)")
		end},
	{"^sometimes heal on your crits$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end},
	{"^reduce spell damage taken by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "spell damage taken reduction (percent)")
		end},
	{"^(%d+)%% spell reflect$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "spell reflect (percent)")
		end},
	{"^stun duration reduced by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "stun duration reduction (percent)")
		end},
	{"^(%d+)%% stun resistance$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "stun resistance (percent)")
		end},
	{"^(%d+)%% reduced threat$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "threat reduction (percent)")
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
