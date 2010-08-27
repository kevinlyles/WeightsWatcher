if GetLocale() ~= "enUS" then
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
	{" the block value of your shield ", " block value "},
	{" shield block rating ", " block rating "},
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
}

ww_equipStats = {EquipStatsMatchLines, {}, EquipStatsUnweightedLines, EquipStatsPreprocessLines, EquipStatsAffixes, WeightsWatcher.parseStats, "equipEffect"}
