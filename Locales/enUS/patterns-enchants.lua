local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local EnchantMatchLines = {
	"^use: permanently ",
	"^use: teaches you how to permanently enchant ",
	"^use: attaches ",
	"^use: enchants? ",
	"^use: removes the safety mechanism from ",
	"^use: add a prismatic socket ",
}

local EnchantUnweightedLines = {
	" skilled engineer ",
	" engineering skill ",
	" lasts for ",
}

local EnchantPreprocessLines = {
	{" increase movement speed slightly ", " minor run speed increase "},
	{" socket ", " prismatic socket "},
	{" prismatic prismatic socket ", " prismatic socket "},
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
	{" mounted movement speed ", " mount speed "},
	{" stealth slightly ", " effective stealth level by 1 "},
	{" stealth%.$", " effective stealth level by 1"},
	{" decrease threat from all attacks and spells ", " reduced threat "},
	{" from all attacks and spells ", " caused "},
	{" reduce threat slightly ", " 2%% reduced threat "},
	{" a minor movement speed ", " minor run speed "},
	{" movement speed by 8%%", " minor run speed increase"},
	{" reducing the duration of disarm effects by ", " disarm duration reduced by "},
	-- item 22023
	{" to add (%d+) to ", " +%1 "},
	-- item 23530
	{" (deals %d+)-(%d+ damage) ", " %1 to %2 "},
	-- item 55055
	{" each time you block ", " every time you block "},
	-- item 6042
	{" (attaches an iron spike to your shield that deals) damage ", " %1 8 to 12 damage "},
	-- item 7967
	{" (attaches a mithril spike to your shield that deals) damage ", " %1 16 to 20 damage "},
	-- item 12645
	{" (attaches a thorium spike to your shield that deals) damage ", " %1 20 to 30 damage "},
	-- items 38813 and 38814
	{" a melee weapon to increase damage to ", " melee damage to "},
}

local EnchantAffixes = {
	"^use: +",
	"^removes the safety mechanism from a bow or gun, +",
	"^teaches you how to +",
	"^permanently +",
	"^enchants? +",
	"^attache?s? +",
	"^adds? +",
	"^an? +",
	"^[%a ]+ to your shield that +",
	"^chain to your weapon, +",
	"^counterweight to a two%-handed sword, mace, axe or polearm increasing the wielder's +",
	"^permanent scope to a bow or gun +",
	"weapon to increase its +",
	"^spurs to your +",

	"^pair of +",
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
	"^or held item +",
	"^or off%-hand item +",

	"^%a+ l?e?g? ?armor +",
	"^onto pants +",
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
-- 	"^regenerates? +",
-- 	"^restores? +",

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
	" +cannot be used on items level %d+ or higher%.$",
	"[\r\n]+%a+ing [%a ]+ causes [%a ]+ to become soulbound%.$",
	"[\r\n]+can only be attached to [%a ]+ in your inventory%.$",
	" +only the enchanter's rings can be enchanted,? and enchanting a ring will cause it to become soulbound%.$",
	" +fur lining requires at least %d+ skill in leatherworking to remain active%.$",
	"[\r\n]+can only be used on the leatherworker's bracers, and doing so will cause them to become soulbound%.$",
	-- TODO: flag these somehow and handle it in scoring
	" +does not stack with other similar effects%.",
	" +does not stack with other passive movement speed bonuses%.",
	" +does not stack with other enchantments for the selected equipment slot%.",
	"[\r\n]+wearer must be level %d+ or higher to receive the benefits of this armor kit%.$",

	" +with it%.$",

	"^%a+ ?%a* belt buckle onto a belt, adding a +",
	" +to the belt%.$",
	" +to shoulder armor%.$",
	" +t?o[fn]? any? item worn on the %a[%a ,]+ or %a+",
	" +t?on? a %a[%a ,]+ slot item%.?$",
	" +on a pair of gloves",
	"points of +",
	"^mana regeneration by +",

	" +to a sha%-touched weapon or armament of the thunder king%.$",

	"%.$",
}

ww_enchants = {EnchantMatchLines, {}, EnchantUnweightedLines, EnchantPreprocessLines, EnchantAffixes, WeightsWatcher.parseStats, "enchant"}
