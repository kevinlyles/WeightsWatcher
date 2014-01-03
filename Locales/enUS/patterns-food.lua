local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local FoodMatchLines = {
	"^use: restores .* over ",
	"^use: restores .* per seco?n?d? for ",
	"^use: restores .* every seco?n?d? for ",
	"^use: set out a %a+ feast ",
	" drunk",
	-- items 21254, 46691, and 46710
	" well fed,? ",
	" drinker's desire ",
	" smooo+th",
}

local FoodIgnoreLines = {
	" must remain seated while %a+ing%.$",
	" %(%d+ min cooldown%)$",
	" nearby party members ",
}

local FoodUnweightedLines = {
	" you will become well fed and can track ",
	" discover the fortune hidden in your meal!$",
}

local FoodPreprocessLines = {
	{" of your (%a+) ", " %1 "},
	{" every seco?n?d? for ", " over "},
	{" per seco?n?d? for ", " over "},
	{" reduces ", " decreases "},
	{", but decreases ", " and decreases "},
	{" all stats are reduced by ", " decreases all stats by "},
}

local FoodAffixes = {
	"^use: +",
	"^set out a great feast that will feed your party! +",
	"^set out a bountiful feast to feed a very hungry party%. +",
	"^restores %d+%%? %a+ over %d+ sec%. *",
	"^restores %d+%%? health and %d*%%? ?mana f?ov?e?r %d+ sec%. *",
	"^restores %d+ %a+ over %d+ sec, but at a cost%. +",
	"^must remain seated while %a+ing%. +",
	"^if you spend at least %d+ seco?n?d?s? %a+ing you will become \"?well fed,?\"? +",
	"^if you spend at least %d+ seco?n?d?s? %a+ing you will become enlightened +",
	"^if you eat for %d+ seconds will +",
	"^and +",
	"^gain +",
	"^also +",
	"^increases? +",
	"^increasing +",
	"^your +",
	"^restores +",
	" +green means it's good!$",
	" +and gets you pretty drunk%.$",
	" +and gets you drunk to boot[%.!]$",
	" +st%a+ alcohol%.$",
	" +also packs quite a kick%.%.%.$",
	" +smooo+th%.$",
	" +and increases the drinker's desire to converse%.$",
	" +for %d+ min%.?$",
	" +for %d+ hours?%.$",
}

ww_food = {FoodMatchLines, FoodIgnoreLines, FoodUnweightedLines, FoodPreprocessLines, FoodAffixes, WeightsWatcher.parseStats, "food"}
