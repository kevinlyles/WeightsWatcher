if GetLocale() ~= "enUS" then
	return
end

local ElixirMatchLines = {
	" battle elixir%.",
	" guardian elixir%.",
}

local ElixirUnweightedLines = {
	" walk across water ",
	" of your spell targets ",
}

local ElixirPreprocessLines = {
	{" and your ", " and "},
	{" and restores ", " and "},
	{" and grants ", " and "},
	-- Should be obsolete (item 40212 appears to have been updated)
	--{" critical ", " critical strike "},
	{" maximum health ", " health "},
	{" the chance that the player will reflect hostile spells cast on them by (%d+)%% for %d+ hrs%. +will automatically reflect the first offensive spell cast against the user", " %1%% spell reflect"},
	{" is increased by ", " by "},
	{" resistance to all schools of magic ", " all resistances "},
	{" resistance to magic ", " all resistances "},
}

local ElixirAffixes = {
	"^use: +",
	"^increases +",
	"^you grow larger and +",
	"^your +",
	"^the player's +",
	"^the target's +",
	"^maximum +",
	"^mana regeneration by +",
	"^regenerate +",
	" +%(1 sec cooldown%)$",
	" +%([12] min cooldown%)$",
	" +this effect persists through death, but only works [io]n [%a ',:]+%.$",
	" +this effect only works [io]n [%a ',:]+%.$",
	"[\r\n]+only active [io]n [%a ',:]+%.$",
	" +effect persists through death%.$",
	" +this$",
	" +you can only have the effect of one flask at a time%.$",
	" +counts as both a battle and guardian elixir%.$",
	" +battle elixir%.$",
	" +guardian elixir%.$",
	" +this effect counts as a$",
	" +%d+ ho?u?rs?%.$",
	" +%d+ minu?t?e?s?%.$",
	" +for$",
	" +lasts$",
	" +effect$",
	" +when consumed%.$",
	" +and size$",
	" +to match your new size%.$",
	"%.$",
}

ww_elixirs = {ElixirMatchLines, {}, ElixirUnweightedLines, ElixirPreprocessLines, ElixirAffixes, WeightsWatcher.parseStats, "elixir"}
