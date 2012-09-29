if GetLocale() ~= "enUS" then
	return
end

local PreprocessLines = {
	{" +%(1 sec cooldown%)$", ""},
	{"^use: attaches a ghost iron spike to your shield that sometimes deals 210 to 350 damage when you block with it%.[\r\n]+attaching a ghost iron spike to your shield causes it to become soulbound%.$", "ghost iron shield spike"},
	{"^use: attaches a permanent scope to a bow or gun that sometimes increases ranged attack power by 800 for 10 sec when dealing damage with ranged attacks%.[\r\n]+attaching this scope to a ranged weapon causes it to become soulbound%.$", "gnomish x-ray scope"},
	{"^use: attaches a pyrium spike to your shield that sometimes deals 210 to 350 damage when you block with it%.[\r\n]+attaching a pyrium spike to your shield causes it to become soulbound%.$", "pyrium shield spike"},
	{"^use: enchants a weapon to have a 15%% chance to inflict 9 to 13 fire damage to all enemies within 3 yards%.$", "fiery blaze"},
	{"^use: permanently attaches a mirrored scope to a ranged weapon, sometimes increasi?n?g?e?s? critical strike by 900 for 10 sec when dealing damage with ranged attacks%.[\r\n]+attaching this scope to a ranged weapon causes it to become soulbound%.$", "mirror scope"},
	{"^use: permanently attaches lord blastington's special scope to a ranged weapon, sometimes increasing agility by 1,?800 for 10 sec when dealing damage with ranged attacks%.[\r\n]+attaching this scope to a ranged weapon causes it to become soulbound%.$", "lord blastington's scope of doom"},
	{"^use: permanently enchant a melee weapon to cause your damaging spells and melee weapon hits to occasionally inflict additional frost damage and slow the target%. +requires a level 60 or higher item%.[\r\n\\n]+slow effect does not work on targets 73 or higher%.$", "deathfrost"},
	{"^use: permanently enchant a melee weapon to cause your harmful spells to sometimes increase haste by 250%. +requires a level 60 or higher item%.$", "black magic"},
	{"^use: permanently enchant a melee weapon to have a chance of reducing movement speed and doing additional damage against giants%. +requires a level 60 or higher item%.$", "giant slayer"},
	{"^use: permanently enchant a melee weapon to have a chance of stunning and doing additional damage against demons%.$", "demonslaying"},
	{"^use: permanently enchant a melee weapon to make your spells sometimes restore 100 mana to nearby party members%. +requires a level 35 or higher item%.$", "spellsurge"},
	{"^use: permanently enchant a melee weapon to occasionally grant you 120 critical strike%. +only one instance of this effect can be active at a time%. +requires a level 60 or higher item%.$", "executioner"},
	{"^use: permanently enchant a melee weapon to occasionally heal nearby party members for 180 to 300 when attacking in melee%. +requires a level 35 or higher item%.$", "battlemaster"},
	{"^use: permanently enchant a melee weapon to occasionally increase agility by 120 and haste by 30%. +requires a level 35 or higher item%.$", "mongoose"},
	{"^use: permanently enchant a melee weapon to often chill the target, reducing their movement and attack speed%. +has a reduced effect for players above level 60%.$", "icy chill"},
	{"^use: permanently enchant a melee weapon to often heal for 75 to 125 and increase strength by 100 for 15 sec%. when attacking in melee%. has a reduced effect for players above level 60%.$", "crusader"},
	{"^use: permanently enchant a melee weapon to often inflict a curse on the target, inflicting shadow damage and reducing their melee damage%.$", "unholy weapon"},
	{"^use: permanently enchant a melee weapon to often steal life from the enemy and give it to the wielder%. +has a reduced effect for players above level 60%.$", "lifestealing"},
	{"^use: permanently enchant a melee weapon to often strike for 40 additional fire damage%.$", "fiery weapon"},
	{"^use: permanently enchant a melee weapon to sometimes disrupt elementals when struck by your melee attacks, dealing arcane damage and silencing them for 5 sec%. +requires a level 300 or higher item%.$", "elemental slayer"},
	{"^use: permanently enchant a melee weapon to sometimes heal the wielder when striking in melee%. +requires a level 60 or higher item%.$", "lifeward"},
	{"^use: permanently enchant a melee weapon to sometimes increase haste by 450 for 12 sec when healing or dealing spell or melee damage%. +requires a level 300 or higher item%.$", "hurricane"},
	{"^use: permanently enchant a melee weapon to sometimes increase your attack power by 400, but at the cost of reduced armor%. +requires a level 60 or higher item%.$", "berserking"},
	{"^use: permanently enchant a melee weapon to sometimes inflict fire damage%. +requires a level 60 or higher item%.$", "icebreaker"},
	{"^use: permanently enchant a weapon to often deal %d%d%d to %d%d%d nature damage to an enemy damaged by your spells or struck by your melee attacks%. +requires a level 300 or higher item%.$", "avalanche"},
	{"^use: permanently enchant a weapon to sometimes grant blade warding when striking an enemy%. +blade warding increases your parry by 200 and inflicts 600 to 800 damage on your next parry%. +lasts 10 sec%.[\r\n ]+this enchantment requires the wielder is at least level 75%.$", "blade ward"},
	{"^use: permanently enchant a weapon to sometimes heal you when damaging an enemy with spells and melee attacks%. +requires a level 300 or higher item%.$", "mending"},
	{"^use: permanently enchant a weapon to sometimes increase attack power by 1000 for 12 sec when striking in melee%. +requires a level 300 or higher item%.$", "landslide"},
	{"^use: permanently enchant a weapon to sometimes increase dodge by 600 and movement speed by 15%% for 10 sec when striking in melee, stacking with passive movement speed effects%. +requires a level 300 or higher item%.$", "windwalk"},
	{"^use: permanently enchant a weapon to sometimes increase intellect by 500 for 12 sec when dealing damage or healing with spells%. +requires a level 300 or higher item%.$", "power torrent"},
	{"^use: permanently enchant a weapon to sometimes increase spirit by 200 for 15 sec when healing or dealing damage with spells%. +requires a level 300 or higher item%.$", "heartsong"},
	{"^use: permanently enchant your weapon to sometimes grant blood reserve when striking an enemy or inflicting damage with bleed attacks%. +when you fall below 35%% health, blood reserve restores 360 to 440 health%. +lasts 20 sec and stacks up to 5 times%.[\r\n ]+this enchantment requires the wielder is at least level 75%.$", "blood draining"},
	{"^use: permanently enchants a melee weapon to make your damaging melee strikes sometimes activate a mogu protection spell, absorbing up to 7,?500 damage%. +requires a level 372 or higher item%.$", "colossus"},
	{"^use: permanently enchants a melee weapon to sometimes increase your dodge by 1,?650 for 7 sec when dealing melee damage%. +requires a level 372 or higher item%.$", "river's song"},
	{"^use: permanently enchants a melee weapon to sometimes increase your strength or agility by 1,?650 when dealing melee damage%. +your highest stat is always chosen%. +requires a level 372 or higher item%.$", "dancing steel"},
	{"^use: permanently enchants a melee weapon to sometimes inflict 2,?775 to 3,?225 additional elemental damage when dealing damage with spells and melee attacks%. +requires a level 372 or higher item%.$", "elemental force"},
	{"^use: permanently enchants? a melee weapon to sometimes increase your critical strike, haste, or mastery by 1,?500 for 12 sec when dealing damage or healing with spells and melee attacks%. +requires a level 372 or higher item%.$", "windsong"},
	{"^use: permanently enchants? a melee weapon to sometimes increase your intellect by 1,?650 when healing or dealing damage with spells%. +if less than 25%% of your mana remains when the effect is triggered, your spirit will also increase by 750%. +requires a level 372 or higher item%.$", "jade spirit"},
	{"^use: teaches you how to permanently enchant a melee weapon to cause your damaging spells and melee weapon hits to occasionally inflict additional frost damage and slow the target%. +requires a level 60 or higher item%.$", "deathfrost"},
	{"^use: teaches you how to permanently enchant a melee weapon to cause your harmful spells to sometimes increase haste%. +requires a level 60 or higher item%.$", "black magic"},
	{"^use: teaches you how to permanently enchant a melee weapon to have a chance of reducing movement speed and doing additional damage against giants%. +requires a level 60 or higher item%.$", "giant slayer"},
	{"^use: teaches you how to permanently enchant a melee weapon to have a chance of stunning and doing additional damage against demons%.$", "demonslaying"},
	{"^use: teaches you how to permanently enchant a melee weapon to make your damaging melee strikes sometimes activate a mogu protection spell, absorbing damage%. +requires a level 372 or higher item%.$", "colossus"},
	{"^use: teaches you how to permanently enchant a melee weapon to make your spells sometimes restore 100 mana to nearby party members%. +requires a level 35 or higher item%.$", "spellsurge"},
	{"^use: teaches you how to permanently enchant a melee weapon to occasionally grant you 120 critical strike%. requires a level 60 or higher item%.$", "executioner"},
	{"^use: teaches you how to permanently enchant a melee weapon to occasionally heal nearby party members for 180 to 300 when attacking in melee%. +requires a level 35 or higher item%.$", "battlemaster"},
	{"^use: teaches you how to permanently enchant a melee weapon to occasionally increase agility by 120 and attack speed slightly%. +requires a level 35 or higher item%.$", "mongoose"},
	{"^use: teaches you how to permanently enchant a melee weapon to often chill the target, reducing their movement and attack speed%. +has a reduced effect for players above level 60%.$", "icy chill"},
	{"^use: teaches you how to permanently enchant a melee weapon to often heal for 75 to 125 and increase strength by 100 for 15 sec%. when attacking in melee%. has a reduced effect for players above level 60%.$", "crusader"},
	{"^use: teaches you how to permanently enchant a melee weapon to often inflict a curse on the target, inflicting shadow damage and reducing their melee damage%.$", "unholy weapon"},
	{"^use: teaches you how to permanently enchant a melee weapon to often steal life from the enemy and give it to the wielder%. +has a reduced effect for players above level 60%.$", "lifestealing"},
	{"^use: teaches you how to permanently enchant a melee weapon to often strike for 40 additional fire damage%.$", "fiery weapon"},
	{"^use: teaches you how to permanently enchant a melee weapon to sometimes grant blood reserve when striking an enemy or inflicting damage with bleed attacks, healing you when your health is low%. +enchantment requires level 75%.$", "blood draining"},
	{"^use: teaches you how to permanently enchant a melee weapon to sometimes heal the wielder when striking in melee%. +requires a level 60 or higher item%.$", "lifeward"},
	{"^use: teaches you how to permanently enchant a melee weapon to sometimes increase intellect when healing or dealing damage with spells%. +also increases spirit if your mana is low%. +requires a level 372 or higher item%.$", "jade spirit"},
	{"^use: teaches you how to permanently enchant a melee weapon to sometimes increase your attack power at the cost of reduced armor%. +requires a level 60 or higher item%.$", "berserking"},
	{"^use: teaches you how to permanently enchant a melee weapon to sometimes increase your critical strike, haste, or mastery by 1,?500 for 12 sec when dealing damage with spells and melee attacks%. +requires a level 372 or higher item%.$", "windsong"},
	{"^use: teaches you how to permanently enchant a melee weapon to sometimes increase your dodge when dealing melee damage%. +requires a level 372 or higher item%.$", "river's song"},
	{"^use: teaches you how to permanently enchant a melee weapon to sometimes increase your strength or agility by 1,?650 when dealing melee damage%. +requires a level 372 or higher item%.$", "dancing steel"},
	{"^use: teaches you how to permanently enchant a melee weapon to sometimes inflict additional damage when dealing damage with spells and melee attacks%. +requires a level 372 or higher item%.$", "elemental force"},
	{"^use: teaches you how to permanently enchant a melee weapon to sometimes inflict fire damage%. +requires a level 60 or higher item%.$", "icebreaker"},
	{"^use: teaches you how to permanently enchant a weapon to sometimes grant blade warding when striking an enemy, increasing parry and inflicting damage on your next parry%. +enchantment requires level 75%.$", "blade ward"},
	{"^use: teaches you how to permanently enchant a weapon to sometimes increase attack power when striking with melee attacks%. +requires a level 300 or higher item%.$", "landslide"},
	{"^use: teaches you how to permanently enchant a weapon to sometimes increase dodge and movement speed when striking in melee%. +requires a level 300 or higher item%.$", "windwalk"},
	{"^use: teaches you how to permanently enchant a weapon to sometimes increase spell power when dealing damage or healing with spells%. +requires a level 300 or higher item%.$", "power torrent"},
}

local MatchLines = {}
for i = 2, #(PreprocessLines) do
	table.insert(MatchLines, PreprocessLines[i][1]:sub(1, -2))
end

local function oneOf(stat)
	return {stats = WeightsWatcher.newStatTable({[stat] = 1})}
end

ww_enchant_items = {MatchLines, {}, {}, PreprocessLines, {}, oneOf, "enchantItem"}
