local L = ww_localizedStats

-- format:
-- 	[source] = {
--  	[type] = {
--  		[quality] = {
--  			[gemId] = {
--  				"color",
--  				"name",
--  				{stats},
--  			}
--  		}
--  	}
-- 	}
--
-- sources:
-- 	Vendor: purchasable w/ gold
-- 	PVP-Vendor: purchasable w/ pvp stuff
-- 	Crafted: crafted by players
-- 	Procced: procced via crafting
-- 	Drop: drops from a mob or zone
-- 	Quest: quest reward
--
-- types:
-- 	Normal: normal gems, no restrictions on their use
-- 	Unique-Equipped: Only one can be equipped at a time
-- 	Jewelcrafter-Only: Only jewelcrafters can use them
--
-- qualities:
-- 	1: BC white
-- 	2: BC green
-- 	3: BC blue
-- 	4: BC epic
-- 	5: wrath green
-- 	6: wrath blue
-- 	7: wrath epic

ww_gems = {
	["Vendor"] = {
		["Normal"] = {
			[1] = {
				[2956] = {
					"red",
					"Bold Tourmaline",
					{[L["strength"]] = 4},
				},
				[2957] = {
					"red",
					"Delicate Tourmaline",
					{[L["agility"]] = 4},
				},
				[2958] = {
					"red",
					"Teardrop Tourmaline",
					{[L["spell power"]] = 5},
				},
				[2959] = {
					"red",
					"Runed Tourmaline",
					{[L["spell power"]] = 5},
				},
				[2960] = {
					"red",
					"Bright Tourmaline",
					{[L["attack power"]] = 8},
				},
				[2961] = {
					"blue",
					"Solid Zircon",
					{[L["stamina"]] = 6},
				},
				[2962] = {
					"blue",
					"Sparkling Zircon",
					{[L["spirit"]] = 4},
				},
				[2963] = {
					"blue",
					"Lustrous Zircon",
					{[L["mp5"]] = 2},
				},
				[2964] = {
					"yellow",
					"Brilliant Amber",
					{[L["intellect"]] = 4},
				},
				[2965] = {
					"yellow",
					"Smooth Amber",
					{[L["critical strike rating"]] = 4},
				},
				[2966] = {
					"yellow",
					"Rigid Amber",
					{[L["hit rating"]] = 4},
				},
				[2967] = {
					"yellow",
					"Gleaming Amber",
					{[L["critical strike rating"]] = 4},
				},
				[2968] = {
					"yellow",
					"Thick Amber",
					{[L["defense rating"]] = 4},
				},
			},
		},
	},
	["Crafted"] = {
		["Normal"] = {
			[2] = {
				[2690] = {
					"red",
					"Teardrop Blood Garnet",
					{[L["spell power"]] = 7},
				},
				[2691] = {
					"red",
					"Bold Blood Garnet",
					{[L["strength"]] = 6},
				},
				[2692] = {
					"red",
					"Runed Blood Garnet",
					{[L["spell power"]] = 7},
				},
				[2693] = {
					"red",
					"Delicate Blood Garnet",
					{[L["agility"]] = 6},
				},
				[2694] = {
					"yellow",
					"Brilliant Golden Draenite",
					{[L["intellect"]] = 6},
				},
				[2695] = {
					"yellow",
					"Smooth Golden Draenite",
					{[L["critical strike rating"]] = 6},
				},
				[2696] = {
					"yellow",
					"Thick Golden Draenite",
					{[L["defense rating"]] = 6},
				},
				[2697] = {
					"yellow",
					"Rigid Golden Draenite",
					{[L["hit rating"]] = 6},
				},
				[2698] = {
					"blue",
					"Solid Azure Moonstone",
					{[L["stamina"]] = 9},
				},
				[2699] = {
					"blue",
					"Sparkling Azure Moonstone",
					{[L["spirit"]] = 6},
				},
				[2700] = {
					"blue",
					"Stormy Azure Moonstone",
					{[L["spell penetration"]] = 8},
				},
				[2701] = {
					"blue",
					"Lustrous Azure Moonstone",
					{[L["mp5"]] = 3},
				},
				[2705] = {
					"orange",
					"Luminous Flame Spessarite",
					{[L["spell power"]] = 4, [L["intellect"]] = 3},
				},
				[2706] = {
					"green",
					"Enduring Deep Peridot",
					{[L["defense rating"]] = 3, [L["stamina"]] = 4},
				},
				[2707] = {
					"green",
					"Dazzling Deep Peridot",
					{[L["intellect"]] = 3, [L["mp5"]] = 2},
				},
				[2708] = {
					"purple",
					"Glowing Shadow Draenite",
					{[L["spell power"]] = 4, [L["stamina"]] = 4},
				},
				[2709] = {
					"purple",
					"Royal Shadow Draenite",
					{[L["spell power"]] = 4, [L["mp5"]] = 2},
				},
				[2710] = {
					"purple",
					"Shifting Shadow Draenite",
					{[L["agility"]] = 3, [L["stamina"]] = 4},
				},
				[2711] = {
					"purple",
					"Sovereign Shadow Draenite",
					{[L["strength"]] = 3, [L["stamina"]] = 4},
				},
				[2752] = {
					"orange",
					"Inscribed Flame Spesarite",
					{[L["critical strike rating"]] = 3, [L["strength"]] = 3},
				},
				[2755] = {
					"orange",
					"Glinting Flame Spessarite",
					{[L["hit rating"]] = 3, [L["agility"]] = 3},
				},
				[2757] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike rating"]] = 3, [L["stamina"]] = 4},
				},
				[2760] = {
					"orange",
					"Potent Flame Spessarite",
					{[L["critical strike rating"]] = 3, [L["spell power"]] = 4},
				},
				[2762] = {
					"green",
					"Radiant Deep Peridot",
					{[L["critical strike rating"]] = 3, [L["spell penetration"]] = 4},
				},
				[2942] = {
					"yellow",
					"Gleaming Golden Draenite",
					{[L["critical strike rating"]] = 6},
				},
				[2971] = {
					"red",
					"Bright Blood Garnet",
					{[L["attack power"]] = 12},
				},
				[3104] = {
					"yellow",
					"Great Golden Draenite",
					{[L["hit rating"]] = 6},
				},
				[3106] = {
					"purple",
					"Balanced Shadow Draenite",
					{[L["attack power"]] = 6, [L["stamina"]] = 4},
				},
				[3108] = {
					"purple",
					"Infused Shadow Draenite",
					{[L["attack power"]] = 6, [L["mp5"]] = 1},
				},
				[3110] = {
					"orange",
					"Veiled Flame Spessarite",
					{[L["hit rating"]] = 3, [L["spell power"]] = 4},
				},
				[3113] = {
					"orange",
					"Wicked Flame Spessarite",
					{[L["critical strike rating"]] = 3, [L["attack power"]] = 6},
				},
				[3201] = {
					"purple",
					"Purified Jaggal Pearl",
					{[L["spell power"]] = 4, [L["spirit"]] = 3},
				},
			},
			[3] = {
				[2725] = {
					"red",
					"Bold Living Ruby",
					{[L["strength"]] = 8},
				},
				[2726] = {
					"red",
					"Delicate Living Ruby",
					{[L["agility"]] = 8},
				},
				[2727] = {
					"red",
					"Teardrop Living Ruby",
					{[L["spell power"]] = 9},
				},
				[2728] = {
					"red",
					"Runed Living Ruby",
					{[L["spell power"]] = 9},
				},
				[2729] = {
					"red",
					"Bright Living Ruby",
					{[L["attack power"]] = 16},
				},
				[2730] = {
					"red",
					"Subtle Living Ruby",
					{[L["dodge rating"]] = 8},
				},
				[2731] = {
					"blue",
					"Solid Star of Elune",
					{[L["stamina"]] = 12},
				},
				[2732] = {
					"blue",
					"Sparkling Star of Elune",
					{[L["spirit"]] = 8},
				},
				[2733] = {
					"blue",
					"Lustrous Star of Elune",
					{[L["mp5"]] = 4},
				},
				[2734] = {
					"yellow",
					"Brilliant Dawnstone",
					{[L["intellect"]] = 8},
				},
				[2735] = {
					"yellow",
					"Smooth Dawnstone",
					{[L["critical strike rating"]] = 8},
				},
				[2736] = {
					"yellow",
					"Gleaming Dawnstone",
					{[L["critical strike rating"]] = 8},
				},
				[2737] = {
					"yellow",
					"Thick Dawnstone",
					{[L["defense rating"]] = 8},
				},
				[2738] = {
					"purple",
					"Sovereign Nightseye",
					{[L["strength"]] = 4, [L["stamina"]] = 6},
				},
				[2739] = {
					"purple",
					"Shifting Nightseye",
					{[L["agility"]] = 4, [L["stamina"]] = 6},
				},
				[2740] = {
					"purple",
					"Glowing Nightseye",
					{[L["spell power"]] = 5, [L["stamina"]] = 6},
				},
				[2741] = {
					"purple",
					"Royal Nightseye",
					{[L["spell power"]] = 5, [L["mp5"]] = 2},
				},
				[2742] = {
					"orange",
					"Luminous Noble Topaz",
					{[L["spell power"]] = 5, [L["intellect"]] = 4},
				},
				[2743] = {
					"green",
					"Enduring Talasite",
					{[L["defense rating"]] = 4, [L["stamina"]] = 6},
				},
				[2744] = {
					"green",
					"Dazzling Talasite",
					{[L["intellect"]] = 4, [L["mp5"]] = 2},
				},
				[2753] = {
					"orange",
					"Inscribed Noble Topaz",
					{[L["critical strike rating"]] = 4, [L["strength"]] = 4},
				},
				[2754] = {
					"red",
					"Flashing Living Ruby",
					{[L["parry rating"]] = 8},
				},
				[2756] = {
					"orange",
					"Glinting Noble Topaz",
					{[L["hit rating"]] = 4, [L["agility"]] = 4},
				},
				[2758] = {
					"green",
					"Jagged Talasite",
					{[L["critical strike rating"]] = 4, [L["stamina"]] = 6},
				},
				[2759] = {
					"yellow",
					"Mystic Dawnstone",
					{[L["resilience rating"]] = 8},
				},
				[2761] = {
					"orange",
					"Potent Noble Topaz",
					{[L["critical strike rating"]] = 4, [L["spell power"]] = 5},
				},
				[2763] = {
					"green",
					"Radiant Talasite",
					{[L["critical strike rating"]] = 4, [L["spell penetration"]] = 5},
				},
				[2764] = {
					"yellow",
					"Great Dawnstone",
					{[L["hit rating"]] = 8},
				},
				[2765] = {
					"blue",
					"Stormy Star of Elune",
					{[L["spell penetration"]] = 10},
				},
				[2827] = {
					"meta",
					"Destructive Skyfire Diamond",
					{[L["critical strike rating"]] = 14, [L["spell reflect (percent)"]] = 1},
				},
				[2828] = {
					"meta",
					"Mystical Skyfire Diamond",
					{[L["chance to increase spell haste"]] = 1},
				},
				[2829] = {
					"meta",
					"Swift Skyfire Diamond",
					{[L["attack power"]] = 24, [L["minor run speed"]] = 1},
				},
				[2830] = {
					"meta",
					"Egnimatic Skyfire Diamond",
					{[L["critical strike rating"]] = 12, [L["snare/root duration reduction (percent)"]] = 10},
				},
				[2831] = {
					"meta",
					"Powerful Earthstorm Diamond",
					{[L["stamina"]] = 18, [L["stun duration reduction (percent)"]] = 15},
				},
				[2832] = {
					"meta",
					"Bracing Earthstorm Diamond",
					{[L["spell power"]] = 14, [L["threat reduction (percent)"]] = 2},
				},
				[2833] = {
					"meta",
					"Tenacious Earthstorm Diamond",
					{[L["defense rating"]] = 12, [L["chance to restore health on hit"]] = 1},
				},
				[2834] = {
					"meta",
					"Brutal Earthstorm Diamond",
					{[L["average melee weapon damage"]] = 3, [L["maximum melee weapon damage"]] = 3, [L["chance to stun target"]] = 1},
				},
				[2835] = {
					"meta",
					"Insightful Earthstorm Diamond",
					{[L["intellect"]] = 12, [L["chance to restore mana on spellcast"]] = 1},
				},
				[2947] = {
					"prismatic",
					"Prismatic Sphere",
					{[L["all resistances"]] = 3},
				},
				[3105] = {
					"yellow",
					"Rigid Dawnstone",
					{[L["hit rating"]] = 8},
				},
				[3107] = {
					"purple",
					"Balanced Nightseye",
					{[L["attack power"]] = 8, [L["stamina"]] = 6},
				},
				[3109] = {
					"purple",
					"Infused Nightseye",
					{[L["attack power"]] = 8, [L["mp5"]] = 2},
				},
				[3111] = {
					"orange",
					"Veiled Noble Topaz",
					{[L["hit rating"]] = 4, [L["spell power"]] = 5},
				},
				[3112] = {
					"orange",
					"Wicked Noble Topaz",
					{[L["critical strike rating"]] = 4, [L["attack power"]] = 8},
				},
				[3154] = {
					"meta",
					"Relentless Earthstorm Diamond",
					{[L["agility"]] = 12, [L["critical damage (percent)"]] = 3},
				},
				[3155] = {
					"meta",
					"Thundering Skyfire Diamond",
					{[L["chance to increase physical haste"]] = 1},
				},
				[3202] = {
					"purple",
					"Purified Shadow Pearl",
					{[L["spell power"]] = 5, [L["spirit"]] = 4},
				},
				[3226] = {
					"green",
					"Steady Talasite",
					{[L["resilience rating"]] = 4, [L["stamina"]] = 6},
				},
				[3261] = {
					"meta",
					"Chaotic Skyfire Diamond",
					{[L["critical strike rating"]] = 12, [L["critical damage (percent)"]] = 3},
				},
				[3270] = {
					"yellow",
					"Quick Dawnstone",
					{[L["haste rating"]] = 8},
				},
				[3271] = {
					"orange",
					"Reckless Noble Topaz",
					{[L["haste rating"]] = 4, [L["spell power"]] = 5},
				},
				[3272] = {
					"green",
					"Foreceful Talasite",
					{[L["haste rating"]] = 4, [L["stamina"]] = 6},
				},
				[3274] = {
					"meta",
					"Eternal Earthstorm Diamond",
					{[L["defense rating"]] = 12, [L["block value (percent)"]] = 5},
				},
				[3275] = {
					"meta",
					"Ember Skyfire Diamond",
					{[L["spell power"]] = 14, [L["intellect (percent)"]] = 2},
				},
				[3280] = {
					"purple",
					"Regal Nightseye",
					{[L["dodge rating"]] = 4, [L["stamina"]] = 6},
				},
			},
			[4] = {
				[2948] = {
					"prismatic",
					"Void Sphere",
					{[L["all resistances"]] = 4},
				},
				[3115] = {
					"red",
					"Bold Crimson Spinel",
					{[L["strength"]] = 10},
				},
				[3116] = {
					"red",
					"Delicate Crimson Spinel",
					{[L["agility"]] = 10},
				},
				[3117] = {
					"red",
					"Teardrop Crimson Spinel",
					{[L["spell power"]] = 12},
				},
				[3118] = {
					"red",
					"Runed Crimson Spinel",
					{[L["spell power"]] = 12},
				},
				[3119] = {
					"red",
					"Bright Crimson Spinel",
					{[L["attack power"]] = 20},
				},
				[3120] = {
					"red",
					"Subtle Crimson Spinel",
					{[L["dodge rating"]] = 10},
				},
				[3121] = {
					"red",
					"Flashing Crimson Spinel",
					{[L["parry rating"]] = 10},
				},
				[3122] = {
					"blue",
					"Solid Empyrean Sapphire",
					{[L["stamina"]] = 15},
				},
				[3123] = {
					"blue",
					"Sparkling Empyrean Sapphire",
					{[L["spirit"]] = 10},
				},
				[3124] = {
					"blue",
					"Lustrous Empyrean Sapphire",
					{[L["mp5"]] = 5},
				},
				[3125] = {
					"blue",
					"Stormy Empyrean Sapphire",
					{[L["spell penetration"]] = 13},
				},
				[3126] = {
					"yellow",
					"Brilliant Lionseye",
					{[L["intellect"]] = 10},
				},
				[3127] = {
					"yellow",
					"Smooth Lionseye",
					{[L["critical strike rating"]] = 10},
				},
				[3128] = {
					"yellow",
					"Rigid Lionseye",
					{[L["hit rating"]] = 10},
				},
				[3129] = {
					"yellow",
					"Gleaming Lionseye",
					{[L["critical strike rating"]] = 10},
				},
				[3130] = {
					"yellow",
					"Thick Lionseye",
					{[L["defense rating"]] = 10},
				},
				[3131] = {
					"yellow",
					"Mystic Lionseye",
					{[L["resilience rating"]] = 10},
				},
				[3132] = {
					"yellow",
					"Great Lionseye",
					{[L["hit rating"]] = 10},
				},
				[3133] = {
					"purple",
					"Sovereign Shadowsong Amethyst",
					{[L["strength"]] = 5, [L["stamina"]] = 7},
				},
				[3134] = {
					"purple",
					"Shifting Shadowsong Amethyst",
					{[L["agility"]] = 5, [L["stamina"]] = 7},
				},
				[3135] = {
					"purple",
					"Balanced Shadowsong Amethyst",
					{[L["attack power"]] = 10, [L["stamina"]] = 7},
				},
				[3136] = {
					"purple",
					"Infused Shadowsong Amethyst",
					{[L["attack power"]] = 10, [L["mp5"]] = 3},
				},
				[3137] = {
					"purple",
					"Glowing Shadowsong Amethyst",
					{[L["spell power"]] = 6, [L["stamina"]] = 7},
				},
				[3138] = {
					"purple",
					"Royal Shadowsong Amethyst",
					{[L["spell power"]] = 6, [L["mp5"]] = 3},
				},
				[3139] = {
					"orange",
					"Inscribed Pyrestone",
					{[L["critical strike rating"]] = 5, [L["strength"]] = 5},
				},
				[3140] = {
					"orange",
					"Potent Pyrestone",
					{[L["critical strike rating"]] = 5, [L["spell power"]] = 6},
				},
				[3141] = {
					"orange",
					"Luminous Pyrestone",
					{[L["spell power"]] = 6, [L["intellect"]] = 5},
				},
				[3142] = {
					"orange",
					"Glinting Pyrestone",
					{[L["hit rating"]] = 5, [L["agility"]] = 5},
				},
				[3143] = {
					"orange",
					"Shining Fire Opal",
					{[L["hit rating"]] = 5, [L["spell power"]] = 6},
				},
				[3144] = {
					"orange",
					"Wicked Pyrestone",
					{[L["critical strike rating"]] = 5, [L["attack power"]] = 10},
				},
				[3145] = {
					"green",
					"Enduring Seaspray Emerald",
					{[L["defense rating"]] = 5, [L["stamina"]] = 7},
				},
				[3146] = {
					"green",
					"Radiant Seaspray Emerald",
					{[L["critical strike rating"]] = 5, [L["spell penetration"]] = 6},
				},
				[3147] = {
					"green",
					"Dazzling Seaspray Emerald",
					{[L["intellect"]] = 5, [L["mp5"]] = 3},
				},
				[3148] = {
					"green",
					"Jagged Seaspray Emerald",
					{[L["critical strike rating"]] = 5, [L["stamina"]] = 7},
				},
				[3284] = {
					"green",
					"Steady Seaspray Emerald",
					{[L["resilience rating"]] = 5, [L["stamina"]] = 7},
				},
				[3285] = {
					"green",
					"Forceful Seaspray Emerald",
					{[L["haste rating"]] = 5, [L["stamina"]] = 7},
				},
				[3286] = {
					"orange",
					"Reckless Pyrestone",
					{[L["haste rating"]] = 5, [L["spell power"]] = 6},
				},
				[3287] = {
					"yellow",
					"Quick Lionseye",
					{[L["haste rating"]] = 10},
				},
				[3318] = {
					"purple",
					"Purified Shadowsong Amethyst",
					{[L["spell power"]] = 6, [L["spirit"]] = 5},
				},
			},
			[5] = {
				[3371] = {
					"red",
					"Bold Bloodstone",
					{[L["strength"]] = 12},
				},
				[3374] = {
					"red",
					"Delicate Bloodstone",
					{[L["agility"]] = 12},
				},
				[3375] = {
					"red",
					"Bright Bloodstone",
					{[L["attack power"]] = 24},
				},
				[3376] = {
					"red",
					"Subtle Bloodstone",
					{[L["dodge rating"]] = 12},
				},
				[3377] = {
					"red",
					"Flashing Bloodstone",
					{[L["parry rating"]] = 12},
				},
				[3378] = {
					"red",
					"Fractured Bloodstone",
					{[L["armor penetration rating"]] = 12},
				},
				[3379] = {
					"red",
					"Precise Bloodstone",
					{[L["expertise rating"]] = 12},
				},
				[3380] = {
					"red",
					"Runed Bloodstone",
					{[L["spell power"]] = 14},
				},
				[3381] = {
					"yellow",
					"Brilliant Sun Crystal",
					{[L["intellect"]] = 12},
				},
				[3382] = {
					"yellow",
					"Smooth Sun Crystal",
					{[L["critical strike rating"]] = 12},
				},
				[3383] = {
					"yellow",
					"Rigid Sun Crystal",
					{[L["hit rating"]] = 12},
				},
				[3384] = {
					"yellow",
					"Thick Sun Crystal",
					{[L["defense rating"]] = 12},
				},
				[3385] = {
					"yellow",
					"Mystic Sun Crystal",
					{[L["resilience rating"]] = 12},
				},
				[3386] = {
					"yellow",
					"Quick Sun Crystal",
					{[L["haste rating"]] = 12},
				},
				[3387] = {
					"blue",
					"Solid Chalcedony",
					{[L["stamina"]] = 18},
				},
				[3388] = {
					"blue",
					"Sparkling Chalcedony",
					{[L["spirit"]] = 12},
				},
				[3389] = {
					"blue",
					"Lustrous Chalcedony",
					{[L["mp5"]] = 6},
				},
				[3390] = {
					"blue",
					"Stormy Chalcedony",
					{[L["spell penetration"]] = 15},
				},
				[3391] = {
					"purple",
					"Puissant Shadow Crystal",
					{[L["armor penetration rating"]] = 6, [L["stamina"]] = 9},
				},
				[3392] = {
					"purple",
					"Sovereign Shadow Crystal",
					{[L["strength"]] = 6, [L["stamina"]] = 9},
				},
				[3393] = {
					"purple",
					"Shifting Shadow Crystal",
					{[L["agility"]] = 6, [L["stamina"]] = 9},
				},
				[3394] = {
					"purple",
					"Glowing Shadow Crystal",
					{[L["spell power"]] = 7, [L["stamina"]] = 9},
				},
				[3395] = {
					"purple",
					"Balanced Shadow Crystal",
					{[L["attack power"]] = 12, [L["stamina"]] = 9},
				},
				[3396] = {
					"purple",
					"Regal Shadow Crystal",
					{[L["dodge rating"]] = 6, [L["stamina"]] = 9},
				},
				[3397] = {
					"purple",
					"Defender's Shadow Crystal",
					{[L["parry rating"]] = 6, [L["stamina"]] = 9},
				},
				[3398] = {
					"purple",
					"Guardian's Shadow Crystal",
					{[L["expertise rating"]] = 6, [L["stamina"]] = 9},
				},
				[3399] = {
					"purple",
					"Purified Shadow Crystal",
					{[L["spell power"]] = 7, [L["spirit"]] = 6},
				},
				[3400] = {
					"purple",
					"Tenuous Shadow Crystal",
					{[L["agility"]] = 6, [L["mp5"]] = 3},
				},
				[3401] = {
					"purple",
					"Royal Shadow Crystal",
					{[L["spell power"]] = 7, [L["mp5"]] = 3},
				},
				[3402] = {
					"purple",
					"Infused Shadow Crystal",
					{[L["attack power"]] = 12, [L["mp5"]] = 3},
				},
				[3403] = {
					"purple",
					"Mysterious Shadow Crystal",
					{[L["spell power"]] = 7, [L["spell penetration"]] = 8},
				},
				[3404] = {
					"orange",
					"Luminous Huge Citrine",
					{[L["spell power"]] = 7, [L["intellect"]] = 6},
				},
				[3405] = {
					"orange",
					"Inscribed Huge Citrine",
					{[L["strength"]] = 6, [L["critical strike rating"]] = 6},
				},
				[3406] = {
					"orange",
					"Glinting Huge Citrine",
					{[L["agility"]] = 6, [L["hit rating"]] = 6},
				},
				[3407] = {
					"orange",
					"Champion's Huge Citrine",
					{[L["strength"]] = 6, [L["defense rating"]] = 6},
				},
				[3408] = {
					"orange",
					"Resplendent Huge Citrine",
					{[L["strength"]] = 6, [L["resilience rating"]] = 6},
				},
				[3409] = {
					"orange",
					"Fierce Huge Citrine",
					{[L["strength"]] = 6, [L["haste rating"]] = 6},
				},
				[3410] = {
					"orange",
					"Deadly Huge Ditrine",
					{[L["agility"]] = 6, [L["critical strike rating"]] = 6},
				},
				[3411] = {
					"orange",
					"Etched Huge Citrine",
					{[L["strength"]] = 6, [L["hit rating"]] = 6},
				},
				[3412] = {
					"orange",
					"Lucent Huge Citrine",
					{[L["agility"]] = 6, [L["resilience rating"]] = 6},
				},
				[3413] = {
					"orange",
					"Deft Huge Citrine",
					{[L["agility"]] = 6, [L["haste rating"]] = 6},
				},
				[3414] = {
					"orange",
					"Potent Huge Citrine",
					{[L["spell power"]] = 7, [L["critical strike rating"]] = 6},
				},
				[3415] = {
					"orange",
					"Veiled Huge Citrine",
					{[L["spell power"]] = 7, [L["hit rating"]] = 6},
				},
				[3416] = {
					"orange",
					"Durable Huge Citrine",
					{[L["spell power"]] = 7, [L["resilience rating"]] = 6},
				},
				[3417] = {
					"orange",
					"Reckless Huge Citrine",
					{[L["spell power"]] = 7, [L["haste rating"]] = 6},
				},
				[3418] = {
					"orange",
					"Swalwart Huge Citrine",
					{[L["dodge rating"]] = 6, [L["defense rating"]] = 6},
				},
				[3419] = {
					"orange",
					"Glimmering Huge Citrine",
					{[L["parry rating"]] = 6, [L["defense rating"]] = 6},
				},
				[3420] = {
					"orange",
					"Accurate Huge Citrine",
					{[L["expertise rating"]] = 6, [L["hit rating"]] = 6},
				},
				[3421] = {
					"orange",
					"Resolute Huge Citrine",
					{[L["expertise rating"]] = 6, [L["defense rating"]] = 6},
				},
				[3422] = {
					"orange",
					"Wicked Huge Citrine",
					{[L["attack power"]] = 12, [L["critical strike rating"]] = 6},
				},
				[3423] = {
					"orange",
					"Pristine Huge Citrine",
					{[L["attack power"]] = 12, [L["hit rating"]] = 6},
				},
				[3424] = {
					"orange",
					"Empowered Huge Citrine",
					{[L["attack power"]] = 12, [L["resilience rating"]] = 6},
				},
				[3426] = {
					"orange",
					"Stark Huge Citrine",
					{[L["attack power"]] = 12, [L["haste rating"]] = 6},
				},
				[3427] = {
					"green",
					"Timeless Dark Jade",
					{[L["intellect"]] = 6, [L["stamina"]] = 9},
				},
				[3428] = {
					"green",
					"Jagged Dark Jade",
					{[L["critical strike rating"]] = 6, [L["stamina"]] = 9},
				},
				[3429] = {
					"green",
					"Vivid Dark Jade",
					{[L["hit rating"]] = 6, [L["stamina"]] = 9},
				},
				[3430] = {
					"green",
					"Enduring Dark Jade",
					{[L["defense rating"]] = 6, [L["stamina"]] = 9},
				},
				[3431] = {
					"green",
					"Steady Dark Jade",
					{[L["resilience rating"]] = 6, [L["stamina"]] = 9},
				},
				[3432] = {
					"green",
					"Forceful Dark Jade",
					{[L["haste rating"]] = 6, [L["stamina"]] = 9},
				},
				[3433] = {
					"green",
					"Seer's Dark Jade",
					{[L["intellect"]] = 6, [L["spirit"]] = 6},
				},
				[3434] = {
					"green",
					"Misty Dark Jade",
					{[L["critical strike rating"]] = 6, [L["spirit"]] = 6},
				},
				[3435] = {
					"green",
					"Shining Dark Jade",
					{[L["hit rating"]] = 6, [L["spirit"]] = 6},
				},
				[3436] = {
					"green",
					"Turbid Dark Jade",
					{[L["resilience rating"]] = 6, [L["spirit"]] = 6},
				},
				[3437] = {
					"green",
					"Intricate Dark Jade",
					{[L["haste rating"]] = 6, [L["spirit"]] = 6},
				},
				[3438] = {
					"green",
					"Dazzling Dark Jade",
					{[L["intellect"]] = 6, [L["mp5"]] = 3},
				},
				[3439] = {
					"green",
					"Sundered Dark Jade",
					{[L["critical strike rating"]] = 6, [L["mp5"]] = 3},
				},
				[3440] = {
					"green",
					"Lambent Dark Jade",
					{[L["hit rating"]] = 6, [L["mp5"]] = 3},
				},
				[3441] = {
					"green",
					"Opaque Dark Jade",
					{[L["resilience rating"]] = 6, [L["mp5"]] = 3},
				},
				[3442] = {
					"green",
					"Energized Dark Jade",
					{[L["haste rating"]] = 6, [L["mp5"]] = 3},
				},
				[3443] = {
					"green",
					"Radiant Dark Jade",
					{[L["critical strike rating"]] = 6, [L["spell penetration"]] = 8},
				},
				[3444] = {
					"green",
					"Tense Dark Jade",
					{[L["hit rating"]] = 6, [L["spell penetration"]] = 8},
				},
				[3445] = {
					"green",
					"Shattered Dark Jade",
					{[L["haste rating"]] = 6, [L["spell penetration"]] = 8},
				},
			},
			[6] = {
				[3446] = {
					"red",
					"Bold Scarlet Ruby",
					{[L["strength"]] = 16},
				},
				[3447] = {
					"red",
					"Delicate Scarlet Ruby",
					{[L["agility"]] = 16},
				},
				[3448] = {
					"red",
					"Runed Scarlet Ruby",
					{[L["spell power"]] = 19},
				},
				[3449] = {
					"red",
					"Bright Scarlet Ruby",
					{[L["attack power"]] = 32},
				},
				[3450] = {
					"red",
					"Subtle Scarlet Ruby",
					{[L["dodge rating"]] = 16},
				},
				[3451] = {
					"red",
					"Flashing Scarlet Ruby",
					{[L["parry rating"]] = 16},
				},
				[3452] = {
					"red",
					"Fractured Scarlet Ruby",
					{[L["armor penetration rating"]] = 16},
				},
				[3453] = {
					"red",
					"Precise Scarlet Ruby",
					{[L["expertise rating"]] = 16},
				},
				[3454] = {
					"blue",
					"Solid Sky Sapphire",
					{[L["stamina"]] = 24},
				},
				[3455] = {
					"blue",
					"Sparkling Sky Sapphire",
					{[L["spirit"]] = 16},
				},
				[3456] = {
					"blue",
					"Lustrous Sky Sapphire",
					{[L["mp5"]] = 8},
				},
				[3457] = {
					"blue",
					"Stormy Sky Sapphire",
					{[L["spell penetration"]] = 20},
				},
				[3458] = {
					"yellow",
					"Brilliant Autumn's Glow",
					{[L["intellect"]] = 16},
				},
				[3459] = {
					"yellow",
					"Smooth Autumn's Glow",
					{[L["critical strike rating"]] = 16},
				},
				[3460] = {
					"yellow",
					"Rigid Autumn's Glow",
					{[L["hit rating"]] = 16},
				},
				[3461] = {
					"yellow",
					"Thick Autumn's Glow",
					{[L["defense rating"]] = 16},
				},
				[3462] = {
					"yellow",
					"Mystic Autumn's Glow",
					{[L["resilience rating"]] = 16},
				},
				[3463] = {
					"yellow",
					"Quick Autumn's Glow",
					{[L["haste rating"]] = 16},
				},
				[3464] = {
					"purple",
					"Sovereign Twilight Opal",
					{[L["strength"]] = 8, [L["stamina"]] = 12},
				},
				[3465] = {
					"purple",
					"Shifting Twilight Opal",
					{[L["agility"]] = 8, [L["stamina"]] = 12},
				},
				[3466] = {
					"purple",
					"Glowing Twilight Opal",
					{[L["spell power"]] = 9, [L["stamina"]] = 12},
				},
				[3467] = {
					"purple",
					"Balanced Twilight Opal",
					{[L["attack power"]] = 16, [L["stamina"]] = 12},
				},
				[3468] = {
					"purple",
					"Regal Twilight Opal",
					{[L["dodge rating"]] = 8, [L["stamina"]] = 12},
				},
				[3469] = {
					"purple",
					"Defender's Twilight Opal",
					{[L["parry rating"]] = 8, [L["stamina"]] = 12},
				},
				[3470] = {
					"purple",
					"Puissant Twilight Opal",
					{[L["armor penetration rating"]] = 8, [L["stamina"]] = 12},
				},
				[3471] = {
					"purple",
					"Guardian's Twilight Opal",
					{[L["expertise rating"]] = 8, [L["stamina"]] = 12},
				},
				[3472] = {
					"purple",
					"Purified Twilight Opal",
					{[L["spell power"]] = 9, [L["spirit"]] = 8},
				},
				[3473] = {
					"purple",
					"Royal Twilight Opal",
					{[L["spell power"]] = 9, [L["mp5"]] = 4},
				},
				[3474] = {
					"purple",
					"Tenuous Twilight Opal",
					{[L["agility"]] = 8, [L["mp5"]] = 4},
				},
				[3475] = {
					"purple",
					"Infused Twilight Opal",
					{[L["attack power"]] = 16, [L["mp5"]] = 4},
				},
				[3476] = {
					"purple",
					"Mysterious Twilight Opal",
					{[L["spell power"]] = 9, [L["spell penetration"]] = 10},
				},
				[3477] = {
					"orange",
					"Inscribed Monarch Topaz",
					{[L["strength"]] = 8, [L["critical strike rating"]] = 8},
				},
				[3478] = {
					"orange",
					"Etched Monarch Topaz",
					{[L["strength"]] = 8, [L["hit rating"]] = 8},
				},
				[3479] = {
					"orange",
					"Champion's Monarch Topaz",
					{[L["strength"]] = 8, [L["defense rating"]] = 8},
				},
				[3480] = {
					"orange",
					"Resplendent Monarch Topaz",
					{[L["strength"]] = 8, [L["resilience rating"]] = 8},
				},
				[3481] = {
					"orange",
					"Fierce Monarch Topaz",
					{[L["strength"]] = 8, [L["haste rating"]] = 8},
				},
				[3482] = {
					"orange",
					"Deadly Monarch Topaz",
					{[L["agility"]] = 8, [L["critical strike rating"]] = 8},
				},
				[3483] = {
					"orange",
					"Glinting Monarch Topaz",
					{[L["agility"]] = 8, [L["hit rating"]] = 8},
				},
				[3484] = {
					"orange",
					"Lucent Monarch Topaz",
					{[L["agility"]] = 8, [L["resilience rating"]] = 8},
				},
				[3485] = {
					"orange",
					"Deft Monarch Topaz",
					{[L["agility"]] = 8, [L["haste rating"]] = 8},
				},
				[3486] = {
					"orange",
					"Luminous Monarch Topaz",
					{[L["spell power"]] = 9, [L["intellect"]] = 8},
				},
				[3487] = {
					"orange",
					"Potent Monarch Topaz",
					{[L["spell power"]] = 9, [L["critical strike rating"]] = 8},
				},
				[3488] = {
					"orange",
					"Veiled Monarch Topaz",
					{[L["spell power"]] = 9, [L["hit rating"]] = 8},
				},
				[3489] = {
					"orange",
					"Durable Monarch Topaz",
					{[L["spell power"]] = 9, [L["resilience rating"]] = 8},
				},
				[3490] = {
					"orange",
					"Reckless Monarch Topaz",
					{[L["spell power"]] = 9, [L["haste rating"]] = 8},
				},
				[3491] = {
					"orange",
					"Wicked Monarch Topaz",
					{[L["attack power"]] = 16, [L["critical strike rating"]] = 8},
				},
				[3492] = {
					"orange",
					"Pristine Monarch Topaz",
					{[L["attack power"]] = 16, [L["hit rating"]] = 8},
				},
				[3493] = {
					"orange",
					"Empowered Monarch Topaz",
					{[L["attack power"]] = 16, [L["resilience rating"]] = 8},
				},
				[3494] = {
					"orange",
					"Stark Monarch Topaz",
					{[L["attack power"]] = 16, [L["haste rating"]] = 8},
				},
				[3495] = {
					"orange",
					"Stalwart Monarch Topaz",
					{[L["dodge rating"]] = 8, [L["defense rating"]] = 8},
				},
				[3496] = {
					"orange",
					"Glimmering Monarch Topaz",
					{[L["parry rating"]] = 8, [L["defense rating"]] = 8},
				},
				[3497] = {
					"orange",
					"Accurate Monarch Topaz",
					{[L["expertise rating"]] = 8, [L["hit rating"]] = 8},
				},
				[3498] = {
					"orange",
					"Resolute Monarch Topaz",
					{[L["expertise rating"]] = 8, [L["defense rating"]] = 8},
				},
				[3499] = {
					"green",
					"Timeless Forest Emerald",
					{[L["intellect"]] = 8, [L["stamina"]] = 12},
				},
				[3500] = {
					"green",
					"Jagged Forest Emerald",
					{[L["critical strike rating"]] = 8, [L["stamina"]] = 12},
				},
				[3501] = {
					"green",
					"Vivid Forest Emerald",
					{[L["hit rating"]] = 8, [L["stamina"]] = 12},
				},
				[3502] = {
					"green",
					"Enduring Forest Emerald",
					{[L["defense rating"]] = 8, [L["stamina"]] = 12},
				},
				[3503] = {
					"green",
					"Steady Forest Emerald",
					{[L["resilience rating"]] = 8, [L["stamina"]] = 12},
				},
				[3504] = {
					"green",
					"Forceful Forest Emerald",
					{[L["haste rating"]] = 8, [L["stamina"]] = 12},
				},
				[3505] = {
					"green",
					"Seer's Forest Emerald",
					{[L["intellect"]] = 8, [L["spirit"]] = 8},
				},
				[3506] = {
					"green",
					"Misty Forest Emerald",
					{[L["critical strike rating"]] = 8, [L["spirit"]] = 8},
				},
				[3507] = {
					"green",
					"Shining Forest Emerald",
					{[L["hit rating"]] = 8, [L["spirit"]] = 8},
				},
				[3508] = {
					"green",
					"Turbid Forest Emerald",
					{[L["resilience rating"]] = 8, [L["spirit"]] = 8},
				},
				[3509] = {
					"green",
					"Intricate Forest Emerald",
					{[L["haste rating"]] = 8, [L["spirit"]] = 8},
				},
				[3510] = {
					"green",
					"Dazzling Forest Emerald",
					{[L["intellect"]] = 8, [L["mp5"]] = 4},
				},
				[3511] = {
					"green",
					"Sundered Forest Emerald",
					{[L["critical strike rating"]] = 8, [L["mp5"]] = 4},
				},
				[3512] = {
					"green",
					"Lambent Forest Emerald",
					{[L["hit rating"]] = 8, [L["mp5"]] = 4},
				},
				[3513] = {
					"green",
					"Opaque Forest Emerald",
					{[L["resilience rating"]] = 8, [L["mp5"]] = 4},
				},
				[3514] = {
					"green",
					"Energized Forest Emerald",
					{[L["haste rating"]] = 8, [L["mp5"]] = 4},
				},
				[3515] = {
					"green",
					"Radiant Forest Emerald",
					{[L["critical strike rating"]] = 8, [L["spell penetration"]] = 10},
				},
				[3516] = {
					"green",
					"Tense Forest Emerald",
					{[L["hit rating"]] = 8, [L["spell penetration"]] = 10},
				},
				[3517] = {
					"green",
					"Shattered Forest Emerald",
					{[L["haste rating"]] = 8, [L["spell penetration"]] = 10},
				},
				[3621] = {
					"meta",
					"Chaotic Skyflare Diamond",
					{[L["critical strike rating"]] = 21, [L["critical damage (percent)"]] = 3},
				},
				[3622] = {
					"meta",
					"Destructive Skyflare Diamond",
					{[L["critical strike rating"]] = 25, [L["spell reflect (percent)"]] = 1},
				},
				[3623] = {
					"meta",
					"Ember Skyflare Diamond",
					{[L["spell power"]] = 25, [L["intellect (percent)"]] = 2},
				},
				[3624] = {
					"meta",
					"Egnimatic Skyflare Diamond",
					{[L["critical strike rating"]] = 21, [L["snare/root duration reduction (percent)"]] = 10},
				},
				[3625] = {
					"meta",
					"Swift Skyflare Diamond",
					{[L["attack power"]] = 42, [L["minor run speed"]] = 1},
				},
				[3626] = {
					"meta",
					"Bracing Earthsiege Diamond",
					{[L["spell power"]] = 25, [L["threat reduction (percent)"]] = 2},
				},
				[3627] = {
					"meta",
					"Insightful Earthsiege Diamond",
					{[L["intellect"]] = 21, [L["chance to restore mana on spellcast"]] = 1},
				},
				[3628] = {
					"meta",
					"Relentless Earthsiege Diamond",
					{[L["agility"]] = 21, [L["critical damage (percent)"]] = 3},
				},
				[3631] = {
					"meta",
					"Eternal Earthsiege Diamond",
					{[L["defense rating"]] = 21, [L["block value (percent)"]] = 5},
				},
				[3632] = {
					"meta",
					"Tireless Skyflare Diamond",
					{[L["spell power"]] = 25, [L["minor run speed"]] = 1},
				},
				[3633] = {
					"meta",
					"Revitalizing Skyflare Diamond",
					{[L["mp5"]] = 11, [L["critical healing (percent)"]] = 3},
				},
				[3634] = {
					"meta",
					"Effulgent Skyflare Diamond",
					{[L["stamina"]] = 32, [L["spell damage taken reduction (percent)"]] = 2},
				},
				[3635] = {
					"meta",
					"Forlorn Skyflare Diamond",
					{[L["spell power"]] = 25, [L["silence duration reduction (percent)"]] = 10},
				},
				[3636] = {
					"meta",
					"Impassive Skyflare Diamond",
					{[L["critical strike rating"]] = 21, [L["fear duration reduction (percent)"]] = 10},
				},
				[3637] = {
					"meta",
					"Austere Earthsiege Diamond",
					{[L["stamina"]] = 32, [L["armor from items (percent)"]] = 2},
				},
				[3638] = {
					"meta",
					"Persistent Earthsiege Diamond",
					{[L["attack power"]] = 42, [L["stun duration reduction (percent)"]] = 10},
				},
				[3639] = {
					"meta",
					"Trenchant Earthsiege Diamond",
					{[L["spell power"]] = 25, [L["stun duration reduction (percent)"]] = 10},
				},
				[3640] = {
					"meta",
					"Invigorating Earthsiege Diamond",
					{[L["attack power"]] = 42, [L["sometimes heal on your crits"]] = 1},
				},
				[3641] = {
					"meta",
					"Beaming Earthsiege Diamond",
					{[L["critical strike rating"]] = 21, [L["mana (percent)"]] = 2},
				},
				[3642] = {
					"meta",
					"Powerful Earthsiege Diamond",
					{[L["stamina"]] = 32, [L["stun duration reduction (percent)"]] = 10},
				},
				[3643] = {
					"meta",
					"Thundering Skyflare Diamond",
					{[L["chance to increase physical haste"]] = 1},
				},
			},
			[7] = {
				[3518] = {
					"red",
					"Bold Cardinal Ruby",
					{[L["strength"]] = 20},
				},
				[3519] = {
					"red",
					"Delicate Cardinal Ruby",
					{[L["agility"]] = 20},
				},
				[3520] = {
					"red",
					"Runed Cardinal Ruby",
					{[L["spell power"]] = 23},
				},
				[3521] = {
					"red",
					"Bright Cardinal Ruby",
					{[L["attack power"]] = 40},
				},
				[3522] = {
					"red",
					"Subtle Cardinal Ruby",
					{[L["dodge rating"]] = 20},
				},
				[3523] = {
					"red",
					"Flashing Cardinal Ruby",
					{[L["parry rating"]] = 20},
				},
				[3524] = {
					"red",
					"Precise Cardinal Ruby",
					{[L["expertise rating"]] = 20},
				},
				[3525] = {
					"red",
					"Fractured Cardinal Ruby",
					{[L["armor penetration rating"]] = 20},
				},
				[3526] = {
					"yellow",
					"Brilliant King's Amber",
					{[L["intellect"]] = 20},
				},
				[3527] = {
					"yellow",
					"Smooth King's Amber",
					{[L["critical strike rating"]] = 20},
				},
				[3528] = {
					"yellow",
					"Rigid King's Amber",
					{[L["hit rating"]] = 20},
				},
				[3529] = {
					"yellow",
					"Thick King's Amber",
					{[L["defense rating"]] = 20},
				},
				[3530] = {
					"yellow",
					"Mystic King's Amber",
					{[L["resilience rating"]] = 20},
				},
				[3531] = {
					"yellow",
					"Quick King's Amber",
					{[L["haste rating"]] = 20},
				},
				[3532] = {
					"blue",
					"Solid Majestic Zircon",
					{[L["stamina"]] = 30},
				},
				[3533] = {
					"blue",
					"Sparkling Majestic Zircon",
					{[L["spirit"]] = 20},
				},
				[3534] = {
					"blue",
					"Lustrous Majestic Zircon",
					{[L["mp5"]] = 10},
				},
				[3535] = {
					"blue",
					"Stormy Majestic Zircon",
					{[L["spell penetration"]] = 25},
				},
				[3536] = {
					"purple",
					"Sovereign Dreadstone",
					{[L["strength"]] = 10, [L["stamina"]] = 15},
				},
				[3537] = {
					"purple",
					"Shifting Dreadstone",
					{[L["agility"]] = 10, [L["stamina"]] = 15},
				},
				[3538] = {
					"purple",
					"Glowing Dreadstone",
					{[L["spell power"]] = 12, [L["stamina"]] = 15},
				},
				[3539] = {
					"purple",
					"Balanced Dreadstone",
					{[L["attack power"]] = 20, [L["stamina"]] = 15},
				},
				[3540] = {
					"purple",
					"Regal Dreadstone",
					{[L["dodge rating"]] = 10, [L["stamina"]] = 15},
				},
				[3541] = {
					"purple",
					"Defender's Dreadstone",
					{[L["parry rating"]] = 10, [L["stamina"]] = 15},
				},
				[3542] = {
					"purple",
					"Guardian's Dreadstone",
					{[L["expertise rating"]] = 10, [L["stamina"]] = 15},
				},
				[3543] = {
					"purple",
					"Puissant Dreadstone",
					{[L["armor penetration rating"]] = 10, [L["stamina"]] = 15},
				},
				[3544] = {
					"purple",
					"Tenuous Dreadstone",
					{[L["agility"]] = 10, [L["mp5"]] = 5},
				},
				[3545] = {
					"purple",
					"Purified Dreadstone",
					{[L["spell power"]] = 12, [L["spirit"]] = 10},
				},
				[3546] = {
					"purple",
					"Royal Dreadstone",
					{[L["spell power"]] = 12, [L["mp5"]] = 5},
				},
				[3547] = {
					"purple",
					"Infused Dreadstone",
					{[L["attack power"]] = 20, [L["mp5"]] = 5},
				},
				[3548] = {
					"purple",
					"Mysterious Dreadstone",
					{[L["spell power"]] = 12, [L["spell penetration"]] = 13},
				},
				[3549] = {
					"orange",
					"Inscribed Ametrine",
					{[L["strength"]] = 10, [L["critical strike rating"]] = 10},
				},
				[3550] = {
					"orange",
					"Etched Ametrine",
					{[L["strength"]] = 10, [L["hit rating"]] = 10},
				},
				[3551] = {
					"orange",
					"Champion's Ametrine",
					{[L["strength"]] = 10, [L["defense rating"]] = 10},
				},
				[3552] = {
					"orange",
					"Resplendent Ametrine",
					{[L["strength"]] = 10, [L["resilience rating"]] = 10},
				},
				[3553] = {
					"orange",
					"Fierce Ametrine",
					{[L["strength"]] = 10, [L["haste rating"]] = 10},
				},
				[3554] = {
					"orange",
					"Deadly Ametrine",
					{[L["agility"]] = 10, [L["critical strike rating"]] = 10},
				},
				[3555] = {
					"orange",
					"Glinting Ametrine",
					{[L["agility"]] = 10, [L["hit rating"]] = 10},
				},
				[3556] = {
					"orange",
					"Lucent Ametrine",
					{[L["agility"]] = 10, [L["resilience rating"]] = 10},
				},
				[3557] = {
					"orange",
					"Deft Ametrine",
					{[L["agility"]] = 10, [L["haste rating"]] = 10},
				},
				[3558] = {
					"orange",
					"Luminous Ametrine",
					{[L["spell power"]] = 12, [L["intellect"]] = 10},
				},
				[3559] = {
					"orange",
					"Potent Ametrine",
					{[L["spell power"]] = 12, [L["critical strike rating"]] = 10},
				},
				[3560] = {
					"orange",
					"Veiled Ametrine",
					{[L["spell power"]] = 12, [L["hit rating"]] = 10},
				},
				[3561] = {
					"orange",
					"Durable Ametrine",
					{[L["spell power"]] = 12, [L["resilience rating"]] = 10},
				},
				[3563] = {
					"orange",
					"Reckless Ametrine",
					{[L["spell power"]] = 12, [L["haste rating"]] = 10},
				},
				[3564] = {
					"orange",
					"Wicked Ametrine",
					{[L["attack power"]] = 20, [L["critical strike rating"]] = 10},
				},
				[3565] = {
					"orange",
					"Pristine Ametrine",
					{[L["attack power"]] = 20, [L["hit rating"]] = 10},
				},
				[3566] = {
					"orange",
					"Empowered Ametrine",
					{[L["attack power"]] = 20, [L["resilience rating"]] = 10},
				},
				[3567] = {
					"orange",
					"Stark Ametrine",
					{[L["attack power"]] = 20, [L["haste rating"]] = 10},
				},
				[3568] = {
					"orange",
					"Stalwart Ametrine",
					{[L["dodge rating"]] = 10, [L["defense rating"]] = 10},
				},
				[3569] = {
					"orange",
					"Glimmering Ametrine",
					{[L["parry rating"]] = 10, [L["defense rating"]] = 10},
				},
				[3570] = {
					"orange",
					"Accurate Ametrine",
					{[L["expertise rating"]] = 10, [L["hit rating"]] = 10},
				},
				[3571] = {
					"orange",
					"Resolute Ametrine",
					{[L["expertise rating"]] = 10, [L["defense rating"]] = 10},
				},
				[3572] = {
					"green",
					"Timeless Eye of Zul",
					{[L["intellect"]] = 10, [L["stamina"]] = 15},
				},
				[3573] = {
					"green",
					"Jagged Eye of Zul",
					{[L["critical strike rating"]] = 10, [L["stamina"]] = 15},
				},
				[3574] = {
					"green",
					"Vivid Eye of Zul",
					{[L["hit rating"]] = 10, [L["stamina"]] = 15},
				},
				[3575] = {
					"green",
					"Enduring Eye of Zul",
					{[L["defense rating"]] = 10, [L["stamina"]] = 15},
				},
				[3576] = {
					"green",
					"Steady Eye of Zul",
					{[L["resilience rating"]] = 10, [L["stamina"]] = 15},
				},
				[3577] = {
					"green",
					"Forceful Eye of Zul",
					{[L["haste rating"]] = 10, [L["stamina"]] = 15},
				},
				[3578] = {
					"green",
					"Seer's Eye of Zul",
					{[L["intellect"]] = 10, [L["spirit"]] = 10},
				},
				[3579] = {
					"green",
					"Misty Eye of Zul",
					{[L["critical strike rating"]] = 10, [L["spirit"]] = 10},
				},
				[3580] = {
					"green",
					"Shining Eye of Zul",
					{[L["hit rating"]] = 10, [L["spirit"]] = 10},
				},
				[3581] = {
					"green",
					"Turbid Eye of Zul",
					{[L["resilience rating"]] = 10, [L["spirit"]] = 10},
				},
				[3582] = {
					"green",
					"Intricate Eye of Zul",
					{[L["haste rating"]] = 10, [L["spirit"]] = 10},
				},
				[3583] = {
					"green",
					"Dazzling Eye of Zul",
					{[L["intellect"]] = 10, [L["mp5"]] = 5},
				},
				[3584] = {
					"green",
					"Sundered Eye of Zul",
					{[L["critical strike rating"]] = 10, [L["mp5"]] = 5},
				},
				[3585] = {
					"green",
					"Lambent Eye of Zul",
					{[L["hit rating"]] = 10, [L["mp5"]] = 5},
				},
				[3586] = {
					"green",
					"Opaque Eye of Zul",
					{[L["resilience rating"]] = 10, [L["mp5"]] = 5},
				},
				[3587] = {
					"green",
					"Energized Eye of Zul",
					{[L["haste rating"]] = 10, [L["mp5"]] = 5},
				},
				[3588] = {
					"green",
					"Radiant Eye of Zul",
					{[L["critical strike rating"]] = 10, [L["spell penetration"]] = 13},
				},
				[3589] = {
					"green",
					"Tense Eye of Zul",
					{[L["hit rating"]] = 10, [L["spell penetration"]] = 13},
				},
				[3590] = {
					"green",
					"Shattered Eye of Zul",
					{[L["haste rating"]] = 10, [L["spell penetration"]] = 13},
				},
			},
		},
		["Unique-Equipped"] = {
			[5] = {
				[3749] = {
					"prismatic",
					"Enchanted Pearl",
					{[L["all stats"]] = 4},
				},
			},
			[6] = {
				[3750] = {
					"prismatic",
					"Enchanted Tear",
					{[L["all stats"]] = 6},
				},
			},
			[7] = {
				[3879] = {
					"prismatic",
					"Nightmare Tear",
					{[L["all stats"]] = 10},
				},
			},
		},
		["Jewelcrafter-Only"] = {
			[4] = {
				[3208] = {
					"red",
					"Crimson Sun",
					{[L["attack power"]] = 24},
				},
				[3210] = {
					"red",
					"Don Julio's Heart",
					{[L["spell power"]] = 14},
				},
				[3211] = {
					"red",
					"Kailee's Rose",
					{[L["spell power"]] = 14},
				},
				[3212] = {
					"blue",
					"Falling Star",
					{[L["stamina"]] = 18},
				},
				[3217] = {
					"yellow",
					"Blood of Amber",
					{[L["critical strike rating"]] = 12},
				},
				[3220] = {
					"yellow",
					"Stone of Blades",
					{[L["critical strike rating"]] = 12},
				},
				[3221] = {
					"yellow",
					"Facet of Eternity",
					{[L["defense rating"]] = 12},
				},
			},
			[7] = {
				[3292] = {
					"red",
					"Bright Dragon's Eye",
					{[L["attack power"]] = 68},
				},
				[3293] = {
					"blue",
					"Solid Dragon's Eye",
					{[L["stamina"]] = 51},
				},
				[3732] = {
					"red",
					"Bold Dragon's Eye",
					{[L["strength"]] = 34},
				},
				[3733] = {
					"red",
					"Delicate Dragon's Eye",
					{[L["agility"]] = 34},
				},
				[3734] = {
					"red",
					"Runed Dragon's Eye",
					{[L["spell power"]] = 39},
				},
				[3735] = {
					"blue",
					"Sparkling Dragon's Eye",
					{[L["spirit"]] = 34},
				},
				[3736] = {
					"blue",
					"Lustrous Dragon's Eye",
					{[L["mp5"]] = 17},
				},
				[3737] = {
					"yellow",
					"Brilliant Dragon's Eye",
					{[L["intellect"]] = 34},
				},
				[3738] = {
					"yellow",
					"Smooth Dragon's Eye",
					{[L["critical strike rating"]] = 34},
				},
				[3739] = {
					"yellow",
					"Quick Dragon's Eye",
					{[L["haste rating"]] = 34},
				},
				[3740] = {
					"red",
					"Subtle Dragon's Eye",
					{[L["dodge rating"]] = 34},
				},
				[3741] = {
					"red",
					"Flashing Dragon's Eye",
					{[L["parry rating"]] = 34},
				},
				[3742] = {
					"yellow",
					"Rigid Dragon's Eye",
					{[L["hit rating"]] = 34},
				},
				[3743] = {
					"yellow",
					"Thick Dragon's Eye",
					{[L["defense rating"]] = 34},
				},
				[3744] = {
					"yellow",
					"Mystic Dragon's Eye",
					{[L["resilience rating"]] = 34},
				},
				[3745] = {
					"red",
					"Fractured Dragon's Eye",
					{[L["armor penetration rating"]] = 34},
				},
				[3746] = {
					"red",
					"Precise Dragon's Eye",
					{[L["expertise rating"]] = 34},
				},
				[3747] = {
					"blue",
					"Stormy Dragon's Eye",
					{[L["spell penetration"]] = 43},
				},
			},
		},
	},
	["Procced"] = {
		["Normal"] = {
			[5] = {
				[3644] = {
					"red",
					"Perfect Delicate Bloodstone",
					{[L["agility"]] = 14},
				},
				[3646] = {
					"red",
					"Perfect Subtle Bloodstone",
					{[L["dodge rating"]] = 14},
				},
				[3647] = {
					"red",
					"Perfect Precise Bloodstone",
					{[L["expertise rating"]] = 14},
				},
				[3648] = {
					"red",
					"Perfect Flashing Bloodstone",
					{[L["parry rating"]] = 14},
				},
				[3649] = {
					"red",
					"Perfect Bold Bloodstone",
					{[L["strength"]] = 14},
				},
				[3650] = {
					"red",
					"Perfect Runed Bloodstone",
					{[L["spell power"]] = 16},
				},
				[3651] = {
					"red",
					"Perfect Bright Bloodstone",
					{[L["attack power"]] = 28},
				},
				[3652] = {
					"red",
					"Perfect Fractured Bloodstone",
					{[L["armor penetration rating"]] = 14},
				},
				[3653] = {
					"blue",
					"Perfect Sparkling Chalcedony",
					{[L["spirit"]] = 14},
				},
				[3654] = {
					"blue",
					"Perfect Lustrous Chalcedony",
					{[L["mp5"]] = 7},
				},
				[3655] = {
					"blue",
					"Perfect Solid Chalcedony",
					{[L["stamina"]] = 21},
				},
				[3656] = {
					"blue",
					"Perfect Stormy Chalcedony",
					{[L["spell penetration"]] = 18},
				},
				[3657] = {
					"yellow",
					"Perfect Smooth Sun Crystal",
					{[L["critical strike rating"]] = 14},
				},
				[3658] = {
					"yellow",
					"Perfect Thick Sun Crystal",
					{[L["defense rating"]] = 14},
				},
				[3659] = {
					"yellow",
					"Perfect Quick Sun Crystal",
					{[L["haste rating"]] = 14},
				},
				[3660] = {
					"yellow",
					"Perfect Rigid Sun Crystal",
					{[L["hit rating"]] = 14},
				},
				[3661] = {
					"yellow",
					"Perfect Brilliant Sun Crystal",
					{[L["intellect"]] = 14},
				},
				[3662] = {
					"yellow",
					"Perfect Mystic Sun Crystal",
					{[L["resilience rating"]] = 14},
				},
				[3663] = {
					"purple",
					"Perfect Infused Shadow Crystal",
					{[L["attack power"]] = 14, [L["mp5"]] = 4},
				},
				[3664] = {
					"purple",
					"Perfect Balanced Shadow Crystal",
					{[L["attack power"]] = 14, [L["stamina"]] = 11},
				},
				[3665] = {
					"purple",
					"Perfect Puissant Shadow Crystal",
					{[L["armor penetration rating"]] = 7, [L["stamina"]] = 11},
				},
				[3666] = {
					"purple",
					"Perfect Tenuous Shadow Crystal",
					{[L["agility"]] = 7, [L["mp5"]] = 4},
				},
				[3667] = {
					"purple",
					"Perfect Shifting Shadow Crystal",
					{[L["agility"]] = 7, [L["stamina"]] = 11},
				},
				[3668] = {
					"purple",
					"Perfect Regal Shadow Crystal",
					{[L["dodge rating"]] = 7, [L["stamina"]] = 11},
				},
				[3669] = {
					"purple",
					"Perfect Guardian's Shadow Crystal",
					{[L["expertise rating"]] = 7, [L["stamina"]] = 11},
				},
				[3670] = {
					"purple",
					"Perfect Defender's Shadow Crystal",
					{[L["parry rating"]] = 7, [L["stamina"]] = 11},
				},
				[3671] = {
					"purple",
					"Perfect Sovereign Shadow Crystal",
					{[L["strength"]] = 7, [L["stamina"]] = 11},
				},
				[3672] = {
					"purple",
					"Perfect Royal Shadow Crystal",
					{[L["spell power"]] = 8, [L["mp5"]] = 4},
				},
				[3673] = {
					"purple",
					"Perfect Purified Shadow Crystal",
					{[L["spell power"]] = 8, [L["spirit"]] = 7},
				},
				[3674] = {
					"purple",
					"Perfect Mysterious Shadow Crystal",
					{[L["spell power"]] = 8, [L["spell penetration"]] = 9},
				},
				[3675] = {
					"purple",
					"Perfect Glowing Shadow Crystal",
					{[L["spell power"]] = 8, [L["stamina"]] = 11},
				},
				[3677] = {
					"orange",
					"Perfect Deft Huge Citrine",
					{[L["agility"]] = 7, [L["haste rating"]] = 7},
				},
				[3678] = {
					"orange",
					"Perfect Stark Huge Citrine",
					{[L["attack power"]] = 14, [L["haste rating"]] = 7},
				},
				[3679] = {
					"orange",
					"Perfect Pristine Huge Citrine",
					{[L["attack power"]] = 14, [L["hit rating"]] = 7},
				},
				[3680] = {
					"orange",
					"Perfect Empowered Huge Citrine",
					{[L["attack power"]] = 14, [L["resilience rating"]] = 7},
				},
				[3681] = {
					"orange",
					"Perfect Inscribed Huge Citrine",
					{[L["strength"]] = 7, [L["critical strike rating"]] = 7},
				},
				[3682] = {
					"orange",
					"Perfect Etched Huge Citrine",
					{[L["strength"]] = 7, [L["hit rating"]] = 7},
				},
				[3683] = {
					"orange",
					"Perfect Champion's Huge Citrine",
					{[L["strength"]] = 7, [L["defense rating"]] = 7},
				},
				[3684] = {
					"orange",
					"Perfect Resplendent Huge Citrine",
					{[L["strength"]] = 7, [L["resilience rating"]] = 7},
				},
				[3685] = {
					"orange",
					"Perfect Fierce Huge Citrine",
					{[L["strength"]] = 7, [L["haste rating"]] = 7},
				},
				[3686] = {
					"orange",
					"Perfect Deadly Huge Citrine",
					{[L["agility"]] = 7, [L["critical strike rating"]] = 7},
				},
				[3687] = {
					"orange",
					"Perfect Glinting Huge Citrine",
					{[L["agility"]] = 7, [L["hit rating"]] = 7},
				},
				[3688] = {
					"orange",
					"Perfect Lucent Huge Citrine",
					{[L["agility"]] = 7, [L["resilience rating"]] = 7},
				},
				[3689] = {
					"orange",
					"Perfect Luminous Huge Citrine",
					{[L["spell power"]] = 8, [L["intellect"]] = 7},
				},
				[3690] = {
					"orange",
					"Perfect Potent Huge Citrine",
					{[L["spell power"]] = 8, [L["critical strike rating"]] = 7},
				},
				[3691] = {
					"orange",
					"Perfect Veiled Huge Citrine",
					{[L["spell power"]] = 8, [L["hit rating"]] = 7},
				},
				[3692] = {
					"orange",
					"Perfect Durable Huge Citrine",
					{[L["spell power"]] = 8, [L["resilience rating"]] = 7},
				},
				[3693] = {
					"orange",
					"Perfect Reckless Huge Citrine",
					{[L["spell power"]] = 8, [L["haste rating"]] = 7},
				},
				[3694] = {
					"orange",
					"Perfect Stalwart Huge Citrine",
					{[L["dodge rating"]] = 7, [L["defense rating"]] = 7},
				},
				[3695] = {
					"orange",
					"Perfect Glimmering Huge Citrine",
					{[L["parry rating"]] = 7, [L["defense rating"]] = 7},
				},
				[3696] = {
					"orange",
					"Perfect Accurate Huge Citrine",
					{[L["expertise rating"]] = 7, [L["hit rating"]] = 7},
				},
				[3697] = {
					"orange",
					"Perfect Resolute Huge Citrine",
					{[L["expertise rating"]] = 7, [L["defense rating"]] = 7},
				},
				[3698] = {
					"green",
					"Perfect Misty Dark Jade",
					{[L["critical strike rating"]] = 7, [L["spirit"]] = 7},
				},
				[3699] = {
					"green",
					"Perfect Jagged Dark Jade",
					{[L["critical strike rating"]] = 7, [L["stamina"]] = 11},
				},
				[3700] = {
					"green",
					"Perfect Enduring Dark Jade",
					{[L["defense rating"]] = 7, [L["stamina"]] = 11},
				},
				[3701] = {
					"green",
					"Perfect Intricate Dark Jade",
					{[L["haste rating"]] = 7, [L["spirit"]] = 7},
				},
				[3702] = {
					"green",
					"Perfect Forceful Dark Jade",
					{[L["haste rating"]] = 7, [L["stamina"]] = 11},
				},
				[3703] = {
					"green",
					"Perfect Shining Dark Jade",
					{[L["hit rating"]] = 7, [L["spirit"]] = 7},
				},
				[3704] = {
					"green",
					"Perfect Vivid Dark Jade",
					{[L["hit rating"]] = 7, [L["stamina"]] = 11},
				},
				[3705] = {
					"green",
					"Perfect Seer's Dark Jade",
					{[L["intellect"]] = 7, [L["spirit"]] = 7},
				},
				[3706] = {
					"green",
					"Perfect Timeless Dark Jade",
					{[L["intellect"]] = 7, [L["stamina"]] = 11},
				},
				[3707] = {
					"green",
					"Perfect Turbid Dark Jade",
					{[L["resilience rating"]] = 7, [L["spirit"]] = 7},
				},
				[3708] = {
					"green",
					"Perfect Steady Dark Jade",
					{[L["resilience rating"]] = 7, [L["stamina"]] = 11},
				},
				[3709] = {
					"green",
					"Perfect Radiant Dark Jade",
					{[L["critical strike rating"]] = 7, [L["spell penetration"]] = 9},
				},
				[3710] = {
					"green",
					"Perfect Sundered Dark Jade",
					{[L["critical strike rating"]] = 7, [L["mp5"]] = 4},
				},
				[3711] = {
					"green",
					"Perfect Dazzling Dark Jade",
					{[L["intellect"]] = 7, [L["mp5"]] = 4},
				},
				[3712] = {
					"green",
					"Perfect Lambent Dark Jade",
					{[L["hit rating"]] = 7, [L["mp5"]] = 4},
				},
				[3713] = {
					"green",
					"Perfect Opaque Dark Jade",
					{[L["resilience rating"]] = 7, [L["mp5"]] = 4},
				},
				[3714] = {
					"green",
					"Perfect Energized Dark Jade",
					{[L["haste rating"]] = 7, [L["mp5"]] = 4},
				},
				[3715] = {
					"green",
					"Perfect Tense Dark Jade",
					{[L["hit rating"]] = 7, [L["spell penetration"]] = 9},
				},
				[3716] = {
					"green",
					"Perfect Shattered Dark Jade",
					{[L["haste rating"]] = 7, [L["spell penetration"]] = 9},
				},
				[3767] = {
					"orange",
					"Perfect Wicked Huge Citrine",
					{[L["attack power"]] = 14, [L["critical strike rating"]] = 7},
				},
			},
		},
	},
	["PVP-Vendor"] = {
		["Normal"] = {
			[4] = {
				[2912] = {
					"red",
					"Runed Ornate Ruby",
					{[L["spell power"]] = 12},
				},
				[2913] = {
					"yellow",
					"Smooth Ornate Dawnstone",
					{[L["critical strike rating"]] = 10},
				},
				[2914] = {
					"yellow",
					"Gleaming Ornate Dawnstone",
					{[L["critical strike rating"]] = 10},
				},
				[2916] = {
					"orange",
					"Potent Ornate Topaz",
					{[L["critical strike rating"]] = 5, [L["spell power"]] = 6},
				},
				[2945] = {
					"red",
					"Bold Ornate Ruby",
					{[L["attack power"]] = 20},
				},
				[2946] = {
					"orange",
					"Inscribed Ornate Topaz",
					{[L["attack power"]] = 10, [L["critical strike rating"]] = 5},
				},
				[2949] = {
					"red",
					"Bold Ornate Ruby",
					{[L["attack power"]] = 20},
				},
				[3335] = {
					"red",
					"Bold Ornate Ruby",
					{[L["attack power"]] = 20},
				},
				[3336] = {
					"yellow",
					"Gleaming Ornate Dawnstone",
					{[L["critical strike rating"]] = 10},
				},
				[3337] = {
					"orange",
					"Inscribed Ornate Topaz",
					{[L["attack power"]] = 10, [L["critical strike rating"]] = 5},
				},
				[3338] = {
					"orange",
					"Potent Ornate Topaz",
					{[L["spell power"]] = 6, [L["critical strike rating"]] = 5},
				},
				[3339] = {
					"red",
					"Runed Ornate Ruby",
					{[L["spell power"]] = 12},
				},
				[3340] = {
					"yellow",
					"Smooth Ornate Dawnstone",
					{[L["critical strike rating"]] = 10},
				},
			},
			[6] = {
				[3798] = {
					"meta",
					"Swift Starflare Diamond",
					{[L["attack power"]] = 34, [L["minor run speed"]] = 1},
				},
				[3799] = {
					"meta",
					"Tireless Starflare Diamond",
					{[L["spell power"]] = 20, [L["minor run speed"]] = 1},
				},
				[3800] = {
					"meta",
					"Impassive Starflare Diamond",
					{[L["critical strike rating"]] = 17, [L["fear duration reduction (percent)"]] = 10},
				},
				[3801] = {
					"meta",
					"Egnimatic Starflare Diamond",
					{[L["critical strike rating"]] = 17, [L["snare/root duration reduction (percent)"]] = 10},
				},
				[3802] = {
					"meta",
					"Forlorn Starflare Diamond",
					{[L["spell power"]] = 20, [L["silence duration reduction (percent)"]] = 10},
				},
				[3803] = {
					"meta",
					"Persistent Earthshatter Diamond",
					{[L["attack power"]] = 34, [L["stun duration reduction (percent)"]] = 10},
				},
				[3804] = {
					"meta",
					"Powerful Earthshatter Diamond",
					{[L["stamina"]] = 26, [L["stun duration reduction (percent)"]] = 10},
				},
				[3805] = {
					"meta",
					"Trenchant Earthshatter Diamond",
					{[L["spell power"]] = 20, [L["stun duration reduction (percent)"]] = 10},
				},
			},
		},
		["Unique-Equipped"] = {
			[3] = {
				[2896] = {
					"red",
					"Stark Blood Garnet",
					{[L["spell power"]] = 8},
				},
				[2898] = {
					"green",
					"Notched Deep Peridot",
					{[L["stamina"]] = 3, [L["critical strike rating"]] = 4},
				},
				[2899] = {
					"green",
					"Barbed Deep Peridot",
					{[L["stamina"]] = 3, [L["critical strike rating"]] = 4},
				},
				[2921] = {
					"green",
					"Barbed Deep Peridot",
					{[L["stamina"]] = 3, [L["critical strike rating"]] = 4},
				},
				[2923] = {
					"green",
					"Notched Deep Peridot",
					{[L["stamina"]] = 3, [L["critical strike rating"]] = 4},
				},
				[2924] = {
					"red",
					"Stark Blood Garnet",
					{[L["spell power"]] = 8},
				},
				[2943] = {
					"red",
					"Mighty Blood Garnet",
					{[L["attack power"]] = 14},
				},
				[2944] = {
					"red",
					"Mighty Blood Garnet",
					{[L["attack power"]] = 14},
				},
				[2969] = {
					"meta",
					"Swift Windfire Diamond",
					{[L["attack power"]] = 20, [L["minor run speed"]] = 1},
				},
				[2970] = {
					"meta",
					"Swift Starfire Diamond",
					{[L["spell power"]] = 12, [L["minor run speed"]] = 1},
				},
				[3065] = {
					"red",
					"Don Rodrigo's Heart",
					{[L["strength"]] = 8},
				},
				[3103] = {
					"red",
					"Don Amancio's Heart",
					{[L["strength"]] = 8},
				},
			},
			[4] = {
				[2891] = {
					"yellow",
					"Sublime Mystic Dawnstone",
					{[L["resilience rating"]] = 10},
				},
			},
			[7] = {
				[3792] = {
					"yellow",
					"Kharmaa's Grace",
					{[L["resilience rating"]] = 20},
				},
			},
		},
	},
	["Drop"] = {
		["Normal"] = {
			[4] = {
				[3045] = {
					"purple",
					"Sovereign Tanzanite",
					{[L["strength"]] = 5, [L["stamina"]] = 6},
				},
				[3046] = {
					"orange",
					"Luminous Fire Opal",
					{[L["spell power"]] = 6, [L["intellect"]] = 4},
				},
				[3047] = {
					"green",
					"Polished Chrysoprase",
					{[L["stamina"]] = 6, [L["critical strike rating"]] = 5},
				},
				[3048] = {
					"purple",
					"Shifting Tanzanite",
					{[L["agility"]] = 5, [L["stamina"]] = 6},
				},
				[3049] = {
					"green",
					"Sundered Chrysoprase",
					{[L["critical strike rating"]] = 5, [L["mp5"]] = 2},
				},
				[3050] = {
					"orange",
					"Infused Fire Opal",
					{[L["spell power"]] = 6, [L["intellect"]] = 4},
				},
				[3051] = {
					"purple",
					"Blessed Tanzanite",
					{[L["spell power"]] = 6, [L["stamina"]] = 6},
				},
				[3052] = {
					"orange",
					"Pristine Fire Opal",
					{[L["attack power"]] = 10, [L["hit rating"]] = 4},
				},
				[3053] = {
					"orange",
					"Stalwart Fire Opal",
					{[L["defense rating"]] = 5, [L["dodge rating"]] = 4},
				},
				[3054] = {
					"purple",
					"Glowing Tanzanite",
					{[L["spell power"]] = 6, [L["stamina"]] = 6},
				},
				[3055] = {
					"orange",
					"Glinting Fire Opal",
					{[L["agility"]] = 5, [L["hit rating"]] = 4},
				},
				[3056] = {
					"orange",
					"Glimmering Fire Opal",
					{[L["parry rating"]] = 5, [L["defense rating"]] = 4},
				},
				[3057] = {
					"orange",
					"Etched Fire Opal",
					{[L["strength"]] = 5, [L["hit rating"]] = 4},
				},
				[3058] = {
					"green",
					"Rune Covered Chrysoprase",
					{[L["critical strike rating"]] = 5, [L["mp5"]] = 2},
				},
				[3060] = {
					"purple",
					"Regal Tanzanite",
					{[L["dodge rating"]] = 5, [L["stamina"]] = 6},
				},
				[3061] = {
					"orange",
					"Shining Fire Opal",
					{[L["hit rating"]] = 5, [L["spell power"]] = 6},
				},
				[3062] = {
					"orange",
					"Assassin's Fire Opal",
					{[L["critical strike rating"]] = 6, [L["dodge rating"]] = 5},
				},
				[3063] = {
					"purple",
					"Defender's Tanzanite",
					{[L["parry rating"]] = 5, [L["stamina"]] = 6},
				},
				[3064] = {
					"purple",
					"Imperial Tanzanite",
					{[L["spirit"]] = 5, [L["spell power"]] = 5},
				},
				[3066] = {
					"orange",
					"Mysterious Fire Opal",
					{[L["spell power"]] = 6, [L["spell penetration"]] = 5},
				},
				[3067] = {
					"purple",
					"Brutal Tanzanite",
					{[L["attack power"]] = 10, [L["stamina"]] = 6},
				},
				[3068] = {
					"orange",
					"Nimble Fire Opal",
					{[L["dodge rating"]] = 5, [L["hit rating"]] = 4},
				},
				[3069] = {
					"orange",
					"Durable Fire Opal",
					{[L["spell power"]] = 6, [L["resilience rating"]] = 4},
				},
				[3070] = {
					"orange",
					"Deadly Fire Opal",
					{[L["attack power"]] = 8, [L["critical strike rating"]] = 5},
				},
				[3071] = {
					"green",
					"Timeless Chrysoprase",
					{[L["intellect"]] = 5, [L["stamina"]] = 6},
				},
				[3072] = {
					"orange",
					"Enscribed Fire Opal", -- No, that's not a typo (on my part, anyway)
					{[L["strength"]] = 5, [L["critical strike rating"]] = 4},
				},
				[3073] = {
					"orange",
					"Glistening Fire Opal",
					{[L["agility"]] = 4, [L["defense rating"]] = 5},
				},
				[3074] = {
					"green",
					"Seer's Chrysoprase",
					{[L["intellect"]] = 4, [L["spirit"]] = 5},
				},
				[3075] = {
					"orange",
					"Champion's Fire Opal",
					{[L["strength"]] = 5, [L["defense rating"]] = 4},
				},
				[3076] = {
					"orange",
					"Potent Fire Opal",
					{[L["critical strike rating"]] = 4, [L["spell power"]] = 6},
				},
				[3077] = {
					"green",
					"Dazzling Chrysoprase",
					{[L["intellect"]] = 5, [L["mp5"]] = 2},
				},
				[3078] = {
					"green",
					"Enduring Chrysoprase",
					{[L["stamina"]] = 6, [L["defense rating"]] = 5},
				},
				[3079] = {
					"orange",
					"Empowered Fire Opal",
					{[L["attack power"]] = 8, [L["resilience rating"]] = 5},
				},
				[3080] = {
					"green",
					"Steady Chrysoprase",
					{[L["stamina"]] = 6, [L["resilience rating"]] = 5},
				},
				[3081] = {
					"orange",
					"Iridescent Fire Opal",
					{[L["spell power"]] = 6, [L["critical strike rating"]] = 4},
				},
				[3082] = {
					"green",
					"Effulgent Chrysoprase",
					{[L["defense rating"]] = 5, [L["mp5"]] = 2},
				},
				[3083] = {
					"purple",
					"Fluorescent Tanzanite",
					{[L["spell power"]] = 6, [L["spirit"]] = 4},
				},
				[3084] = {
					"orange",
					"Beaming Fire Opal",
					{[L["dodge rating"]] = 5, [L["resilience rating"]] = 4},
				},
				[3085] = {
					"green",
					"Jagged Chrysoprase",
					{[L["stamina"]] = 6, [L["critical strike rating"]] = 5},
				},
				[3086] = {
					"purple",
					"Royal Tanzanite",
					{[L["spell power"]] = 6, [L["mp5"]] = 2},
				},
				[3087] = {
					"orange",
					"Resplendent Fire Opal",
					{[L["strength"]] = 5, [L["resilience rating"]] = 4},
				},
				[3088] = {
					"green",
					"Vivid Chrysoprase",
					{[L["hit rating"]] = 5, [L["stamina"]] = 6},
				},
				[3089] = {
					"green",
					"Lambent Chrysoprase",
					{[L["hit rating"]] = 5, [L["mp5"]] = 2},
				},
				[3090] = {
					"orange",
					"Splendid Fire Opal",
					{[L["parry rating"]] = 5, [L["resilience rating"]] = 4},
				},
				[3091] = {
					"green",
					"Radiant Chrysoprase",
					{[L["critical strike rating"]] = 5, [L["spell penetration"]] = 5},
				},
			},
			[7] = {
				[3861] = {
					"red",
					"Bold Stormjewel",
					{[L["strength"]] = 20},
				},
				[3862] = {
					"red",
					"Delicate Stormjewel",
					{[L["agility"]] = 20},
				},
				[3863] = {
					"blue",
					"Solid Stormjewel",
					{[L["stamina"]] = 30},
				},
				[3864] = {
					"blue",
					"Sparkling Stormjewel",
					{[L["spirit"]] = 20},
				},
				[3865] = {
					"yellow",
					"Brilliant Stormjewel",
					{[L["intellect"]] = 20},
				},
				[3866] = {
					"red",
					"Runed Stormjewel",
					{[L["spell power"]] = 23},
				},
				[3867] = {
					"yellow",
					"Rigid Stormjewel",
					{[L["hit rating"]] = 20},
				},
			},
		},
		["Unique-Equipped"] = {
			[3] = {
				[3268] = {
					"blue",
					"Eye of the Sea",
					{[L["stamina"]] = 15},
				},
			}
		},
	},
	["Quest"] = {
		["Normal"] = {
			[3] = {
				[3162] = {
					"meta",
					"Potent Unstable Diamond",
					{[L["attack power"]] = 24, [L["stun resist chance (percent)"]] = 5},
				},
				[3163] = {
					"meta",
					"Imbued Unstable Diamond",
					{[L["spell power"]] = 14, [L["stun resist chance (percent)"]] = 5},
				},
			},
			[4] = {
				[3099] = {
					"purple",
					"Infused Amethyst",
					{[L["spell power"]] = 6, [L["stamina"]] = 6},
				},
				[3100] = {
					"purple",
					"Soothing Amethyst",
					{[L["spell power"]] = 6, [L["stamina"]] = 6},
				},
				[3101] = {
					"purple",
					"Pulsing Amethyst",
					{[L["attack power"]] = 10, [L["stamina"]] = 6},
				},
				[3276] = {
					"red",
					"Bright Crimson Spinel",
					{[L["attack power"]] = 20},
				},
				[3277] = {
					"red",
					"Runed Crimson Spinel",
					{[L["spell power"]] = 12},
				},
				[3278] = {
					"red",
					"Teardrop Crimson Spinel",
					{[L["spell power"]] = 12},
				},
				[3281] = {
					"red",
					"Bright Crimson Spinel",
					{[L["attack power"]] = 20},
				},
				[3282] = {
					"red",
					"Runed Crimson Spinel",
					{[L["spell power"]] = 12},
				},
				[3283] = {
					"red",
					"Teardrop Crimson Spinel",
					{[L["spell power"]] = 12},
				},
			},
		},
		["Unique-Equipped"] = {
			[3] = {
				[3156] = {
					"purple",
					"Unstable Amethyst",
					{[L["attack power"]] = 8, [L["stamina"]] = 6},
				},
				[3157] = {
					"green",
					"Unstable Peridot",
					{[L["intellect"]] = 4, [L["stamina"]] = 6},
				},
				[3158] = {
					"blue",
					"Unstable Sapphire",
					{[L["spell power"]] = 5, [L["spirit"]] = 4},
				},
				[3159] = {
					"orange",
					"Unstable Citrine",
					{[L["attack power"]] = 8, [L["critical strike rating"]] = 4},
				},
				[3160] = {
					"orange",
					"Unstable Topaz",
					{[L["spell power"]] = 5, [L["intellect"]] = 4},
				},
				[3161] = {
					"green",
					"Unstable Talasite",
					{[L["stamina"]] = 4, [L["critical strike rating"]] = 4},
				},
			},
			[4] = {
				[3262] = {
					"blue",
					"Charmed Amani Jewel",
					{[L["stamina"]] = 15},
				},
			},
		},
	},
}

local GemQualities = {}

for gemSource, gems in pairs(ww_gems) do
	for gemType, gems in pairs(gems) do
		for gemQuality, gems in pairs(gems) do
			for gemId, gemInfo in pairs(gems) do
				GemQualities[gemId] = {
					source = gemSource,
					type = gemType,
					quality = gemQuality,
					info = gemInfo,
				}
			end
		end
	end
end

function WeightsWatcher.GemInfo(gemId)
	if type(gemId) == "string" then
		gemId = tonumber(gemId)
	end
	return GemQualities[gemId]
end
