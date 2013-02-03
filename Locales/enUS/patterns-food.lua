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
	{" reduces ", " decreases "},
	{", but decreases ", " and decreases "},
	{" all stats are reduced by ", " decreases all stats by "},
	{" resistance to all schools of magic ", " all resistances "},
}

local FoodAffixes = {
	"^use: +",
	"^set out a great feast that will feed your party! +",
	"^set out a bountiful feast to feed a very hungry party%. +",
	"^restores %d+%%? %a+ over %d+ sec%. *",
	"^restores %d+%%? health and %d*%%? ?mana over %d+ sec%. *",
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

ww_food = {FoodMatchLines, FoodIgnoreLines, FoodUnweightedLines, FoodPreprocessLines, FoodAffixes, WeightsWatcher.parseStats, "food"}
