if GetLocale() ~= "enUS" then
	return
end

local EnchantMatchLines = {
	"^use: permanently ",
	"^use: teaches you how to permanently enchant ",
	"^use: attaches ",
	"^use: enchants? ",
}

local EnchantUnweightedLines = {
	" sometimes ",
	" chance ",
	" often ",
	" damage to ",
	" occasionally ",
}

local EnchantPreprocessLines = {
	{" socket ", " prismatic socket "},
	{" and increase?i?n?g? ", " and "},
	{" and your ", " and "},
	{" melee weapon to do (%d+) additional points? of damage", " %1 melee damage"},
	{" armor value ", " armor "},
	{" a slight movement speed increase", " a minor movement speed increase"},
	{"^use: attaches a permanent scope to a bow or gun that increases its damage by ", "increases ranged weapon damage by "},
	{" resistance to (%a+) by ", " %1 resistance by "},
	{" resistance to all schools of magic by ", " all resistances by "},
	{" to all ", " all "},
}

local EnchantAffixes = {
	"^use: +",
	"^teaches you how to +",
	"^permanently +",
	"^enchants? +",
	"^attache?s? +",
	"^an? +",
	"^chain to your weapon, +",
	"^counterweight to a two%-handed sword, mace, axe or polearm increasing the wielder's +",
	"^permanent scope to a bow or gun +",
	"weapon to increase its +",
	"^spurs to your +",

	"^boots +",
	"^bracers? +",
	"^cloak +",
	"^gloves +",
	"^shield +",
	"^piece of +",
	"^chest armor +",
	"^two%-handed +",
	"^melee weapon +",
	"^weapon +",
	"^staff +",
	"^ring +",

	"^%a+ l?e?g? ?armor onto pants +",
	"^embroiders spellthread into pants, +",
	"lightweight titanium plating to a shield, +",

	"^increasing +",

	"^[st]o +",
	"^that +",
	"^they +",
	"^it +",

	"^increases? +",
	"^provides? +",
	"^adds? +",
	"^gives? +",
	"^grants? +",
	"^regenerates? +",
	"^restores? +",

	"^your +",
	"^the +",
	"^[bw]earer's +",
	" of the [bw]earer",
	"^both +",
	"^its +",

	" +%(1 sec cooldown%)$",
	" +only use?able on items level %d+ and above%.$",
	" +requires a level %d+ or higher l?e?v?e?l? ?item%.$",
	" +must be level %d+ or lower to gain this benefit%.$",
	" +wearer must be level %d+ or higher%.$",
	"[\r\n]+%a+ing [%a ]+ causes [%a ]+ to become soulbound%.$",
	"[\r\n]+can only be attached to [%a ]+ in your inventory%.$",
	" +only the enchanter's rings can be enchanted,? and enchanting a ring will cause it to become soulbound%.$",
	-- TODO: flag this somehow and handle it in scoring
	" +does not stack with other similar effects%.",

	"^eternal belt buckle onto a belt, adding a +",
	" +to the belt%.$",
	" +t?of? an item worn on the %a[%a ,]+ or %a+",
	" +on a pair of gloves",
	"additional points? of +",
	"^mana regeneration by +",

	"%.$",
}

ww_enchants = {EnchantMatchLines, {}, EnchantUnweightedLines, EnchantPreprocessLines, EnchantAffixes, WeightsWatcher.parseStats, "enchant"}
