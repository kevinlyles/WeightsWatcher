if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

Preprocess = {
	{"|r$", ""},
	{"^|c[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]", ""},
	{"Improves", "Increases"},
	{"Increases your", "Increases"},
	{"Increases the target's", "Increases"},
	{"Unique%-Equipped", "Unique"},
	{"^Use: Teaches you how to permanently enchant ", "Use: Permanently enchant "},
	{"(%d+) to (%a)", "%1 %2"},
	{"^Use: .*%.  If you spend at least %d+ seconds eating you will become well fed and gain ([%a%d][%a%d, ]+) for .*%.", "%1"},
}

IgnoredLines = {
	"^Soulbound$",
	"^Binds when equipped$",
	"^Binds when picked up$",
	"^Binds when used$",
	"^Durability %d+ / %d+$",
	"^<.+>$",
	"^\".+\"$",
	"^Use: Restores %d+ %a[%a ]+ over %d+ sec%.  Must remain seated while %a+ing%.",
	"^Use: Restores %d+%% of your %a[%a ]+ per second for %d+ sec%.  Must remain seated while %a+ing%.",
	"^Use: Heals %d+ damage over %d+ sec%.$",
	"^Use: Restores %d+ to %d+ %a+",
	-- Some relics that boost stats for certain abilities only
	"^Equip: Increases the %a[%a ]+ of your %a[%a ]+ by ",
}

MultipleStatLines = {
	{" and ",
		function(text)
			return WeightsWatcher:multipleStats(text)
		end},
	{"%d %- %d",
		function(textL, textR)
			return WeightsWatcher:damageRange(textL, textR)
		end},
}

SingleStatLines = {
	{"^Rune of the Stoneskin Gargoyle",
		function()
			return {"Defense", "25"}
		end},
	{"^Equip: Restores (%d+) mana per 5 sec%.",
		function(text, pattern)
			return WeightsWatcher:singleStatValueOnly(text, pattern, "MP5")
		end},
	{"^Use: Increases mana regeneration by (%d+) mana per 5 seconds for ",
		function(text, pattern)
			return WeightsWatcher:singleStatValueOnly(text, pattern, "MP5")
		end},
	{"^%((%d[%d.]+) damage per second%)$",
		function(text, pattern)
			return WeightsWatcher:singleStatValueOnly(text, pattern, "DPS")
		end},
	{"^%+?(%d+%%?) (%a[%a ]+)",
		function(text, pattern)
			local start, _, value, name = string.find(text, pattern)
			if start then
				return {name, value}
			end
		end},

	"^(%a[%a ]+) (%d+)",
	"^Equip: Increases (%a[%a ]+) by (%d+)%.",
	"^Equip: Increased (%a[%a ]+) %+(%d+)%.",
	"^Use: Increases (%a[%a ]+) by (%d+) for .*%.",
	"^Use: Permanently increase the (%a[%a ]+) of .* by (%d+)%.",
	"^Use: Permanently enchant .* to increase (%a[%a ]+) by (%d+)%.",
	"^Use: When applied to your fishing pole, increases (Fishing) by (%d+) for ",

	-- TODO: figure out how to properly handle these
	"^(Classes): (%a[%a ,]+)",
	"^(Requires %a[%a ]+) %((%d+)%)",
}

DoubleSlotLines = {
	"^Head$",
	"^Shoulder$",
	"^Chest$",
	"^Wrist$",
	"^Hands$",
	"^Waist$",
	"^Legs$",
	"^Feet$",
	"^Main Hand$",
	"^Off Hand$",
	"^One%-Hand$",
	"^Two%-Hand$",
	"^Relic$",
	"^Ranged$",
	"^Thrown$",
	"^Projectile$",
}

SingleSlotLines = {
	"^Unique$",
	"^Neck$",
	"^Back$",
	"^Shirt$",
	"^Tabard$",
	"^Finger$",
	"^Trinket$",
	"^Held In Off%-hand$",
}

function WeightsWatcher:multipleStats(text)
	local stat, stringTable
	local stats = {}

	text = string.gsub(string.gsub(text, ",? and ", "\a"), ", ", "\a")
	stringTable = { strsplit("\a", text) }
	for _, statString in pairs(stringTable) do
		stat = WeightsWatcher:singleStat(statString)
		if stat then
			table.insert(stats, stat)
		end
	end
	if #(stats) > 0 then
		return stats
	end
end

function WeightsWatcher:damageRange(textL, textR)
	local speed
	local stats = {}
	local start, _, added, minVal, maxVal, name = string.find(textL, "^(%+?)(%d+) %- (%d+) (%a* ?Damage)")
	if start then
		if added == "+" then
			added = "Added "
		end
		table.insert(stats, {"Minimum " .. added .. name, minVal})
		table.insert(stats, {"Maximum " .. added .. name, maxVal})
	end
	if textR then
		start, _, speed = string.find(textR, "^Speed (%d[%d.]+)$")
		if start then
			table.insert(stats, {"Speed", speed})
		end
	end
	if #(stats) > 0 then
		return stats
	end
end

function WeightsWatcher:singleStat(text)
	local stat
	for _, regex in pairs(SingleStatLines) do
		if type(regex) == "table" then
			local pattern, func = unpack(regex)
			if string.find(text, pattern) then
				stat = func(text, pattern)
				if stat then
					break
				end
			end
		else
			start, _, name, value = string.find(text, regex)
			if start then
				stat = {name, value}
				break
			end
		end
	end
	return stat
end

function WeightsWatcher:singleStatValueOnly(text, pattern, name)
	local start, _, value = string.find(text, pattern)
	if start then
		return {name, value}
	end
end
