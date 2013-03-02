local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local UseEffectMatchLines = {
	"^use: ",
}

local UseEffectIgnoreLines = {
	"^use: heal",
	"^use: a %a* ?%a* ?alcohol",
	"^use: transform",
	"^use: a sample of ",
	" if they have free room ",
	"^use: throw into ",
	"^use: instantly restores ",
	"^use: reduces ",
	"^use: combines? ",
	"^use: inflicts? ",
	"^use: summons? ",
	"^use: turns? ",
	"^use: unlocks? ",
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
}

local UseEffectAffixes = {
	"^use: +",
	-- item 4952
	"^a powerful ale that +",
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
