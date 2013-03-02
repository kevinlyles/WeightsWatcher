local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local GenericMatchLines = {
	"^[^:]+$",
}

local GenericPreprocessLines = {
	-- items 31864 and 31872
	{" & ", " and "},
	-- items 95346 and 95347
	{", and ", " and "},
	-- item 28363
	{"^([^,]+), ([^,]+)$", "%1 and %2"},
	{" resist all$", " all resistances"},
	{" block$", " block value"},
	-- random enchant id 1470
	{" resist shadow$", " shadow resistance"},
	-- random enchant id -55
-- 	{"^%+(%d+) shadow damage$", "%1 shadow spell damage"},
	{" to all ", " all "},
	{" (%d+%%) stun resistance$", " chance to resist stun effects by %1"},
	{" reduces snare/root duration by ", " snare/root duration reduced by "},
	{" maximum mana$", " mana"},
	-- Items 7348 and 30318
	{" critical strike %(ranged%)", " ranged critical strike"},
}

local GenericAffixes = {
	"^adds +",
	" +%(reforged from [^)]+%)$",
}

ww_generic = {GenericMatchLines, {}, {}, GenericPreprocessLines, GenericAffixes, WeightsWatcher.parseStats, "generic"}
