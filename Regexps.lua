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

function WeightsWatcher.newStatTable(tbl)
	return setmetatable(tbl or {}, ww_normalStatsMetatable)
end

Preprocess = {
	{"|r$", ""},
	{"^|c[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]", ""},
	{" +$", ""},
}

ignoredInvalidStats = {
	"item level",
	"requires level",
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
}

SingleStatLines = {
}

ItemInfoLines = {
	"^binds ",
	"^unique",
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
