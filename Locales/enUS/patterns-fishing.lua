local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local FishingMatchLines = {
	" fishing ",
}

local FishingPreProcessLines = {
	{" skill increased ", " "},
	{" for 10 min%. %(10 min cooldown%)$", ""},
	{" skill by ", " by "},
}

local FishingAffixes = {
	"^use: +",
	"^equip: +",
	"^replaces the fishing line on your fishing pole with %a[%a ]+%a, +",
	"^permanently +",
	"^increasing +",
	"^when applied to your fishing pole, increases +",
	"^makes you slightly tipsy and increases your skill in +",
	"^attach a lure to your equipped fishing pole, increasing +",
	"%.$",
	"utes$",
	" +[35] min",
	" +1[05] min$",
	" +1 hour$",
	" +for$",
}

ww_fishing = {FishingMatchLines, {}, {}, FishingPreProcessLines, FishingAffixes, WeightsWatcher.parseStats, "fishing"}
