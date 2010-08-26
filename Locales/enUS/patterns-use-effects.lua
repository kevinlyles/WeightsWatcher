if GetLocale() ~= "enUS" then
	return
end

local UseEffectMatchLines = {
	"^use: ",
}

local UseEffectIgnoreLines = {
	"^use: heal",
	"^use: a strong alcoholic beverage",
	"^use: transform",
	"^use: a sample of ",
	"^use: a typical alcoholic beverage",
	" if they have free room ",
	"^use: a weak alcohol",
	"^use: throw into ",
	"^use: a strangely glowing alcoholic beverage",
	"^use: instantly restores ",
}

local UseEffectUnweightedLines = {
	"^[^%d]+ %(%d[%a%d ]+ cooldown%)$",
	"^use: absorbs ",
	"^use: coats a weapon with poison ",
}

local UseEffectPreprocessLines = {
	{" decreases your ", " decreases "},
	{" all magical resistances ", " all resistances "},
	{" additional ", " "},
	{" maximum health ", " health "},
	{" all attributes ", " all stats "},
}

local UseEffectAffixes = {
	"^use: +",
	"^a powerful ale that +",
	"^increases +",
	"^the target's +",
	"^the player's +",
	"^your +",
	"^restores +",
	"^gives the gift of the wild to all party and raid members, increasing +",
	" +%([14] sec cooldown%)$",
	" +only one scroll effect can be active at a time%.$",
	" +for 5 min%.$",
	" +30 mins?%.$",
	" +1 hour%.$",
	" +for$",
	" +lasts$",
	" +for all party and raid members$",
	"%.$",
}

ww_useEffects = {UseEffectMatchLines, UseEffectIgnoreLines, UseEffectUnweightedLines, UseEffectPreprocessLines, UseEffectAffixes, WeightsWatcher.parseStats, "useEffect"}