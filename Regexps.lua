Preprocess = {
	{"(.*)|r$", "%1"},
	{"^|c[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9](.*)", "%1"},
	{"Improves", "Increases"},
	{"Increases your", "Increases"},
	{"Increases the target's", "Increases"},
	{"Unique%-Equipped", "Unique"},
	{"^Use: Teaches you how to permanently enchant ", "Use: Permanently enchant "},
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
	"^Use: Heals %d+ damage over %d+ sec%.$",
}

SingleStatLines = {
	{"^Rune of the Stoneskin Gargoyle",
		function()
			return {"Defense", "25"}
		end},
	{"Restores (%d+) mana per 5 sec%.",
		function(text, pattern)
			local start, value
			start, _, value = string.find(text, pattern)
			if start then
				return {"MP5", value}
			end
		end},
	{"^%((%d[%d.]+) damage per second%)$",
		function(text, pattern)
			local start, value
			start, _, value = string.find(text, pattern)
			if start then
				return {"DPS", value}
			end
		end},
	{"^%+?(%d+) (%a[%a ]+)",
		function(text, pattern)
			local start, _, value, name = string.find(text, pattern)
			if start then
				return {name, value}
			end
		end},

	"^(%a[%a ]+) (%d+)",
	"^Equip: Increases (%a[%a ]+) by (%d+)%.",
	"^Use: Increases (%a[%a ]+) by (%d+) for .*%.",
	"^Use: Permanently increase the (%a[%a ]+) of .* by (%d+)%..*",
	"^Use: Permanently enchant .* to increase (%a[%a ]+) by (%d+)%..*",
	"^Use: When applied to your fishing pole, increases (Fishing) by (%d+) for ",
	{"^Use: Increases mana regeneration by (%d+) mana per 5 seconds for ",
		function(text, pattern)
			local start, value
			start, _, value = string.find(text, pattern)
			if start then
				return {"MP5", value}
			end
		end},
	"^Use: Permanently increase the (%a[%a ]+) of .* by (%d+)%.",
	"^Use: Permanently enchant .* to increase (%a[%a ]+) by (%d+)%.",
}

ProcessedLines = {
	-- TODO: split this into min and max damage
	{"(%d+) %- (%d+) Damage",
		function(text, pattern)
			local start, val1, val2
			start, _, val1, val2 = string.find(text, pattern)
			if start then
				return {"Damage", val1 .. "-" .. val2}
			end
		end},

	"^(Classes): (%a[%a ,]+)",
	"^(Requires %a[%a ]+) %((%d+)%)",

	-- TODO: figure out how to properly handle this and other multi-stat lines
	"^Use: .*%.  If you spend at least %d+ seconds eating you will become well fed and gain ([%a%d][%a%d, ]+) for .*%.",

	"^(Unique)$",
	"^(Head)$",
	"^(Neck)$",
	"^(Shoulder)$",
	"^(Back)$",
	"^(Chest)$",
	"^(Shirt)$",
	"^(Tabard)$",
	"^(Wrist)$",
	"^(Hands)$",
	"^(Waist)$",
	"^(Legs)$",
	"^(Feet)$",
	"^(Finger)$",
	"^(Trinket)$",
	"^(Main Hand)$",
	"^(Off%-hand)$",
	"^Held In (Off%-hand)$",
	"^(Relic)$",
	"^(Ranged)$",
	"^(Two Hand)$",
}
