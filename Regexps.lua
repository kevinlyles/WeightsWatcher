Preprocess = {
	{"(.*)|r$", "%1"},
	{"^|c[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9](.*)", "%1"},
}

ProcessedLines = {
	{"^%+?(%d+) (%a[%a ]+)",
		function(text, pattern)
			local start, name, value
			start, _, value, name = string.find(text, pattern)
			if start then
				return {name, value}
			end
		end},
	"^(%a[%a ]+) (%d+)",
	"^Equip: Increases (%a[%a ]+) by (%d+)%.",
	"^Soulbound$",
	"^Durability %d+ / %d+$",
	"^<.+>$",
}
