local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local EnchantMatchLines = {
	"^use: permanently ",
	"^use: teaches you how to permanently enchant ",
	"^use: attaches ",
	"^use: enchants? ",
	"^use: add a prismatic socket ",
	"^use: removes the safety mechanism from ",
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
	{"^use: attaches a permanent scope to a bow or gun that increases its damage by ", "increases ranged damage by "},
	-- items 18182 and 29187
	{" resistance to all magic schools ", " all resistances "},
	{" skill by ", " by "},
	-- item 20076
	{" adds to a shoulder slot item increased ", " "},
	{" mounted movement speed ", " mount speed "},
	{" decrease threat from all attacks and spells ", " reduced threat "},
	{" from all attacks and spells ", " caused "},
	{" reduce threat slightly ", " 2%% reduced threat "},
	{" a minor movement speed ", " minor run speed "},
	{" movement speed by 8%%", " minor run speed increase"},
	{" reduce?s?i?n?g? the duration of disarm effects by ", " disarm duration reduced by "},
	{" resilience ", " pvp resilience "},
	{" pvp pvp resilience ", " pvp resilience "},
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
	"^lightweight titanium plating to a shield, +",
	"weapon to increase its +",
	"^spurs to +",
	"^your +",

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

	"^increasing +",

	"^[st]o +",
	"^that +",
	"^it +",

	"^increases? +",
	"^gives? +",
	"^grants? +",

	"^your +",
	"^the +",
	"^both +",
	"^its +",

	" +%(1 sec cooldown%)$",
	" +requires a level %d+ or higher l?e?v?e?l? ?item%.$",
	" +must be level %d+ or lower to gain this benefit%.$",
	" +cannot be used on items level %d+ or higher%.$",
	"[\r\n]+%a+ing [%a ]+ causes [%a ]+ to become soulbound%.$",
	"[\r\n]+can only be attached to [%a ]+ in your inventory%.$",
	" +only the enchanter's rings can be enchanted,? and enchanting a ring will cause it to become soulbound%.$",
	-- TODO: flag these somehow and handle it in scoring
	" +disarm duration reduction does not stack with other similar effects%.",
	" +does not stack with other similar effects%.",
	" +does not stack with other passive movement speed bonuses%.",
	" +does not stack with other enchantments for the selected equipment slot%.",
	-- item 89717
	" +effect is reduced for players below level %d+.$",

	" +with it%.$",

	"^%a+ ?%a* belt buckle onto a belt, adding a +",
	" +to the belt%.$",
	" +to shoulder armor%.$",
	" +t?o[fn]? any? item worn on the %a[%a ,]+ or %a+",
	" +t?on? a %a[%a ,]+ slot item%.?$",
	" +on a pair of gloves",
	"points of +",

	" +to a sha%-touched weapon or armament of the thunder king%.$",

	"%.$",
}

ww_enchants = {EnchantMatchLines, {}, EnchantUnweightedLines, EnchantPreprocessLines, EnchantAffixes, WeightsWatcher.parseStats, "enchant"}
