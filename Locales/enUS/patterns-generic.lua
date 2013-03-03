local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local GenericMatchLines = {
	"^[^:]+$",
}

local GenericPreprocessLines = {
	{" resist all$", " all resistances"},
	{" block$", " block value"},
	-- random enchant id 1470
	{" resist shadow$", " shadow resistance"},
	{" to all ", " all "},
	{" (%d+%%) stun resistance$", " chance to resist stun effects by %1"},
	{" reduces snare/root duration by ", " snare/root duration reduced by "},
	{" maximum mana$", " mana"},
	-- Items 7348 and 30318
	{" critical strike %(ranged%)", " ranged critical strike"},
	-- items 95346 and 95347
	{", and ", " and "},
}

local GenericAffixes = {
	" +%(reforged from [^)]+%)$", --Keep for reforged items (only happens in game)
}

ww_generic = {GenericMatchLines, {}, {}, GenericPreprocessLines, GenericAffixes, WeightsWatcher.parseStats, "generic"}
