if GetLocale() ~= "enUS" then
	return
end

local EquipStatsMatchLines = {
	"^equip: increases [^t].* by ",
	"^equip: increases your effective stealth level",
	"^equip: increases effective stealth level",
	"^equip: improves [^t].* by ",
	"^equip: restores ",
	"^equip: increases the block value of your shield by ",
	"^equip: [+-]?%d+ all resistances%.$",
	"^equip: [+-]?%d+ armor%.$",
}

local EquipStatsUnweightedLines = {
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
	{" effective stealth level%.$", " effective stealth level by 1."},
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
