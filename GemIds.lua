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
					"Brilliant Tourmaline",
					{[L["intellect"]] = 4},
				},
				[2959] = {
					"red",
					"Brilliant Tourmaline",
					{[L["intellect"]] = 4},
				},
				[2960] = {
					"red",
					"Delicate Tourmaline",
					{[L["agility"]] = 4},
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
					"Sparkling Zircon",
					{[L["spirit"]] = 4},
				},
				[2964] = {
					"red",
					"Brilliant Tourmaline",
					{[L["intellect"]] = 4},
				},
				[2965] = {
					"yellow",
					"Smooth Amber",
					{[L["critical strike rating"]] = 4},
				},
				[2966] = {
					"blue",
					"Rigid Zircon",
					{[L["hit rating"]] = 4},
				},
				[2967] = {
					"yellow",
					"Smooth Amber",
					{[L["critical strike rating"]] = 4},
				},
				[2968] = {
					"yellow",
					"Subtle Amber",
					{[L["dodge rating"]] = 4},
				},
			},
		},
	},
	["Crafted"] = {
		["Normal"] = {
			[2] = {
				[2690] = {
					"red",
					"Brilliant Blood Garnet",
					{[L["intellect"]] = 6},
				},
				[2691] = {
					"red",
					"Bold Blood Garnet",
					{[L["strength"]] = 6},
				},
				[2692] = {
					"red",
					"Brilliant Blood Garnet",
					{[L["intellect"]] = 7},
				},
				[2693] = {
					"red",
					"Delicate Blood Garnet",
					{[L["agility"]] = 6},
				},
				[2694] = {
					"red",
					"Brilliant Blood Garnet",
					{[L["intellect"]] = 6},
				},
				[2695] = {
					"yellow",
					"Smooth Golden Draenite",
					{[L["critical strike rating"]] = 6},
				},
				[2696] = {
					"yellow",
					"Subtle Golden Draenite",
					{[L["dodge rating"]] = 6},
				},
				[2697] = {
					"blue",
					"Rigid Azure Moonstone",
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
					"Sparkling Azure Moonstone",
					{[L["spirit"]] = 6},
				},
				[2705] = {
					"orange",
					"Reckless Flame Spessarite",
					{[L["haste rating"]] = 3, [L["intellect"]] = 3},
				},
				[2706] = {
					"green",
					"Regal Deep Peridot",
					{[L["dodge rating"]] = 3, [L["stamina"]] = 4},
				},
				[2707] = {
					"purple",
					"Purified Deep Peridot",
					{[L["intellect"]] = 3, [L["spirit"]] = 3},
				},
				[2708] = {
					"purple",
					"Timeless Shadow Draenite",
					{[L["intellect"]] = 3, [L["stamina"]] = 4},
				},
				[2709] = {
					"purple",
					"Purified Shadow Draenite",
					{[L["intellect"]] = 3, [L["spirit"]] = 3},
				},
				[2710] = {
					"purple",
					"Shifting Shadow Draenite",
					{[L["agility"]] = 3, [L["stamina"]] = 4},
				},
				[2711] = {
					"purple",
					"Sovereign Shadow Draenite",
					{[L["stamina"]] = 4, [L["strength"]] = 3},
				},
				[2752] = {
					"orange",
					"Inscribed Flame Spessarite",
					{[L["critical strike rating"]] = 3, [L["strength"]] = 3},
				},
				[2755] = {
					"purple",
					"Glinting Shadow Draenite",
					{[L["agility"]] = 3, [L["hit rating"]] = 3},
				},
				[2757] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike rating"]] = 3, [L["stamina"]] = 4},
				},
				[2760] = {
					"orange",
					"Potent Flame Spessarite",
					{[L["critical strike rating"]] = 3, [L["intellect"]] = 3},
				},
				[2762] = {
					"green",
					"Radiant Deep Peridot",
					{[L["critical strike rating"]] = 3, [L["spell penetration"]] = 4},
				},
				[2942] = {
					"yellow",
					"Smooth Golden Draenite",
					{[L["critical strike rating"]] = 6},
				},
				[2971] = {
					"red",
					"Delicate Blood Garnet",
					{[L["agility"]] = 6},
				},
				[3104] = {
					"blue",
					"Rigid Azure Moonstone",
					{[L["hit rating"]] = 6},
				},
				[3106] = {
					"purple",
					"Shifting Shadow Draenite",
					{[L["agility"]] = 3, [L["stamina"]] = 4},
				},
				[3108] = {
					"purple",
					"Shifting Shadow Draenite",
					{[L["agility"]] = 3, [L["stamina"]] = 4},
				},
				[3110] = {
					"purple",
					"Veiled Shadow Draenite",
					{[L["hit rating"]] = 3, [L["intellect"]] = 3},
				},
				[3113] = {
					"orange",
					"Deadly Flame Spessarite",
					{[L["agility"]] = 3, [L["critical strike rating"]] = 3},
				},
				[3201] = {
					"purple",
					"Purified Jaggal Pearl",
					{[L["intellect"]] = 3, [L["spirit"]] = 3},
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
					"Brilliant Living Ruby",
					{[L["intellect"]] = 8},
				},
				[2728] = {
					"red",
					"Brilliant Living Ruby",
					{[L["intellect"]] = 8},
				},
				[2729] = {
					"red",
					"Delicate Living Ruby",
					{[L["agility"]] = 8},
				},
				[2730] = {
					"yellow",
					"Subtle Dawnstone",
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
					"Sparkling Star of Elune",
					{[L["spirit"]] = 8},
				},
				[2734] = {
					"red",
					"Brilliant Living Ruby",
					{[L["intellect"]] = 8},
				},
				[2735] = {
					"yellow",
					"Smooth Dawnstone",
					{[L["critical strike rating"]] = 8},
				},
				[2736] = {
					"yellow",
					"Smooth Dawnstone",
					{[L["critical strike rating"]] = 8},
				},
				[2737] = {
					"yellow",
					"Subtle Dawnstone",
					{[L["dodge rating"]] = 8},
				},
				[2738] = {
					"purple",
					"Sovereign Nightseye",
					{[L["stamina"]] = 6, [L["strength"]] = 4},
				},
				[2739] = {
					"purple",
					"Shifting Nightseye",
					{[L["agility"]] = 4, [L["stamina"]] = 6},
				},
				[2740] = {
					"purple",
					"Timeless Nightseye",
					{[L["intellect"]] = 5, [L["stamina"]] = 6},
				},
				[2741] = {
					"purple",
					"Purified Nightseye",
					{[L["intellect"]] = 4, [L["spirit"]] = 4},
				},
				[2742] = {
					"orange",
					"Reckless Noble Topaz",
					{[L["haste rating"]] = 4, [L["intellect"]] = 4},
				},
				[2743] = {
					"green",
					"Regal Talasite",
					{[L["dodge rating"]] = 4, [L["stamina"]] = 6},
				},
				[2744] = {
					"purple",
					"Purified Nightseye",
					{[L["intellect"]] = 4, [L["spirit"]] = 4},
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
					"purple",
					"Glinting Nightseye",
					{[L["agility"]] = 4, [L["hit rating"]] = 4},
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
					{[L["critical strike rating"]] = 4, [L["intellect"]] = 4},
				},
				[2763] = {
					"green",
					"Radiant Talasite",
					{[L["critical strike rating"]] = 4, [L["spell penetration"]] = 5},
				},
				[2764] = {
					"blue",
					"Rigid Star of Elune",
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
					{[L["critical strike rating"]] = 12, [L["minor run speed"]] = 1},
				},
				[2830] = {
					"meta",
					"Enigmatic Skyfire Diamond",
					{[L["critical strike rating"]] = 12, [L["snare/root duration reduction (percent)"]] = 10},
				},
				[2831] = {
					"meta",
					"Powerful Earthstorm Diamond",
					{[L["stamina"]] = 18, [L["stun duration reduction (percent)"]] = 10},
				},
				[2832] = {
					"meta",
					"Bracing Earthstorm Diamond",
					{[L["intellect"]] = 12, [L["threat reduction (percent)"]] = 2},
				},
				[2833] = {
					"meta",
					"Tenacious Earthstorm Diamond",
					{[L["chance to restore health on hit"]] = 1, [L["dodge rating"]] = 12},
				},
				[2834] = {
					"meta",
					"Brutal Earthstorm Diamond",
					{[L["average melee weapon damage"]] = 3, [L["chance to stun target"]] = 1, [L["maximum melee weapon damage"]] = 3},
				},
				[2835] = {
					"meta",
					"Insightful Earthstorm Diamond",
					{[L["chance to restore mana on spellcast"]] = 1, [L["intellect"]] = 12},
				},
				[2947] = {
					"prismatic",
					"Prismatic Sphere",
					{[L["all resistances"]] = 3},
				},
				[3105] = {
					"blue",
					"Rigid Star of Elune",
					{[L["hit rating"]] = 8},
				},
				[3107] = {
					"purple",
					"Shifting Nightseye",
					{[L["agility"]] = 4, [L["stamina"]] = 6},
				},
				[3109] = {
					"purple",
					"Glinting Nightseye",
					{[L["agility"]] = 4, [L["hit rating"]] = 4},
				},
				[3111] = {
					"purple",
					"Veiled Nightseye",
					{[L["hit rating"]] = 4, [L["intellect"]] = 4},
				},
				[3112] = {
					"orange",
					"Deadly Noble Topaz",
					{[L["agility"]] = 4, [L["critical strike rating"]] = 4},
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
					{[L["intellect"]] = 4, [L["spirit"]] = 4},
				},
				[3226] = {
					"green",
					"Steady Talasite",
					{[L["resilience rating"]] = 4, [L["stamina"]] = 6},
				},
				[3261] = {
					"meta",
					"Chaotic Skyfire Diamond",
					{[L["critical damage (percent)"]] = 3, [L["critical strike rating"]] = 12},
				},
				[3270] = {
					"yellow",
					"Quick Dawnstone",
					{[L["haste rating"]] = 8},
				},
				[3271] = {
					"orange",
					"Reckless Noble Topaz",
					{[L["haste rating"]] = 4, [L["intellect"]] = 4},
				},
				[3272] = {
					"green",
					"Forceful Talasite",
					{[L["haste rating"]] = 4, [L["stamina"]] = 6},
				},
				[3274] = {
					"meta",
					"Eternal Earthstorm Diamond",
					{[L["block value (percent)"]] = 1, [L["dodge rating"]] = 12},
				},
				[3275] = {
					"meta",
					"Ember Skyfire Diamond",
					{[L["intellect"]] = 12, [L["mana (percent)"]] = 2},
				},
				[3280] = {
					"green",
					"Regal Talasite",
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
					"Brilliant Crimson Spinel",
					{[L["intellect"]] = 10},
				},
				[3118] = {
					"red",
					"Brilliant Crimson Spinel",
					{[L["intellect"]] = 10},
				},
				[3119] = {
					"red",
					"Delicate Crimson Spinel",
					{[L["agility"]] = 10},
				},
				[3120] = {
					"yellow",
					"Subtle Lionseye",
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
					"Sparkling Empyrean Sapphire",
					{[L["spirit"]] = 10},
				},
				[3125] = {
					"blue",
					"Stormy Empyrean Sapphire",
					{[L["spell penetration"]] = 13},
				},
				[3126] = {
					"red",
					"Brilliant Crimson Spinel",
					{[L["intellect"]] = 10},
				},
				[3127] = {
					"yellow",
					"Smooth Lionseye",
					{[L["critical strike rating"]] = 10},
				},
				[3128] = {
					"blue",
					"Rigid Empyrean Sapphire",
					{[L["hit rating"]] = 10},
				},
				[3129] = {
					"yellow",
					"Smooth Lionseye",
					{[L["critical strike rating"]] = 10},
				},
				[3130] = {
					"yellow",
					"Subtle Lionseye",
					{[L["dodge rating"]] = 10},
				},
				[3131] = {
					"yellow",
					"Mystic Lionseye",
					{[L["resilience rating"]] = 10},
				},
				[3132] = {
					"blue",
					"Rigid Empyrean Sapphire",
					{[L["hit rating"]] = 10},
				},
				[3133] = {
					"purple",
					"Sovereign Shadowsong Amethyst",
					{[L["stamina"]] = 7, [L["strength"]] = 5},
				},
				[3134] = {
					"purple",
					"Shifting Shadowsong Amethyst",
					{[L["agility"]] = 5, [L["stamina"]] = 7},
				},
				[3135] = {
					"purple",
					"Shifting Shadowsong Amethyst",
					{[L["agility"]] = 5, [L["stamina"]] = 7},
				},
				[3136] = {
					"purple",
					"Glinting Shadowsong Amethyst",
					{[L["agility"]] = 5, [L["hit rating"]] = 5},
				},
				[3137] = {
					"purple",
					"Timeless Shadowsong Amethyst",
					{[L["intellect"]] = 5, [L["stamina"]] = 7},
				},
				[3138] = {
					"purple",
					"Purified Shadowsong Amethyst",
					{[L["intellect"]] = 5, [L["spirit"]] = 5},
				},
				[3139] = {
					"orange",
					"Inscribed Pyrestone",
					{[L["critical strike rating"]] = 5, [L["strength"]] = 5},
				},
				[3140] = {
					"orange",
					"Potent Pyrestone",
					{[L["critical strike rating"]] = 5, [L["intellect"]] = 5},
				},
				[3141] = {
					"orange",
					"Reckless Pyrestone",
					{[L["haste rating"]] = 5, [L["intellect"]] = 5},
				},
				[3142] = {
					"purple",
					"Glinting Shadowsong Amethyst",
					{[L["agility"]] = 5, [L["hit rating"]] = 5},
				},
				[3143] = {
					"purple",
					"Veiled Shadowsong Amethyst",
					{[L["hit rating"]] = 5, [L["intellect"]] = 5},
				},
				[3144] = {
					"orange",
					"Deadly Pyrestone",
					{[L["agility"]] = 5, [L["critical strike rating"]] = 5},
				},
				[3145] = {
					"green",
					"Regal Seaspray Emerald",
					{[L["dodge rating"]] = 5, [L["stamina"]] = 7},
				},
				[3146] = {
					"green",
					"Radiant Seaspray Emerald",
					{[L["critical strike rating"]] = 5, [L["spell penetration"]] = 6},
				},
				[3147] = {
					"purple",
					"Purified Shadowsong Amethyst",
					{[L["intellect"]] = 5, [L["spirit"]] = 5},
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
					{[L["haste rating"]] = 5, [L["intellect"]] = 5},
				},
				[3287] = {
					"yellow",
					"Quick Lionseye",
					{[L["haste rating"]] = 10},
				},
				[3318] = {
					"purple",
					"Purified Shadowsong Amethyst",
					{[L["intellect"]] = 5, [L["spirit"]] = 5},
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
					"Delicate Bloodstone",
					{[L["agility"]] = 12},
				},
				[3376] = {
					"yellow",
					"Subtle Sun Crystal",
					{[L["dodge rating"]] = 12},
				},
				[3377] = {
					"red",
					"Flashing Bloodstone",
					{[L["parry rating"]] = 12},
				},
				[3378] = {
					"yellow",
					"Smooth Sun Crystal",
					{[L["critical strike rating"]] = 12},
				},
				[3379] = {
					"red",
					"Precise Bloodstone",
					{[L["expertise rating"]] = 12},
				},
				[3380] = {
					"red",
					"Brilliant Bloodstone",
					{[L["intellect"]] = 12},
				},
				[3381] = {
					"red",
					"Brilliant Bloodstone",
					{[L["intellect"]] = 12},
				},
				[3382] = {
					"yellow",
					"Smooth Sun Crystal",
					{[L["critical strike rating"]] = 12},
				},
				[3383] = {
					"blue",
					"Rigid Chalcedony",
					{[L["hit rating"]] = 12},
				},
				[3384] = {
					"yellow",
					"Subtle Sun Crystal",
					{[L["dodge rating"]] = 12},
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
					"Sparkling Chalcedony",
					{[L["spirit"]] = 12},
				},
				[3390] = {
					"blue",
					"Stormy Chalcedony",
					{[L["spell penetration"]] = 15},
				},
				[3391] = {
					"green",
					"Jagged Dark Jade",
					{[L["critical strike rating"]] = 6, [L["stamina"]] = 9},
				},
				[3392] = {
					"purple",
					"Sovereign Shadow Crystal",
					{[L["stamina"]] = 9, [L["strength"]] = 6},
				},
				[3393] = {
					"purple",
					"Shifting Shadow Crystal",
					{[L["agility"]] = 6, [L["stamina"]] = 9},
				},
				[3394] = {
					"purple",
					"Timeless Shadow Crystal",
					{[L["intellect"]] = 6, [L["stamina"]] = 9},
				},
				[3395] = {
					"purple",
					"Shifting Shadow Crystal",
					{[L["agility"]] = 6, [L["stamina"]] = 9},
				},
				[3396] = {
					"green",
					"Regal Dark Jade",
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
					{[L["intellect"]] = 6, [L["spirit"]] = 6},
				},
				[3400] = {
					"purple",
					"Glinting Shadow Crystal",
					{[L["agility"]] = 6, [L["hit rating"]] = 6},
				},
				[3401] = {
					"purple",
					"Purified Shadow Crystal",
					{[L["intellect"]] = 6, [L["spirit"]] = 6},
				},
				[3402] = {
					"purple",
					"Glinting Shadow Crystal",
					{[L["agility"]] = 6, [L["hit rating"]] = 6},
				},
				[3403] = {
					"purple",
					"Mysterious Shadow Crystal",
					{[L["intellect"]] = 6, [L["spell penetration"]] = 8},
				},
				[3404] = {
					"orange",
					"Reckless Huge Citrine",
					{[L["haste rating"]] = 6, [L["intellect"]] = 6},
				},
				[3405] = {
					"orange",
					"Inscribed Huge Citrine",
					{[L["critical strike rating"]] = 6, [L["strength"]] = 6},
				},
				[3406] = {
					"purple",
					"Glinting Shadow Crystal",
					{[L["agility"]] = 6, [L["hit rating"]] = 6},
				},
				[3407] = {
					"orange",
					"Champion's Huge Citrine",
					{[L["dodge rating"]] = 6, [L["strength"]] = 6},
				},
				[3408] = {
					"orange",
					"Resplendent Huge Citrine",
					{[L["resilience rating"]] = 6, [L["strength"]] = 6},
				},
				[3409] = {
					"orange",
					"Fierce Huge Citrine",
					{[L["haste rating"]] = 6, [L["strength"]] = 6},
				},
				[3410] = {
					"orange",
					"Deadly Huge Citrine",
					{[L["agility"]] = 6, [L["critical strike rating"]] = 6},
				},
				[3411] = {
					"purple",
					"Etched Shadow Crystal",
					{[L["hit rating"]] = 6, [L["strength"]] = 6},
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
					{[L["critical strike rating"]] = 6, [L["intellect"]] = 6},
				},
				[3415] = {
					"purple",
					"Veiled Shadow Crystal",
					{[L["hit rating"]] = 6, [L["intellect"]] = 6},
				},
				[3416] = {
					"orange",
					"Willful Huge Citrine",
					{[L["intellect"]] = 6, [L["resilience rating"]] = 6},
				},
				[3417] = {
					"orange",
					"Reckless Huge Citrine",
					{[L["haste rating"]] = 6, [L["intellect"]] = 6},
				},
				[3418] = {
					"orange",
					"Stalwart Huge Citrine",
					{[L["dodge rating"]] = 6, [L["parry rating"]] = 6},
				},
				[3419] = {
					"orange",
					"Stalwart Huge Citrine",
					{[L["dodge rating"]] = 6, [L["parry rating"]] = 6},
				},
				[3420] = {
					"purple",
					"Accurate Shadow Crystal",
					{[L["expertise rating"]] = 6, [L["hit rating"]] = 6},
				},
				[3421] = {
					"orange",
					"Resolute Huge Citrine",
					{[L["dodge rating"]] = 6, [L["expertise rating"]] = 6},
				},
				[3422] = {
					"orange",
					"Deadly Huge Citrine",
					{[L["agility"]] = 6, [L["critical strike rating"]] = 6},
				},
				[3423] = {
					"purple",
					"Glinting Huge Citrine",
					{[L["agility"]] = 6, [L["hit rating"]] = 6},
				},
				[3424] = {
					"orange",
					"Lucent Huge Citrine",
					{[L["agility"]] = 6, [L["resilience rating"]] = 6},
				},
				[3426] = {
					"orange",
					"Deft Huge Citrine",
					{[L["agility"]] = 6, [L["haste rating"]] = 6},
				},
				[3427] = {
					"purple",
					"Timeless Shadow Crystal",
					{[L["intellect"]] = 6, [L["stamina"]] = 9},
				},
				[3428] = {
					"green",
					"Jagged Dark Jade",
					{[L["critical strike rating"]] = 6, [L["stamina"]] = 9},
				},
				[3429] = {
					"green",
					"Nimble Dark Jade",
					{[L["dodge rating"]] = 6, [L["hit rating"]] = 6},
				},
				[3430] = {
					"green",
					"Regal Dark Jade",
					{[L["dodge rating"]] = 6, [L["stamina"]] = 9},
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
					"purple",
					"Purified Shadow Crystal",
					{[L["intellect"]] = 6, [L["spirit"]] = 6},
				},
				[3434] = {
					"green",
					"Misty Dark Jade",
					{[L["critical strike rating"]] = 6, [L["spirit"]] = 6},
				},
				[3435] = {
					"green",
					"Lightning Dark Jade",
					{[L["haste rating"]] = 6, [L["hit rating"]] = 6},
				},
				[3436] = {
					"green",
					"Turbid Dark Jade",
					{[L["resilience rating"]] = 6, [L["spirit"]] = 6},
				},
				[3437] = {
					"green",
					"Energized Dark Jade",
					{[L["haste rating"]] = 6, [L["spirit"]] = 6},
				},
				[3438] = {
					"purple",
					"Purified Shadow Crystal",
					{[L["intellect"]] = 6, [L["spirit"]] = 6},
				},
				[3439] = {
					"green",
					"Misty Dark Jade",
					{[L["critical strike rating"]] = 6, [L["spirit"]] = 6},
				},
				[3440] = {
					"green",
					"Lightning Dark Jade",
					{[L["haste rating"]] = 6, [L["hit rating"]] = 6},
				},
				[3441] = {
					"green",
					"Turbid Dark Jade",
					{[L["resilience rating"]] = 6, [L["spirit"]] = 6},
				},
				[3442] = {
					"green",
					"Energized Dark Jade",
					{[L["haste rating"]] = 6, [L["spirit"]] = 6},
				},
				[3443] = {
					"green",
					"Radiant Dark Jade",
					{[L["critical strike rating"]] = 6, [L["spell penetration"]] = 8},
				},
				[3444] = {
					"green",
					"Radiant Dark Jade",
					{[L["critical strike rating"]] = 6, [L["spell penetration"]] = 8},
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
					"Brilliant Scarlet Ruby",
					{[L["intellect"]] = 16},
				},
				[3449] = {
					"red",
					"Delicate Scarlet Ruby",
					{[L["agility"]] = 16},
				},
				[3450] = {
					"yellow",
					"Subtle Autumn's Glow",
					{[L["dodge rating"]] = 16},
				},
				[3451] = {
					"red",
					"Flashing Scarlet Ruby",
					{[L["parry rating"]] = 16},
				},
				[3452] = {
					"yellow",
					"Smooth Autumn's Glow",
					{[L["critical strike rating"]] = 16},
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
					"Sparkling Sky Sapphire",
					{[L["spirit"]] = 16},
				},
				[3457] = {
					"blue",
					"Stormy Sky Sapphire",
					{[L["spell penetration"]] = 20},
				},
				[3458] = {
					"red",
					"Brilliant Scarlet Ruby",
					{[L["intellect"]] = 16},
				},
				[3459] = {
					"yellow",
					"Smooth Autumn's Glow",
					{[L["critical strike rating"]] = 16},
				},
				[3460] = {
					"blue",
					"Rigid Sky Sapphire",
					{[L["hit rating"]] = 16},
				},
				[3461] = {
					"yellow",
					"Subtle Autumn's Glow",
					{[L["dodge rating"]] = 16},
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
					{[L["stamina"]] = 12, [L["strength"]] = 8},
				},
				[3465] = {
					"purple",
					"Shifting Twilight Opal",
					{[L["agility"]] = 8, [L["stamina"]] = 12},
				},
				[3466] = {
					"purple",
					"Timeless Twilight Opal",
					{[L["intellect"]] = 8, [L["stamina"]] = 12},
				},
				[3467] = {
					"purple",
					"Shifting Twilight Opal",
					{[L["agility"]] = 8, [L["stamina"]] = 12},
				},
				[3468] = {
					"green",
					"Regal Forest Emerald",
					{[L["dodge rating"]] = 8, [L["stamina"]] = 12},
				},
				[3469] = {
					"purple",
					"Defender's Twilight Opal",
					{[L["parry rating"]] = 8, [L["stamina"]] = 12},
				},
				[3470] = {
					"green",
					"Jagged Forest Emerald",
					{[L["critical strike rating"]] = 8, [L["stamina"]] = 12},
				},
				[3471] = {
					"purple",
					"Guardian's Twilight Opal",
					{[L["expertise rating"]] = 8, [L["stamina"]] = 12},
				},
				[3472] = {
					"purple",
					"Purified Twilight Opal",
					{[L["intellect"]] = 8, [L["spirit"]] = 8},
				},
				[3473] = {
					"purple",
					"Purified Twilight Opal",
					{[L["intellect"]] = 8, [L["spirit"]] = 8},
				},
				[3474] = {
					"purple",
					"Glinting Twilight Opal",
					{[L["agility"]] = 8, [L["hit rating"]] = 8},
				},
				[3475] = {
					"purple",
					"Glinting Twilight Opal",
					{[L["agility"]] = 8, [L["hit rating"]] = 8},
				},
				[3476] = {
					"purple",
					"Mysterious Twilight Opal",
					{[L["intellect"]] = 8, [L["spell penetration"]] = 10},
				},
				[3477] = {
					"orange",
					"Inscribed Monarch Topaz",
					{[L["critical strike rating"]] = 8, [L["strength"]] = 8},
				},
				[3478] = {
					"purple",
					"Etched Twilight Opal",
					{[L["hit rating"]] = 8, [L["strength"]] = 8},
				},
				[3479] = {
					"orange",
					"Champion's Monarch Topaz",
					{[L["dodge rating"]] = 8, [L["strength"]] = 8},
				},
				[3480] = {
					"orange",
					"Resplendent Monarch Topaz",
					{[L["resilience rating"]] = 8, [L["strength"]] = 8},
				},
				[3481] = {
					"orange",
					"Fierce Monarch Topaz",
					{[L["haste rating"]] = 8, [L["strength"]] = 8},
				},
				[3482] = {
					"orange",
					"Deadly Monarch Topaz",
					{[L["agility"]] = 8, [L["critical strike rating"]] = 8},
				},
				[3483] = {
					"purple",
					"Glinting Twilight Opal",
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
					"Reckless Monarch Topaz",
					{[L["haste rating"]] = 8, [L["intellect"]] = 8},
				},
				[3487] = {
					"orange",
					"Potent Monarch Topaz",
					{[L["critical strike rating"]] = 8, [L["intellect"]] = 8},
				},
				[3488] = {
					"purple",
					"Veiled Twilight Opal",
					{[L["hit rating"]] = 8, [L["intellect"]] = 8},
				},
				[3489] = {
					"orange",
					"Willful Monarch Topaz",
					{[L["intellect"]] = 8, [L["resilience rating"]] = 8},
				},
				[3490] = {
					"orange",
					"Reckless Monarch Topaz",
					{[L["haste rating"]] = 8, [L["intellect"]] = 8},
				},
				[3491] = {
					"orange",
					"Deadly Monarch Topaz",
					{[L["agility"]] = 8, [L["critical strike rating"]] = 8},
				},
				[3492] = {
					"purple",
					"Glinting Twilight Opal",
					{[L["agility"]] = 8, [L["hit rating"]] = 8},
				},
				[3493] = {
					"orange",
					"Lucent Monarch Topaz",
					{[L["agility"]] = 8, [L["resilience rating"]] = 8},
				},
				[3494] = {
					"orange",
					"Deft Monarch Topaz",
					{[L["agility"]] = 8, [L["haste rating"]] = 8},
				},
				[3495] = {
					"orange",
					"Stalwart Monarch Topaz",
					{[L["dodge rating"]] = 8, [L["parry rating"]] = 8},
				},
				[3496] = {
					"orange",
					"Stalwart Monarch Topaz",
					{[L["dodge rating"]] = 8, [L["parry rating"]] = 8},
				},
				[3497] = {
					"purple",
					"Accurate Twilight Opal",
					{[L["expertise rating"]] = 8, [L["hit rating"]] = 8},
				},
				[3498] = {
					"orange",
					"Resolute Monarch Topaz",
					{[L["dodge rating"]] = 8, [L["expertise rating"]] = 8},
				},
				[3499] = {
					"purple",
					"Timeless Twilight Opal",
					{[L["intellect"]] = 8, [L["stamina"]] = 12},
				},
				[3500] = {
					"green",
					"Jagged Forest Emerald",
					{[L["critical strike rating"]] = 8, [L["stamina"]] = 12},
				},
				[3501] = {
					"green",
					"Nimble Forest Emerald",
					{[L["dodge rating"]] = 8, [L["hit rating"]] = 8},
				},
				[3502] = {
					"green",
					"Regal Forest Emerald",
					{[L["dodge rating"]] = 8, [L["stamina"]] = 12},
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
					"purple",
					"Purified Twilight Opal",
					{[L["intellect"]] = 8, [L["spirit"]] = 8},
				},
				[3506] = {
					"green",
					"Misty Forest Emerald",
					{[L["critical strike rating"]] = 8, [L["spirit"]] = 8},
				},
				[3507] = {
					"green",
					"Lightning Forest Emerald",
					{[L["haste rating"]] = 8, [L["hit rating"]] = 8},
				},
				[3508] = {
					"green",
					"Turbid Forest Emerald",
					{[L["resilience rating"]] = 8, [L["spirit"]] = 8},
				},
				[3509] = {
					"green",
					"Energized Forest Emerald",
					{[L["haste rating"]] = 8, [L["spirit"]] = 8},
				},
				[3510] = {
					"purple",
					"Purified Twilight Opal",
					{[L["intellect"]] = 8, [L["spirit"]] = 8},
				},
				[3511] = {
					"green",
					"Misty Forest Emerald",
					{[L["critical strike rating"]] = 8, [L["spirit"]] = 8},
				},
				[3512] = {
					"green",
					"Lightning Forest Emerald",
					{[L["haste rating"]] = 8, [L["hit rating"]] = 8},
				},
				[3513] = {
					"green",
					"Turbid Forest Emerald",
					{[L["resilience rating"]] = 8, [L["spirit"]] = 8},
				},
				[3514] = {
					"green",
					"Energized Forest Emerald",
					{[L["haste rating"]] = 8, [L["spirit"]] = 8},
				},
				[3515] = {
					"green",
					"Radiant Forest Emerald",
					{[L["critical strike rating"]] = 8, [L["spell penetration"]] = 10},
				},
				[3516] = {
					"green",
					"Radiant Forest Emerald",
					{[L["critical strike rating"]] = 8, [L["spell penetration"]] = 10},
				},
				[3517] = {
					"green",
					"Shattered Forest Emerald",
					{[L["haste rating"]] = 8, [L["spell penetration"]] = 10},
				},
				[3621] = {
					"meta",
					"Chaotic Skyflare Diamond",
					{[L["critical damage (percent)"]] = 3, [L["critical strike rating"]] = 21},
				},
				[3622] = {
					"meta",
					"Destructive Skyflare Diamond",
					{[L["critical strike rating"]] = 25, [L["spell reflect (percent)"]] = 1},
				},
				[3623] = {
					"meta",
					"Ember Skyflare Diamond",
					{[L["intellect"]] = 21, [L["mana (percent)"]] = 2},
				},
				[3624] = {
					"meta",
					"Enigmatic Skyflare Diamond",
					{[L["critical strike rating"]] = 21, [L["snare/root duration reduction (percent)"]] = 10},
				},
				[3625] = {
					"meta",
					"Swift Skyflare Diamond",
					{[L["critical strike rating"]] = 21, [L["minor run speed"]] = 1},
				},
				[3626] = {
					"meta",
					"Bracing Earthsiege Diamond",
					{[L["intellect"]] = 21, [L["threat reduction (percent)"]] = 2},
				},
				[3627] = {
					"meta",
					"Insightful Earthsiege Diamond",
					{[L["chance to restore mana on spellcast"]] = 1, [L["intellect"]] = 21},
				},
				[3628] = {
					"meta",
					"Relentless Earthsiege Diamond",
					{[L["agility"]] = 21, [L["critical damage (percent)"]] = 3},
				},
				[3631] = {
					"meta",
					"Eternal Earthsiege Diamond",
					{[L["block value (percent)"]] = 1, [L["dodge rating"]] = 21},
				},
				[3632] = {
					"meta",
					"Tireless Skyflare Diamond",
					{[L["intellect"]] = 21, [L["minor run speed"]] = 1},
				},
				[3633] = {
					"meta",
					"Revitalizing Skyflare Diamond",
					{[L["critical healing (percent)"]] = 3, [L["spirit"]] = 22},
				},
				[3634] = {
					"meta",
					"Shielded Skyflare Diamond",
					{[L["spell damage taken reduction (percent)"]] = 2, [L["stamina"]] = 32},
				},
				[3635] = {
					"meta",
					"Forlorn Skyflare Diamond",
					{[L["intellect"]] = 21, [L["silence duration reduction (percent)"]] = 10},
				},
				[3636] = {
					"meta",
					"Impassive Skyflare Diamond",
					{[L["critical strike rating"]] = 21, [L["fear duration reduction (percent)"]] = 10},
				},
				[3637] = {
					"meta",
					"Austere Earthsiege Diamond",
					{[L["armor from items (percent)"]] = 2, [L["stamina"]] = 32},
				},
				[3638] = {
					"meta",
					"Persistent Earthsiege Diamond",
					{[L["critical strike rating"]] = 21, [L["stun duration reduction (percent)"]] = 10},
				},
				[3639] = {
					"meta",
					"Trenchant Earthsiege Diamond",
					{[L["intellect"]] = 21, [L["stun duration reduction (percent)"]] = 10},
				},
				[3640] = {
					"meta",
					"Invigorating Earthsiege Diamond",
					{[L["haste rating"]] = 21, [L["sometimes heal on your crits"]] = 1},
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
					"Brilliant Cardinal Ruby",
					{[L["intellect"]] = 20},
				},
				[3521] = {
					"red",
					"Delicate Cardinal Ruby",
					{[L["agility"]] = 20},
				},
				[3522] = {
					"yellow",
					"Subtle King's Amber",
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
					"yellow",
					"Smooth King's Amber",
					{[L["critical strike rating"]] = 20},
				},
				[3526] = {
					"red",
					"Brilliant Cardinal Ruby",
					{[L["intellect"]] = 20},
				},
				[3527] = {
					"yellow",
					"Smooth King's Amber",
					{[L["critical strike rating"]] = 20},
				},
				[3528] = {
					"blue",
					"Rigid Majestic Zircon",
					{[L["hit rating"]] = 20},
				},
				[3529] = {
					"yellow",
					"Subtle King's Amber",
					{[L["dodge rating"]] = 20},
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
					"Sparkling Majestic Zircon",
					{[L["spirit"]] = 20},
				},
				[3535] = {
					"blue",
					"Stormy Majestic Zircon",
					{[L["spell penetration"]] = 25},
				},
				[3536] = {
					"purple",
					"Sovereign Dreadstone",
					{[L["stamina"]] = 15, [L["strength"]] = 10},
				},
				[3537] = {
					"purple",
					"Shifting Dreadstone",
					{[L["agility"]] = 10, [L["stamina"]] = 15},
				},
				[3538] = {
					"purple",
					"Timeless Dreadstone",
					{[L["intellect"]] = 10, [L["stamina"]] = 15},
				},
				[3539] = {
					"purple",
					"Shifting Dreadstone",
					{[L["agility"]] = 10, [L["stamina"]] = 15},
				},
				[3540] = {
					"green",
					"Regal Eye of Zul",
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
					"green",
					"Jagged Eye of Zul",
					{[L["critical strike rating"]] = 10, [L["stamina"]] = 15},
				},
				[3544] = {
					"purple",
					"Glinting Dreadstone",
					{[L["agility"]] = 10, [L["hit rating"]] = 10},
				},
				[3545] = {
					"purple",
					"Purified Dreadstone",
					{[L["intellect"]] = 10, [L["spirit"]] = 10},
				},
				[3546] = {
					"purple",
					"Purified Dreadstone",
					{[L["intellect"]] = 10, [L["spirit"]] = 10},
				},
				[3547] = {
					"purple",
					"Glinting Dreadstone",
					{[L["agility"]] = 10, [L["hit rating"]] = 10},
				},
				[3548] = {
					"purple",
					"Mysterious Dreadstone",
					{[L["intellect"]] = 10, [L["spell penetration"]] = 13},
				},
				[3549] = {
					"orange",
					"Inscribed Ametrine",
					{[L["critical strike rating"]] = 10, [L["strength"]] = 10},
				},
				[3550] = {
					"purple",
					"Etched Dreadstone",
					{[L["hit rating"]] = 10, [L["strength"]] = 10},
				},
				[3551] = {
					"orange",
					"Champion's Ametrine",
					{[L["dodge rating"]] = 10, [L["strength"]] = 10},
				},
				[3552] = {
					"orange",
					"Resplendent Ametrine",
					{[L["resilience rating"]] = 10, [L["strength"]] = 10},
				},
				[3553] = {
					"orange",
					"Fierce Ametrine",
					{[L["haste rating"]] = 10, [L["strength"]] = 10},
				},
				[3554] = {
					"orange",
					"Deadly Ametrine",
					{[L["agility"]] = 10, [L["critical strike rating"]] = 10},
				},
				[3555] = {
					"purple",
					"Glinting Dreadstone",
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
					"purple",
					"Purified Dreadstone",
					{[L["intellect"]] = 10, [L["spirit"]] = 10},
				},
				[3559] = {
					"orange",
					"Potent Ametrine",
					{[L["critical strike rating"]] = 10, [L["intellect"]] = 10},
				},
				[3560] = {
					"purple",
					"Veiled Dreadstone",
					{[L["hit rating"]] = 10, [L["intellect"]] = 10},
				},
				[3561] = {
					"orange",
					"Willful Ametrine",
					{[L["intellect"]] = 10, [L["resilience rating"]] = 10},
				},
				[3563] = {
					"orange",
					"Reckless Ametrine",
					{[L["haste rating"]] = 10, [L["intellect"]] = 10},
				},
				[3564] = {
					"orange",
					"Deadly Ametrine",
					{[L["agility"]] = 10, [L["critical strike rating"]] = 10},
				},
				[3565] = {
					"purple",
					"Glinting Ametrine",
					{[L["agility"]] = 10, [L["hit rating"]] = 10},
				},
				[3566] = {
					"orange",
					"Lucent Ametrine",
					{[L["agility"]] = 10, [L["resilience rating"]] = 10},
				},
				[3567] = {
					"orange",
					"Deft Ametrine",
					{[L["agility"]] = 10, [L["haste rating"]] = 10},
				},
				[3568] = {
					"orange",
					"Stalwart Ametrine",
					{[L["dodge rating"]] = 10, [L["parry rating"]] = 10},
				},
				[3569] = {
					"orange",
					"Stalwart Ametrine",
					{[L["dodge rating"]] = 10, [L["parry rating"]] = 10},
				},
				[3570] = {
					"purple",
					"Accurate Dreadstone",
					{[L["expertise rating"]] = 10, [L["hit rating"]] = 10},
				},
				[3571] = {
					"orange",
					"Resolute Ametrine",
					{[L["dodge rating"]] = 10, [L["expertise rating"]] = 10},
				},
				[3572] = {
					"purple",
					"Timeless Dreadstone",
					{[L["intellect"]] = 10, [L["stamina"]] = 15},
				},
				[3573] = {
					"green",
					"Jagged Eye of Zul",
					{[L["critical strike rating"]] = 10, [L["stamina"]] = 15},
				},
				[3574] = {
					"green",
					"Nimble Eye of Zul",
					{[L["dodge rating"]] = 10, [L["hit rating"]] = 10},
				},
				[3575] = {
					"green",
					"Regal Eye of Zul",
					{[L["dodge rating"]] = 10, [L["stamina"]] = 15},
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
					"purple",
					"Purified Dreadstone",
					{[L["intellect"]] = 10, [L["spirit"]] = 10},
				},
				[3579] = {
					"green",
					"Misty Eye of Zul",
					{[L["critical strike rating"]] = 10, [L["spirit"]] = 10},
				},
				[3580] = {
					"green",
					"Lightning Eye of Zul",
					{[L["haste rating"]] = 10, [L["hit rating"]] = 10},
				},
				[3581] = {
					"green",
					"Turbid Eye of Zul",
					{[L["resilience rating"]] = 10, [L["spirit"]] = 10},
				},
				[3582] = {
					"green",
					"Energized Eye of Zul",
					{[L["haste rating"]] = 10, [L["spirit"]] = 10},
				},
				[3583] = {
					"purple",
					"Purified Dreadstone",
					{[L["intellect"]] = 10, [L["spirit"]] = 10},
				},
				[3584] = {
					"green",
					"Misty Eye of Zul",
					{[L["critical strike rating"]] = 10, [L["spirit"]] = 10},
				},
				[3585] = {
					"green",
					"Lightning Eye of Zul",
					{[L["haste rating"]] = 10, [L["hit rating"]] = 10},
				},
				[3586] = {
					"green",
					"Turbid Eye of Zul",
					{[L["resilience rating"]] = 10, [L["spirit"]] = 10},
				},
				[3587] = {
					"green",
					"Energized Eye of Zul",
					{[L["haste rating"]] = 10, [L["spirit"]] = 10},
				},
				[3588] = {
					"green",
					"Radiant Eye of Zul",
					{[L["critical strike rating"]] = 10, [L["spell penetration"]] = 13},
				},
				[3589] = {
					"green",
					"Radiant Eye of Zul",
					{[L["critical strike rating"]] = 10, [L["spell penetration"]] = 13},
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
					{[L["agility"]] = 12},
				},
				[3210] = {
					"red",
					"Don Julio's Heart",
					{[L["intellect"]] = 12},
				},
				[3211] = {
					"red",
					"Kailee's Rose",
					{[L["intellect"]] = 12},
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
					{[L["dodge rating"]] = 12},
				},
			},
			[7] = {
				[3292] = {
					"red",
					"Delicate Dragon's Eye",
					{[L["agility"]] = 34},
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
					"Brilliant Dragon's Eye",
					{[L["intellect"]] = 34},
				},
				[3735] = {
					"blue",
					"Sparkling Dragon's Eye",
					{[L["spirit"]] = 34},
				},
				[3736] = {
					"blue",
					"Sparkling Dragon's Eye",
					{[L["spirit"]] = 34},
				},
				[3737] = {
					"red",
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
					"yellow",
					"Subtle Dragon's Eye",
					{[L["dodge rating"]] = 34},
				},
				[3741] = {
					"red",
					"Flashing Dragon's Eye",
					{[L["parry rating"]] = 34},
				},
				[3742] = {
					"blue",
					"Rigid Dragon's Eye",
					{[L["hit rating"]] = 34},
				},
				[3743] = {
					"yellow",
					"Subtle Dragon's Eye",
					{[L["dodge rating"]] = 34},
				},
				[3744] = {
					"yellow",
					"Mystic Dragon's Eye",
					{[L["resilience rating"]] = 34},
				},
				[3745] = {
					"yellow",
					"Smooth Dragon's Eye",
					{[L["critical strike rating"]] = 34},
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
					"yellow",
					"Perfect Subtle Sun Crystal",
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
					"Perfect Brilliant Bloodstone",
					{[L["intellect"]] = 14},
				},
				[3651] = {
					"red",
					"Perfect Delicate Bloodstone",
					{[L["agility"]] = 14},
				},
				[3652] = {
					"yellow",
					"Perfect Smooth Sun Crystal",
					{[L["critical strike rating"]] = 14},
				},
				[3653] = {
					"blue",
					"Perfect Sparkling Chalcedony",
					{[L["spirit"]] = 14},
				},
				[3654] = {
					"blue",
					"Perfect Sparkling Chalcedony",
					{[L["spirit"]] = 14},
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
					"Perfect Subtle Sun Crystal",
					{[L["dodge rating"]] = 14},
				},
				[3659] = {
					"yellow",
					"Perfect Quick Sun Crystal",
					{[L["haste rating"]] = 14},
				},
				[3660] = {
					"blue",
					"Perfect Rigid Chalcedony",
					{[L["hit rating"]] = 14},
				},
				[3661] = {
					"red",
					"Perfect Brilliant Bloodstone",
					{[L["intellect"]] = 14},
				},
				[3662] = {
					"yellow",
					"Perfect Mystic Sun Crystal",
					{[L["resilience rating"]] = 14},
				},
				[3663] = {
					"purple",
					"Perfect Glinting Shadow Crystal",
					{[L["agility"]] = 7, [L["hit rating"]] = 7},
				},
				[3664] = {
					"purple",
					"Perfect Shifting Shadow Crystal",
					{[L["agility"]] = 7, [L["stamina"]] = 10},
				},
				[3665] = {
					"green",
					"Perfect Jagged Dark Jade",
					{[L["critical strike rating"]] = 7, [L["stamina"]] = 10},
				},
				[3666] = {
					"purple",
					"Perfect Glinting Shadow Crystal",
					{[L["agility"]] = 7, [L["hit rating"]] = 7},
				},
				[3667] = {
					"purple",
					"Perfect Shifting Shadow Crystal",
					{[L["agility"]] = 7, [L["stamina"]] = 10},
				},
				[3668] = {
					"green",
					"Perfect Regal Dark Jade",
					{[L["dodge rating"]] = 7, [L["stamina"]] = 10},
				},
				[3669] = {
					"purple",
					"Perfect Guardian's Shadow Crystal",
					{[L["expertise rating"]] = 7, [L["stamina"]] = 10},
				},
				[3670] = {
					"purple",
					"Perfect Defender's Shadow Crystal",
					{[L["parry rating"]] = 7, [L["stamina"]] = 10},
				},
				[3671] = {
					"purple",
					"Perfect Sovereign Shadow Crystal",
					{[L["stamina"]] = 10, [L["strength"]] = 7},
				},
				[3672] = {
					"purple",
					"Perfect Purified Shadow Crystal",
					{[L["intellect"]] = 7, [L["spirit"]] = 7},
				},
				[3673] = {
					"purple",
					"Perfect Purified Shadow Crystal",
					{[L["intellect"]] = 7, [L["spirit"]] = 7},
				},
				[3674] = {
					"purple",
					"Perfect Mysterious Shadow Crystal",
					{[L["intellect"]] = 7, [L["spell penetration"]] = 9},
				},
				[3675] = {
					"purple",
					"Perfect Timeless Shadow Crystal",
					{[L["intellect"]] = 7, [L["stamina"]] = 10},
				},
				[3677] = {
					"orange",
					"Perfect Deft Huge Citrine",
					{[L["agility"]] = 7, [L["haste rating"]] = 7},
				},
				[3678] = {
					"orange",
					"Perfect Deft Huge Citrine",
					{[L["agility"]] = 7, [L["haste rating"]] = 7},
				},
				[3679] = {
					"purple",
					"Perfect Glinting Huge Citrine",
					{[L["agility"]] = 7, [L["hit rating"]] = 7},
				},
				[3680] = {
					"orange",
					"Perfect Lucent Huge Citrine",
					{[L["agility"]] = 7, [L["resilience rating"]] = 7},
				},
				[3681] = {
					"orange",
					"Perfect Inscribed Huge Citrine",
					{[L["critical strike rating"]] = 7, [L["strength"]] = 7},
				},
				[3682] = {
					"purple",
					"Perfect Etched Shadow Crystal",
					{[L["hit rating"]] = 7, [L["strength"]] = 7},
				},
				[3683] = {
					"orange",
					"Perfect Champion's Huge Citrine",
					{[L["dodge rating"]] = 7, [L["strength"]] = 7},
				},
				[3684] = {
					"orange",
					"Perfect Resplendent Huge Citrine",
					{[L["resilience rating"]] = 7, [L["strength"]] = 7},
				},
				[3685] = {
					"orange",
					"Perfect Fierce Huge Citrine",
					{[L["haste rating"]] = 7, [L["strength"]] = 7},
				},
				[3686] = {
					"orange",
					"Perfect Deadly Huge Citrine",
					{[L["agility"]] = 7, [L["critical strike rating"]] = 7},
				},
				[3687] = {
					"purple",
					"Perfect Glinting Shadow Crystal",
					{[L["agility"]] = 7, [L["hit rating"]] = 7},
				},
				[3688] = {
					"orange",
					"Perfect Lucent Huge Citrine",
					{[L["agility"]] = 7, [L["resilience rating"]] = 7},
				},
				[3689] = {
					"purple",
					"Perfect Purified Shadow Crystal",
					{[L["intellect"]] = 7, [L["spirit"]] = 7},
				},
				[3690] = {
					"orange",
					"Perfect Potent Huge Citrine",
					{[L["critical strike rating"]] = 7, [L["intellect"]] = 7},
				},
				[3691] = {
					"purple",
					"Perfect Veiled Shadow Crystal",
					{[L["hit rating"]] = 7, [L["intellect"]] = 7},
				},
				[3692] = {
					"orange",
					"Perfect Willful Huge Citrine",
					{[L["intellect"]] = 7, [L["resilience rating"]] = 7},
				},
				[3693] = {
					"orange",
					"Perfect Reckless Huge Citrine",
					{[L["haste rating"]] = 7, [L["intellect"]] = 7},
				},
				[3694] = {
					"orange",
					"Perfect Stalwart Huge Citrine",
					{[L["dodge rating"]] = 7, [L["parry rating"]] = 7},
				},
				[3695] = {
					"orange",
					"Perfect Stalwart Huge Citrine",
					{[L["dodge rating"]] = 7, [L["parry rating"]] = 7},
				},
				[3696] = {
					"purple",
					"Perfect Accurate Shadow Crystal",
					{[L["expertise rating"]] = 7, [L["hit rating"]] = 7},
				},
				[3697] = {
					"orange",
					"Perfect Resolute Huge Citrine",
					{[L["dodge rating"]] = 7, [L["expertise rating"]] = 7},
				},
				[3698] = {
					"green",
					"Perfect Misty Dark Jade",
					{[L["critical strike rating"]] = 7, [L["spirit"]] = 7},
				},
				[3699] = {
					"green",
					"Perfect Jagged Dark Jade",
					{[L["critical strike rating"]] = 7, [L["stamina"]] = 10},
				},
				[3700] = {
					"green",
					"Perfect Regal Dark Jade",
					{[L["dodge rating"]] = 7, [L["stamina"]] = 10},
				},
				[3701] = {
					"green",
					"Perfect Energized Dark Jade",
					{[L["haste rating"]] = 7, [L["spirit"]] = 7},
				},
				[3702] = {
					"green",
					"Perfect Forceful Dark Jade",
					{[L["haste rating"]] = 7, [L["stamina"]] = 10},
				},
				[3703] = {
					"green",
					"Perfect Lightning Dark Jade",
					{[L["haste rating"]] = 7, [L["hit rating"]] = 7},
				},
				[3704] = {
					"green",
					"Perfect Nimble Dark Jade",
					{[L["dodge rating"]] = 7, [L["hit rating"]] = 7},
				},
				[3705] = {
					"purple",
					"Perfect Purified Shadow Crystal",
					{[L["intellect"]] = 7, [L["spirit"]] = 7},
				},
				[3706] = {
					"purple",
					"Perfect Timeless Shadow Crystal",
					{[L["intellect"]] = 7, [L["stamina"]] = 10},
				},
				[3707] = {
					"green",
					"Perfect Turbid Dark Jade",
					{[L["resilience rating"]] = 7, [L["spirit"]] = 7},
				},
				[3708] = {
					"green",
					"Perfect Steady Dark Jade",
					{[L["resilience rating"]] = 7, [L["stamina"]] = 10},
				},
				[3709] = {
					"green",
					"Perfect Radiant Dark Jade",
					{[L["critical strike rating"]] = 7, [L["spell penetration"]] = 9},
				},
				[3710] = {
					"green",
					"Perfect Misty Dark Jade",
					{[L["critical strike rating"]] = 7, [L["spirit"]] = 7},
				},
				[3711] = {
					"purple",
					"Perfect Purified Shadow Crystal",
					{[L["intellect"]] = 7, [L["spirit"]] = 7},
				},
				[3712] = {
					"green",
					"Perfect Lightning Dark Jade",
					{[L["haste rating"]] = 7, [L["hit rating"]] = 7},
				},
				[3713] = {
					"green",
					"Perfect Turbid Dark Jade",
					{[L["resilience rating"]] = 7, [L["spirit"]] = 7},
				},
				[3714] = {
					"green",
					"Perfect Energized Dark Jade",
					{[L["haste rating"]] = 7, [L["spirit"]] = 7},
				},
				[3715] = {
					"green",
					"Perfect Radiant Dark Jade",
					{[L["critical strike rating"]] = 7, [L["spell penetration"]] = 9},
				},
				[3716] = {
					"green",
					"Perfect Shattered Dark Jade",
					{[L["haste rating"]] = 7, [L["spell penetration"]] = 9},
				},
				[3767] = {
					"orange",
					"Perfect Deadly Huge Citrine",
					{[L["agility"]] = 7, [L["critical strike rating"]] = 7},
				},
			},
		},
	},
	["PVP-Vendor"] = {
		["Normal"] = {
			[4] = {
				[2912] = {
					"red",
					"Brilliant Ornate Ruby",
					{[L["intellect"]] = 10},
				},
				[2913] = {
					"yellow",
					"Smooth Ornate Dawnstone",
					{[L["critical strike rating"]] = 10},
				},
				[2914] = {
					"yellow",
					"Smooth Ornate Dawnstone",
					{[L["critical strike rating"]] = 10},
				},
				[2916] = {
					"orange",
					"Potent Ornate Topaz",
					{[L["critical strike rating"]] = 5, [L["intellect"]] = 5},
				},
				[2945] = {
					"red",
					"Delicate Ornate Ruby",
					{[L["agility"]] = 10},
				},
				[2946] = {
					"orange",
					"Deadly Ornate Topaz",
					{[L["agility"]] = 5, [L["critical strike rating"]] = 5},
				},
				[3335] = {
					"red",
					"Delicate Ornate Ruby",
					{[L["agility"]] = 10},
				},
				[3336] = {
					"yellow",
					"Smooth Ornate Dawnstone",
					{[L["critical strike rating"]] = 10},
				},
				[3337] = {
					"orange",
					"Deadly Ornate Topaz",
					{[L["agility"]] = 5, [L["critical strike rating"]] = 5},
				},
				[3338] = {
					"orange",
					"Potent Ornate Topaz",
					{[L["critical strike rating"]] = 5, [L["intellect"]] = 5},
				},
				[3339] = {
					"red",
					"Brilliant Ornate Ruby",
					{[L["intellect"]] = 10},
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
					{[L["critical strike rating"]] = 17, [L["minor run speed"]] = 1},
				},
				[3799] = {
					"meta",
					"Tireless Starflare Diamond",
					{[L["intellect"]] = 17, [L["minor run speed"]] = 1},
				},
				[3800] = {
					"meta",
					"Impassive Starflare Diamond",
					{[L["critical strike rating"]] = 17, [L["fear duration reduction (percent)"]] = 10},
				},
				[3801] = {
					"meta",
					"Enigmatic Starflare Diamond",
					{[L["critical strike rating"]] = 17, [L["snare/root duration reduction (percent)"]] = 10},
				},
				[3802] = {
					"meta",
					"Forlorn Starflare Diamond",
					{[L["intellect"]] = 17, [L["silence duration reduction (percent)"]] = 10},
				},
				[3803] = {
					"meta",
					"Persistent Earthshatter Diamond",
					{[L["critical strike rating"]] = 17, [L["stun duration reduction (percent)"]] = 10},
				},
				[3804] = {
					"meta",
					"Powerful Earthshatter Diamond",
					{[L["stamina"]] = 26, [L["stun duration reduction (percent)"]] = 10},
				},
				[3805] = {
					"meta",
					"Trenchant Earthshatter Diamond",
					{[L["intellect"]] = 17, [L["stun duration reduction (percent)"]] = 10},
				},
			},
		},
		["Unique-Equipped"] = {
			[3] = {
				[2896] = {
					"red",
					"Brilliant Blood Garnet",
					{[L["intellect"]] = 7},
				},
				[2898] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike rating"]] = 4, [L["stamina"]] = 3},
				},
				[2899] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike rating"]] = 4, [L["stamina"]] = 3},
				},
				[2918] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike rating"]] = 4, [L["stamina"]] = 3},
				},
				[2921] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike rating"]] = 4, [L["stamina"]] = 3},
				},
				[2923] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike rating"]] = 4, [L["stamina"]] = 3},
				},
				[2924] = {
					"red",
					"Brilliant Blood Garnet",
					{[L["intellect"]] = 7},
				},
				[2943] = {
					"red",
					"Delicate Blood Garnet",
					{[L["agility"]] = 7},
				},
				[2944] = {
					"red",
					"Delicate Blood Garnet",
					{[L["agility"]] = 7},
				},
				[2969] = {
					"meta",
					"Swift Windfire Diamond",
					{[L["critical strike rating"]] = 10, [L["minor run speed"]] = 1},
				},
				[2970] = {
					"meta",
					"Quickened Starfire Diamond",
					{[L["intellect"]] = 10, [L["minor run speed"]] = 1},
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
					"Mystic Dawnstone",
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
					{[L["stamina"]] = 6, [L["strength"]] = 5},
				},
				[3046] = {
					"orange",
					"Reckless Fire Opal",
					{[L["haste rating"]] = 4, [L["intellect"]] = 5},
				},
				[3047] = {
					"green",
					"Jagged Chrysoprase",
					{[L["critical strike rating"]] = 5, [L["stamina"]] = 6},
				},
				[3048] = {
					"purple",
					"Shifting Tanzanite",
					{[L["agility"]] = 5, [L["stamina"]] = 6},
				},
				[3049] = {
					"green",
					"Misty Chrysoprase",
					{[L["critical strike rating"]] = 5, [L["spirit"]] = 4},
				},
				[3050] = {
					"orange",
					"Reckless Fire Opal",
					{[L["haste rating"]] = 4, [L["intellect"]] = 5},
				},
				[3051] = {
					"purple",
					"Timeless Tanzanite",
					{[L["intellect"]] = 5, [L["stamina"]] = 6},
				},
				[3052] = {
					"purple",
					"Glinting Tanzanite",
					{[L["agility"]] = 5, [L["hit rating"]] = 4},
				},
				[3053] = {
					"orange",
					"Stalwart Fire Opal",
					{[L["dodge rating"]] = 4, [L["parry rating"]] = 5},
				},
				[3054] = {
					"purple",
					"Timeless Tanzanite",
					{[L["intellect"]] = 5, [L["stamina"]] = 6},
				},
				[3055] = {
					"purple",
					"Glinting Tanzanite",
					{[L["agility"]] = 5, [L["hit rating"]] = 4},
				},
				[3056] = {
					"orange",
					"Stalwart Fire Opal",
					{[L["dodge rating"]] = 4, [L["parry rating"]] = 5},
				},
				[3057] = {
					"purple",
					"Etched Tanzanite",
					{[L["hit rating"]] = 4, [L["strength"]] = 5},
				},
				[3058] = {
					"green",
					"Misty Chrysoprase",
					{[L["critical strike rating"]] = 5, [L["spirit"]] = 4},
				},
				[3060] = {
					"green",
					"Regal Tanzanite",
					{[L["dodge rating"]] = 5, [L["stamina"]] = 6},
				},
				[3061] = {
					"purple",
					"Veiled Tanzanite",
					{[L["hit rating"]] = 4, [L["intellect"]] = 5},
				},
				[3062] = {
					"green",
					"Jagged Chrysoprase",
					{[L["critical strike rating"]] = 5, [L["stamina"]] = 6},
				},
				[3063] = {
					"purple",
					"Defender's Tanzanite",
					{[L["parry rating"]] = 5, [L["stamina"]] = 6},
				},
				[3064] = {
					"purple",
					"Purified Tanzanite",
					{[L["intellect"]] = 5, [L["spirit"]] = 5},
				},
				[3066] = {
					"purple",
					"Mysterious Tanzanite",
					{[L["intellect"]] = 5, [L["spell penetration"]] = 5},
				},
				[3067] = {
					"purple",
					"Shifting Tanzanite",
					{[L["agility"]] = 5, [L["stamina"]] = 6},
				},
				[3068] = {
					"green",
					"Nimble Chrysoprase",
					{[L["dodge rating"]] = 5, [L["hit rating"]] = 4},
				},
				[3069] = {
					"orange",
					"Willful Fire Opal",
					{[L["intellect"]] = 5, [L["resilience rating"]] = 4},
				},
				[3070] = {
					"orange",
					"Deadly Fire Opal",
					{[L["agility"]] = 5, [L["critical strike rating"]] = 4},
				},
				[3071] = {
					"purple",
					"Timeless Chrysoprase",
					{[L["intellect"]] = 5, [L["stamina"]] = 6},
				},
				[3072] = {
					"orange",
					"Inscribed Fire Opal",
					{[L["critical strike rating"]] = 4, [L["strength"]] = 5},
				},
				[3073] = {
					"orange",
					"Polished Fire Opal",
					{[L["agility"]] = 4, [L["dodge rating"]] = 5},
				},
				[3074] = {
					"green",
					"Purified Chrysoprase",
					{[L["intellect"]] = 5, [L["spirit"]] = 4},
				},
				[3075] = {
					"orange",
					"Champion's Fire Opal",
					{[L["dodge rating"]] = 4, [L["strength"]] = 5},
				},
				[3076] = {
					"orange",
					"Potent Fire Opal",
					{[L["critical strike rating"]] = 4, [L["intellect"]] = 5},
				},
				[3077] = {
					"purple",
					"Purified Chrysoprase",
					{[L["intellect"]] = 5, [L["spirit"]] = 4},
				},
				[3078] = {
					"green",
					"Regal Chrysoprase",
					{[L["dodge rating"]] = 5, [L["stamina"]] = 6},
				},
				[3079] = {
					"orange",
					"Lucent Fire Opal",
					{[L["agility"]] = 5, [L["resilience rating"]] = 4},
				},
				[3080] = {
					"green",
					"Steady Chrysoprase",
					{[L["resilience rating"]] = 5, [L["stamina"]] = 6},
				},
				[3081] = {
					"orange",
					"Potent Fire Opal",
					{[L["critical strike rating"]] = 4, [L["intellect"]] = 5},
				},
				[3082] = {
					"green",
					"Regal Chrysoprase",
					{[L["dodge rating"]] = 5, [L["stamina"]] = 6},
				},
				[3083] = {
					"purple",
					"Purified Tanzanite",
					{[L["intellect"]] = 5, [L["spirit"]] = 4},
				},
				[3084] = {
					"green",
					"Steady Chrysoprase",
					{[L["resilience rating"]] = 5, [L["stamina"]] = 6},
				},
				[3085] = {
					"green",
					"Jagged Chrysoprase",
					{[L["critical strike rating"]] = 5, [L["stamina"]] = 6},
				},
				[3086] = {
					"purple",
					"Purified Tanzanite",
					{[L["intellect"]] = 5, [L["spirit"]] = 4},
				},
				[3087] = {
					"orange",
					"Resplendent Fire Opal",
					{[L["resilience rating"]] = 4, [L["strength"]] = 5},
				},
				[3088] = {
					"green",
					"Nimble Chrysoprase",
					{[L["dodge rating"]] = 4, [L["hit rating"]] = 5},
				},
				[3089] = {
					"green",
					"Lightning Chrysoprase",
					{[L["haste rating"]] = 4, [L["hit rating"]] = 5},
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
					"red",
					"Brilliant Stormjewel",
					{[L["intellect"]] = 20},
				},
				[3866] = {
					"red",
					"Brilliant Stormjewel",
					{[L["intellect"]] = 20},
				},
				[3867] = {
					"blue",
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
					"Tense Unstable Diamond",
					{[L["critical strike rating"]] = 12, [L["stun resist chance (percent)"]] = 5},
				},
				[3163] = {
					"meta",
					"Imbued Unstable Diamond",
					{[L["intellect"]] = 12, [L["stun resist chance (percent)"]] = 5},
				},
			},
			[4] = {
				[3099] = {
					"purple",
					"Timeless Amethyst",
					{[L["intellect"]] = 5, [L["stamina"]] = 6},
				},
				[3100] = {
					"purple",
					"Tireless Soothing Amethyst",
					{[L["intellect"]] = 5, [L["stamina"]] = 6},
				},
				[3101] = {
					"purple",
					"Sovereign Amethyst",
					{[L["stamina"]] = 6, [L["strength"]] = 5},
				},
				[3276] = {
					"red",
					"Delicate Crimson Spinel",
					{[L["agility"]] = 10},
				},
				[3277] = {
					"red",
					"Brilliant Crimson Spinel",
					{[L["intellect"]] = 10},
				},
				[3278] = {
					"red",
					"Brilliant Crimson Spinel",
					{[L["intellect"]] = 10},
				},
				[3281] = {
					"red",
					"Delicate Crimson Spinel",
					{[L["agility"]] = 10},
				},
				[3282] = {
					"red",
					"Brilliant Crimson Spinel",
					{[L["intellect"]] = 10},
				},
				[3283] = {
					"red",
					"Brilliant Crimson Spinel",
					{[L["intellect"]] = 10},
				},
			},
		},
		["Unique-Equipped"] = {
			[3] = {
				[3156] = {
					"purple",
					"Unstable Amethyst",
					{[L["agility"]] = 5, [L["stamina"]] = 6},
				},
				[3157] = {
					"purple",
					"Unstable Peridot",
					{[L["intellect"]] = 4, [L["stamina"]] = 6},
				},
				[3158] = {
					"purple",
					"Unstable Sapphire",
					{[L["intellect"]] = 5, [L["spirit"]] = 4},
				},
				[3159] = {
					"orange",
					"Unstable Citrine",
					{[L["agility"]] = 5, [L["critical strike rating"]] = 4},
				},
				[3160] = {
					"orange",
					"Unstable Topaz",
					{[L["haste rating"]] = 4, [L["intellect"]] = 5},
				},
				[3161] = {
					"green",
					"Unstable Talasite",
					{[L["critical strike rating"]] = 4, [L["stamina"]] = 4},
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
