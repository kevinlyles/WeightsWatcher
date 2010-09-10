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
	" against ",
}

local EnchantPreprocessLines = {
	{" increase movement speed slightly ", " minor run speed increase "},
	{" socket ", " prismatic socket "},
	{" and increase?i?n?g? ", " and "},
	{" and your ", " and "},
	-- item 23547
	{" and restore ", " and "},
	{" melee weapon to do (%d+) additional points? of damage", " %1 melee damage"},
	{" armor value ", " armor "},
	{" additional ", " "},
	{" a slight movement speed increase", " minor run speed increase"},
	{"^use: attaches a permanent scope to a bow or gun that increases its damage by ", "increases ranged damage by "},
	{" resistance to (%a+) by ", " %1 resistance by "},
	{" resistance to all schools of magic by ", " all resistances by "},
	-- items 18182 and 29187
	{" resistance to all magic schools ", " all resistances "},
	{" to all ", " all "},
	{" skill by ", " by "},
	-- item 19782
	{" shield block ", " block "},
	{" resist ", " resistance "},
	-- item 23548
	{" attacker power ", " attack power "},
	-- item 20076
	{" adds to a shoulder slot item increased ", " "},
	{" resilience by ", " resilience rating by "},
	{" mounted movement speed ", " mount speed "},
	{" stealth slightly ", " effective stealth level by 1 "},
	{" stealth%.$", " effective stealth level by 1"},
	{" decrease threat from all attacks and spells ", " reduced threat "},
	{" from all attacks and spells ", " caused "},
	{" reduce threat slightly ", " 2%% reduced threat "},
	{" a minor movement speed ", " minor run speed "},
	{" reducing the duration of disarm effects by ", " disarm duration reduced by "},
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
	"^chest +",
	"^armor +",
	"^two%-handed +",
	"^melee weapon +",
	"^weapon +",
	"^staff +",
	"^ring +",
	"^shoulder slot item +",

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
	" +cannot be used on items level 300 or higher%.$",
	"[\r\n]+%a+ing [%a ]+ causes [%a ]+ to become soulbound%.$",
	"[\r\n]+can only be attached to [%a ]+ in your inventory%.$",
	" +only the enchanter's rings can be enchanted,? and enchanting a ring will cause it to become soulbound%.$",
	" +fur lining requires at least %d+ skill in leatherworking to remain active%.$",
	"[\r\n]+can only be used on the leatherworker's bracers, and doing so will cause them to become soulbound%.$",
	-- TODO: flag this somehow and handle it in scoring
	" +does not stack with other similar effects%.",
	" +does not stack with other enchantments for the selected equipment slot%.",

	"^eternal belt buckle onto a belt, adding a +",
	" +to the belt%.$",
	" +to shoulder armor%.$",
	" +t?o[fn]? any? item worn on the %a[%a ,]+ or %a+",
	" +t?on? a %a[%a ,]+ slot item%.?$",
	" +on a pair of gloves",
	"points of +",
	"^mana regeneration by +",

	"%.$",
}

ww_enchants = {EnchantMatchLines, {}, EnchantUnweightedLines, EnchantPreprocessLines, EnchantAffixes, WeightsWatcher.parseStats, "enchant"}
