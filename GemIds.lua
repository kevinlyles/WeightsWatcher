if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

-- format:
-- 	[rarity] = {
--  	[gemId] = {
--  		"color",
--  		"name(s)",
--  		stats,
--  	},
-- 	},
--
-- rarity:
-- 	1: BC white
-- 	2: BC green
-- 	3: BC blue
-- 	4: BC epic
-- 	5: BC UE
-- 	6: wrath green
-- 	7: perfect wrath green
-- 	8: wrath blue
-- 	9: wrath epic
-- 	10: wrath UE
-- 	11: wrath JC-only

GemIds = {
	[1] = {
		[2956] = {
			"Red",
			"Bold Tourmaline",
			{["Strength"] = 4},
		},
		[2957] = {
			"Red",
			"Delicate Tourmaline",
			{["Agility"] = 4},
		},
		[2958] = {
			"Red",
			"Teardrop Tourmaline",
			{["Spell Power"] = 5},
		},
		[2959] = {
			"Red",
			"Runed Tourmaline",
			{["Spell Power"] = 5},
		},
		[2960] = {
			"Red",
			"Bright Tourmaline",
			{["Attack Power"] = 8},
		},
		[2961] = {
			"Blue",
			"Solid Zircon",
			{["Stamina"] = 6},
		},
		[2962] = {
			"Blue",
			"Sparkling Zircon",
			{["Spirit"] = 4},
		},
		[2963] = {
			"Blue",
			"Lustrous Zircon",
			{["MP5"] = 2},
		},
		[2964] = {
			"Yellow",
			"Brilliant Amber",
			{["Intellect"] = 4},
		},
		[2965] = {
			"Yellow",
			"Smooth Amber",
			{["Critical Strike Rating"] = 4},
		},
		[2966] = {
			"Yellow",
			"Rigid Amber",
			{["Hit Rating"] = 4},
		},
		[2967] = {
			"Yellow",
			"Gleaming Amber",
			{["Critical Strike Rating"] = 4},
		},
		[2968] = {
			"Yellow",
			"Thick Amber",
			{["Defense Rating"] = 4},
		},
	},
	[2] = {
		[2690] = {
			"Red",
			"Teardrop Blood Garnet",
			{["Spell Power"] = 7},
		},
		[2691] = {
			"Red",
			"Bold Blood Garnet",
			{["Strength"] = 6},
		},
		[2692] = {
			"Red",
			"Runed Blood Garnet",
			{["Spell Power"] = 7},
		},
		[2693] = {
			"Red",
			"Delicate Blood Garnet",
			{["Agility"] = 6},
		},
		[2694] = {
			"Yellow",
			"Brilliant Golden Draenite",
			{["Intellect"] = 6},
		},
		[2695] = {
			"Yellow",
			"Smooth Golden Draenite",
			{["Critical Strike Rating"] = 6},
		},
		[2696] = {
			"Yellow",
			"Thick Golden Draenite",
			{["Defense Rating"] = 6},
		},
		[2697] = {
			"Yellow",
			"Rigid Golden Draenite",
			{["Hit Rating"] = 6},
		},
		[2698] = {
			"Blue",
			"Solid Azure Moonstone",
			{["Stamina"] = 9},
		},
		[2699] = {
			"Blue",
			"Sparkling Azure Moonstone",
			{["Spirit"] = 6},
		},
		[2700] = {
			"Blue",
			"Stormy Azure Moonstone",
			{["Spell Penetration"] = 8},
		},
		[2701] = {
			"Blue",
			"Lustrous Azure Moonstone",
			{["MP5"] = 3},
		},
		[2705] = {
			"Orange",
			"Luminous Flame Spessarite",
			{["Spell Power"] = 4, ["Intellect"] = 3},
		},
		[2706] = {
			"Green",
			"Enduring Deep Peridot",
			{["Defense Rating"] = 3, ["Stamina"] = 4},
		},
		[2707] = {
			"Green",
			"Dazzling Deep Peridot",
			{["Intellect"] = 3, ["MP5"] = 2},
		},
		[2708] = {
			"Purple",
			"Glowing Shadow Draenite",
			{["Spell Power"] = 4, ["Stamina"] = 4},
		},
		[2709] = {
			"Purple",
			"Royal Shadow Draenite",
			{["Spell Power"] = 4, ["MP5"] = 2},
		},
		[2710] = {
			"Purple",
			"Shifting Shadow Draenite",
			{["Agility"] = 3, ["Stamina"] = 4},
		},
		[2711] = {
			"Purple",
			"Sovereign Shadow Draenite",
			{["Strength"] = 3, ["Stamina"] = 4},
		},
		[2752] = {
			"Orange",
			"Inscribed Flame Spesarite",
			{["Critical Strike Rating"] = 3, ["Strength"] = 3},
		},
		[2755] = {
			"Orange",
			"Glinting Flame Spessarite",
			{["Hit Rating"] = 3, ["Agility"] = 3},
		},
		[2757] = {
			"Green",
			"Jagged Deep Peridot",
			{["Critical Strike Rating"] = 3, ["Stamina"] = 4},
		},
		[2760] = {
			"Orange",
			"Potent Flame Spessarite",
			{["Critical Strike Rating"] = 3, ["Spell Power"] = 4},
		},
		[2762] = {
			"Green",
			"Radiant Deep Peridot",
			{["Critical Strike Rating"] = 3, ["Spell Penetration"] = 4},
		},
		[2942] = {
			"Yellow",
			"Gleaming Golden Draenite",
			{["Critical Strike Rating"] = 6},
		},
		[2971] = {
			"Red",
			"Bright Blood Garnet",
			{["Attack Power"] = 12},
		},
		[3104] = {
			"Yellow",
			"Great Golden Draenite",
			{["Hit Rating"] = 6},
		},
		[3106] = {
			"Purple",
			"Balanced Shadow Draenite",
			{["Attack Power"] = 6, ["Stamina"] = 4},
		},
		[3108] = {
			"Purple",
			"Infused Shadow Draenite",
			{["Attack Power"] = 6, ["MP5"] = 1},
		},
		[3110] = {
			"Orange",
			"Veiled Flame Spessarite",
			{["Hit Rating"] = 3, ["Spell Power"] = 4},
		},
		[3113] = {
			"Orange",
			"Wicked Flame Spessarite",
			{["Critical Strike Rating"] = 3, ["Attack Power"] = 6},
		},
		[3201] = {
			"Purple",
			"Purified Jaggal Pearl",
			{["Spell Power"] = 4, ["Spirit"] = 3},
		},
		[3390] = {
			"Blue",
			"Stormy Chalcedony",
			{["Spell Penetration"] = 15},
		},
	},
	[3] = {
		[2725] = {
			"Red",
			"Bold Living Ruby",
			{["Strength"] = 8},
		},
		[2726] = {
			"Red",
			"Delicate Living Ruby",
			{["Agility"] = 8},
		},
		[2727] = {
			"Red",
			"Teardrop Living Ruby",
			{["Spell Power"] = 9},
		},
		[2728] = {
			"Red",
			"Runed Living Ruby",
			{["Spell Power"] = 9},
		},
		[2729] = {
			"Red",
			"Bright Living Ruby",
			{["Attack Power"] = 16},
		},
		[2730] = {
			"Red",
			"Subtle Living Ruby",
			{["Dodge Rating"] = 8},
		},
		[2731] = {
			"Blue",
			"Solid Star of Elune",
			{["Stamina"] = 12},
		},
		[2732] = {
			"Blue",
			"Sparkling Star of Elune",
			{["Spirit"] = 8},
		},
		[2733] = {
			"Blue",
			"Lustrous Star of Elune",
			{["MP5"] = 4},
		},
		[2734] = {
			"Yellow",
			"Brilliant Dawnstone",
			{["Intellect"] = 8},
		},
		[2735] = {
			"Yellow",
			"Smooth Dawnstone",
			{["Critical Strike Rating"] = 8},
		},
		[2736] = {
			"Yellow",
			"Gleaming Dawnstone",
			{["Critical Strike Rating"] = 8},
		},
		[2737] = {
			"Yellow",
			"Thick Dawnstone",
			{["Defense Rating"] = 8},
		},
		[2738] = {
			"Purple",
			"Sovereign Nightseye",
			{["Strength"] = 4, ["Stamina"] = 6},
		},
		[2739] = {
			"Purple",
			"Shifting Nightseye",
			{["Agility"] = 4, ["Stamina"] = 6},
		},
		[2740] = {
			"Purple",
			"Glowing Nightseye",
			{["Spell Power"] = 5, ["Stamina"] = 6},
		},
		[2741] = {
			"Purple",
			"Royal Nightseye",
			{["Spell Power"] = 5, ["MP5"] = 2},
		},
		[2743] = {
			"Green",
			"Enduring Talasite",
			{["Defense Rating"] = 4, ["Stamina"] = 6},
		},
		[2744] = {
			"Green",
			"Dazzling Talasite",
			{["Intellect"] = 4, ["MP5"] = 2},
		},
		[2753] = {
			"Orange",
			"Inscribed Noble Topaz",
			{["Critical Strike Rating"] = 4, ["Strength"] = 4},
		},
		[2754] = {
			"Red",
			"Flashing Living Ruby",
			{["Parry Rating"] = 8},
		},
		[2756] = {
			"Orange",
			"Glinting Noble Topaz",
			{["Hit Rating"] = 4, ["Agility"] = 4},
		},
		[2758] = {
			"Green",
			"Jagged Talasite",
			{["Critical Strike Rating"] = 4, ["Stamina"] = 6},
		},
		[2759] = {
			"Yellow",
			"Mystic Dawnstone",
			{["Resilience Rating"] = 8},
		},
		[2761] = {
			"Orange",
			"Potent Noble Topaz",
			{["Critical Strike Rating"] = 4, ["Spell Power"] = 5},
		},
		[2763] = {
			"Green",
			"Radiant Talasite",
			{["Critical Strike Rating"] = 4, ["Spell Penetration"] = 5},
		},
		[2764] = {
			"Yellow",
			"Great Dawnstone",
			{["Hit Rating"] = 8},
		},
		[2765] = {
			"Blue",
			"Stormy Star of Elune",
			{["Spell Penetration"] = 10},
		},
		[2827] = {
			"Meta",
			"Destructive Skyfire Diamond",
			{["Critical Strike Rating"] = 14, ["Spell Reflect (Percent)"] = 1},
		},
		[2828] = {
			"Meta",
			"Mystical Skyfire Diamond",
			{["Chance to Increase Spell Haste"] = 1},
		},
		[2829] = {
			"Meta",
			"Swift Skyfire Diamond",
			{["Attack Power"] = 24, ["Minor Run Speed"] = 1},
		},
		[2830] = {
			"Meta",
			"Egnimatic Skyfire Diamond",
			{["Critical Strike Rating"] = 12, ["Snare/Root Duration Reduction (Percent)"] = 10},
		},
		[2831] = {
			"Meta",
			"Powerful Earthstorm Diamond",
			{["Stamina"] = 18, ["Stun Duration Reduction (Percent)"] = 15},
		},
		[2832] = {
			"Meta",
			"Bracing Earthstorm Diamond",
			{["Spell Power"] = 14, ["Threat Reduction (Percent)"] = 2},
		},
		[2833] = {
			"Meta",
			"Tenacious Earthstorm Diamond",
			{["Defense Rating"] = 12, ["Chance to Restore Health on hit"] = 1},
		},
		[2834] = {
			"Meta",
			"Brutal Earthstorm Diamond",
			{["Weapon Damage"] = 3, ["Chance to Stun Target"] = 1},
		},
		[2835] = {
			"Meta",
			"Insightful Earthstorm Diamond",
			{["Intellect"] = 12, ["Chance to Restore Mana on Spellcast"] = 1},
		},
		[2896] = {
			"Red",
			"Stark Blood Garnet",
			{["Spell Power"] = 8},
		},
		[2898] = {
			"Green",
			"Notched Deep Peridot",
			{["Stamina"] = 3, ["Critical Strike Rating"] = 4},
		},
		[2899] = {
			"Green",
			"Barbed Deep Peridot",
			{["Stamina"] = 3, ["Critical Strike Rating"] = 4},
		},
		[2921] = {
			"Green",
			"Barbed Deep Peridot",
			{["Stamina"] = 3, ["Critical Strike Rating"] = 4},
		},
		[2923] = {
			"Green",
			"Notched Deep Peridot",
			{["Stamina"] = 3, ["Critical Strike Rating"] = 4},
		},
		[2924] = {
			"Red",
			"Stark Blood Garnet",
			{["Spell Power"] = 8},
		},
		[2943] = {
			"Red",
			"Mighty Blood Garnet",
			{["Attack Power"] = 14},
		},
		[2944] = {
			"Red",
			"Mighty Blood Garnet",
			{["Attack Power"] = 14},
		},
		[2947] = {
			"Prismatic",
			"Prismatic Sphere",
			{["All Resistances"] = 3},
		},
		[2969] = {
			"Meta",
			"Swift Windfire Diamond",
			{["Attack Power"] = 20, ["Minor Run Speed"] = 1},
		},
		[2970] = {
			"Meta",
			"Swift Starfire Diamond",
			{["Spell Power"] = 12, ["Minor Run Speed"] = 1},
		},
		[3105] = {
			"Yellow",
			"Rigid Dawnstone",
			{["Hit Rating"] = 8},
		},
		[3107] = {
			"Purple",
			"Balanced Nightseye",
			{["Attack Power"] = 8, ["Stamina"] = 6},
		},
		[3109] = {
			"Purple",
			"Infused Nightseye",
			{["Attack Power"] = 8, ["MP5"] = 2},
		},
		[3111] = {
			"Orange",
			"Veiled Noble Topaz",
			{["Hit Rating"] = 4, ["Spell Power"] = 5},
		},
		[3112] = {
			"Orange",
			"Wicked Noble Topaz",
			{["Critical Strike Rating"] = 4, ["Attack Power"] = 8},
		},
		[3154] = {
			"Meta",
			"Relentless Earthstorm Diamond",
			{["Agility"] = 12, ["Critical Damage (Percent)"] = 3},
		},
		[3155] = {
			"Meta",
			"Thundering Skyfire Diamond",
			{["Chance to Increase Physical Haste"] = 1},
		},
		[3158] = {
			"Blue",
			"Unstable Sapphire",
			{["Spell Power"] = 5, ["Spirit"] = 4},
		},
		[3162] = {
			"Meta",
			"Potent Unstable Diamond",
			{["Attack Power"] = 24, ["Stun Resistance (Percent)"] = 5},
		},
		[3163] = {
			"Meta",
			"Imbued Unstable Diamond",
			{["Spell Power"] = 14, ["Stun Resistance (Percent)"] = 5},
		},
		[3202] = {
			"Purple",
			"Purified Shadow Pearl",
			{["Spell Power"] = 5, ["Spirit"] = 4},
		},
		[3226] = {
			"Green",
			"Steady Talasite",
			{["Resilience Rating"] = 4, ["Stamina"] = 6},
		},
		[3261] = {
			"Meta",
			"Chaotic Skyfire Diamond",
			{["Critical Strike Rating"] = 12, ["Critical Damage (Percent)"] = 3},
		},
		[3270] = {
			"Yellow",
			"Quick Dawnstone",
			{["Haste Rating"] = 8},
		},
		[3271] = {
			"Orange",
			"Reckless Noble Topaz",
			{["Haste Rating"] = 4, ["Spell Power"] = 5},
		},
		[3272] = {
			"Green",
			"Foreceful Talasite",
			{["Haste Rating"] = 4, ["Stamina"] = 6},
		},
		[3274] = {
			"Meta",
			"Eternal Earthstorm Diamond",
			{["Defense Rating"] = 12, ["Block Value (Percent)"] = 5},
		},
		[3275] = {
			"Meta",
			"Ember Skyfire Diamond",
			{["Spell Power"] = 14, ["Intellect (Percent)"] = 2},
		},
		[3280] = {
			"Purple",
			"Regal Nightseye",
			{["Dodge Rating"] = 4, ["Stamina"] = 6},
		},
	},
	[4] = {
		[2742] = {
			"Orange",
			"Luminous Noble Topaz",
			{["Spell Power"] = 5, ["Intellect"] = 4},
		},
		[2912] = {
			"Red",
			"Runed Ornate Ruby",
			{["Spell Power"] = 12},
		},
		[2913] = {
			"Yellow",
			"Smooth Ornate Dawnstone",
			{["Critical Strike Rating"] = 10},
		},
		[2914] = {
			"Yellow",
			"Gleaming Ornate Dawnstone",
			{["Critical Strike Rating"] = 10},
		},
		[2915] = {
			"Orange",
			"Inscribed Pyrestone",
			{["Strength"] = 5, ["Critical Strike Rating"] = 5},
		},
		[2916] = {
			"Orange",
			"Potent Pyrestone",
			{["Critical Strike Rating"] = 5, ["Spell Power"] = 6},
		},
		[2945] = {
			"Red",
			"Bold Ornate Ruby",
			{["Attack Power"] = 20},
		},
		[2946] = {
			"Orange",
			"Inscribed Ornate Topaz",
			{["Attack Power"] = 10, ["Critical Strike Rating"] = 5},
		},
		[2948] = {
			"Prismatic",
			"Void Sphere",
			{["All Resistances"] = 4},
		},
		[2949] = {
			"Red",
			"Bold Ornate Ruby",
			{["Attack Power"] = 20},
		},
		[3045] = {
			"Purple",
			"Sovereign Tanzanite",
			{["Strength"] = 5, ["Stamina"] = 6},
		},
		[3046] = {
			"Orange",
			"Luminous Fire Opal",
			{["Spell Power"] = 6, ["Intellect"] = 4},
		},
		[3047] = {
			"Green",
			"Polished Chrysoprase",
			{["Stamina"] = 6, ["Critical Strike Rating"] = 5},
		},
		[3048] = {
			"Purple",
			"Shifting Tanzanite",
			{["Agility"] = 5, ["Stamina"] = 6},
		},
		[3049] = {
			"Green",
			"Sundered Chrysoprase",
			{["Critical Strike Rating"] = 5, ["MP5"] = 2},
		},
		[3050] = {
			"Orange",
			"Infused Fire Opal",
			{["Spell Power"] = 6, ["Intellect"] = 4},
		},
		[3051] = {
			"Purple",
			"Blessed Tanzanite",
			{["Spell Power"] = 6, ["Stamina"] = 6},
		},
		[3052] = {
			"Orange",
			"Pristine Fire Opal",
			{["Attack Power"] = 10, ["Hit Rating"] = 4},
		},
		[3053] = {
			"Orange",
			"Stalwart Fire Opal",
			{["Defense Rating"] = 5, ["Dodge Rating"] = 4},
		},
		[3054] = {
			"Purple",
			"Glowing Tanzanite",
			{["Spell Power"] = 6, ["Stamina"] = 6},
		},
		[3055] = {
			"Orange",
			"Glinting Fire Opal",
			{["Agility"] = 5, ["Hit Rating"] = 4},
		},
		[3056] = {
			"Orange",
			"Glimmering Fire Opal",
			{["Parry Rating"] = 5, ["Defense Rating"] = 4},
		},
		[3057] = {
			"Orange",
			"Etched Fire Opal",
			{["Strength"] = 5, ["Hit Rating"] = 4},
		},
		[3058] = {
			"Green",
			"Rune Covered Chrysoprase",
			{["Critical Strike Rating"] = 5, ["MP5"] = 2},
		},
		[3060] = {
			"Purple",
			"Regal Tanzanite",
			{["Dodge Rating"] = 5, ["Stamina"] = 6},
		},
		[3061] = {
			"Orange",
			"Shining Fire Opal",
			{["Hit Rating"] = 5, ["Spell Power"] = 6},
		},
		[3062] = {
			"Orange",
			"Assassin's Fire Opal",
			{["Critical Strike Rating"] = 6, ["Dodge Rating"] = 5},
		},
		[3063] = {
			"Purple",
			"Defender's Tanzanite",
			{["Parry Rating"] = 5, ["Stamina"] = 6},
		},
		[3064] = {
			"Purple",
			"Imperial Tanzanite",
			{["Spirit"] = 5, ["Spell Power"] = 5},
		},
		[3066] = {
			"Orange",
			"Mysterious Fire Opal",
			{["Spell Power"] = 6, ["Spell Penetration"] = 5},
		},
		[3067] = {
			"Purple",
			"Brutal Tanzanite",
			{["Attack Power"] = 10, ["Stamina"] = 6},
		},
		[3068] = {
			"Orange",
			"Nimble Fire Opal",
			{["Dodge Rating"] = 5, ["Hit Rating"] = 4},
		},
		[3069] = {
			"Orange",
			"Durable Fire Opal",
			{["Spell Power"] = 6, ["Resilience Rating"] = 4},
		},
		[3070] = {
			"Orange",
			"Deadly Fire Opal",
			{["Attack Power"] = 8, ["Critical Strike Rating"] = 5},
		},
		[3071] = {
			"Green",
			"Timeless Chrysoprase",
			{["Intellect"] = 5, ["Stamina"] = 6},
		},
		[3072] = {
			"Orange",
			"Enscribed Fire Opal", -- No, that's not a typo (on my part, anyway)
			{["Strength"] = 5, ["Critical Strike Rating"] = 4},
		},
		[3073] = {
			"Orange",
			"Glistening Fire Opal",
			{["Agility"] = 4, ["Defense Rating"] = 5},
		},
		[3074] = {
			"Green",
			"Seer's Chrysoprase",
			{["Intellect"] = 4, ["Spirit"] = 5},
		},
		[3075] = {
			"Orange",
			"Champion's Fire Poal",
			{["Strength"] = 5, ["Defense Rating"] = 4},
		},
		[3076] = {
			"Orange",
			"Potent Fire Opal",
			{["Critical Strike Rating"] = 4, ["Spell Power"] = 6},
		},
		[3077] = {
			"Green",
			"Dazzling Chrysoprase",
			{["Intellect"] = 5, ["MP5"] = 2},
		},
		[3078] = {
			"Green",
			"Enduring Chrysoprase",
			{["Stamina"] = 6, ["Defense Rating"] = 5},
		},
		[3079] = {
			"Orange",
			"Empowered Fire Opal",
			{["Attack Power"] = 8, ["Resilience Rating"] = 5},
		},
		[3080] = {
			"Green",
			"Steady Chrysoprase",
			{["Stamina"] = 6, ["Resilience Rating"] = 5},
		},
		[3081] = {
			"Orange",
			"Iridescent Fire Opal",
			{["Spell Power"] = 6, ["Critical Strike Rating"] = 4},
		},
		[3082] = {
			"Green",
			"Effulgent Chrysoprase",
			{["Defense Rating"] = 5, ["MP5"] = 2},
		},
		[3083] = {
			"Purple",
			"Fluorescent Tanzanite",
			{["Spell Power"] = 6, ["Spirit"] = 4},
		},
		[3084] = {
			"Orange",
			"Beaming Fire Opal",
			{["Dodge Rating"] = 5, ["Resilience Rating"] = 4},
		},
		[3085] = {
			"Green",
			"Jagged Chrysoprase",
			{["Stamina"] = 6, ["Critical Strike Rating"] = 5},
		},
		[3086] = {
			"Purple",
			"Royal Tanzanite",
			{["Spell Power"] = 6, ["MP5"] = 2},
		},
		[3087] = {
			"Orange",
			"Resplendent Fire Opal",
			{["Strength"] = 5, ["Resilience Rating"] = 4},
		},
		[3088] = {
			"Green",
			"Vivid Chrysoprase",
			{["Hit Rating"] = 5, ["Stamina"] = 6},
		},
		[3089] = {
			"Green",
			"Lambent Chrysoprase",
			{["Hit Rating"] = 5, ["MP5"] = 2},
		},
		[3090] = {
			"Orange",
			"Splendid Fire Opal",
			{["Parry Rating"] = 5, ["Resilience Rating"] = 4},
		},
		[3091] = {
			"Green",
			"Radiant Chrysoprase",
			{["Critical Strike Rating"] = 5, ["Spell Penetration"] = 5},
		},
		[3099] = {
			"Purple",
			"Infused Amethyst",
			{["Spell Power"] = 6, ["Stamina"] = 6},
		},
		[3100] = {
			"Purple",
			"Soothing Amethyst",
			{["Spell Power"] = 6, ["Stamina"] = 6},
		},
		[3101] = {
			"Purple",
			"Pulsing Amethyst",
			{["Attack Power"] = 10, ["Stamina"] = 6},
		},
		[3115] = {
			"Red",
			"Bold Crimson Spinel",
			{["Strength"] = 10},
		},
		[3116] = {
			"Red",
			"Delicate Crimson Spinel",
			{["Agility"] = 10},
		},
		[3117] = {
			"Red",
			"Teardrop Crimson Spinel",
			{["Spell Power"] = 12},
		},
		[3118] = {
			"Red",
			"Runed Crimson Spinel",
			{["Spell Power"] = 12},
		},
		[3119] = {
			"Red",
			"Bright Crimson Spinel",
			{["Attack Power"] = 20},
		},
		[3120] = {
			"Red",
			"Subtle Crimson Spinel",
			{["Dodge Rating"] = 10},
		},
		[3121] = {
			"Red",
			"Flashing Crimson Spinel",
			{["Parry Rating"] = 10},
		},
		[3122] = {
			"Blue",
			"Solid Empyrean Sapphire",
			{["Stamina"] = 15},
		},
		[3123] = {
			"Blue",
			"Sparkling Empyrean Sapphire",
			{["Spirit"] = 10},
		},
		[3125] = {
			"Blue",
			"Stormy Empyrean Sapphire",
			{["Spell Penetration"] = 13},
		},
		[3126] = {
			"Yellow",
			"Brilliant Lionseye",
			{["Intellect"] = 10},
		},
		[3127] = {
			"Yellow",
			"Smooth Lionseye",
			{["Critical Strike Rating"] = 10},
		},
		[3128] = {
			"Yellow",
			"Rigid Lionseye",
			{["Hit Rating"] = 10},
		},
		[3129] = {
			"Yellow",
			"Gleaming Lionseye",
			{["Critical Strike Rating"] = 10},
		},
		[3130] = {
			"Yellow",
			"Thick Lionseye",
			{["Defense Rating"] = 10},
		},
		[3131] = {
			"Yellow",
			"Mystic Lionseye",
			{["Resilience Rating"] = 10},
		},
		[3132] = {
			"Yellow",
			"Great Lionseye",
			{["Hit Rating"] = 10},
		},
		[3133] = {
			"Purple",
			"Sovereign Shadowsong Amethyst",
			{["Strength"] = 5, ["Stamina"] = 7},
		},
		[3134] = {
			"Purple",
			"Shifting Shadowsong Amethyst",
			{["Agility"] = 5, ["Stamina"] = 7},
		},
		[3135] = {
			"Purple",
			"Balanced Shadowsong Amethyst",
			{["Attack Power"] = 10, ["Stamina"] = 7},
		},
		[3136] = {
			"Purple",
			"Infused Shadowsong Amethyst",
			{["Attack Power"] = 10, ["MP5"] = 3},
		},
		[3137] = {
			"Purple",
			"Glowing Shadowsong Amethyst",
			{["Spell Power"] = 6, ["Stamina"] = 7},
		},
		[3138] = {
			"Purple",
			"Royal Shadowsong Amethyst",
			{["Spell Power"] = 6, ["MP5"] = 3},
		},
		[3139] = {
			"Orange",
			"Inscribed Pyrestone",
			{["Critical Strike Rating"] = 5, ["Strength"] = 5},
		},
		[3140] = {
			"Orange",
			"Potent Ornate Topaz",
			{["Critical Strike Rating"] = 5, ["Spell Power"] = 6},
		},
		[3141] = {
			"Orange",
			"Luminous Pyrestone",
			{["Spell Power"] = 6, ["Intellect"] = 5},
		},
		[3142] = {
			"Orange",
			"Glinting Pyrestone",
			{["Hit Rating"] = 5, ["Agility"] = 5},
		},
		[3143] = {
			"Orange",
			"Shining Fire Opal",
			{["Hit Rating"] = 5, ["Spell Power"] = 6},
		},
		[3144] = {
			"Orange",
			"Inscribed Ornate Topaz",
			{["Critical Strike Rating"] = 5, ["Attack Power"] = 10},
		},
		[3145] = {
			"Green",
			"Enduring Seaspray Emerald",
			{["Defense Rating"] = 5, ["Stamina"] = 7},
		},
		[3146] = {
			"Green",
			"Radiant Seaspray Emerald",
			{["Critical Strike Rating"] = 5, ["Spell Penetration"] = 6},
		},
		[3147] = {
			"Green",
			"Dazzling Seaspray Emerald",
			{["Intellect"] = 5, ["MP5"] = 3},
		},
		[3148] = {
			"Green",
			"Jagged Seaspray Emerald",
			{["Critical Strike Rating"] = 5, ["Stamina"] = 7},
		},
		[3276] = {
			"Red",
			"Bright Crimson Spinel",
			{["Attack Power"] = 20},
		},
		[3277] = {
			"Red",
			"Runed Crimson Spinel",
			{["Spell Power"] = 12},
		},
		[3278] = {
			"Red",
			"Teardrop Crimson Spinel",
			{["Spell Power"] = 12},
		},
		[3281] = {
			"Red",
			"Bright Crimson Spinel",
			{["Attack Power"] = 20},
		},
		[3282] = {
			"Red",
			"Runed Crimson Spinel",
			{["Spell Power"] = 12},
		},
		[3283] = {
			"Red",
			"Teardrop Crimson Spinel",
			{["Spell Power"] = 12},
		},
		[3284] = {
			"Green",
			"Steady Seaspray Emerald",
			{["Resilience Rating"] = 5, ["Stamina"] = 7},
		},
		[3285] = {
			"Green",
			"Forceful Seaspray Emerald",
			{["Haste Rating"] = 5, ["Stamina"] = 7},
		},
		[3286] = {
			"Orange",
			"Reckless Pyrestone",
			{["Haste Rating"] = 5, ["Spell Power"] = 6},
		},
		[3287] = {
			"Yellow",
			"Quick Lionseye",
			{["Haste Rating"] = 10},
		},
		[3318] = {
			"Purple",
			"Purified Shadowsong Amethyst",
			{["Spell Power"] = 6, ["Spirit"] = 5},
		},
		[3335] = {
			"Red",
			"Bold Ornate Ruby",
			{["Attack Power"] = 20},
		},
		[3336] = {
			"Yellow",
			"Gleaming Ornate Dawnstone",
			{["Critical Strike Rating"] = 10},
		},
		[3337] = {
			"Orange",
			"Inscribed Ornate Topaz",
			{["Attack Power"] = 10, ["Critical Strike Rating"] = 5},
		},
		[3338] = {
			"Orange",
			"Potent Ornate Topaz",
			{["Spell Power"] = 6, ["Critical Strike Rating"] = 5},
		},
		[3339] = {
			"Red",
			"Runed Ornate Ruby",
			{["Spell Power"] = 12},
		},
		[3340] = {
			"Yellow",
			"Smooth Ornate Dawnstone",
			{["Critical Strike Rating"] = 10},
		},
	},
	[5] = {
		[2891] = {
			"Yellow",
			"Sublime Mystic Dawnstone",
			{["Resilience Rating"] = 10},
		},
		[3065] = {
			"Red",
			"Don Rodrigo's Heart",
			{["Strength"] = 8},
		},
		[3103] = {
			"Red",
			"Don Amancio's Heart",
			{["Strength"] = 8},
		},
		[3124] = {
			"Blue",
			"Lustrous Empyrean Sapphire",
			{["MP5"] = 5},
		},
		[3156] = {
			"Purple",
			"Unstable Amethyst",
			{["Attack Power"] = 8, ["Stamina"] = 6},
		},
		[3157] = {
			"Green",
			"Untable Peridot",
			{["Intellect"] = 4, ["Stamina"] = 6},
		},
		[3159] = {
			"Orange",
			"Unstable Citrine",
			{["Attack Power"] = 8, ["Critical Strike Rating"] = 4},
		},
		[3160] = {
			"Orange",
			"Unstable Topaz",
			{["Spell Power"] = 5, ["Intellect"] = 4},
		},
		[3161] = {
			"Green",
			"Unstable Talasite",
			{["Stamina"] = 4, ["Critical Strike Rating"] = 4},
		},
		[3197] = {
			"Green",
			"Radiant Spencerite",
			{["Attack Power"] = 20},
		},
		[3208] = {
			"Red",
			"Crimson Sun",
			{["Attack Power"] = 24},
		},
		[3209] = {
			"Red",
			"Delicate Fire Ruby",
			{["Agility"] = 12},
		},
		[3210] = {
			"Red",
			"Don Julio's Heart",
			{["Spell Power"] = 14},
		},
		[3211] = {
			"Red",
			"Kailee's Rose",
			{["Spell Power"] = 14},
		},
		[3212] = {
			"Blue",
			"Falling Star",
			{["Stamina"] = 18},
		},
		[3214] = {
			"Blue",
			"Sparkling Falling Star",
			{["Spirit"] = 12},
		},
		[3215] = {
			"Yellow",
			"Mystic Bladestone",
			{["Resilience Rating"] = 12},
		},
		[3216] = {
			"Yellow",
			"Brilliant Bladestone",
			{["Intellect"] = 12},
		},
		[3217] = {
			"Yellow",
			"Blood of Amber",
			{["Critical Strike Rating"] = 12},
		},
		[3218] = {
			"Yellow",
			"Great Bladestone",
			{["Hit Rating"] = 12},
		},
		[3219] = {
			"Yellow",
			"Rigid Bladestone",
			{["Hit Rating"] = 12},
		},
		[3220] = {
			"Yellow",
			"Stone of Blades",
			{["Critical Strike Rating"] = 12},
		},
		[3221] = {
			"Yellow",
			"Facet of Eternity",
			{["Defense Rating"] = 12},
		},
		[3262] = {
			"Blue",
			"Charmed Amani Jewel",
			{["Stamina"] = 15},
		},
		[3268] = {
			"Blue",
			"Eye of the Sea",
			{["Stamina"] = 15},
		},
	},
	[6] = {
		[3371] = {
			"Red",
			"Bold Bloodstone",
			{["Strength"] = 12},
		},
		[3374] = {
			"Red",
			"Delicate Bloodstone",
			{["Agility"] = 12},
		},
		[3375] = {
			"Red",
			"Bright Bloodstone",
			{["Attack Power"] = 24},
		},
		[3376] = {
			"Red",
			"Subtle Bloodstone",
			{["Dodge Rating"] = 12},
		},
		[3377] = {
			"Red",
			"Flashing Bloodstone",
			{["Parry Rating"] = 12},
		},
		[3378] = {
			"Red",
			"Fractured Bloodstone",
			{["Armor Penetration Rating"] = 12},
		},
		[3379] = {
			"Red",
			"Precise Bloodstone",
			{["Expertise Rating"] = 12},
		},
		[3380] = {
			"Red",
			"Runed Bloodstone",
			{["Spell Power"] = 14},
		},
		[3381] = {
			"Yellow",
			"Brilliant Sun Crystal",
			{["Intellect"] = 12},
		},
		[3382] = {
			"Yellow",
			"Smooth Sun Crystal",
			{["Critical Strike Rating"] = 12},
		},
		[3383] = {
			"Yellow",
			"Rigid Sun Crystal",
			{["Hit Rating"] = 12},
		},
		[3384] = {
			"Yellow",
			"Thick Sun Crystal",
			{["Defense Rating"] = 12},
		},
		[3385] = {
			"Yellow",
			"Mystic Sun Crystal",
			{["Resilience Rating"] = 12},
		},
		[3386] = {
			"Yellow",
			"Quick Sun Crystal",
			{["Haste Rating"] = 12},
		},
		[3387] = {
			"Blue",
			"Solid Chalcedony",
			{["Stamina"] = 18},
		},
		[3388] = {
			"Blue",
			"Sparkling Chalcedony",
			{["Spirit"] = 12},
		},
		[3389] = {
			"Blue",
			"Lustrous Chalcedony",
			{["MP5"] = 6},
		},
		[3391] = {
			"Purple",
			"Puissant Shadow Crystal",
			{["Armor Penetration Rating"] = 6, ["Stamina"] = 9},
		},
		[3392] = {
			"Purple",
			"Sovereign Shadow Crystal",
			{["Strength"] = 6, ["Stamina"] = 9},
		},
		[3393] = {
			"Purple",
			"Shifting Shadow Crystal",
			{["Agility"] = 6, ["Stamina"] = 9},
		},
		[3394] = {
			"Purple",
			"Glowing Shadow Crystal",
			{["Spell Power"] = 7, ["Stamina"] = 9},
		},
		[3395] = {
			"Purple",
			"Balanced Shadow Crystal",
			{["Attack Power"] = 12, ["Stamina"] = 9},
		},
		[3396] = {
			"Purple",
			"Regal Shadow Crystal",
			{["Dodge Rating"] = 6, ["Stamina"] = 9},
		},
		[3397] = {
			"Purple",
			"Defender's Shadow Crystal",
			{["Parry Rating"] = 6, ["Stamina"] = 9},
		},
		[3398] = {
			"Purple",
			"Guardian's Shadow Crystal",
			{["Expertise Rating"] = 6, ["Stamina"] = 9},
		},
		[3399] = {
			"Purple",
			"Purified Shadow Crystal",
			{["Spell Power"] = 7, ["Spirit"] = 6},
		},
		[3400] = {
			"Purple",
			"Tenuous Shadow Crystal",
			{["Agility"] = 6, ["MP5"] = 3},
		},
		[3401] = {
			"Purple",
			"Royal Shadow Crystal",
			{["Spell Power"] = 7, ["MP5"] = 3},
		},
		[3402] = {
			"Purple",
			"Infused Shadow Crystal",
			{["Attack Power"] = 12, ["MP5"] = 3},
		},
		[3403] = {
			"Purple",
			"Mysterious Shadow Crystal",
			{["Spell Power"] = 7, ["Spell Penetration"] = 8},
		},
		[3404] = {
			"Orange",
			"Luminous Huge Citrine",
			{["Spell Power"] = 7, ["Intellect"] = 6},
		},
		[3405] = {
			"Orange",
			"Inscribed Huge Citrine",
			{["Strength"] = 6, ["Critical Strike Rating"] = 6},
		},
		[3406] = {
			"Orange",
			"Glinting Huge Citrine",
			{["Agility"] = 6, ["Hit Rating"] = 6},
		},
		[3407] = {
			"Orange",
			"Champion's Huge Citrine",
			{["Strength"] = 6, ["Defense Rating"] = 6},
		},
		[3408] = {
			"Orange",
			"Resplendent Huge Citrine",
			{["Strength"] = 6, ["Resilience Rating"] = 6},
		},
		[3409] = {
			"Orange",
			"Fierce Huge Citrine",
			{["Strength"] = 6, ["Haste Rating"] = 6},
		},
		[3410] = {
			"Orange",
			"Deadly Huge Ditrine",
			{["Agility"] = 6, ["Critical Strike Rating"] = 6},
		},
		[3411] = {
			"Orange",
			"Etched Huge Citrine",
			{["Strength"] = 6, ["Hit Rating"] = 6},
		},
		[3412] = {
			"Orange",
			"Lucent Huge Citrine",
			{["Agility"] = 6, ["Resilience Rating"] = 6},
		},
		[3413] = {
			"Orange",
			"Deft Huge Citrine",
			{["Agility"] = 6, ["Haste Rating"] = 6},
		},
		[3414] = {
			"Orange",
			"Potent Huge Citrine",
			{["Spell Power"] = 7, ["Critical Strike Rating"] = 6},
		},
		[3415] = {
			"Orange",
			"Veiled Huge Citrine",
			{["Spell Power"] = 7, ["Hit Rating"] = 6},
		},
		[3416] = {
			"Orange",
			"Durable Huge Citrine",
			{["Spell Power"] = 7, ["Resilience Rating"] = 6},
		},
		[3417] = {
			"Orange",
			"Reckless Huge Citrine",
			{["Spell Power"] = 7, ["Haste Rating"] = 6},
		},
		[3418] = {
			"Orange",
			"Swalwart Huge Citrine",
			{["Dodge Rating"] = 6, ["Defense Rating"] = 6},
		},
		[3419] = {
			"Orange",
			"Glimmering Huge Citrine",
			{["Parry Rating"] = 6, ["Defense Rating"] = 6},
		},
		[3420] = {
			"Orange",
			"Accurate Huge Citrine",
			{["Expertise Rating"] = 6, ["Hit Rating"] = 6},
		},
		[3421] = {
			"Orange",
			"Resolute Huge Citrine",
			{["Expertise Rating"] = 6, ["Defense Rating"] = 6},
		},
		[3422] = {
			"Orange",
			"Wicked Huge Citrine",
			{["Attack Power"] = 12, ["Critical Strike Rating"] = 6},
		},
		[3423] = {
			"Orange",
			"Pristine Huge Citrine",
			{["Attack Power"] = 12, ["Hit Rating"] = 6},
		},
		[3424] = {
			"Orange",
			"Empowered Huge Citrine",
			{["Attack Power"] = 12, ["Resilience Rating"] = 6},
		},
		[3426] = {
			"Orange",
			"Stark Huge Citrine",
			{["Attack Power"] = 12, ["Haste Rating"] = 6},
		},
		[3427] = {
			"Green",
			"Timeless Dark Jade",
			{["Intellect"] = 6, ["Stamina"] = 9},
		},
		[3428] = {
			"Green",
			"Jagged Dark Jade",
			{["Critical Strike Rating"] = 6, ["Stamina"] = 9},
		},
		[3429] = {
			"Green",
			"Vivid Dark Jade",
			{["Hit Rating"] = 6, ["Stamina"] = 9},
		},
		[3430] = {
			"Green",
			"Enduring Dark Jade",
			{["Defense Rating"] = 6, ["Stamina"] = 9},
		},
		[3431] = {
			"Green",
			"Steady Dark Jade",
			{["Resilience Rating"] = 6, ["Stamina"] = 9},
		},
		[3432] = {
			"Green",
			"Forceful Dark Jade",
			{["Haste Rating"] = 6, ["Stamina"] = 9},
		},
		[3433] = {
			"Green",
			"Seer's Dark Jade",
			{["Intellect"] = 6, ["Spirit"] = 6},
		},
		[3434] = {
			"Green",
			"Misty Dark Jade",
			{["Critical Strike Rating"] = 6, ["Spirit"] = 6},
		},
		[3435] = {
			"Green",
			"Shining Dark Jade",
			{["Hit Rating"] = 6, ["Spirit"] = 6},
		},
		[3436] = {
			"Green",
			"Turbid Dark Jade",
			{["Resilience Rating"] = 6, ["Spirit"] = 6},
		},
		[3437] = {
			"Green",
			"Intricate Dark Jade",
			{["Haste Rating"] = 6, ["Spirit"] = 6},
		},
		[3438] = {
			"Green",
			"Dazzling Dark Jade",
			{["Intellect"] = 6, ["MP5"] = 3},
		},
		[3439] = {
			"Green",
			"Sundered Dark Jade",
			{["Critical Strike Rating"] = 6, ["MP5"] = 3},
		},
		[3440] = {
			"Green",
			"Lambent Dark Jade",
			{["Hit Rating"] = 6, ["MP5"] = 3},
		},
		[3441] = {
			"Green",
			"Opaque Dark Jade",
			{["Resilience Rating"] = 6, ["MP5"] = 3},
		},
		[3442] = {
			"Green",
			"Energized Dark Jade",
			{["Haste Rating"] = 6, ["MP5"] = 3},
		},
		[3443] = {
			"Green",
			"Sundered Dark Jade",
			{["Critical Strike Rating"] = 6, ["Spell Penetration"] = 8},
		},
		[3444] = {
			"Green",
			"Tense Dark Jade",
			{["Hit Rating"] = 6, ["Spell Penetration"] = 8},
		},
		[3445] = {
			"Green",
			"Shattered Dark Jade",
			{["Haste Rating"] = 6, ["Spell Penetration"] = 8},
		},
	},
	[7] = {
		[3644] = {
			"Red",
			"Perfect Delicate Bloodstone",
			{["Agility"] = 14},
		},
		[3646] = {
			"Red",
			"Perfect Subtle Bloodstone",
			{["Dodge Rating"] = 14},
		},
		[3647] = {
			"Red",
			"Perfect Precise Bloodstone",
			{["Expertise Rating"] = 14},
		},
		[3648] = {
			"Red",
			"Perfect Flashing Bloodstone",
			{["Parry Rating"] = 14},
		},
		[3649] = {
			"Red",
			"Perfect Bold Bloodstone",
			{["Strength"] = 14},
		},
		[3650] = {
			"Red",
			"Perfect Runed Bloodstone",
			{["Spell Power"] = 16},
		},
		[3651] = {
			"Red",
			"Perfect Bright Bloodstone",
			{["Attack Power"] = 28},
		},
		[3652] = {
			"Red",
			"Perfect Fractured Bloodstone",
			{["Armor Penetration Rating"] = 14},
		},
		[3653] = {
			"Blue",
			"Perfect Sparkling Chalcedony",
			{["Spirit"] = 14},
		},
		[3654] = {
			"Blue",
			"Perfect Lustrous Chalcedony",
			{["MP5"] = 7},
		},
		[3655] = {
			"Blue",
			"Perfect Solid Chalcedony",
			{["Stamina"] = 21},
		},
		[3656] = {
			"Blue",
			"Perfect Stormy Chalcedony",
			{["Spell Penetration"] = 18},
		},
		[3657] = {
			"Yellow",
			"Perfect Smooth Sun Crystal",
			{["Critical Strike Rating"] = 14},
		},
		[3658] = {
			"Yellow",
			"Perfect Thick Sun Crystal",
			{["Defense Rating"] = 14},
		},
		[3659] = {
			"Yellow",
			"Perfect Quick Sun Crystal",
			{["Haste Rating"] = 14},
		},
		[3660] = {
			"Yellow",
			"Perfect Rigid Sun Crystal",
			{["Hit Rating"] = 14},
		},
		[3661] = {
			"Yellow",
			"Perfect Brilliant Sun Crystal",
			{["Intellect"] = 14},
		},
		[3662] = {
			"Yellow",
			"Perfect Mystic Sun Crystal",
			{["Resilience Rating"] = 14},
		},
		[3663] = {
			"Purple",
			"Perfect Infused Shadow Crystal",
			{["Attack Power"] = 14, ["MP5"] = 4},
		},
		[3664] = {
			"Purple",
			"Perfect Balanced Shadow Crystal",
			{["Attack Power"] = 14, ["Stamina"] = 11},
		},
		[3665] = {
			"Purple",
			"Perfect Puissant Shadow Crystal",
			{["Armor Penetration Rating"] = 7, ["Stamina"] = 11},
		},
		[3666] = {
			"Purple",
			"Perfect Tenuous Shadow Crystal",
			{["Agility"] = 7, ["MP5"] = 4},
		},
		[3667] = {
			"Purple",
			"Perfect Shifting Shadow Crystal",
			{["Agility"] = 7, ["Stamina"] = 11},
		},
		[3668] = {
			"Purple",
			"Perfect Regal Shadow Crystal",
			{["Dodge Rating"] = 7, ["Stamina"] = 11},
		},
		[3669] = {
			"Purple",
			"Perfect Guardian's Shadow Crystal",
			{["Expertise Rating"] = 7, ["Stamina"] = 11},
		},
		[3670] = {
			"Purple",
			"Perfect Defender's Shadow Crystal",
			{["Parry Rating"] = 7, ["Stamina"] = 11},
		},
		[3671] = {
			"Purple",
			"Perfect Sovereign Shadow Crystal",
			{["Strength"] = 7, ["Stamina"] = 11},
		},
		[3672] = {
			"Purple",
			"Perfect Royal Shadow Crystal",
			{["Spell Power"] = 8, ["MP5"] = 4},
		},
		[3673] = {
			"Purple",
			"Perfect Purified Shadow Crystal",
			{["Spell Power"] = 8, ["Spirit"] = 7},
		},
		[3674] = {
			"Purple",
			"Perfect Mysterious Shadow Crystal",
			{["Spell Power"] = 8, ["Spell Penetration"] = 9},
		},
		[3675] = {
			"Purple",
			"Perfect Glowing Shadow Crystal",
			{["Spell Power"] = 8, ["Stamina"] = 11},
		},
		[3677] = {
			"Orange",
			"Perfect Deft Huge Citrine",
			{["Agility"] = 7, ["Haste Rating"] = 7},
		},
		[3678] = {
			"Orange",
			"Perfect Stark Huge Citrine",
			{["Attack Power"] = 14, ["Haste Rating"] = 7},
		},
		[3679] = {
			"Orange",
			"Perfect Pristine Huge Citrine",
			{["Attack Power"] = 14, ["Hit Rating"] = 7},
		},
		[3680] = {
			"Orange",
			"Perfect Empowered Huge Citrine",
			{["Attack Power"] = 14, ["Resilience Rating"] = 7},
		},
		[3681] = {
			"Orange",
			"Perfect Inscribed Huge Citrine",
			{["Strength"] = 7, ["Critical Strike Rating"] = 7},
		},
		[3682] = {
			"Orange",
			"Perfect Etched Huge Citrine",
			{["Strength"] = 7, ["Hit Rating"] = 7},
		},
		[3683] = {
			"Orange",
			"Perfect Champion's Huge Citrine",
			{["Strength"] = 7, ["Defense Rating"] = 7},
		},
		[3684] = {
			"Orange",
			"Perfect Resplendent Huge Citrine",
			{["Strength"] = 7, ["Resilience Rating"] = 7},
		},
		[3685] = {
			"Orange",
			"Perfect Fierce Huge Citrine",
			{["Strength"] = 7, ["Haste Rating"] = 7},
		},
		[3686] = {
			"Orange",
			"Perfect Deadly Huge Citrine",
			{["Agility"] = 7, ["Critical Strike Rating"] = 7},
		},
		[3687] = {
			"Orange",
			"Perfect Glinting Huge Citrine",
			{["Agility"] = 7, ["Hit Rating"] = 7},
		},
		[3688] = {
			"Orange",
			"Perfect Lucent Huge Citrine",
			{["Agility"] = 7, ["Resilience Rating"] = 7},
		},
		[3689] = {
			"Orange",
			"Perfect Luminous Huge Citrine",
			{["Spell Power"] = 8, ["Intellect"] = 7},
		},
		[3690] = {
			"Orange",
			"Perfect Potent Huge Citrine",
			{["Spell Power"] = 8, ["Critical Strike Rating"] = 7},
		},
		[3691] = {
			"Orange",
			"Perfect Veiled Huge Citrine",
			{["Spell Power"] = 8, ["Hit Rating"] = 7},
		},
		[3692] = {
			"Orange",
			"Perfect Durable Huge Citrine",
			{["Spell Power"] = 8, ["Resilience Rating"] = 7},
		},
		[3693] = {
			"Orange",
			"Perfect Reckless Huge Citrine",
			{["Spell Power"] = 8, ["Haste Rating"] = 7},
		},
		[3694] = {
			"Orange",
			"Perfect Stalwart Huge Citrine",
			{["Dodge Rating"] = 7, ["Defense Rating"] = 7},
		},
		[3695] = {
			"Orange",
			"Perfect Glimmering Huge Citrine",
			{["Parry Rating"] = 7, ["Defense Rating"] = 7},
		},
		[3696] = {
			"Orange",
			"Perfect Accurate Huge Citrine",
			{["Expertise Rating"] = 7, ["Hit Rating"] = 7},
		},
		[3697] = {
			"Orange",
			"Perfect Resolute Huge Citrine",
			{["Expertise Rating"] = 7, ["Defense Rating"] = 7},
		},
		[3698] = {
			"Green",
			"Perfect Misty Dark Jade",
			{["Critical Strike Rating"] = 7, ["Spirit"] = 7},
		},
		[3699] = {
			"Green",
			"Perfect Jagged Dark Jade",
			{["Critical Strike Rating"] = 7, ["Stamina"] = 11},
		},
		[3700] = {
			"Green",
			"Perfect Enduring Dark Jade",
			{["Defense Rating"] = 7, ["Stamina"] = 11},
		},
		[3701] = {
			"Green",
			"Perfect Intricate Dark Jade",
			{["Haste Rating"] = 7, ["Spirit"] = 7},
		},
		[3702] = {
			"Green",
			"Perfect Forceful Dark Jade",
			{["Haste Rating"] = 7, ["Stamina"] = 11},
		},
		[3703] = {
			"Green",
			"Perfect Shining Dark Jade",
			{["Hit Rating"] = 7, ["Spirit"] = 7},
		},
		[3704] = {
			"Green",
			"Perfect Vivid Dark Jade",
			{["Hit Rating"] = 7, ["Stamina"] = 11},
		},
		[3705] = {
			"Green",
			"Perfect Seer's Dark Jade",
			{["Intellect"] = 7, ["Spirit"] = 7},
		},
		[3706] = {
			"Green",
			"Perfect Timeless Dark Jade",
			{["Intellect"] = 7, ["Stamina"] = 11},
		},
		[3707] = {
			"Green",
			"Perfect Turbid Dark Jade",
			{["Resilience Rating"] = 7, ["Spirit"] = 7},
		},
		[3708] = {
			"Green",
			"Perfect Steady Dark Jade",
			{["Resilience Rating"] = 7, ["Stamina"] = 11},
		},
		[3709] = {
			"Green",
			"Perfect Radiant Dark Jade",
			{["Critical Strike Rating"] = 7, ["Spell Penetration"] = 9},
		},
		[3710] = {
			"Green",
			"Perfect Sundered Dark Jade",
			{["Critical Strike Rating"] = 7, ["MP5"] = 4},
		},
		[3711] = {
			"Green",
			"Perfect Dazzling Dark Jade",
			{["Intellect"] = 7, ["MP5"] = 4},
		},
		[3712] = {
			"Green",
			"Perfect Lambent Dark Jade",
			{["Hit Rating"] = 7, ["MP5"] = 4},
		},
		[3713] = {
			"Green",
			"Perfect Opaque Dark Jade",
			{["Resilience Rating"] = 7, ["MP5"] = 4},
		},
		[3714] = {
			"Green",
			"Perfect Energized Dark Jade",
			{["Haste Rating"] = 7, ["MP5"] = 4},
		},
		[3715] = {
			"Green",
			"Perfect Tense Dark Jade",
			{["Hit Rating"] = 7, ["Spell Penetration"] = 9},
		},
		[3716] = {
			"Green",
			"Perfect Shattered Dark Jade",
			{["Haste Rating"] = 7, ["Spell Penetration"] = 9},
		},
		[3767] = {
			"Orange",
			"Perfect Wicked Huge Citrine",
			{["Attack Power"] = 14, ["Critical Strike Rating"] = 7},
		},
	},
	[8] = {
		[3446] = {
			"Red",
			"Bold Scarlet Ruby",
			{["Strength"] = 16},
		},
		[3447] = {
			"Red",
			"Delicate Scarlet Ruby",
			{["Agility"] = 16},
		},
		[3448] = {
			"Red",
			"Runed Scarlet Ruby",
			{["Spell Power"] = 19},
		},
		[3449] = {
			"Red",
			"Bright Scarlet Ruby",
			{["Attack Power"] = 32},
		},
		[3450] = {
			"Red",
			"Subtle Scarlet Ruby",
			{["Dodge Rating"] = 16},
		},
		[3451] = {
			"Red",
			"Flashing Scarlet Ruby",
			{["Parry Rating"] = 16},
		},
		[3452] = {
			"Red",
			"Fractured Scarlet Ruby",
			{["Armor Penetration Rating"] = 16},
		},
		[3453] = {
			"Red",
			"Precise Scarlet Ruby",
			{["Expertise Rating"] = 16},
		},
		[3454] = {
			"Blue",
			"Solid Sky Sapphire",
			{["Stamina"] = 24},
		},
		[3455] = {
			"Blue",
			"Sparkling Sky Sapphire",
			{["Spirit"] = 16},
		},
		[3456] = {
			"Blue",
			"Lustrous Sky Sapphire",
			{["MP5"] = 8},
		},
		[3457] = {
			"Blue",
			"Stormy Sky Sapphire",
			{["Spell Penetration"] = 20},
		},
		[3458] = {
			"Yellow",
			"Brilliant Autumn's Glow",
			{["Intellect"] = 16},
		},
		[3459] = {
			"Yellow",
			"Smooth Autumn's Glow",
			{["Critical Strike Rating"] = 16},
		},
		[3460] = {
			"Yellow",
			"Rigid Autumn's Glow",
			{["Hit Rating"] = 16},
		},
		[3461] = {
			"Yellow",
			"Thick Autumn's Glow",
			{["Defense Rating"] = 16},
		},
		[3462] = {
			"Yellow",
			"Mystic Autumn's Glow",
			{["Resilience Rating"] = 16},
		},
		[3463] = {
			"Yellow",
			"Quick Autumn's Glow",
			{["Haste Rating"] = 16},
		},
		[3464] = {
			"Purple",
			"Sovereign Twilight Opal",
			{["Strength"] = 8, ["Stamina"] = 12},
		},
		[3465] = {
			"Purple",
			"Shifting Twilight Opal",
			{["Agility"] = 8, ["Stamina"] = 12},
		},
		[3466] = {
			"Purple",
			"Glowing Twilight Opal",
			{["Spell Power"] = 9, ["Stamina"] = 12},
		},
		[3467] = {
			"Purple",
			"Balanced Twilight Opal",
			{["Attack Power"] = 16, ["Stamina"] = 12},
		},
		[3468] = {
			"Purple",
			"Regal Twilight Opal",
			{["Dodge Rating"] = 8, ["Stamina"] = 12},
		},
		[3469] = {
			"Purple",
			"Defender's Twilight Opal",
			{["Parry Rating"] = 8, ["Stamina"] = 12},
		},
		[3470] = {
			"Purple",
			"Pusiiant Twilight Opal",
			{["Armor Penetration Rating"] = 8, ["Stamina"] = 12},
		},
		[3471] = {
			"Purple",
			"Guardian's Twilight Opal",
			{["Expertise Rating"] = 8, ["Stamina"] = 12},
		},
		[3472] = {
			"Purple",
			"Purified Twilight Opal",
			{["Spell Power"] = 9, ["Spirit"] = 8},
		},
		[3473] = {
			"Purple",
			"Royal Twilight Opal",
			{["Spell Power"] = 9, ["MP5"] = 4},
		},
		[3474] = {
			"Purple",
			"Tenuous Twilight Opal",
			{["Agility"] = 8, ["MP5"] = 4},
		},
		[3475] = {
			"Purple",
			"Infused Twilight Opal",
			{["Attack Power"] = 16, ["MP5"] = 4},
		},
		[3476] = {
			"Purple",
			"Mysterious Twilight Opal",
			{["Spell Power"] = 9, ["Spell Penetration"] = 10},
		},
		[3477] = {
			"Orange",
			"Inscribed Monarch Topaz",
			{["Strength"] = 8, ["Critical Strike Rating"] = 8},
		},
		[3478] = {
			"Orange",
			"Etched Monarch Topaz",
			{["Strength"] = 8, ["Hit Rating"] = 8},
		},
		[3479] = {
			"Orange",
			"Champion's Monarch Topaz",
			{["Strength"] = 8, ["Defense Rating"] = 8},
		},
		[3480] = {
			"Orange",
			"Resplendent Monarch Topaz",
			{["Strength"] = 8, ["Resilience Rating"] = 8},
		},
		[3481] = {
			"Orange",
			"Fierce Monarch Topaz",
			{["Strength"] = 8, ["Haste Rating"] = 8},
		},
		[3482] = {
			"Orange",
			"Deadly Monarch Topaz",
			{["Agility"] = 8, ["Critical Strike Rating"] = 8},
		},
		[3483] = {
			"Orange",
			"Glinting Monarch Topaz",
			{["Agility"] = 8, ["Hit Rating"] = 8},
		},
		[3484] = {
			"Orange",
			"Lucent Monarch Topaz",
			{["Agility"] = 8, ["Resilience Rating"] = 8},
		},
		[3485] = {
			"Orange",
			"Deft Monarch Topaz",
			{["Agility"] = 8, ["Haste Rating"] = 8},
		},
		[3486] = {
			"Orange",
			"Luminous Monarch Topaz",
			{["Spell Power"] = 9, ["Intellect"] = 8},
		},
		[3487] = {
			"Orange",
			"Potent Monarch Topaz",
			{["Spell Power"] = 9, ["Critical Strike Rating"] = 8},
		},
		[3488] = {
			"Orange",
			"Veiled Monarch Topaz",
			{["Spell Power"] = 9, ["Hit Rating"] = 8},
		},
		[3489] = {
			"Orange",
			"Durable Monarch Topaz",
			{["Spell Power"] = 9, ["Resilience Rating"] = 8},
		},
		[3490] = {
			"Orange",
			"Reckless Monarch Topaz",
			{["Spell Power"] = 9, ["Haste Rating"] = 8},
		},
		[3491] = {
			"Orange",
			"Wicked Monarch Topaz",
			{["Attack Power"] = 16, ["Critical Strike Rating"] = 8},
		},
		[3492] = {
			"Orange",
			"Pristine Monarch Topaz",
			{["Attack Power"] = 16, ["Hit Rating"] = 8},
		},
		[3493] = {
			"Orange",
			"Empowered Monarch Topaz",
			{["Attack Power"] = 16, ["Resilience Rating"] = 8},
		},
		[3494] = {
			"Orange",
			"Stark Monarch Topaz",
			{["Attack Power"] = 16, ["Haste Rating"] = 8},
		},
		[3495] = {
			"Orange",
			"Stalwart Monarch Topaz",
			{["Dodge Rating"] = 8, ["Defense Rating"] = 8},
		},
		[3496] = {
			"Orange",
			"Glimmering Monarch Topaz",
			{["Parry Rating"] = 8, ["Defense Rating"] = 8},
		},
		[3497] = {
			"Orange",
			"Accurate Monarch Topaz",
			{["Expertise Rating"] = 8, ["Hit Rating"] = 8},
		},
		[3498] = {
			"Orange",
			"Resolute Monarch Topaz",
			{["Expertise Rating"] = 8, ["Defense Rating"] = 8},
		},
		[3499] = {
			"Green",
			"Timeless Forest Emerald",
			{["Intellect"] = 8, ["Stamina"] = 12},
		},
		[3500] = {
			"Green",
			"Jagged Forest Emerald",
			{["Critical Strike Rating"] = 8, ["Stamina"] = 12},
		},
		[3501] = {
			"Green",
			"Vivid Forest Emerald",
			{["Hit Rating"] = 8, ["Stamina"] = 12},
		},
		[3502] = {
			"Green",
			"Enduring Forest Emerald",
			{["Defense Rating"] = 8, ["Stamina"] = 12},
		},
		[3503] = {
			"Green",
			"Steady Forest Emerald",
			{["Resilience Rating"] = 8, ["Stamina"] = 12},
		},
		[3504] = {
			"Green",
			"Forceful Forest Emerald",
			{["Haste Rating"] = 8, ["Stamina"] = 12},
		},
		[3505] = {
			"Green",
			"Seer's Forest Emerald",
			{["Intellect"] = 8, ["Spirit"] = 8},
		},
		[3506] = {
			"Green",
			"Misty Forest Emerald",
			{["Critical Strike Rating"] = 8, ["Spirit"] = 8},
		},
		[3507] = {
			"Green",
			"Shining Forest Emerald",
			{["Hit Rating"] = 8, ["Spirit"] = 8},
		},
		[3508] = {
			"Green",
			"Turbid Forest Emerald",
			{["Resilience Rating"] = 8, ["Spirit"] = 8},
		},
		[3509] = {
			"Green",
			"Intricate Forest Emerald",
			{["Haste Rating"] = 8, ["Spirit"] = 8},
		},
		[3510] = {
			"Green",
			"Dazzling Forest Emerald",
			{["Intellect"] = 8, ["MP5"] = 4},
		},
		[3511] = {
			"Green",
			"Sundered Forest Emerald",
			{["Critical Strike Rating"] = 8, ["MP5"] = 4},
		},
		[3512] = {
			"Green",
			"Lambent Forest Emerald",
			{["Hit Rating"] = 8, ["MP5"] = 4},
		},
		[3513] = {
			"Green",
			"Opaque Forest Emerald",
			{["Resilience Rating"] = 8, ["MP5"] = 4},
		},
		[3514] = {
			"Green",
			"Energized Forest Emerald",
			{["Haste Rating"] = 8, ["MP5"] = 4},
		},
		[3515] = {
			"Green",
			"Radiant Forest Emerald",
			{["Critical Strike Rating"] = 8, ["Spell Penetration"] = 10},
		},
		[3516] = {
			"Green",
			"Tense Forest Emerald",
			{["Hit Rating"] = 8, ["Spell Penetration"] = 10},
		},
		[3517] = {
			"Green",
			"Shattered Forest Emerald",
			{["Haste Rating"] = 8, ["Spell Penetration"] = 10},
		},
		[3621] = {
			"Meta",
			"Chaotic Skyflare Diamond",
			{["Critical Strike Rating"] = 21, ["Critical Damage (Percent)"] = 3},
		},
		[3622] = {
			"Meta",
			"Destructive Skyflare Diamond",
			{["Critical Strike Rating"] = 25, ["Spell Reflect (Percent)"] = 1},
		},
		[3623] = {
			"Meta",
			"Ember Skyflare Diamond",
			{["Spell Power"] = 25, ["Intellect (Percent)"] = 2},
		},
		[3624] = {
			"Meta",
			"Egnimatic Skyflare Diamond",
			{["Critical Strike Rating"] = 21, ["Snare/Root Duration Reduction (Percent)"] = 10},
		},
		[3625] = {
			"Meta",
			"Swift Skyflare Diamond",
			{["Attack Power"] = 42, ["Minor Run Speed"] = 1},
		},
		[3626] = {
			"Meta",
			"Bracing Earthsiege Diamond",
			{["Spell Power"] = 25, ["Threat Reduction (Percent)"] = 2},
		},
		[3627] = {
			"Meta",
			"Insightful Earthsiege Diamond",
			{["Intellect"] = 21, ["Chance to Restore Mana on Spellcast"] = 1},
		},
		[3628] = {
			"Meta",
			"Relentless Earthsiege Diamond",
			{["Agility"] = 21, ["Critical Damage (Percent)"] = 3},
		},
		[3631] = {
			"Meta",
			"Eternal Earthsiege Diamond",
			{["Defense Rating"] = 21, ["Block Value (Percent)"] = 5},
		},
		[3632] = {
			"Meta",
			"Tireless Skyflare Diamond",
			{["Spell Power"] = 25, ["Minor Run Speed"] = 1},
		},
		[3633] = {
			"Meta",
			"Revitalizing Skyflare Diamond",
			{["MP5"] = 11, ["Critical Healing (Percent)"] = 3},
		},
		[3634] = {
			"Meta",
			"Effulgent Skyflare Diamond",
			{["Stamina"] = 32, ["Spell Damage Taken Reduction (Percent)"] = 2},
		},
		[3635] = {
			"Meta",
			"Forlorn Skyflare Diamond",
			{["Spell Power"] = 25, ["Silence Duration Reduction (Percent)"] = 10},
		},
		[3636] = {
			"Meta",
			"Impassive Skyflare Diamond",
			{["Critical Strike Rating"] = 21, ["Fear Duration Reduction (Percent)"] = 10},
		},
		[3637] = {
			"Meta",
			"Austere Earthsiege Diamond",
			{["Stamina"] = 32, ["Armor from Items (Percent)"] = 2},
		},
		[3638] = {
			"Meta",
			"Persistent Earthsiege Diamond",
			{["Attack Power"] = 42, ["Stun Duration Reduction (Percent)"] = 10},
		},
		[3639] = {
			"Meta",
			"Trenchant Earthsiege Diamond",
			{["Spell Power"] = 25, ["Stun Duration Reduction (Percent)"] = 10},
		},
		[3640] = {
			"Meta",
			"Invigorating Earthsiege Diamond",
			{["Attack Power"] = 42, ["Sometimes Heal on Your Crits"] = 1},
		},
		[3641] = {
			"Meta",
			"Beaming Earthsiege Diamond",
			{["Critical Strike Rating"] = 21, ["Mana (Percent)"] = 2},
		},
		[3642] = {
			"Meta",
			"Powerful Earthsiege Diamond",
			{["Stamina"] = 32, ["Stun Duration Reduction (Percent)"] = 10},
		},
		[3643] = {
			"Meta",
			"Thundering Skyflare Diamond",
			{["Chance to Increase Physical Haste"] = 1},
		},
		[3798] = {
			"Meta",
			"Swift Starflare Diamond",
			{["Attack Power"] = 34, ["Minor Run Speed"] = 1},
		},
		[3799] = {
			"Meta",
			"Tireless Starflare Diamond",
			{["Spell Power"] = 20, ["Minor Run Speed"] = 1},
		},
		[3800] = {
			"Meta",
			"Impassive Starflare Diamond",
			{["Critical Strike Rating"] = 17, ["Fear Duration Reduction (Percent)"] = 10},
		},
		[3801] = {
			"Meta",
			"Egnimatic Starflare Diamond",
			{["Critical Strike Rating"] = 17, ["Snare/Root Duration Reduction (Percent)"] = 10},
		},
		[3802] = {
			"Meta",
			"Forlorn Starflare Diamond",
			{["Spell Power"] = 20, ["Silence Duration Reduction (Percent)"] = 10},
		},
		[3803] = {
			"Meta",
			"Persistent Earthshatter Diamond",
			{["Attack Power"] = 34, ["Stun Duration Reduction (Percent)"] = 10},
		},
		[3804] = {
			"Meta",
			"Powerful Earthshatter Diamond",
			{["Stamina"] = 26, ["Stun Duration Reduction (Percent)"] = 10},
		},
		[3805] = {
			"Meta",
			"Trenchant Earthshatter Diamond",
			{["Spell Power"] = 20, ["Stun Duration Reduction (Percent)"] = 10},
		},
	},
	[9] = {
		[3518] = {
			"Red",
			"Bold Cardinal Ruby",
			{["Strength"] = 20},
		},
		[3519] = {
			"Red",
			"Delicate Cardinal Ruby",
			{["Agility"] = 20},
		},
		[3520] = {
			"Red",
			"Runed Cardinal Ruby",
			{["Spell Power"] = 23},
		},
		[3521] = {
			"Red",
			"Bright Cardinal Ruby",
			{["Attack Power"] = 40},
		},
		[3522] = {
			"Red",
			"Subtle Cardinal Ruby",
			{["Dodge Rating"] = 20},
		},
		[3523] = {
			"Red",
			"Flashing Cardinal Ruby",
			{["Parry Rating"] = 20},
		},
		[3524] = {
			"Red",
			"Precise Cardinal Ruby",
			{["Expertise Rating"] = 20},
		},
		[3525] = {
			"Red",
			"Fractured Cardinal Ruby",
			{["Armor Penetration Rating"] = 20},
		},
		[3526] = {
			"Yellow",
			"Brilliant King's Amber",
			{["Intellect"] = 20},
		},
		[3527] = {
			"Yellow",
			"Smooth King's Amber",
			{["Critical Strike Rating"] = 20},
		},
		[3528] = {
			"Yellow",
			"Rigid King's Amber",
			{["Hit Rating"] = 20},
		},
		[3529] = {
			"Yellow",
			"Thick King's Amber",
			{["Defense Rating"] = 20},
		},
		[3530] = {
			"Yellow",
			"Mystic King's Amber",
			{["Resilience Rating"] = 20},
		},
		[3531] = {
			"Yellow",
			"Quick King's Amber",
			{["Haste Rating"] = 20},
		},
		[3532] = {
			"Blue",
			"Solid Majestic Zircon",
			{["Stamina"] = 30},
		},
		[3533] = {
			"Blue",
			"Sparkling Majestic Zircon",
			{["Spirit"] = 20},
		},
		[3534] = {
			"Blue",
			"Lustrous Majestic Zircon",
			{["MP5"] = 10},
		},
		[3535] = {
			"Blue",
			"Stormy Majestic Zircon",
			{["Spell Penetration"] = 25},
		},
		[3536] = {
			"Purple",
			"Sovereign Dreadstone",
			{["Strength"] = 10, ["Stamina"] = 15},
		},
		[3537] = {
			"Purple",
			"Shifting Dreadstone",
			{["Agility"] = 10, ["Stamina"] = 15},
		},
		[3538] = {
			"Purple",
			"Glowing Dreadstone",
			{["Spell Power"] = 12, ["Stamina"] = 15},
		},
		[3539] = {
			"Purple",
			"Balanced Dreadstone",
			{["Attack Power"] = 20, ["Stamina"] = 15},
		},
		[3540] = {
			"Purple",
			"Regal Dreadstone",
			{["Dodge Rating"] = 10, ["Stamina"] = 15},
		},
		[3541] = {
			"Purple",
			"Defender's Dreadstone",
			{["Parry Rating"] = 10, ["Stamina"] = 15},
		},
		[3542] = {
			"Purple",
			"Guardian's Dreadstone",
			{["Expertise Rating"] = 10, ["Stamina"] = 15},
		},
		[3543] = {
			"Purple",
			"Puissant Dreadstone",
			{["Armor Penetration Rating"] = 10, ["Stamina"] = 15},
		},
		[3544] = {
			"Purple",
			"Tenuous Dreadstone",
			{["Agility"] = 10, ["MP5"] = 5},
		},
		[3545] = {
			"Purple",
			"Purified Dreadstone",
			{["Spell Power"] = 12, ["Spirit"] = 10},
		},
		[3546] = {
			"Purple",
			"Royal Dreadstone",
			{["Spell Power"] = 12, ["MP5"] = 5},
		},
		[3547] = {
			"Purple",
			"Infused Dreadstone",
			{["Attack Power"] = 20, ["MP5"] = 5},
		},
		[3548] = {
			"Purple",
			"Mysterious Dreadstone",
			{["Spell Power"] = 12, ["Spell Penetration"] = 13},
		},
		[3549] = {
			"Orange",
			"Inscribed Ametrine",
			{["Strength"] = 10, ["Critical Strike Rating"] = 10},
		},
		[3550] = {
			"Orange",
			"Etched Ametrine",
			{["Strength"] = 10, ["Hit Rating"] = 10},
		},
		[3551] = {
			"Orange",
			"Champion's Ametrine",
			{["Strength"] = 10, ["Defense Rating"] = 10},
		},
		[3552] = {
			"Orange",
			"Resplendent Ametrine",
			{["Strength"] = 10, ["Resilience Rating"] = 10},
		},
		[3553] = {
			"Orange",
			"Fierce Ametrine",
			{["Strength"] = 10, ["Haste Rating"] = 10},
		},
		[3554] = {
			"Orange",
			"Deadly Ametrine",
			{["Agility"] = 10, ["Critical Strike Rating"] = 10},
		},
		[3555] = {
			"Orange",
			"Glinting Ametrine",
			{["Agility"] = 10, ["Hit Rating"] = 10},
		},
		[3556] = {
			"Orange",
			"Lucent Ametrine",
			{["Agility"] = 10, ["Resilience Rating"] = 10},
		},
		[3557] = {
			"Orange",
			"Deft Ametrine",
			{["Agility"] = 10, ["Haste Rating"] = 10},
		},
		[3558] = {
			"Orange",
			"Luminous Ametrine",
			{["Spell Power"] = 12, ["Intellect"] = 10},
		},
		[3559] = {
			"Orange",
			"Potent Ametrine",
			{["Spell Power"] = 12, ["Critical Strike Rating"] = 10},
		},
		[3560] = {
			"Orange",
			"Veiled Ametrine",
			{["Spell Power"] = 12, ["Hit Rating"] = 10},
		},
		[3561] = {
			"Orange",
			"Durable Ametrine",
			{["Spell Power"] = 12, ["Resilience Rating"] = 10},
		},
		[3563] = {
			"Orange",
			"Reckless Ametrine",
			{["Spell Power"] = 12, ["Haste Rating"] = 10},
		},
		[3564] = {
			"Orange",
			"Wicked Ametrine",
			{["Attack Power"] = 20, ["Critical Strike Rating"] = 10},
		},
		[3565] = {
			"Orange",
			"Pristine Ametrine",
			{["Attack Power"] = 20, ["Hit Rating"] = 10},
		},
		[3566] = {
			"Orange",
			"Empowered Ametrine",
			{["Attack Power"] = 20, ["Resilience Rating"] = 10},
		},
		[3567] = {
			"Orange",
			"Stark Ametrine",
			{["Attack Power"] = 20, ["Haste Rating"] = 10},
		},
		[3568] = {
			"Orange",
			"Stalwart Ametrine",
			{["Dodge Rating"] = 10, ["Defense Rating"] = 10},
		},
		[3569] = {
			"Orange",
			"Glimmering Ametrine",
			{["Parry Rating"] = 10, ["Defense Rating"] = 10},
		},
		[3570] = {
			"Orange",
			"Accurate Ametrine",
			{["Expertise Rating"] = 10, ["Hit Rating"] = 10},
		},
		[3571] = {
			"Orange",
			"Resolute Ametrine",
			{["Expertise Rating"] = 10, ["Defense Rating"] = 10},
		},
		[3572] = {
			"Green",
			"Timeless Eye of Zul",
			{["Intellect"] = 10, ["Stamina"] = 15},
		},
		[3573] = {
			"Green",
			"Jagged Eye of Zul",
			{["Critical Strike Rating"] = 10, ["Stamina"] = 15},
		},
		[3574] = {
			"Green",
			"Vivid Eye of Zul",
			{["Hit Rating"] = 10, ["Stamina"] = 15},
		},
		[3575] = {
			"Green",
			"Enduring Eye of Zul",
			{["Defense Rating"] = 10, ["Stamina"] = 15},
		},
		[3576] = {
			"Green",
			"Steady Eye of Zul",
			{["Resilience Rating"] = 10, ["Stamina"] = 15},
		},
		[3577] = {
			"Green",
			"Forceful Eye of Zul",
			{["Haste Rating"] = 10, ["Stamina"] = 15},
		},
		[3578] = {
			"Green",
			"Seer's Eye of Zul",
			{["Intellect"] = 10, ["Spirit"] = 10},
		},
		[3579] = {
			"Green",
			"Misty Eye of Zul",
			{["Critical Strike Rating"] = 10, ["Spirit"] = 10},
		},
		[3580] = {
			"Green",
			"Shining Eye of Zul",
			{["Hit Rating"] = 10, ["Spirit"] = 10},
		},
		[3581] = {
			"Green",
			"Turbid Eye of Zul",
			{["Resilience Rating"] = 10, ["Spirit"] = 10},
		},
		[3582] = {
			"Green",
			"Intricate Eye of Zul",
			{["Haste Rating"] = 10, ["Spirit"] = 10},
		},
		[3583] = {
			"Green",
			"Dazzling Eye of Zul",
			{["Intellect"] = 10, ["MP5"] = 5},
		},
		[3584] = {
			"Green",
			"Sundered Eye of Zul",
			{["Critical Strike Rating"] = 10, ["MP5"] = 5},
		},
		[3585] = {
			"Green",
			"Lambent Eye of Zul",
			{["Hit Rating"] = 10, ["MP5"] = 5},
		},
		[3586] = {
			"Green",
			"Opaque Eye of Zul",
			{["Resilience Rating"] = 10, ["MP5"] = 5},
		},
		[3587] = {
			"Green",
			"Energized Eye of Zul",
			{["Haste Rating"] = 10, ["MP5"] = 5},
		},
		[3588] = {
			"Green",
			"Radiant Eye of Zul",
			{["Critical Strike Rating"] = 10, ["Spell Penetration"] = 13},
		},
		[3589] = {
			"Green",
			"Tense Eye of Zul",
			{["Hit Rating"] = 10, ["Spell Penetration"] = 13},
		},
		[3590] = {
			"Green",
			"Shattered Eye of Zul",
			{["Haste Rating"] = 10, ["Spell Penetration"] = 13},
		},
		[3792] = {
			"Yellow",
			"Kharmaa's Grace",
			{["Resilience Rating"] = 20},
		},
		[3861] = {
			"Red",
			"Bold Stormjewel",
			{["Strength"] = 20},
		},
		[3862] = {
			"Red",
			"Delicate Stormjewel",
			{["Agility"] = 20},
		},
		[3863] = {
			"Blue",
			"Solid Stormjewel",
			{["Stamina"] = 30},
		},
		[3864] = {
			"Blue",
			"Sparkling Stormjewel",
			{["Spirit"] = 20},
		},
		[3865] = {
			"Yellow",
			"Brilliant Stormjewel",
			{["Intellect"] = 20},
		},
		[3866] = {
			"Red",
			"Runed Stormjewel",
			{["Spell Power"] = 23},
		},
		[3867] = {
			"Yellow",
			"Rigid Stormjewel",
			{["Hit Rating"] = 20},
		},
	},
	[10] = {
		[3749] = {
			"Prismatic",
			"Enchanted Pearl",
			{["All Stats"] = 4},
		},
		[3750] = {
			"Prismatic",
			"Enchanted Tear",
			{["All Stats"] = 6},
		},
		[3879] = {
			"Prismatic",
			"Nightmare Tear",
			{["All Stats"] = 10},
		},
	},
	[11] = {
		[3292] = {
			"Red",
			"Bright Dragon's Eye",
			{["Attack Power"] = 68},
		},
		[3293] = {
			"Blue",
			"Solid Dragon's Eye",
			{["Stamina"] = 51},
		},
		[3732] = {
			"Red",
			"Bold Dragon's Eye",
			{["Strength"] = 34},
		},
		[3733] = {
			"Red",
			"Delicate Dragon's Eye",
			{["Agility"] = 34},
		},
		[3734] = {
			"Red",
			"Runed Dragon's Eye",
			{["Spell Power"] = 39},
		},
		[3735] = {
			"Blue",
			"Sparkling Dragon's Eye",
			{["Spirit"] = 34},
		},
		[3736] = {
			"Blue",
			"Lustrous Dragon's Eye",
			{["MP5"] = 17},
		},
		[3737] = {
			"Yellow",
			"Brilliant Dragon's Eye",
			{["Intellect"] = 34},
		},
		[3738] = {
			"Yellow",
			"Smooth Dragon's Eye",
			{["Critical Strike Rating"] = 34},
		},
		[3739] = {
			"Yellow",
			"Quick Dragon's Eye",
			{["Haste Rating"] = 34},
		},
		[3740] = {
			"Red",
			"Subtle Dragon's Eye",
			{["Dodge Rating"] = 34},
		},
		[3741] = {
			"Red",
			"Flashing Dragon's Eye",
			{["Parry Rating"] = 34},
		},
		[3742] = {
			"Yellow",
			"Rigid Dragon's Eye",
			{["Hit Rating"] = 34},
		},
		[3743] = {
			"Yellow",
			"Thick Dragon's Eye",
			{["Defense Rating"] = 34},
		},
		[3744] = {
			"Yellow",
			"Mystic Dragon's Eye",
			{["Resilience Rating"] = 34},
		},
		[3745] = {
			"Red",
			"Fractured Dragon's Eye",
			{["Armor Penetration Rating"] = 34},
		},
		[3746] = {
			"Red",
			"Precise Dragon's Eye",
			{["Expertise Rating"] = 34},
		},
		[3747] = {
			"Blue",
			"Stormy Dragon's Eye",
			{["Spell Penetration"] = 43},
		},
	},
}

GemQualities = {}

for quality, gems in ipairs(GemIds) do
	for gemId, _ in pairs(gems)
		GemQualities[gemId] = quality
	end
end

function WeightsWatcher:GemInfo(gemId)
	if type(gemId) == "string" then
		gemId = tonumber(gemId)
	end
	local quality = GemQualities[gemId]
	return quality, GemIds[quality][gemId]
end
