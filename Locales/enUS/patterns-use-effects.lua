local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local UseEffectMatchLines = {
	"^use: ",
}

local UseEffectIgnoreLines = {
	"^use: combines? ",
	"^use: summons? ",
	"^use: a %a* ?%a* ?alcohol",
	"^use: unlocks? ",
	"^use: heal",
	"^use: turns? ",
	"^use: inflicts? ",
	"^use: transform",
	"^use: throw into ",
	"^use: a sample of ",
	"^use: reduces ",
	"^use: instantly restores ",
	" if they have free room ",
}

local UseEffectUnweightedLines = {
	"^[^%d]+ %(%d[%a%d ]+ cooldown%)$",
	"^use: absorbs ",
	"^use: coats a weapon with poison ",
}

local UseEffectPreprocessLines = {
	{" additional ", " "},
	{" decreases your ", " decreases "},
	{" maximum health ", " health "},
}

local UseEffectAffixes = {
	"^use: +",
	-- item 4952
	"^a powerful beverage that +",
	"^increases +",
	"^the player's +",
	"^your +",
	"^restores +",
	" +for 5 min%.$",
	" +30 mins?%.$",
	" +1 hour%.$",
	" +for$",
	" +lasts$",
	" +and attracts those wearing %a+%.$",
	" +for all party and raid members$",
	"%.$",
}

ww_useEffects = {UseEffectMatchLines, UseEffectIgnoreLines, UseEffectUnweightedLines, UseEffectPreprocessLines, UseEffectAffixes, WeightsWatcher.parseStats, "useEffect"}
