if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

function WeightsWatcher.multipleStats(text)
	local stat, stringTable
	local stats = WeightsWatcher.newStatTable()
	local origText = text

	start, _, value = string.find(text, " and %a[%a ]+ by (%d+)%.")
	if start then
		text = string.gsub(text, ".*[iI]ncrease[sd]? ", "")
		text = string.gsub(text, " by (%d+)%..*", " %1")
		text = string.gsub(text, ",? and ", " " .. value .. "\a")
		text = string.gsub(text, ", ", " " .. value .. "\a")
	else
		text = string.gsub(string.gsub(text, ",? and ", "\a"), ", ", "\a")
	end
	stringTable = { strsplit("\a", text) }
	for _, statString in ipairs(stringTable) do
		stat = WeightsWatcher.singleStat(statString)
		if stat then
			stats = stats + stat
		else
			ww_unparsed_lines[origText] = true
		end
	end
	-- Don't return an empty table
	for _, _ in pairs (stats) do
		return stats
	end
end

function WeightsWatcher.damageRange(textL, textR)
	local speed
	local stats = WeightsWatcher.newStatTable()
	local start, _, added, minVal, maxVal, name = string.find(textL, "^(%+?)(%d+) %- (%d+) (%a* ?damage)$")
	if start then
		if added == "+" then
			added = "added "
		end
		stats["minimum " .. added .. name] = tonumber(minVal)
		stats["maximum " .. added .. name] = tonumber(maxVal)
	end
	if textR then
		start, _, speed = string.find(textR, "^speed (%d+%.?%d*)$")
		if start then
			stats["speed"] = tonumber(speed)
		end
	end
	-- Don't return an empty table
	for _, _ in pairs (stats) do
		return stats
	end
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

function WeightsWatcher.newStatTable(tbl)
	return setmetatable(tbl or {}, ww_normalStatsMetatable)
end

Preprocess = {
	["|r$"] = "",
	["^|c[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]"] = "",
	[" +$"] = "",
	["improves"] = "increases",
	["(increases?) your"] = "%1",
	["increases the target's"] = "increases",
	["unique%-equipped"] = "unique",
	["^use: teaches you how to permanently enchant "] = "use: permanently enchant ",
	["(%d+) to (%a)"] = "%1 %2",
	["^use: .*%.  if you spend at least %d+ seconds eating you will become well fed and gain ([%a%d][%a%d, ]+) for .*%."] = "%1",
	["cat, bear, dire bear, and moonkin forms"] = "cat/bear/dire bear/moonkin forms",
	["maximum health"] = "health",
	["mana every 5 seconds"] = "mp5",
	["the block value of your shield"] = "block value",
	["shield block rating"] = "block rating",
	["block$"] = "block value",
}

ignoredInvalidStats = {
	"item level",
	"requires level",
}

IgnoredLines = {
	"^durability %d+ / %d+$",
	"^<.+>$",
	"^\".+\"$",
	"^you may trade this item with players that were also eligible to loot this item for the next ",
	"^$",
	"^requires %a[%a ]+ %- neutral$",
	"^requires %a[%a ]+ %- friendly$",
	"^requires %a[%a ]+ %- honored$",
	"^requires %a[%a ]+ %- revered$",
	"^requires %a[%a ]+ %- exalted$",
	"^use: teaches you how to ",
}

TempIgnoredLines = {
	"^use: restores %d+ %a[%a ]+ over %d+ sec%.  must remain seated while %a+ing%.",
	"^use: restores %d+%% of your %a[%a ]+ per second for %d+ sec%.  must remain seated while %a+ing%.",
	"^use: heals %d+ damage over %d+ sec%.$",
	"^use: restores %d+ to %d+ %a+",
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
	"^(blue) socket$",
	"^(red) socket$",
	"^(yellow) socket$",
	"^(meta) socket$",
}

MultipleStatLines = {
	{" and ",
		function(text)
			return WeightsWatcher.multipleStats(text)
		end},
	{"%d %- %d",
		function(textL, textR)
			return WeightsWatcher.damageRange(textL, textR)
		end},
}

SingleStatLines = {
	{"^equip: restores (%d+) mana per 5 sec%.",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mp5")
		end},
	{"^use: increases mana regeneration by (%d+) mana per 5 seconds for ",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mp5")
		end},
	{"^%((%d[%d.]+) damage per second%)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "dps")
		end},
	{"^adds (%d[%d.]+) damage per second$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "dps")
		end},
	{"^increases attack power by (%d+) in cat/bear/dire bear/moonkin forms only%.",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "feral ap")
		end},
	-- The 5 is to catch MP5 and HP5 values
	{"^%+?(%d+%%?) (%a[%a ]+5?)",
		function(text, pattern)
			local start, _, value, name = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[name] = tonumber(value)})
			end
		end},
	{"^use: permanently enchants? .* to give %+?(%d+) (%a[%a ]+).",
		function(text, pattern)
			local start, _, value, name = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[name] = tonumber(value)})
			end
		end},

	"^(%a[%a ]+) (%d+)",
	"^equip: increases (%a[%a ]+) by (%d+)%.",
	"^equip: increased (%a[%a ]+) %+(%d+)%.",
	"^use: increases (%a[%a ]+) by (%d+) for .*%.",
	"^use: permanently increase the (%a[%a ]+) of .* by (%d+)%.",
	"^use: permanently enchants? .* to increase (%a[%a ]+) by (%d+)%.",
	"^use: when applied to your fishing pole, increases (fishing) by (%d+) for ",

	-- TODO: figure out how to properly handle these
	"^(classes): (%a[%a ,]+)",
	"^(requires %a[%a ]+) %((%d+)%)",
}

ItemInfoLines = {
	"^unique",
	"^binds ",
	"^soulbound$",
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
	"^main hand$",
	"^off hand$",
	"^one%-hand$",
	"^two%-hand$",
	"^relic$",
	"^ranged$",
	"^thrown$",
	"^projectile$",
}

SingleSlotLines = {
	"^neck$",
	"^back$",
	"^shirt$",
	"^tabard$",
	"^finger$",
	"^trinket$",
	"^held in off%-hand$",
}
