local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local EquipStatsMatchLines = {
	"^equip: ",
}

local EquipStatsUnweightedLines = {
	"^equip: reduces ",
	" when fighting ",
	" spell power of ",
	" pet[' ]",
	" you kill a target ",
	" against ",
	" while ",
	" periodic damage done by ",
	" you use ",
}

local EquipStatsPreprocessLines = {
	{" effective stealth level%.$", " effective stealth level by 1"},
	{" stealth slightly%.$", " effective stealth level by 1"},
	{" run speed increased slightly%.$", " minor run speed increase"},
	{" %+(%d+%%) stun resistance%.$", " chance to resist stun effects by %1"},
	{" herbalism ", " herbalism by "},
	{" mining ", " mining by "},
	{" skinning ", " skinning by "},
}

local EquipStatsAffixes = {
	"^equip: +",
	"^increases +",
	"^improves +",
	"^restores +",
	"^your +",
	" +does not work for players above level %d+%.$",
	"%.$",
	" +%([%a ]+%)$",
}

ww_equipStats = {EquipStatsMatchLines, {}, EquipStatsUnweightedLines, EquipStatsPreprocessLines, EquipStatsAffixes, WeightsWatcher.parseStats, "equipEffect"}
