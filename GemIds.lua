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
-- 	8: cataclysm green
-- 	9: cataclysm blue
-- 10: cataclysm epic
-- 11: pandaria green
-- 12: pandaria blue
-- 13: pandaria epic
-- 14: pandaria legendary

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
					{[L["critical strike"]] = 4},
				},
				[2966] = {
					"blue",
					"Rigid Zircon",
					{[L["hit"]] = 4},
				},
				[2967] = {
					"yellow",
					"Smooth Amber",
					{[L["critical strike"]] = 4},
				},
				[2968] = {
					"yellow",
					"Subtle Amber",
					{[L["dodge"]] = 4},
				},
			},
		},
		["Unique-Equipped"] = {
			[9] = {
				[4166] = {
					"cogwheel",
					"Subtle Cogwheel",
					{[L["dodge"]] = 208},
				},
				[4167] = {
					"cogwheel",
					"Smooth Cogwheel",
					{[L["critical strike"]] = 208},
				},
				[4168] = {
					"cogwheel",
					"Quick Cogwheel",
					{[L["haste"]] = 208},
				},
				[4169] = {
					"cogwheel",
					"Fractured Cogwheel",
					{[L["mastery"]] = 208},
				},
				[4170] = {
					"cogwheel",
					"Precise Cogwheel",
					{[L["expertise"]] = 208},
				},
				[4171] = {
					"cogwheel",
					"Flashing Cogwheel",
					{[L["parry"]] = 208},
				},
				[4172] = {
					"cogwheel",
					"Rigid Cogwheel",
					{[L["hit"]] = 208},
				},
				[4173] = {
					"cogwheel",
					"Sparkling Cogwheel",
					{[L["spirit"]] = 208},
				},
				[4239] = {
					"cogwheel",
					"Mystic Cogwheel",
					{[L["pvp resilience"]] = 208},
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
					{[L["critical strike"]] = 6},
				},
				[2696] = {
					"yellow",
					"Subtle Golden Draenite",
					{[L["dodge"]] = 6},
				},
				[2697] = {
					"blue",
					"Rigid Azure Moonstone",
					{[L["hit"]] = 6},
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
					{[L["pvp power"]] = 6},
				},
				[2701] = {
					"blue",
					"Sparkling Azure Moonstone",
					{[L["spirit"]] = 6},
				},
				[2705] = {
					"orange",
					"Reckless Flame Spessarite",
					{[L["haste"]] = 3, [L["intellect"]] = 3},
				},
				[2706] = {
					"green",
					"Regal Deep Peridot",
					{[L["dodge"]] = 3, [L["stamina"]] = 4},
				},
				[2707] = {
					"purple",
					"Purified Shadow Draenite",
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
					{[L["critical strike"]] = 3, [L["strength"]] = 3},
				},
				[2755] = {
					"purple",
					"Glinting Shadow Draenite",
					{[L["agility"]] = 3, [L["hit"]] = 3},
				},
				[2757] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike"]] = 3, [L["stamina"]] = 4},
				},
				[2760] = {
					"orange",
					"Potent Flame Spessarite",
					{[L["critical strike"]] = 3, [L["intellect"]] = 3},
				},
				[2762] = {
					"green",
					"Radiant Deep Peridot",
					{[L["critical strike"]] = 3, [L["pvp power"]] = 3},
				},
				[2942] = {
					"yellow",
					"Smooth Golden Draenite",
					{[L["critical strike"]] = 6},
				},
				[2971] = {
					"red",
					"Delicate Blood Garnet",
					{[L["agility"]] = 6},
				},
				[3104] = {
					"blue",
					"Rigid Azure Moonstone",
					{[L["hit"]] = 6},
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
					{[L["hit"]] = 3, [L["intellect"]] = 3},
				},
				[3113] = {
					"orange",
					"Deadly Flame Spessarite",
					{[L["agility"]] = 3, [L["critical strike"]] = 3},
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
					{[L["dodge"]] = 8},
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
					{[L["critical strike"]] = 8},
				},
				[2736] = {
					"yellow",
					"Smooth Dawnstone",
					{[L["critical strike"]] = 8},
				},
				[2737] = {
					"yellow",
					"Subtle Dawnstone",
					{[L["dodge"]] = 8},
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
					{[L["haste"]] = 4, [L["intellect"]] = 4},
				},
				[2743] = {
					"green",
					"Regal Talasite",
					{[L["dodge"]] = 4, [L["stamina"]] = 6},
				},
				[2744] = {
					"purple",
					"Purified Nightseye",
					{[L["intellect"]] = 4, [L["spirit"]] = 4},
				},
				[2753] = {
					"orange",
					"Inscribed Noble Topaz",
					{[L["critical strike"]] = 4, [L["strength"]] = 4},
				},
				[2754] = {
					"red",
					"Flashing Living Ruby",
					{[L["parry"]] = 8},
				},
				[2756] = {
					"purple",
					"Glinting Nightseye",
					{[L["agility"]] = 4, [L["hit"]] = 4},
				},
				[2758] = {
					"green",
					"Jagged Talasite",
					{[L["critical strike"]] = 4, [L["stamina"]] = 6},
				},
				[2759] = {
					"yellow",
					"Mystic Dawnstone",
					{[L["pvp resilience"]] = 8},
				},
				[2761] = {
					"orange",
					"Potent Noble Topaz",
					{[L["critical strike"]] = 4, [L["intellect"]] = 4},
				},
				[2763] = {
					"green",
					"Radiant Talasite",
					{[L["critical strike"]] = 4, [L["pvp power"]] = 4},
				},
				[2764] = {
					"blue",
					"Rigid Star of Elune",
					{[L["hit"]] = 8},
				},
				[2765] = {
					"blue",
					"Stormy Star of Elune",
					{[L["pvp power"]] = 8},
				},
				[2827] = {
					"meta",
					"Destructive Skyfire Diamond",
					{[L["critical strike"]] = 14, [L["spell reflect (percent)"]] = 1},
				},
				[2828] = {
					"meta",
					"Mystical Skyfire Diamond",
					{[L["chance to increase spell haste"]] = 1},
				},
				[2829] = {
					"meta",
					"Swift Skyfire Diamond",
					{[L["critical strike"]] = 12, [L["minor run speed"]] = 1},
				},
				[2830] = {
					"meta",
					"Enigmatic Skyfire Diamond",
					{[L["critical strike"]] = 12, [L["snare/root duration reduction (percent)"]] = 10},
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
					{[L["chance to restore health on hit"]] = 1, [L["dodge"]] = 12},
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
					{[L["hit"]] = 8},
				},
				[3107] = {
					"purple",
					"Shifting Nightseye",
					{[L["agility"]] = 4, [L["stamina"]] = 6},
				},
				[3109] = {
					"purple",
					"Glinting Nightseye",
					{[L["agility"]] = 4, [L["hit"]] = 4},
				},
				[3111] = {
					"purple",
					"Veiled Nightseye",
					{[L["hit"]] = 4, [L["intellect"]] = 4},
				},
				[3112] = {
					"orange",
					"Deadly Noble Topaz",
					{[L["agility"]] = 4, [L["critical strike"]] = 4},
				},
				[3154] = {
					"meta",
					"Relentless Earthstorm Diamond",
					{[L["agility"]] = 12, [L["critical effect (percent)"]] = 3},
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
					{[L["pvp resilience"]] = 4, [L["stamina"]] = 6},
				},
				[3261] = {
					"meta",
					"Chaotic Skyfire Diamond",
					{[L["critical effect (percent)"]] = 3, [L["critical strike"]] = 12},
				},
				[3270] = {
					"yellow",
					"Quick Dawnstone",
					{[L["haste"]] = 8},
				},
				[3271] = {
					"orange",
					"Reckless Noble Topaz",
					{[L["haste"]] = 4, [L["intellect"]] = 4},
				},
				[3272] = {
					"green",
					"Forceful Talasite",
					{[L["haste"]] = 4, [L["stamina"]] = 6},
				},
				[3274] = {
					"meta",
					"Eternal Earthstorm Diamond",
					{[L["block value (percent)"]] = 1, [L["dodge"]] = 12},
				},
				[3275] = {
					"meta",
					"Ember Skyfire Diamond",
					{[L["intellect"]] = 12, [L["mana (percent)"]] = 2},
				},
				[3280] = {
					"green",
					"Regal Talasite",
					{[L["dodge"]] = 4, [L["stamina"]] = 6},
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
					{[L["dodge"]] = 10},
				},
				[3121] = {
					"red",
					"Flashing Crimson Spinel",
					{[L["parry"]] = 10},
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
					{[L["pvp power"]] = 10},
				},
				[3126] = {
					"red",
					"Brilliant Crimson Spinel",
					{[L["intellect"]] = 10},
				},
				[3127] = {
					"yellow",
					"Smooth Lionseye",
					{[L["critical strike"]] = 10},
				},
				[3128] = {
					"blue",
					"Rigid Empyrean Sapphire",
					{[L["hit"]] = 10},
				},
				[3129] = {
					"yellow",
					"Smooth Lionseye",
					{[L["critical strike"]] = 10},
				},
				[3130] = {
					"yellow",
					"Subtle Lionseye",
					{[L["dodge"]] = 10},
				},
				[3131] = {
					"yellow",
					"Mystic Lionseye",
					{[L["pvp resilience"]] = 10},
				},
				[3132] = {
					"blue",
					"Rigid Empyrean Sapphire",
					{[L["hit"]] = 10},
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
					{[L["agility"]] = 5, [L["hit"]] = 5},
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
					{[L["critical strike"]] = 5, [L["strength"]] = 5},
				},
				[3140] = {
					"orange",
					"Potent Pyrestone",
					{[L["critical strike"]] = 5, [L["intellect"]] = 5},
				},
				[3141] = {
					"orange",
					"Reckless Pyrestone",
					{[L["haste"]] = 5, [L["intellect"]] = 5},
				},
				[3142] = {
					"purple",
					"Glinting Shadowsong Amethyst",
					{[L["agility"]] = 5, [L["hit"]] = 5},
				},
				[3143] = {
					"purple",
					"Veiled Shadowsong Amethyst",
					{[L["hit"]] = 5, [L["intellect"]] = 5},
				},
				[3144] = {
					"orange",
					"Deadly Pyrestone",
					{[L["agility"]] = 5, [L["critical strike"]] = 5},
				},
				[3145] = {
					"green",
					"Regal Seaspray Emerald",
					{[L["dodge"]] = 5, [L["stamina"]] = 7},
				},
				[3146] = {
					"green",
					"Radiant Seaspray Emerald",
					{[L["critical strike"]] = 5, [L["pvp power"]] = 5},
				},
				[3147] = {
					"purple",
					"Purified Shadowsong Amethyst",
					{[L["intellect"]] = 5, [L["spirit"]] = 5},
				},
				[3148] = {
					"green",
					"Jagged Seaspray Emerald",
					{[L["critical strike"]] = 5, [L["stamina"]] = 7},
				},
				[3284] = {
					"green",
					"Steady Seaspray Emerald",
					{[L["pvp resilience"]] = 5, [L["stamina"]] = 7},
				},
				[3285] = {
					"green",
					"Forceful Seaspray Emerald",
					{[L["haste"]] = 5, [L["stamina"]] = 7},
				},
				[3286] = {
					"orange",
					"Reckless Pyrestone",
					{[L["haste"]] = 5, [L["intellect"]] = 5},
				},
				[3287] = {
					"yellow",
					"Quick Lionseye",
					{[L["haste"]] = 10},
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
					{[L["dodge"]] = 12},
				},
				[3377] = {
					"red",
					"Flashing Bloodstone",
					{[L["parry"]] = 12},
				},
				[3378] = {
					"yellow",
					"Smooth Sun Crystal",
					{[L["critical strike"]] = 12},
				},
				[3379] = {
					"red",
					"Precise Bloodstone",
					{[L["expertise"]] = 12},
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
					{[L["critical strike"]] = 12},
				},
				[3383] = {
					"blue",
					"Rigid Chalcedony",
					{[L["hit"]] = 12},
				},
				[3384] = {
					"yellow",
					"Subtle Sun Crystal",
					{[L["dodge"]] = 12},
				},
				[3385] = {
					"yellow",
					"Mystic Sun Crystal",
					{[L["pvp resilience"]] = 12},
				},
				[3386] = {
					"yellow",
					"Quick Sun Crystal",
					{[L["haste"]] = 12},
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
					{[L["pvp power"]] = 12},
				},
				[3391] = {
					"green",
					"Jagged Dark Jade",
					{[L["critical strike"]] = 6, [L["stamina"]] = 9},
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
					{[L["dodge"]] = 6, [L["stamina"]] = 9},
				},
				[3397] = {
					"purple",
					"Defender's Shadow Crystal",
					{[L["parry"]] = 6, [L["stamina"]] = 9},
				},
				[3398] = {
					"purple",
					"Guardian's Shadow Crystal",
					{[L["expertise"]] = 6, [L["stamina"]] = 9},
				},
				[3399] = {
					"purple",
					"Purified Shadow Crystal",
					{[L["intellect"]] = 6, [L["spirit"]] = 6},
				},
				[3400] = {
					"purple",
					"Glinting Shadow Crystal",
					{[L["agility"]] = 6, [L["hit"]] = 6},
				},
				[3401] = {
					"purple",
					"Purified Shadow Crystal",
					{[L["intellect"]] = 6, [L["spirit"]] = 6},
				},
				[3402] = {
					"purple",
					"Glinting Shadow Crystal",
					{[L["agility"]] = 6, [L["hit"]] = 6},
				},
				[3403] = {
					"purple",
					"Mysterious Shadow Crystal",
					{[L["intellect"]] = 6, [L["pvp power"]] = 6},
				},
				[3404] = {
					"orange",
					"Reckless Huge Citrine",
					{[L["haste"]] = 6, [L["intellect"]] = 6},
				},
				[3405] = {
					"orange",
					"Inscribed Huge Citrine",
					{[L["critical strike"]] = 6, [L["strength"]] = 6},
				},
				[3406] = {
					"purple",
					"Glinting Shadow Crystal",
					{[L["agility"]] = 6, [L["hit"]] = 6},
				},
				[3407] = {
					"orange",
					"Champion's Huge Citrine",
					{[L["dodge"]] = 6, [L["strength"]] = 6},
				},
				[3408] = {
					"orange",
					"Resplendent Huge Citrine",
					{[L["pvp resilience"]] = 6, [L["strength"]] = 6},
				},
				[3409] = {
					"orange",
					"Fierce Huge Citrine",
					{[L["haste"]] = 6, [L["strength"]] = 6},
				},
				[3410] = {
					"orange",
					"Deadly Huge Citrine",
					{[L["agility"]] = 6, [L["critical strike"]] = 6},
				},
				[3411] = {
					"purple",
					"Etched Shadow Crystal",
					{[L["hit"]] = 6, [L["strength"]] = 6},
				},
				[3412] = {
					"orange",
					"Lucent Huge Citrine",
					{[L["agility"]] = 6, [L["pvp resilience"]] = 6},
				},
				[3413] = {
					"orange",
					"Deft Huge Citrine",
					{[L["agility"]] = 6, [L["haste"]] = 6},
				},
				[3414] = {
					"orange",
					"Potent Huge Citrine",
					{[L["critical strike"]] = 6, [L["intellect"]] = 6},
				},
				[3415] = {
					"purple",
					"Veiled Shadow Crystal",
					{[L["hit"]] = 6, [L["intellect"]] = 6},
				},
				[3416] = {
					"orange",
					"Willful Huge Citrine",
					{[L["intellect"]] = 6, [L["pvp resilience"]] = 6},
				},
				[3417] = {
					"orange",
					"Reckless Huge Citrine",
					{[L["haste"]] = 6, [L["intellect"]] = 6},
				},
				[3418] = {
					"orange",
					"Stalwart Huge Citrine",
					{[L["dodge"]] = 6, [L["parry"]] = 6},
				},
				[3419] = {
					"orange",
					"Stalwart Huge Citrine",
					{[L["dodge"]] = 6, [L["parry"]] = 6},
				},
				[3420] = {
					"purple",
					"Accurate Shadow Crystal",
					{[L["expertise"]] = 6, [L["hit"]] = 6},
				},
				[3421] = {
					"orange",
					"Resolute Huge Citrine",
					{[L["dodge"]] = 6, [L["expertise"]] = 6},
				},
				[3422] = {
					"orange",
					"Deadly Huge Citrine",
					{[L["agility"]] = 6, [L["critical strike"]] = 6},
				},
				[3423] = {
					"purple",
					"Glinting Shadow Crystal",
					{[L["agility"]] = 6, [L["hit"]] = 6},
				},
				[3424] = {
					"orange",
					"Lucent Huge Citrine",
					{[L["agility"]] = 6, [L["pvp resilience"]] = 6},
				},
				[3426] = {
					"orange",
					"Deft Huge Citrine",
					{[L["agility"]] = 6, [L["haste"]] = 6},
				},
				[3427] = {
					"purple",
					"Timeless Shadow Crystal",
					{[L["intellect"]] = 6, [L["stamina"]] = 9},
				},
				[3428] = {
					"green",
					"Jagged Dark Jade",
					{[L["critical strike"]] = 6, [L["stamina"]] = 9},
				},
				[3429] = {
					"green",
					"Nimble Dark Jade",
					{[L["dodge"]] = 6, [L["hit"]] = 6},
				},
				[3430] = {
					"green",
					"Regal Dark Jade",
					{[L["dodge"]] = 6, [L["stamina"]] = 9},
				},
				[3431] = {
					"green",
					"Steady Dark Jade",
					{[L["pvp resilience"]] = 6, [L["stamina"]] = 9},
				},
				[3432] = {
					"green",
					"Forceful Dark Jade",
					{[L["haste"]] = 6, [L["stamina"]] = 9},
				},
				[3433] = {
					"purple",
					"Purified Shadow Crystal",
					{[L["intellect"]] = 6, [L["spirit"]] = 6},
				},
				[3434] = {
					"green",
					"Misty Dark Jade",
					{[L["critical strike"]] = 6, [L["spirit"]] = 6},
				},
				[3435] = {
					"green",
					"Lightning Dark Jade",
					{[L["haste"]] = 6, [L["hit"]] = 6},
				},
				[3436] = {
					"green",
					"Turbid Dark Jade",
					{[L["pvp resilience"]] = 6, [L["spirit"]] = 6},
				},
				[3437] = {
					"green",
					"Energized Dark Jade",
					{[L["haste"]] = 6, [L["spirit"]] = 6},
				},
				[3438] = {
					"purple",
					"Purified Shadow Crystal",
					{[L["intellect"]] = 6, [L["spirit"]] = 6},
				},
				[3439] = {
					"green",
					"Misty Dark Jade",
					{[L["critical strike"]] = 6, [L["spirit"]] = 6},
				},
				[3440] = {
					"green",
					"Lightning Dark Jade",
					{[L["haste"]] = 6, [L["hit"]] = 6},
				},
				[3441] = {
					"green",
					"Turbid Dark Jade",
					{[L["pvp resilience"]] = 6, [L["spirit"]] = 6},
				},
				[3442] = {
					"green",
					"Energized Dark Jade",
					{[L["haste"]] = 6, [L["spirit"]] = 6},
				},
				[3443] = {
					"green",
					"Radiant Dark Jade",
					{[L["critical strike"]] = 6, [L["pvp power"]] = 6},
				},
				[3444] = {
					"green",
					"Radiant Dark Jade",
					{[L["critical strike"]] = 6, [L["pvp power"]] = 6},
				},
				[3445] = {
					"green",
					"Shattered Dark Jade",
					{[L["haste"]] = 6, [L["pvp power"]] = 6},
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
					{[L["dodge"]] = 16},
				},
				[3451] = {
					"red",
					"Flashing Scarlet Ruby",
					{[L["parry"]] = 16},
				},
				[3452] = {
					"yellow",
					"Smooth Autumn's Glow",
					{[L["critical strike"]] = 16},
				},
				[3453] = {
					"red",
					"Precise Scarlet Ruby",
					{[L["expertise"]] = 16},
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
					{[L["pvp power"]] = 16},
				},
				[3458] = {
					"red",
					"Brilliant Scarlet Ruby",
					{[L["intellect"]] = 16},
				},
				[3459] = {
					"yellow",
					"Smooth Autumn's Glow",
					{[L["critical strike"]] = 16},
				},
				[3460] = {
					"blue",
					"Rigid Sky Sapphire",
					{[L["hit"]] = 16},
				},
				[3461] = {
					"yellow",
					"Subtle Autumn's Glow",
					{[L["dodge"]] = 16},
				},
				[3462] = {
					"yellow",
					"Mystic Autumn's Glow",
					{[L["pvp resilience"]] = 16},
				},
				[3463] = {
					"yellow",
					"Quick Autumn's Glow",
					{[L["haste"]] = 16},
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
					{[L["dodge"]] = 8, [L["stamina"]] = 12},
				},
				[3469] = {
					"purple",
					"Defender's Twilight Opal",
					{[L["parry"]] = 8, [L["stamina"]] = 12},
				},
				[3470] = {
					"green",
					"Jagged Forest Emerald",
					{[L["critical strike"]] = 8, [L["stamina"]] = 12},
				},
				[3471] = {
					"purple",
					"Guardian's Twilight Opal",
					{[L["expertise"]] = 8, [L["stamina"]] = 12},
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
					{[L["agility"]] = 8, [L["hit"]] = 8},
				},
				[3475] = {
					"purple",
					"Glinting Twilight Opal",
					{[L["agility"]] = 8, [L["hit"]] = 8},
				},
				[3476] = {
					"purple",
					"Mysterious Twilight Opal",
					{[L["intellect"]] = 8, [L["pvp power"]] = 8},
				},
				[3477] = {
					"orange",
					"Inscribed Monarch Topaz",
					{[L["critical strike"]] = 8, [L["strength"]] = 8},
				},
				[3478] = {
					"purple",
					"Etched Twilight Opal",
					{[L["hit"]] = 8, [L["strength"]] = 8},
				},
				[3479] = {
					"orange",
					"Champion's Monarch Topaz",
					{[L["dodge"]] = 8, [L["strength"]] = 8},
				},
				[3480] = {
					"orange",
					"Resplendent Monarch Topaz",
					{[L["pvp resilience"]] = 8, [L["strength"]] = 8},
				},
				[3481] = {
					"orange",
					"Fierce Monarch Topaz",
					{[L["haste"]] = 8, [L["strength"]] = 8},
				},
				[3482] = {
					"orange",
					"Deadly Monarch Topaz",
					{[L["agility"]] = 8, [L["critical strike"]] = 8},
				},
				[3483] = {
					"purple",
					"Glinting Twilight Opal",
					{[L["agility"]] = 8, [L["hit"]] = 8},
				},
				[3484] = {
					"orange",
					"Lucent Monarch Topaz",
					{[L["agility"]] = 8, [L["pvp resilience"]] = 8},
				},
				[3485] = {
					"orange",
					"Deft Monarch Topaz",
					{[L["agility"]] = 8, [L["haste"]] = 8},
				},
				[3486] = {
					"orange",
					"Reckless Monarch Topaz",
					{[L["haste"]] = 8, [L["intellect"]] = 8},
				},
				[3487] = {
					"orange",
					"Potent Monarch Topaz",
					{[L["critical strike"]] = 8, [L["intellect"]] = 8},
				},
				[3488] = {
					"purple",
					"Veiled Twilight Opal",
					{[L["hit"]] = 8, [L["intellect"]] = 8},
				},
				[3489] = {
					"orange",
					"Willful Monarch Topaz",
					{[L["intellect"]] = 8, [L["pvp resilience"]] = 8},
				},
				[3490] = {
					"orange",
					"Reckless Monarch Topaz",
					{[L["haste"]] = 8, [L["intellect"]] = 8},
				},
				[3491] = {
					"orange",
					"Deadly Monarch Topaz",
					{[L["agility"]] = 8, [L["critical strike"]] = 8},
				},
				[3492] = {
					"purple",
					"Glinting Twilight Opal",
					{[L["agility"]] = 8, [L["hit"]] = 8},
				},
				[3493] = {
					"orange",
					"Lucent Monarch Topaz",
					{[L["agility"]] = 8, [L["pvp resilience"]] = 8},
				},
				[3494] = {
					"orange",
					"Deft Monarch Topaz",
					{[L["agility"]] = 8, [L["haste"]] = 8},
				},
				[3495] = {
					"orange",
					"Stalwart Monarch Topaz",
					{[L["dodge"]] = 8, [L["parry"]] = 8},
				},
				[3496] = {
					"orange",
					"Stalwart Monarch Topaz",
					{[L["dodge"]] = 8, [L["parry"]] = 8},
				},
				[3497] = {
					"purple",
					"Accurate Twilight Opal",
					{[L["expertise"]] = 8, [L["hit"]] = 8},
				},
				[3498] = {
					"orange",
					"Resolute Monarch Topaz",
					{[L["dodge"]] = 8, [L["expertise"]] = 8},
				},
				[3499] = {
					"purple",
					"Timeless Twilight Opal",
					{[L["intellect"]] = 8, [L["stamina"]] = 12},
				},
				[3500] = {
					"green",
					"Jagged Forest Emerald",
					{[L["critical strike"]] = 8, [L["stamina"]] = 12},
				},
				[3501] = {
					"green",
					"Nimble Forest Emerald",
					{[L["dodge"]] = 8, [L["hit"]] = 8},
				},
				[3502] = {
					"green",
					"Regal Forest Emerald",
					{[L["dodge"]] = 8, [L["stamina"]] = 12},
				},
				[3503] = {
					"green",
					"Steady Forest Emerald",
					{[L["pvp resilience"]] = 8, [L["stamina"]] = 12},
				},
				[3504] = {
					"green",
					"Forceful Forest Emerald",
					{[L["haste"]] = 8, [L["stamina"]] = 12},
				},
				[3505] = {
					"purple",
					"Purified Twilight Opal",
					{[L["intellect"]] = 8, [L["spirit"]] = 8},
				},
				[3506] = {
					"green",
					"Misty Forest Emerald",
					{[L["critical strike"]] = 8, [L["spirit"]] = 8},
				},
				[3507] = {
					"green",
					"Lightning Forest Emerald",
					{[L["haste"]] = 8, [L["hit"]] = 8},
				},
				[3508] = {
					"green",
					"Turbid Forest Emerald",
					{[L["pvp resilience"]] = 8, [L["spirit"]] = 8},
				},
				[3509] = {
					"green",
					"Energized Forest Emerald",
					{[L["haste"]] = 8, [L["spirit"]] = 8},
				},
				[3510] = {
					"purple",
					"Purified Twilight Opal",
					{[L["intellect"]] = 8, [L["spirit"]] = 8},
				},
				[3511] = {
					"green",
					"Misty Forest Emerald",
					{[L["critical strike"]] = 8, [L["spirit"]] = 8},
				},
				[3512] = {
					"green",
					"Lightning Forest Emerald",
					{[L["haste"]] = 8, [L["hit"]] = 8},
				},
				[3513] = {
					"green",
					"Turbid Forest Emerald",
					{[L["pvp resilience"]] = 8, [L["spirit"]] = 8},
				},
				[3514] = {
					"green",
					"Energized Forest Emerald",
					{[L["haste"]] = 8, [L["spirit"]] = 8},
				},
				[3515] = {
					"green",
					"Radiant Forest Emerald",
					{[L["critical strike"]] = 8, [L["pvp power"]] = 8},
				},
				[3516] = {
					"green",
					"Radiant Forest Emerald",
					{[L["critical strike"]] = 8, [L["pvp power"]] = 8},
				},
				[3517] = {
					"green",
					"Shattered Forest Emerald",
					{[L["haste"]] = 8, [L["pvp power"]] = 8},
				},
				[3621] = {
					"meta",
					"Chaotic Skyflare Diamond",
					{[L["critical effect (percent)"]] = 3, [L["critical strike"]] = 21},
				},
				[3622] = {
					"meta",
					"Destructive Skyflare Diamond",
					{[L["critical strike"]] = 25, [L["spell reflect (percent)"]] = 1},
				},
				[3623] = {
					"meta",
					"Ember Skyflare Diamond",
					{[L["intellect"]] = 21, [L["mana (percent)"]] = 2},
				},
				[3624] = {
					"meta",
					"Enigmatic Skyflare Diamond",
					{[L["critical strike"]] = 21, [L["snare/root duration reduction (percent)"]] = 10},
				},
				[3625] = {
					"meta",
					"Swift Skyflare Diamond",
					{[L["critical strike"]] = 21, [L["minor run speed"]] = 1},
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
					{[L["agility"]] = 21, [L["critical effect (percent)"]] = 3},
				},
				[3631] = {
					"meta",
					"Eternal Earthsiege Diamond",
					{[L["block value (percent)"]] = 1, [L["dodge"]] = 21},
				},
				[3632] = {
					"meta",
					"Tireless Skyflare Diamond",
					{[L["intellect"]] = 21, [L["minor run speed"]] = 1},
				},
				[3633] = {
					"meta",
					"Revitalizing Skyflare Diamond",
					{[L["critical effect (percent)"]] = 3, [L["spirit"]] = 22},
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
					{[L["critical strike"]] = 21, [L["fear duration reduction (percent)"]] = 10},
				},
				[3637] = {
					"meta",
					"Austere Earthsiege Diamond",
					{[L["armor from items (percent)"]] = 2, [L["stamina"]] = 32},
				},
				[3638] = {
					"meta",
					"Persistent Earthsiege Diamond",
					{[L["critical strike"]] = 21, [L["stun duration reduction (percent)"]] = 10},
				},
				[3639] = {
					"meta",
					"Trenchant Earthsiege Diamond",
					{[L["intellect"]] = 21, [L["stun duration reduction (percent)"]] = 10},
				},
				[3640] = {
					"meta",
					"Invigorating Earthsiege Diamond",
					{[L["haste"]] = 21, [L["sometimes heal on your crits"]] = 1},
				},
				[3641] = {
					"meta",
					"Beaming Earthsiege Diamond",
					{[L["critical strike"]] = 21, [L["mana (percent)"]] = 2},
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
					{[L["dodge"]] = 20},
				},
				[3523] = {
					"red",
					"Flashing Cardinal Ruby",
					{[L["parry"]] = 20},
				},
				[3524] = {
					"red",
					"Precise Cardinal Ruby",
					{[L["expertise"]] = 20},
				},
				[3525] = {
					"yellow",
					"Smooth King's Amber",
					{[L["critical strike"]] = 20},
				},
				[3526] = {
					"red",
					"Brilliant Cardinal Ruby",
					{[L["intellect"]] = 20},
				},
				[3527] = {
					"yellow",
					"Smooth King's Amber",
					{[L["critical strike"]] = 20},
				},
				[3528] = {
					"blue",
					"Rigid Majestic Zircon",
					{[L["hit"]] = 20},
				},
				[3529] = {
					"yellow",
					"Subtle King's Amber",
					{[L["dodge"]] = 20},
				},
				[3530] = {
					"yellow",
					"Mystic King's Amber",
					{[L["pvp resilience"]] = 20},
				},
				[3531] = {
					"yellow",
					"Quick King's Amber",
					{[L["haste"]] = 20},
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
					{[L["pvp power"]] = 20},
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
					{[L["dodge"]] = 10, [L["stamina"]] = 15},
				},
				[3541] = {
					"purple",
					"Defender's Dreadstone",
					{[L["parry"]] = 10, [L["stamina"]] = 15},
				},
				[3542] = {
					"purple",
					"Guardian's Dreadstone",
					{[L["expertise"]] = 10, [L["stamina"]] = 15},
				},
				[3543] = {
					"green",
					"Jagged Eye of Zul",
					{[L["critical strike"]] = 10, [L["stamina"]] = 15},
				},
				[3544] = {
					"purple",
					"Glinting Dreadstone",
					{[L["agility"]] = 10, [L["hit"]] = 10},
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
					{[L["agility"]] = 10, [L["hit"]] = 10},
				},
				[3548] = {
					"purple",
					"Mysterious Dreadstone",
					{[L["intellect"]] = 10, [L["pvp power"]] = 10},
				},
				[3549] = {
					"orange",
					"Inscribed Ametrine",
					{[L["critical strike"]] = 10, [L["strength"]] = 10},
				},
				[3550] = {
					"purple",
					"Etched Dreadstone",
					{[L["hit"]] = 10, [L["strength"]] = 10},
				},
				[3551] = {
					"orange",
					"Champion's Ametrine",
					{[L["dodge"]] = 10, [L["strength"]] = 10},
				},
				[3552] = {
					"orange",
					"Resplendent Ametrine",
					{[L["pvp resilience"]] = 10, [L["strength"]] = 10},
				},
				[3553] = {
					"orange",
					"Fierce Ametrine",
					{[L["haste"]] = 10, [L["strength"]] = 10},
				},
				[3554] = {
					"orange",
					"Deadly Ametrine",
					{[L["agility"]] = 10, [L["critical strike"]] = 10},
				},
				[3555] = {
					"purple",
					"Glinting Dreadstone",
					{[L["agility"]] = 10, [L["hit"]] = 10},
				},
				[3556] = {
					"orange",
					"Lucent Ametrine",
					{[L["agility"]] = 10, [L["pvp resilience"]] = 10},
				},
				[3557] = {
					"orange",
					"Deft Ametrine",
					{[L["agility"]] = 10, [L["haste"]] = 10},
				},
				[3558] = {
					"purple",
					"Purified Dreadstone",
					{[L["intellect"]] = 10, [L["spirit"]] = 10},
				},
				[3559] = {
					"orange",
					"Potent Ametrine",
					{[L["critical strike"]] = 10, [L["intellect"]] = 10},
				},
				[3560] = {
					"purple",
					"Veiled Dreadstone",
					{[L["hit"]] = 10, [L["intellect"]] = 10},
				},
				[3561] = {
					"orange",
					"Willful Ametrine",
					{[L["intellect"]] = 10, [L["pvp resilience"]] = 10},
				},
				[3563] = {
					"orange",
					"Reckless Ametrine",
					{[L["haste"]] = 10, [L["intellect"]] = 10},
				},
				[3564] = {
					"orange",
					"Deadly Ametrine",
					{[L["agility"]] = 10, [L["critical strike"]] = 10},
				},
				[3565] = {
					"purple",
					"Glinting Dreadstone",
					{[L["agility"]] = 10, [L["hit"]] = 10},
				},
				[3566] = {
					"orange",
					"Lucent Ametrine",
					{[L["agility"]] = 10, [L["pvp resilience"]] = 10},
				},
				[3567] = {
					"orange",
					"Deft Ametrine",
					{[L["agility"]] = 10, [L["haste"]] = 10},
				},
				[3568] = {
					"orange",
					"Stalwart Ametrine",
					{[L["dodge"]] = 10, [L["parry"]] = 10},
				},
				[3569] = {
					"orange",
					"Stalwart Ametrine",
					{[L["dodge"]] = 10, [L["parry"]] = 10},
				},
				[3570] = {
					"purple",
					"Accurate Dreadstone",
					{[L["expertise"]] = 10, [L["hit"]] = 10},
				},
				[3571] = {
					"orange",
					"Resolute Ametrine",
					{[L["dodge"]] = 10, [L["expertise"]] = 10},
				},
				[3572] = {
					"purple",
					"Timeless Dreadstone",
					{[L["intellect"]] = 10, [L["stamina"]] = 15},
				},
				[3573] = {
					"green",
					"Jagged Eye of Zul",
					{[L["critical strike"]] = 10, [L["stamina"]] = 15},
				},
				[3574] = {
					"green",
					"Nimble Eye of Zul",
					{[L["dodge"]] = 10, [L["hit"]] = 10},
				},
				[3575] = {
					"green",
					"Regal Eye of Zul",
					{[L["dodge"]] = 10, [L["stamina"]] = 15},
				},
				[3576] = {
					"green",
					"Steady Eye of Zul",
					{[L["pvp resilience"]] = 10, [L["stamina"]] = 15},
				},
				[3577] = {
					"green",
					"Forceful Eye of Zul",
					{[L["haste"]] = 10, [L["stamina"]] = 15},
				},
				[3578] = {
					"purple",
					"Purified Dreadstone",
					{[L["intellect"]] = 10, [L["spirit"]] = 10},
				},
				[3579] = {
					"green",
					"Misty Eye of Zul",
					{[L["critical strike"]] = 10, [L["spirit"]] = 10},
				},
				[3580] = {
					"green",
					"Lightning Eye of Zul",
					{[L["haste"]] = 10, [L["hit"]] = 10},
				},
				[3581] = {
					"green",
					"Turbid Eye of Zul",
					{[L["pvp resilience"]] = 10, [L["spirit"]] = 10},
				},
				[3582] = {
					"green",
					"Energized Eye of Zul",
					{[L["haste"]] = 10, [L["spirit"]] = 10},
				},
				[3583] = {
					"purple",
					"Purified Dreadstone",
					{[L["intellect"]] = 10, [L["spirit"]] = 10},
				},
				[3584] = {
					"green",
					"Misty Eye of Zul",
					{[L["critical strike"]] = 10, [L["spirit"]] = 10},
				},
				[3585] = {
					"green",
					"Lightning Eye of Zul",
					{[L["haste"]] = 10, [L["hit"]] = 10},
				},
				[3586] = {
					"green",
					"Turbid Eye of Zul",
					{[L["pvp resilience"]] = 10, [L["spirit"]] = 10},
				},
				[3587] = {
					"green",
					"Energized Eye of Zul",
					{[L["haste"]] = 10, [L["spirit"]] = 10},
				},
				[3588] = {
					"green",
					"Radiant Eye of Zul",
					{[L["critical strike"]] = 10, [L["pvp power"]] = 10},
				},
				[3589] = {
					"green",
					"Radiant Eye of Zul",
					{[L["critical strike"]] = 10, [L["pvp power"]] = 10},
				},
				[3590] = {
					"green",
					"Shattered Eye of Zul",
					{[L["haste"]] = 10, [L["pvp power"]] = 10},
				},
			},
			[8] = {
				[3885] = {
					"green",
					"Zen Jasper",
					{[L["mastery"]] = 15, [L["spirit"]] = 15},
				},
				[3886] = {
					"green",
					"Sensei's Jasper",
					{[L["hit"]] = 15, [L["mastery"]] = 15},
				},
				[3889] = {
					"red",
					"Bold Carnelian",
					{[L["strength"]] = 30},
				},
				[3890] = {
					"red",
					"Delicate Carnelian",
					{[L["agility"]] = 30},
				},
				[3891] = {
					"red",
					"Flashing Carnelian",
					{[L["parry"]] = 30},
				},
				[3892] = {
					"red",
					"Brilliant Carnelian",
					{[L["intellect"]] = 30},
				},
				[3893] = {
					"red",
					"Precise Carnelian",
					{[L["expertise"]] = 30},
				},
				[3894] = {
					"blue",
					"Solid Zephyrite",
					{[L["stamina"]] = 45},
				},
				[3895] = {
					"blue",
					"Sparkling Zephyrite",
					{[L["spirit"]] = 30},
				},
				[3896] = {
					"blue",
					"Stormy Zephyrite",
					{[L["pvp power"]] = 30},
				},
				[3897] = {
					"blue",
					"Rigid Zephyrite",
					{[L["hit"]] = 30},
				},
				[3898] = {
					"yellow",
					"Subtle Alicite",
					{[L["dodge"]] = 30},
				},
				[3899] = {
					"yellow",
					"Mystic Alicite",
					{[L["pvp resilience"]] = 30},
				},
				[3900] = {
					"yellow",
					"Quick Alicite",
					{[L["haste"]] = 30},
				},
				[3901] = {
					"yellow",
					"Fractured Alicite",
					{[L["mastery"]] = 30},
				},
				[3902] = {
					"purple",
					"Sovereign Nightstone",
					{[L["stamina"]] = 23, [L["strength"]] = 15},
				},
				[3903] = {
					"purple",
					"Defender's Nightstone",
					{[L["parry"]] = 15, [L["stamina"]] = 23},
				},
				[3904] = {
					"purple",
					"Shifting Nightstone",
					{[L["agility"]] = 15, [L["stamina"]] = 23},
				},
				[3905] = {
					"purple",
					"Timeless Nightstone",
					{[L["intellect"]] = 15, [L["stamina"]] = 23},
				},
				[3906] = {
					"purple",
					"Guardian's Nightstone",
					{[L["expertise"]] = 15, [L["stamina"]] = 23},
				},
				[3907] = {
					"purple",
					"Purified Nightstone",
					{[L["intellect"]] = 15, [L["spirit"]] = 15},
				},
				[3908] = {
					"purple",
					"Etched Nightstone",
					{[L["hit"]] = 15, [L["strength"]] = 15},
				},
				[3909] = {
					"purple",
					"Glinting Nightstone",
					{[L["agility"]] = 15, [L["hit"]] = 15},
				},
				[3910] = {
					"purple",
					"Retaliating Nightstone",
					{[L["hit"]] = 15, [L["parry"]] = 15},
				},
				[3911] = {
					"purple",
					"Veiled Nightstone",
					{[L["hit"]] = 15, [L["intellect"]] = 15},
				},
				[3912] = {
					"purple",
					"Accurate Nightstone",
					{[L["expertise"]] = 15, [L["hit"]] = 15},
				},
				[3913] = {
					"orange",
					"Polished Hessonite",
					{[L["agility"]] = 15, [L["dodge"]] = 15},
				},
				[3914] = {
					"orange",
					"Resolute Hessonite",
					{[L["dodge"]] = 15, [L["expertise"]] = 15},
				},
				[3915] = {
					"orange",
					"Inscribed Hessonite",
					{[L["critical strike"]] = 15, [L["strength"]] = 15},
				},
				[3916] = {
					"orange",
					"Deadly Hessonite",
					{[L["agility"]] = 15, [L["critical strike"]] = 15},
				},
				[3917] = {
					"orange",
					"Potent Hessonite",
					{[L["critical strike"]] = 15, [L["intellect"]] = 15},
				},
				[3918] = {
					"orange",
					"Fierce Hessonite",
					{[L["haste"]] = 15, [L["strength"]] = 15},
				},
				[3919] = {
					"orange",
					"Deft Hessonite",
					{[L["agility"]] = 15, [L["haste"]] = 15},
				},
				[3920] = {
					"orange",
					"Reckless Hessonite",
					{[L["haste"]] = 15, [L["intellect"]] = 15},
				},
				[3921] = {
					"orange",
					"Skillful Hessonite",
					{[L["mastery"]] = 15, [L["strength"]] = 15},
				},
				[3922] = {
					"orange",
					"Adept Hessonite",
					{[L["agility"]] = 15, [L["mastery"]] = 15},
				},
				[3923] = {
					"orange",
					"Fine Hessonite",
					{[L["mastery"]] = 15, [L["parry"]] = 15},
				},
				[3924] = {
					"orange",
					"Artful Hessonite",
					{[L["intellect"]] = 15, [L["mastery"]] = 15},
				},
				[3925] = {
					"orange",
					"Keen Hessonite",
					{[L["expertise"]] = 15, [L["mastery"]] = 15},
				},
				[3926] = {
					"green",
					"Regal Jasper",
					{[L["dodge"]] = 15, [L["stamina"]] = 23},
				},
				[3927] = {
					"green",
					"Nimble Jasper",
					{[L["dodge"]] = 15, [L["hit"]] = 15},
				},
				[3928] = {
					"green",
					"Jagged Jasper",
					{[L["critical strike"]] = 15, [L["stamina"]] = 23},
				},
				[3929] = {
					"green",
					"Piercing Jasper",
					{[L["critical strike"]] = 15, [L["hit"]] = 15},
				},
				[3930] = {
					"green",
					"Steady Jasper",
					{[L["pvp resilience"]] = 15, [L["stamina"]] = 23},
				},
				[3931] = {
					"green",
					"Forceful Jasper",
					{[L["haste"]] = 15, [L["stamina"]] = 23},
				},
				[3932] = {
					"green",
					"Lightning Jasper",
					{[L["haste"]] = 15, [L["hit"]] = 15},
				},
				[3933] = {
					"green",
					"Puissant Jasper",
					{[L["mastery"]] = 15, [L["stamina"]] = 23},
				},
				[3936] = {
					"yellow",
					"Smooth Alicite",
					{[L["critical strike"]] = 30},
				},
			},
			[9] = {
				[3983] = {
					"purple",
					"Accurate Demonseye",
					{[L["expertise"]] = 20, [L["hit"]] = 20},
				},
				[3984] = {
					"purple",
					"Defender's Demonseye",
					{[L["parry"]] = 20, [L["stamina"]] = 30},
				},
				[3985] = {
					"purple",
					"Etched Demonseye",
					{[L["hit"]] = 20, [L["strength"]] = 20},
				},
				[3986] = {
					"purple",
					"Veiled Demonseye",
					{[L["hit"]] = 20, [L["intellect"]] = 20},
				},
				[3987] = {
					"purple",
					"Glinting Demonseye",
					{[L["agility"]] = 20, [L["hit"]] = 20},
				},
				[3988] = {
					"purple",
					"Guardian's Demonseye",
					{[L["expertise"]] = 20, [L["stamina"]] = 30},
				},
				[3989] = {
					"purple",
					"Retaliating Demonseye",
					{[L["hit"]] = 20, [L["parry"]] = 20},
				},
				[3990] = {
					"purple",
					"Purified Demonseye",
					{[L["intellect"]] = 20, [L["spirit"]] = 20},
				},
				[3991] = {
					"purple",
					"Shifting Demonseye",
					{[L["agility"]] = 20, [L["stamina"]] = 30},
				},
				[3992] = {
					"purple",
					"Sovereign Demonseye",
					{[L["stamina"]] = 30, [L["strength"]] = 20},
				},
				[3993] = {
					"purple",
					"Timeless Demonseye",
					{[L["intellect"]] = 20, [L["stamina"]] = 30},
				},
				[3994] = {
					"red",
					"Bold Inferno Ruby",
					{[L["strength"]] = 40},
				},
				[3995] = {
					"red",
					"Brilliant Inferno Ruby",
					{[L["intellect"]] = 40},
				},
				[3996] = {
					"red",
					"Delicate Inferno Ruby",
					{[L["agility"]] = 40},
				},
				[3997] = {
					"red",
					"Flashing Inferno Ruby",
					{[L["parry"]] = 40},
				},
				[3998] = {
					"red",
					"Precise Inferno Ruby",
					{[L["expertise"]] = 40},
				},
				[3999] = {
					"yellow",
					"Fractured Amberjewel",
					{[L["mastery"]] = 40},
				},
				[4000] = {
					"yellow",
					"Mystic Amberjewel",
					{[L["pvp resilience"]] = 40},
				},
				[4001] = {
					"yellow",
					"Quick Amberjewel",
					{[L["haste"]] = 40},
				},
				[4002] = {
					"yellow",
					"Smooth Amberjewel",
					{[L["critical strike"]] = 40},
				},
				[4003] = {
					"yellow",
					"Subtle Amberjewel",
					{[L["dodge"]] = 40},
				},
				[4004] = {
					"blue",
					"Rigid Ocean Sapphire",
					{[L["hit"]] = 40},
				},
				[4005] = {
					"blue",
					"Solid Ocean Sapphire",
					{[L["stamina"]] = 60},
				},
				[4006] = {
					"blue",
					"Sparkling Ocean Sapphire",
					{[L["spirit"]] = 40},
				},
				[4007] = {
					"blue",
					"Stormy Ocean Sapphire",
					{[L["pvp power"]] = 40},
				},
				[4008] = {
					"orange",
					"Adept Ember Topaz",
					{[L["agility"]] = 20, [L["mastery"]] = 20},
				},
				[4009] = {
					"orange",
					"Artful Ember Topaz",
					{[L["intellect"]] = 20, [L["mastery"]] = 20},
				},
				[4010] = {
					"orange",
					"Reckless Ember Topaz",
					{[L["haste"]] = 20, [L["intellect"]] = 20},
				},
				[4011] = {
					"orange",
					"Deadly Ember Topaz",
					{[L["agility"]] = 20, [L["critical strike"]] = 20},
				},
				[4012] = {
					"orange",
					"Deft Ember Topaz",
					{[L["agility"]] = 20, [L["haste"]] = 20},
				},
				[4013] = {
					"orange",
					"Fierce Ember Topaz",
					{[L["haste"]] = 20, [L["strength"]] = 20},
				},
				[4014] = {
					"orange",
					"Fine Ember Topaz",
					{[L["mastery"]] = 20, [L["parry"]] = 20},
				},
				[4015] = {
					"orange",
					"Inscribed Ember Topaz",
					{[L["critical strike"]] = 20, [L["strength"]] = 20},
				},
				[4016] = {
					"orange",
					"Keen Ember Topaz",
					{[L["expertise"]] = 20, [L["mastery"]] = 20},
				},
				[4017] = {
					"orange",
					"Polished Ember Topaz",
					{[L["agility"]] = 20, [L["dodge"]] = 20},
				},
				[4018] = {
					"orange",
					"Potent Ember Topaz",
					{[L["critical strike"]] = 20, [L["intellect"]] = 20},
				},
				[4019] = {
					"orange",
					"Skillful Ember Topaz",
					{[L["mastery"]] = 20, [L["strength"]] = 20},
				},
				[4020] = {
					"orange",
					"Resolute Ember Topaz",
					{[L["dodge"]] = 20, [L["expertise"]] = 20},
				},
				[4021] = {
					"green",
					"Forceful Dream Emerald",
					{[L["haste"]] = 20, [L["stamina"]] = 30},
				},
				[4022] = {
					"green",
					"Jagged Dream Emerald",
					{[L["critical strike"]] = 20, [L["stamina"]] = 30},
				},
				[4023] = {
					"green",
					"Lightning Dream Emerald",
					{[L["haste"]] = 20, [L["hit"]] = 20},
				},
				[4024] = {
					"green",
					"Nimble Dream Emerald",
					{[L["dodge"]] = 20, [L["hit"]] = 20},
				},
				[4025] = {
					"green",
					"Piercing Dream Emerald",
					{[L["critical strike"]] = 20, [L["hit"]] = 20},
				},
				[4026] = {
					"green",
					"Puissant Dream Emerald",
					{[L["mastery"]] = 20, [L["stamina"]] = 30},
				},
				[4027] = {
					"green",
					"Regal Dream Emerald",
					{[L["dodge"]] = 20, [L["stamina"]] = 30},
				},
				[4028] = {
					"green",
					"Sensei's Dream Emerald",
					{[L["hit"]] = 20, [L["mastery"]] = 20},
				},
				[4029] = {
					"green",
					"Steady Dream Emerald",
					{[L["pvp resilience"]] = 20, [L["stamina"]] = 30},
				},
				[4030] = {
					"green",
					"Zen Dream Emerald",
					{[L["mastery"]] = 20, [L["spirit"]] = 20},
				},
				[4045] = {
					"meta",
					"Fleet Shadowspirit Diamond",
					{[L["mastery"]] = 54, [L["minor run speed"]] = 1},
				},
				[4046] = {
					"meta",
					"Chaotic Shadowspirit Diamond",
					{[L["critical effect (percent)"]] = 3, [L["critical strike"]] = 54},
				},
				[4047] = {
					"meta",
					"Bracing Shadowspirit Diamond",
					{[L["intellect"]] = 54, [L["threat reduction (percent)"]] = 2},
				},
				[4048] = {
					"meta",
					"Eternal Shadowspirit Diamond",
					{[L["block value (percent)"]] = 1, [L["stamina"]] = 81},
				},
				[4049] = {
					"meta",
					"Austere Shadowspirit Diamond",
					{[L["armor from items (percent)"]] = 2, [L["stamina"]] = 81},
				},
				[4050] = {
					"meta",
					"Effulgent Shadowspirit Diamond",
					{[L["spell damage taken reduction (percent)"]] = 2, [L["stamina"]] = 81},
				},
				[4051] = {
					"meta",
					"Ember Shadowspirit Diamond",
					{[L["intellect"]] = 54, [L["mana (percent)"]] = 2},
				},
				[4052] = {
					"meta",
					"Revitalizing Shadowspirit Diamond",
					{[L["critical effect (percent)"]] = 3, [L["spirit"]] = 54},
				},
				[4053] = {
					"meta",
					"Destructive Shadowspirit Diamond",
					{[L["critical strike"]] = 54, [L["spell reflect (percent)"]] = 1},
				},
				[4054] = {
					"meta",
					"Powerful Shadowspirit Diamond",
					{[L["stamina"]] = 81, [L["stun duration reduction (percent)"]] = 10},
				},
				[4055] = {
					"meta",
					"Enigmatic Shadowspirit Diamond",
					{[L["critical strike"]] = 54, [L["snare/root duration reduction (percent)"]] = 10},
				},
				[4056] = {
					"meta",
					"Impassive Shadowspirit Diamond",
					{[L["critical strike"]] = 54, [L["fear duration reduction (percent)"]] = 10},
				},
				[4057] = {
					"meta",
					"Forlorn Shadowspirit Diamond",
					{[L["intellect"]] = 54, [L["silence duration reduction (percent)"]] = 10},
				},
				[4236] = {
					"orange",
					"Willful Ember Topaz",
					{[L["intellect"]] = 20, [L["pvp resilience"]] = 20},
				},
				[4237] = {
					"orange",
					"Lucent Ember Topaz",
					{[L["agility"]] = 20, [L["pvp resilience"]] = 20},
				},
				[4238] = {
					"orange",
					"Resplendent Ember Topaz",
					{[L["pvp resilience"]] = 20, [L["strength"]] = 20},
				},
				[4244] = {
					"green",
					"Vivid Dream Emerald",
					{[L["pvp power"]] = 20, [L["pvp resilience"]] = 20},
				},
				[4251] = {
					"meta",
					"Agile Shadowspirit Diamond",
					{[L["agility"]] = 54, [L["critical effect (percent)"]] = 3},
				},
				[4252] = {
					"meta",
					"Reverberating Shadowspirit Diamond",
					{[L["critical effect (percent)"]] = 3, [L["strength"]] = 54},
				},
				[4253] = {
					"meta",
					"Burning Shadowspirit Diamond",
					{[L["critical effect (percent)"]] = 3, [L["intellect"]] = 54},
				},
			},
			[10] = {
				[4273] = {
					"blue",
					"Rigid Deepholm Iolite",
					{[L["hit"]] = 50},
				},
				[4274] = {
					"blue",
					"Stormy Deepholm Iolite",
					{[L["pvp power"]] = 50},
				},
				[4275] = {
					"blue",
					"Sparkling Deepholm Iolite",
					{[L["spirit"]] = 50},
				},
				[4276] = {
					"blue",
					"Solid Deepholm Iolite",
					{[L["stamina"]] = 75},
				},
				[4277] = {
					"green",
					"Misty Elven Peridot",
					{[L["critical strike"]] = 25, [L["spirit"]] = 25},
				},
				[4278] = {
					"green",
					"Piercing Elven Peridot",
					{[L["critical strike"]] = 25, [L["hit"]] = 25},
				},
				[4279] = {
					"green",
					"Lightning Elven Peridot",
					{[L["haste"]] = 25, [L["hit"]] = 25},
				},
				[4280] = {
					"green",
					"Sensei's Elven Peridot",
					{[L["hit"]] = 25, [L["mastery"]] = 25},
				},
				[4281] = {
					"green",
					"Infused Elven Peridot",
					{[L["mastery"]] = 25, [L["pvp power"]] = 25},
				},
				[4282] = {
					"green",
					"Zen Elven Peridot",
					{[L["mastery"]] = 25, [L["spirit"]] = 25},
				},
				[4283] = {
					"green",
					"Balanced Elven Peridot",
					{[L["hit"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4284] = {
					"green",
					"Vivid Elven Peridot",
					{[L["pvp power"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4285] = {
					"green",
					"Turbid Elven Peridot",
					{[L["pvp resilience"]] = 25, [L["spirit"]] = 25},
				},
				[4286] = {
					"green",
					"Radiant Elven Peridot",
					{[L["critical strike"]] = 25, [L["pvp power"]] = 25},
				},
				[4287] = {
					"green",
					"Shattered Elven Peridot",
					{[L["haste"]] = 25, [L["pvp power"]] = 25},
				},
				[4288] = {
					"green",
					"Energized Elven Peridot",
					{[L["haste"]] = 25, [L["spirit"]] = 25},
				},
				[4289] = {
					"green",
					"Jagged Elven Peridot",
					{[L["critical strike"]] = 25, [L["stamina"]] = 37},
				},
				[4290] = {
					"green",
					"Regal Elven Peridot",
					{[L["dodge"]] = 25, [L["stamina"]] = 37},
				},
				[4291] = {
					"green",
					"Forceful Elven Peridot",
					{[L["haste"]] = 25, [L["stamina"]] = 37},
				},
				[4292] = {
					"green",
					"Nimble Elven Peridot",
					{[L["dodge"]] = 25, [L["hit"]] = 25},
				},
				[4293] = {
					"green",
					"Puissant Elven Peridot",
					{[L["mastery"]] = 25, [L["stamina"]] = 37},
				},
				[4294] = {
					"green",
					"Steady Elven Peridot",
					{[L["pvp resilience"]] = 25, [L["stamina"]] = 37},
				},
				[4295] = {
					"orange",
					"Deadly Lava Coral",
					{[L["agility"]] = 25, [L["critical strike"]] = 25},
				},
				[4296] = {
					"orange",
					"Crafty Lava Coral",
					{[L["critical strike"]] = 25, [L["expertise"]] = 25},
				},
				[4297] = {
					"orange",
					"Potent Lava Coral",
					{[L["critical strike"]] = 25, [L["intellect"]] = 25},
				},
				[4298] = {
					"orange",
					"Inscribed Lava Coral",
					{[L["critical strike"]] = 25, [L["strength"]] = 25},
				},
				[4299] = {
					"orange",
					"Polished Lava Coral",
					{[L["agility"]] = 25, [L["dodge"]] = 25},
				},
				[4300] = {
					"orange",
					"Resolute Lava Coral",
					{[L["dodge"]] = 25, [L["expertise"]] = 25},
				},
				[4301] = {
					"orange",
					"Stalwart Lava Coral",
					{[L["dodge"]] = 25, [L["parry"]] = 25},
				},
				[4302] = {
					"orange",
					"Champion's Lava Coral",
					{[L["dodge"]] = 25, [L["strength"]] = 25},
				},
				[4303] = {
					"orange",
					"Deft Lava Coral",
					{[L["agility"]] = 25, [L["haste"]] = 25},
				},
				[4304] = {
					"orange",
					"Wicked Lava Coral",
					{[L["expertise"]] = 25, [L["haste"]] = 25},
				},
				[4305] = {
					"orange",
					"Reckless Lava Coral",
					{[L["haste"]] = 25, [L["intellect"]] = 25},
				},
				[4306] = {
					"orange",
					"Fierce Lava Coral",
					{[L["haste"]] = 25, [L["strength"]] = 25},
				},
				[4307] = {
					"orange",
					"Adept Lava Coral",
					{[L["agility"]] = 25, [L["mastery"]] = 25},
				},
				[4308] = {
					"orange",
					"Keen Lava Coral",
					{[L["expertise"]] = 25, [L["mastery"]] = 25},
				},
				[4309] = {
					"orange",
					"Artful Lava Coral",
					{[L["intellect"]] = 25, [L["mastery"]] = 25},
				},
				[4310] = {
					"orange",
					"Fine Lava Coral",
					{[L["mastery"]] = 25, [L["parry"]] = 25},
				},
				[4311] = {
					"orange",
					"Skillful Lava Coral",
					{[L["mastery"]] = 25, [L["strength"]] = 25},
				},
				[4312] = {
					"orange",
					"Lucent Lava Coral",
					{[L["agility"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4313] = {
					"orange",
					"Tenuous Lava Coral",
					{[L["expertise"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4314] = {
					"orange",
					"Willful Lava Coral",
					{[L["intellect"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4315] = {
					"orange",
					"Splendid Lava Coral",
					{[L["parry"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4316] = {
					"orange",
					"Resplendent Lava Coral",
					{[L["pvp resilience"]] = 25, [L["strength"]] = 25},
				},
				[4317] = {
					"purple",
					"Glinting Shadow Spinel",
					{[L["agility"]] = 25, [L["hit"]] = 25},
				},
				[4318] = {
					"purple",
					"Accurate Shadow Spinel",
					{[L["expertise"]] = 25, [L["hit"]] = 25},
				},
				[4319] = {
					"purple",
					"Veiled Shadow Spinel",
					{[L["hit"]] = 25, [L["intellect"]] = 25},
				},
				[4320] = {
					"purple",
					"Retaliating Shadow Spinel",
					{[L["hit"]] = 25, [L["parry"]] = 25},
				},
				[4321] = {
					"purple",
					"Etched Shadow Spinel",
					{[L["hit"]] = 25, [L["strength"]] = 25},
				},
				[4322] = {
					"purple",
					"Mysterious Shadow Spinel",
					{[L["intellect"]] = 25, [L["pvp power"]] = 25},
				},
				[4323] = {
					"purple",
					"Purified Shadow Spinel",
					{[L["intellect"]] = 25, [L["spirit"]] = 25},
				},
				[4324] = {
					"purple",
					"Shifting Shadow Spinel",
					{[L["agility"]] = 25, [L["stamina"]] = 37},
				},
				[4325] = {
					"purple",
					"Guardian's Shadow Spinel",
					{[L["expertise"]] = 25, [L["stamina"]] = 37},
				},
				[4326] = {
					"purple",
					"Timeless Shadow Spinel",
					{[L["intellect"]] = 25, [L["stamina"]] = 37},
				},
				[4327] = {
					"purple",
					"Defender's Shadow Spinel",
					{[L["parry"]] = 25, [L["stamina"]] = 37},
				},
				[4328] = {
					"purple",
					"Sovereign Shadow Spinel",
					{[L["stamina"]] = 37, [L["strength"]] = 25},
				},
				[4329] = {
					"red",
					"Delicate Queen's Garnet",
					{[L["agility"]] = 50},
				},
				[4330] = {
					"red",
					"Precise Queen's Garnet",
					{[L["expertise"]] = 50},
				},
				[4331] = {
					"red",
					"Brilliant Queen's Garnet",
					{[L["intellect"]] = 50},
				},
				[4332] = {
					"red",
					"Flashing Queen's Garnet",
					{[L["parry"]] = 50},
				},
				[4333] = {
					"red",
					"Bold Queen's Garnet",
					{[L["strength"]] = 50},
				},
				[4334] = {
					"yellow",
					"Smooth Lightstone",
					{[L["critical strike"]] = 50},
				},
				[4335] = {
					"yellow",
					"Subtle Lightstone",
					{[L["dodge"]] = 50},
				},
				[4336] = {
					"yellow",
					"Quick Lightstone",
					{[L["haste"]] = 50},
				},
				[4337] = {
					"yellow",
					"Fractured Lightstone",
					{[L["mastery"]] = 50},
				},
				[4338] = {
					"yellow",
					"Mystic Lightstone",
					{[L["pvp resilience"]] = 50},
				},
				[4672] = {
					"green",
					"Balanced Elven Peridot",
					{[L["hit"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4673] = {
					"green",
					"Infused Elven Peridot",
					{[L["mastery"]] = 25, [L["pvp power"]] = 25},
				},
				[4674] = {
					"orange",
					"Lucent Lava Coral",
					{[L["agility"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4675] = {
					"purple",
					"Mysterious Shadow Spinel",
					{[L["intellect"]] = 25, [L["pvp power"]] = 25},
				},
				[4676] = {
					"yellow",
					"Mystic Lightstone",
					{[L["pvp resilience"]] = 50},
				},
				[4677] = {
					"green",
					"Radiant Elven Peridot",
					{[L["critical strike"]] = 25, [L["pvp power"]] = 25},
				},
				[4678] = {
					"orange",
					"Resplendent Lava Coral",
					{[L["pvp resilience"]] = 25, [L["strength"]] = 25},
				},
				[4679] = {
					"green",
					"Shattered Elven Peridot",
					{[L["haste"]] = 25, [L["pvp power"]] = 25},
				},
				[4680] = {
					"orange",
					"Splendid Lava Coral",
					{[L["parry"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4681] = {
					"green",
					"Steady Elven Peridot",
					{[L["pvp resilience"]] = 25, [L["stamina"]] = 37},
				},
				[4682] = {
					"blue",
					"Stormy Deepholm Iolite",
					{[L["pvp power"]] = 50},
				},
				[4683] = {
					"orange",
					"Tenuous Lava Coral",
					{[L["expertise"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4684] = {
					"green",
					"Turbid Elven Peridot",
					{[L["pvp resilience"]] = 25, [L["spirit"]] = 25},
				},
				[4685] = {
					"green",
					"Vivid Elven Peridot",
					{[L["pvp power"]] = 25, [L["pvp resilience"]] = 25},
				},
				[4686] = {
					"orange",
					"Willful Lava Coral",
					{[L["intellect"]] = 25, [L["pvp resilience"]] = 25},
				},
			},
			[11] = {
				[4453] = {
					"blue",
					"Rigid Lapis Lazuli",
					{[L["hit"]] = 240},
				},
				[4454] = {
					"blue",
					"Stormy Lapis Lazuli",
					{[L["pvp power"]] = 240},
				},
				[4455] = {
					"blue",
					"Sparkling Lapis Lazuli",
					{[L["spirit"]] = 240},
				},
				[4456] = {
					"blue",
					"Solid Lapis Lazuli",
					{[L["stamina"]] = 180},
				},
				[4457] = {
					"green",
					"Misty Alexandrite",
					{[L["critical strike"]] = 120, [L["spirit"]] = 120},
				},
				[4458] = {
					"green",
					"Piercing Alexandrite",
					{[L["critical strike"]] = 120, [L["hit"]] = 120},
				},
				[4459] = {
					"green",
					"Lightning Alexandrite",
					{[L["haste"]] = 120, [L["hit"]] = 120},
				},
				[4460] = {
					"green",
					"Sensei's Alexandrite",
					{[L["hit"]] = 120, [L["mastery"]] = 120},
				},
				[4461] = {
					"green",
					"Effulgent Alexandrite",
					{[L["mastery"]] = 120, [L["pvp power"]] = 120},
				},
				[4462] = {
					"green",
					"Zen Alexandrite",
					{[L["mastery"]] = 120, [L["spirit"]] = 120},
				},
				[4463] = {
					"green",
					"Balanced Alexandrite",
					{[L["hit"]] = 120, [L["pvp resilience"]] = 120},
				},
				[4464] = {
					"green",
					"Vivid Alexandrite",
					{[L["pvp power"]] = 120, [L["pvp resilience"]] = 120},
				},
				[4465] = {
					"green",
					"Turbid Alexandrite",
					{[L["pvp resilience"]] = 120, [L["spirit"]] = 120},
				},
				[4466] = {
					"green",
					"Radiant Alexandrite",
					{[L["critical strike"]] = 120, [L["pvp power"]] = 120},
				},
				[4467] = {
					"green",
					"Shattered Alexandrite",
					{[L["haste"]] = 120, [L["pvp power"]] = 120},
				},
				[4468] = {
					"green",
					"Energized Alexandrite",
					{[L["haste"]] = 120, [L["spirit"]] = 120},
				},
				[4469] = {
					"green",
					"Jagged Alexandrite",
					{[L["critical strike"]] = 120, [L["stamina"]] = 90},
				},
				[4470] = {
					"green",
					"Regal Alexandrite",
					{[L["dodge"]] = 120, [L["stamina"]] = 90},
				},
				[4471] = {
					"green",
					"Forceful Alexandrite",
					{[L["haste"]] = 120, [L["stamina"]] = 90},
				},
				[4472] = {
					"green",
					"Nimble Alexandrite",
					{[L["hit"]] = 120, [L["stamina"]] = 90},
				},
				[4473] = {
					"green",
					"Puissant Alexandrite",
					{[L["mastery"]] = 120, [L["stamina"]] = 90},
				},
				[4474] = {
					"green",
					"Steady Alexandrite",
					{[L["pvp resilience"]] = 120, [L["stamina"]] = 90},
				},
				[4475] = {
					"orange",
					"Deadly Tiger Opal",
					{[L["agility"]] = 60, [L["critical strike"]] = 120},
				},
				[4476] = {
					"orange",
					"Crafty Tiger Opal",
					{[L["critical strike"]] = 120, [L["expertise"]] = 120},
				},
				[4477] = {
					"orange",
					"Potent Tiger Opal",
					{[L["critical strike"]] = 120, [L["intellect"]] = 60},
				},
				[4478] = {
					"orange",
					"Inscribed Tiger Opal",
					{[L["critical strike"]] = 120, [L["strength"]] = 60},
				},
				[4479] = {
					"orange",
					"Polished Tiger Opal",
					{[L["agility"]] = 60, [L["dodge"]] = 120},
				},
				[4480] = {
					"orange",
					"Resolute Tiger Opal",
					{[L["dodge"]] = 120, [L["expertise"]] = 120},
				},
				[4481] = {
					"orange",
					"Stalwart Tiger Opal",
					{[L["dodge"]] = 120, [L["parry"]] = 120},
				},
				[4482] = {
					"orange",
					"Champion's Tiger Opal",
					{[L["dodge"]] = 120, [L["strength"]] = 60},
				},
				[4483] = {
					"orange",
					"Deft Tiger Opal",
					{[L["agility"]] = 60, [L["haste"]] = 120},
				},
				[4484] = {
					"orange",
					"Wicked Tiger Opal",
					{[L["expertise"]] = 120, [L["haste"]] = 120},
				},
				[4485] = {
					"orange",
					"Reckless Tiger Opal",
					{[L["haste"]] = 120, [L["intellect"]] = 60},
				},
				[4486] = {
					"orange",
					"Fierce Tiger Opal",
					{[L["haste"]] = 120, [L["strength"]] = 60},
				},
				[4487] = {
					"orange",
					"Adept Tiger Opal",
					{[L["agility"]] = 60, [L["mastery"]] = 120},
				},
				[4488] = {
					"orange",
					"Keen Tiger Opal",
					{[L["expertise"]] = 120, [L["mastery"]] = 120},
				},
				[4489] = {
					"orange",
					"Artful Tiger Opal",
					{[L["intellect"]] = 60, [L["mastery"]] = 120},
				},
				[4490] = {
					"orange",
					"Fine Tiger Opal",
					{[L["mastery"]] = 120, [L["parry"]] = 120},
				},
				[4491] = {
					"orange",
					"Skillful Tiger Opal",
					{[L["mastery"]] = 120, [L["strength"]] = 60},
				},
				[4492] = {
					"orange",
					"Lucent Tiger Opal",
					{[L["agility"]] = 60, [L["pvp resilience"]] = 120},
				},
				[4493] = {
					"orange",
					"Tenuous Tiger Opal",
					{[L["expertise"]] = 120, [L["pvp resilience"]] = 120},
				},
				[4494] = {
					"orange",
					"Willful Tiger Opal",
					{[L["intellect"]] = 60, [L["pvp resilience"]] = 120},
				},
				[4495] = {
					"orange",
					"Splendid Tiger Opal",
					{[L["parry"]] = 120, [L["pvp resilience"]] = 120},
				},
				[4496] = {
					"orange",
					"Resplendent Tiger Opal",
					{[L["pvp resilience"]] = 120, [L["strength"]] = 60},
				},
				[4497] = {
					"purple",
					"Glinting Roguestone",
					{[L["agility"]] = 60, [L["hit"]] = 120},
				},
				[4498] = {
					"purple",
					"Accurate Roguestone",
					{[L["expertise"]] = 120, [L["hit"]] = 120},
				},
				[4499] = {
					"purple",
					"Veiled Roguestone",
					{[L["hit"]] = 120, [L["intellect"]] = 60},
				},
				[4500] = {
					"purple",
					"Retaliating Roguestone",
					{[L["hit"]] = 120, [L["parry"]] = 120},
				},
				[4501] = {
					"purple",
					"Etched Roguestone",
					{[L["hit"]] = 120, [L["strength"]] = 60},
				},
				[4502] = {
					"purple",
					"Mysterious Roguestone",
					{[L["intellect"]] = 60, [L["pvp power"]] = 120},
				},
				[4503] = {
					"purple",
					"Purified Roguestone",
					{[L["intellect"]] = 60, [L["spirit"]] = 120},
				},
				[4504] = {
					"purple",
					"Shifting Roguestone",
					{[L["agility"]] = 60, [L["stamina"]] = 90},
				},
				[4505] = {
					"purple",
					"Guardian's Roguestone",
					{[L["expertise"]] = 120, [L["stamina"]] = 90},
				},
				[4506] = {
					"purple",
					"Timeless Roguestone",
					{[L["intellect"]] = 60, [L["stamina"]] = 90},
				},
				[4507] = {
					"purple",
					"Defender's Roguestone",
					{[L["parry"]] = 120, [L["stamina"]] = 90},
				},
				[4508] = {
					"purple",
					"Sovereign Roguestone",
					{[L["stamina"]] = 90, [L["strength"]] = 60},
				},
				[4509] = {
					"red",
					"Delicate Pandarian Garnet",
					{[L["agility"]] = 120},
				},
				[4511] = {
					"red",
					"Precise Pandarian Garnet",
					{[L["expertise"]] = 240},
				},
				[4512] = {
					"red",
					"Brilliant Pandarian Garnet",
					{[L["intellect"]] = 120},
				},
				[4513] = {
					"red",
					"Flashing Pandarian Garnet",
					{[L["parry"]] = 240},
				},
				[4514] = {
					"red",
					"Bold Pandarian Garnet",
					{[L["strength"]] = 120},
				},
				[4515] = {
					"yellow",
					"Smooth Sunstone",
					{[L["critical strike"]] = 240},
				},
				[4516] = {
					"yellow",
					"Subtle Sunstone",
					{[L["dodge"]] = 240},
				},
				[4517] = {
					"yellow",
					"Quick Sunstone",
					{[L["haste"]] = 240},
				},
				[4518] = {
					"yellow",
					"Fractured Sunstone",
					{[L["mastery"]] = 240},
				},
				[4519] = {
					"yellow",
					"Mystic Sunstone",
					{[L["pvp resilience"]] = 240},
				},
				[4985] = {
					"purple",
					"Tense Roguestone",
					{[L["pvp power"]] = 120, [L["strength"]] = 60},
				},
				[4988] = {
					"purple",
					"Assassin's Roguestone",
					{[L["agility"]] = 60, [L["pvp power"]] = 120},
				},
			},
			[12] = {
				[4587] = {
					"blue",
					"Rigid River's Heart",
					{[L["hit"]] = 320},
				},
				[4588] = {
					"blue",
					"Stormy River's Heart",
					{[L["pvp power"]] = 320},
				},
				[4589] = {
					"blue",
					"Sparkling River's Heart",
					{[L["spirit"]] = 320},
				},
				[4590] = {
					"blue",
					"Solid River's Heart",
					{[L["stamina"]] = 240},
				},
				[4591] = {
					"green",
					"Misty Wild Jade",
					{[L["critical strike"]] = 160, [L["spirit"]] = 160},
				},
				[4592] = {
					"green",
					"Piercing Wild Jade",
					{[L["critical strike"]] = 160, [L["hit"]] = 160},
				},
				[4593] = {
					"green",
					"Lightning Wild Jade",
					{[L["haste"]] = 160, [L["hit"]] = 160},
				},
				[4594] = {
					"green",
					"Sensei's Wild Jade",
					{[L["hit"]] = 160, [L["mastery"]] = 160},
				},
				[4595] = {
					"green",
					"Effulgent Wild Jade",
					{[L["mastery"]] = 160, [L["pvp power"]] = 160},
				},
				[4596] = {
					"green",
					"Zen Wild Jade",
					{[L["mastery"]] = 160, [L["spirit"]] = 160},
				},
				[4597] = {
					"green",
					"Balanced Wild Jade",
					{[L["hit"]] = 160, [L["pvp resilience"]] = 160},
				},
				[4598] = {
					"green",
					"Vivid Wild Jade",
					{[L["pvp power"]] = 160, [L["pvp resilience"]] = 160},
				},
				[4599] = {
					"green",
					"Turbid Wild Jade",
					{[L["pvp resilience"]] = 160, [L["spirit"]] = 160},
				},
				[4600] = {
					"green",
					"Radiant Wild Jade",
					{[L["critical strike"]] = 160, [L["pvp power"]] = 160},
				},
				[4601] = {
					"green",
					"Shattered Wild Jade",
					{[L["haste"]] = 160, [L["pvp power"]] = 160},
				},
				[4602] = {
					"green",
					"Energized Wild Jade",
					{[L["haste"]] = 160, [L["spirit"]] = 160},
				},
				[4603] = {
					"green",
					"Jagged Wild Jade",
					{[L["critical strike"]] = 160, [L["stamina"]] = 120},
				},
				[4604] = {
					"green",
					"Regal Wild Jade",
					{[L["dodge"]] = 160, [L["stamina"]] = 120},
				},
				[4605] = {
					"green",
					"Forceful Wild Jade",
					{[L["haste"]] = 160, [L["stamina"]] = 120},
				},
				[4606] = {
					"green",
					"Nimble Wild Jade",
					{[L["hit"]] = 160, [L["stamina"]] = 120},
				},
				[4607] = {
					"green",
					"Puissant Wild Jade",
					{[L["mastery"]] = 160, [L["stamina"]] = 120},
				},
				[4608] = {
					"green",
					"Steady Wild Jade",
					{[L["pvp resilience"]] = 160, [L["stamina"]] = 120},
				},
				[4609] = {
					"orange",
					"Deadly Vermilion Onyx",
					{[L["agility"]] = 80, [L["critical strike"]] = 160},
				},
				[4610] = {
					"orange",
					"Crafty Vermilion Onyx",
					{[L["critical strike"]] = 160, [L["expertise"]] = 160},
				},
				[4611] = {
					"orange",
					"Potent Vermilion Onyx",
					{[L["critical strike"]] = 160, [L["intellect"]] = 80},
				},
				[4612] = {
					"orange",
					"Inscribed Vermilion Onyx",
					{[L["critical strike"]] = 160, [L["strength"]] = 80},
				},
				[4613] = {
					"orange",
					"Polished Vermilion Onyx",
					{[L["agility"]] = 80, [L["dodge"]] = 160},
				},
				[4614] = {
					"orange",
					"Resolute Vermilion Onyx",
					{[L["dodge"]] = 160, [L["expertise"]] = 160},
				},
				[4615] = {
					"orange",
					"Stalwart Vermilion Onyx",
					{[L["dodge"]] = 160, [L["parry"]] = 160},
				},
				[4616] = {
					"orange",
					"Champion's Vermilion Onyx",
					{[L["dodge"]] = 160, [L["strength"]] = 80},
				},
				[4617] = {
					"orange",
					"Deft Vermilion Onyx",
					{[L["agility"]] = 80, [L["haste"]] = 160},
				},
				[4618] = {
					"orange",
					"Wicked Vermilion Onyx",
					{[L["expertise"]] = 160, [L["haste"]] = 160},
				},
				[4619] = {
					"orange",
					"Reckless Vermilion Onyx",
					{[L["haste"]] = 160, [L["intellect"]] = 80},
				},
				[4620] = {
					"orange",
					"Fierce Vermilion Onyx",
					{[L["haste"]] = 160, [L["strength"]] = 80},
				},
				[4621] = {
					"orange",
					"Adept Vermilion Onyx",
					{[L["agility"]] = 80, [L["mastery"]] = 160},
				},
				[4622] = {
					"orange",
					"Keen Vermilion Onyx",
					{[L["expertise"]] = 160, [L["mastery"]] = 160},
				},
				[4623] = {
					"orange",
					"Artful Vermilion Onyx",
					{[L["intellect"]] = 80, [L["mastery"]] = 160},
				},
				[4624] = {
					"orange",
					"Fine Vermilion Onyx",
					{[L["mastery"]] = 160, [L["parry"]] = 160},
				},
				[4625] = {
					"orange",
					"Skillful Vermilion Onyx",
					{[L["mastery"]] = 160, [L["strength"]] = 80},
				},
				[4626] = {
					"orange",
					"Lucent Vermilion Onyx",
					{[L["agility"]] = 80, [L["pvp resilience"]] = 160},
				},
				[4627] = {
					"orange",
					"Tenuous Vermilion Onyx",
					{[L["expertise"]] = 160, [L["pvp resilience"]] = 160},
				},
				[4628] = {
					"orange",
					"Willful Vermilion Onyx",
					{[L["intellect"]] = 80, [L["pvp resilience"]] = 160},
				},
				[4629] = {
					"orange",
					"Splendid Vermilion Onyx",
					{[L["parry"]] = 160, [L["pvp resilience"]] = 160},
				},
				[4630] = {
					"orange",
					"Resplendent Vermilion Onyx",
					{[L["pvp resilience"]] = 160, [L["strength"]] = 80},
				},
				[4631] = {
					"purple",
					"Glinting Imperial Amethyst",
					{[L["agility"]] = 80, [L["hit"]] = 160},
				},
				[4632] = {
					"purple",
					"Accurate Imperial Amethyst",
					{[L["expertise"]] = 160, [L["hit"]] = 160},
				},
				[4633] = {
					"purple",
					"Veiled Imperial Amethyst",
					{[L["hit"]] = 160, [L["intellect"]] = 80},
				},
				[4634] = {
					"purple",
					"Retaliating Imperial Amethyst",
					{[L["hit"]] = 160, [L["parry"]] = 160},
				},
				[4635] = {
					"purple",
					"Etched Imperial Amethyst",
					{[L["hit"]] = 160, [L["strength"]] = 80},
				},
				[4636] = {
					"purple",
					"Mysterious Imperial Amethyst",
					{[L["intellect"]] = 80, [L["pvp power"]] = 160},
				},
				[4637] = {
					"purple",
					"Purified Imperial Amethyst",
					{[L["intellect"]] = 80, [L["spirit"]] = 160},
				},
				[4638] = {
					"purple",
					"Shifting Imperial Amethyst",
					{[L["agility"]] = 80, [L["stamina"]] = 120},
				},
				[4640] = {
					"purple",
					"Timeless Imperial Amethyst",
					{[L["intellect"]] = 80, [L["stamina"]] = 120},
				},
				[4641] = {
					"purple",
					"Defender's Imperial Amethyst",
					{[L["parry"]] = 160, [L["stamina"]] = 120},
				},
				[4642] = {
					"purple",
					"Sovereign Imperial Amethyst",
					{[L["stamina"]] = 120, [L["strength"]] = 80},
				},
				[4643] = {
					"red",
					"Delicate Primordial Ruby",
					{[L["agility"]] = 160},
				},
				[4644] = {
					"red",
					"Brilliant Primordial Ruby",
					{[L["intellect"]] = 160},
				},
				[4645] = {
					"red",
					"Flashing Primordial Ruby",
					{[L["parry"]] = 320},
				},
				[4646] = {
					"red",
					"Bold Primordial Ruby",
					{[L["strength"]] = 160},
				},
				[4647] = {
					"yellow",
					"Smooth Sun's Radiance",
					{[L["critical strike"]] = 320},
				},
				[4648] = {
					"yellow",
					"Subtle Sun's Radiance",
					{[L["dodge"]] = 320},
				},
				[4649] = {
					"yellow",
					"Quick Sun's Radiance",
					{[L["haste"]] = 320},
				},
				[4650] = {
					"yellow",
					"Fractured Sun's Radiance",
					{[L["mastery"]] = 320},
				},
				[4651] = {
					"yellow",
					"Mystic Sun's Radiance",
					{[L["pvp resilience"]] = 320},
				},
				[4652] = {
					"purple",
					"Guardian's Imperial Amethyst",
					{[L["expertise"]] = 160, [L["stamina"]] = 120},
				},
				[4653] = {
					"red",
					"Precise Primordial Ruby",
					{[L["expertise"]] = 320},
				},
				[4655] = {
					"meta",
					"Ember Primal Diamond",
					{[L["intellect"]] = 216, [L["mana (percent)"]] = 2},
				},
				[4656] = {
					"meta",
					"Agile Primal Diamond",
					{[L["agility"]] = 216, [L["critical effect (percent)"]] = 3},
				},
				[4657] = {
					"meta",
					"Reverberating Primal Diamond",
					{[L["critical effect (percent)"]] = 3, [L["strength"]] = 216},
				},
				[4658] = {
					"meta",
					"Burning Primal Diamond",
					{[L["critical effect (percent)"]] = 3, [L["intellect"]] = 216},
				},
				[4659] = {
					"meta",
					"Fleet Primal Diamond",
					{[L["mastery"]] = 432, [L["minor run speed"]] = 1},
				},
				[4660] = {
					"meta",
					"Revitalizing Primal Diamond",
					{[L["critical effect (percent)"]] = 3, [L["spirit"]] = 432},
				},
				[4661] = {
					"meta",
					"Destructive Primal Diamond",
					{[L["critical strike"]] = 432, [L["spell reflect (percent)"]] = 1},
				},
				[4662] = {
					"meta",
					"Powerful Primal Diamond",
					{[L["stamina"]] = 324, [L["stun duration reduction (percent)"]] = 10},
				},
				[4664] = {
					"meta",
					"Enigmatic Primal Diamond",
					{[L["critical strike"]] = 432, [L["snare/root duration reduction (percent)"]] = 10},
				},
				[4665] = {
					"meta",
					"Impassive Primal Diamond",
					{[L["critical strike"]] = 432, [L["fear duration reduction (percent)"]] = 10},
				},
				[4666] = {
					"meta",
					"Forlorn Primal Diamond",
					{[L["intellect"]] = 216, [L["silence duration reduction (percent)"]] = 10},
				},
				[4667] = {
					"meta",
					"Austere Primal Diamond",
					{[L["armor from items (percent)"]] = 2, [L["stamina"]] = 324},
				},
				[4668] = {
					"meta",
					"Eternal Primal Diamond",
					{[L["block value (percent)"]] = 1, [L["dodge"]] = 432},
				},
				[4669] = {
					"meta",
					"Effulgent Primal Diamond",
					{[L["spell damage taken reduction (percent)"]] = 2, [L["stamina"]] = 324},
				},
				[4899] = {
					"cogwheel",
					"Flashing Tinker's Gear",
					{[L["parry"]] = 600},
				},
				[4900] = {
					"cogwheel",
					"Fractured Tinker's Gear",
					{[L["mastery"]] = 600},
				},
				[4901] = {
					"cogwheel",
					"Precise Tinker's Gear",
					{[L["expertise"]] = 600},
				},
				[4902] = {
					"cogwheel",
					"Quick Tinker's Gear",
					{[L["haste"]] = 600},
				},
				[4903] = {
					"cogwheel",
					"Rigid Tinker's Gear",
					{[L["hit"]] = 600},
				},
				[4904] = {
					"cogwheel",
					"Smooth Tinker's Gear",
					{[L["critical strike"]] = 600},
				},
				[4905] = {
					"cogwheel",
					"Sparkling Tinker's Gear",
					{[L["spirit"]] = 600},
				},
				[4906] = {
					"cogwheel",
					"Subtle Tinker's Gear",
					{[L["dodge"]] = 600},
				},
				[4984] = {
					"purple",
					"Tense Imperial Amethyst",
					{[L["pvp power"]] = 160, [L["strength"]] = 80},
				},
				[4990] = {
					"purple",
					"Assassin's Imperial Amethyst",
					{[L["agility"]] = 80, [L["pvp power"]] = 160},
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
					{[L["critical strike"]] = 12},
				},
				[3220] = {
					"yellow",
					"Stone of Blades",
					{[L["critical strike"]] = 12},
				},
				[3221] = {
					"yellow",
					"Facet of Eternity",
					{[L["dodge"]] = 12},
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
					{[L["critical strike"]] = 34},
				},
				[3739] = {
					"yellow",
					"Quick Dragon's Eye",
					{[L["haste"]] = 34},
				},
				[3740] = {
					"yellow",
					"Subtle Dragon's Eye",
					{[L["dodge"]] = 34},
				},
				[3741] = {
					"red",
					"Flashing Dragon's Eye",
					{[L["parry"]] = 34},
				},
				[3742] = {
					"blue",
					"Rigid Dragon's Eye",
					{[L["hit"]] = 34},
				},
				[3743] = {
					"yellow",
					"Subtle Dragon's Eye",
					{[L["dodge"]] = 34},
				},
				[3744] = {
					"yellow",
					"Mystic Dragon's Eye",
					{[L["pvp resilience"]] = 34},
				},
				[3745] = {
					"yellow",
					"Smooth Dragon's Eye",
					{[L["critical strike"]] = 34},
				},
				[3746] = {
					"red",
					"Precise Dragon's Eye",
					{[L["expertise"]] = 34},
				},
				[3747] = {
					"blue",
					"Stormy Dragon's Eye",
					{[L["pvp power"]] = 34},
				},
			},
			[10] = {
				[4031] = {
					"red",
					"Bold Chimera's Eye",
					{[L["strength"]] = 67},
				},
				[4032] = {
					"red",
					"Brilliant Chimera's Eye",
					{[L["intellect"]] = 67},
				},
				[4033] = {
					"red",
					"Delicate Chimera's Eye",
					{[L["agility"]] = 67},
				},
				[4034] = {
					"red",
					"Flashing Chimera's Eye",
					{[L["parry"]] = 67},
				},
				[4035] = {
					"yellow",
					"Fractured Chimera's Eye",
					{[L["mastery"]] = 67},
				},
				[4036] = {
					"yellow",
					"Mystic Chimera's Eye",
					{[L["pvp resilience"]] = 67},
				},
				[4037] = {
					"red",
					"Precise Chimera's Eye",
					{[L["expertise"]] = 67},
				},
				[4038] = {
					"yellow",
					"Quick Chimera's Eye",
					{[L["haste"]] = 67},
				},
				[4039] = {
					"blue",
					"Rigid Chimera's Eye",
					{[L["hit"]] = 67},
				},
				[4040] = {
					"yellow",
					"Smooth Chimera's Eye",
					{[L["critical strike"]] = 67},
				},
				[4041] = {
					"blue",
					"Solid Chimera's Eye",
					{[L["stamina"]] = 101},
				},
				[4042] = {
					"blue",
					"Sparkling Chimera's Eye",
					{[L["spirit"]] = 67},
				},
				[4043] = {
					"blue",
					"Stormy Chimera's Eye",
					{[L["pvp power"]] = 67},
				},
				[4044] = {
					"yellow",
					"Subtle Chimera's Eye",
					{[L["dodge"]] = 67},
				},
			},
			[12] = {
				[4810] = {
					"red",
					"Bold Serpent's Eye",
					{[L["strength"]] = 320},
				},
				[4811] = {
					"red",
					"Brilliant Serpent's Eye",
					{[L["intellect"]] = 320},
				},
				[4812] = {
					"red",
					"Delicate Serpent's Eye",
					{[L["agility"]] = 320},
				},
				[4813] = {
					"red",
					"Flashing Serpent's Eye",
					{[L["parry"]] = 480},
				},
				[4814] = {
					"yellow",
					"Fractured Serpent's Eye",
					{[L["mastery"]] = 480},
				},
				[4815] = {
					"red",
					"Precise Serpent's Eye",
					{[L["expertise"]] = 480},
				},
				[4816] = {
					"yellow",
					"Quick Serpent's Eye",
					{[L["haste"]] = 480},
				},
				[4817] = {
					"blue",
					"Rigid Serpent's Eye",
					{[L["hit"]] = 480},
				},
				[4818] = {
					"yellow",
					"Smooth Serpent's Eye",
					{[L["critical strike"]] = 480},
				},
				[4819] = {
					"yellow",
					"Subtle Serpent's Eye",
					{[L["dodge"]] = 480},
				},
				[4820] = {
					"blue",
					"Solid Serpent's Eye",
					{[L["stamina"]] = 480},
				},
				[4821] = {
					"blue",
					"Sparkling Serpent's Eye",
					{[L["spirit"]] = 480},
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
					{[L["dodge"]] = 14},
				},
				[3647] = {
					"red",
					"Perfect Precise Bloodstone",
					{[L["expertise"]] = 14},
				},
				[3648] = {
					"red",
					"Perfect Flashing Bloodstone",
					{[L["parry"]] = 14},
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
					{[L["critical strike"]] = 14},
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
					{[L["pvp power"]] = 14},
				},
				[3657] = {
					"yellow",
					"Perfect Smooth Sun Crystal",
					{[L["critical strike"]] = 14},
				},
				[3658] = {
					"yellow",
					"Perfect Subtle Sun Crystal",
					{[L["dodge"]] = 14},
				},
				[3659] = {
					"yellow",
					"Perfect Quick Sun Crystal",
					{[L["haste"]] = 14},
				},
				[3660] = {
					"blue",
					"Perfect Rigid Chalcedony",
					{[L["hit"]] = 14},
				},
				[3661] = {
					"red",
					"Perfect Brilliant Bloodstone",
					{[L["intellect"]] = 14},
				},
				[3662] = {
					"yellow",
					"Perfect Mystic Sun Crystal",
					{[L["pvp resilience"]] = 14},
				},
				[3663] = {
					"purple",
					"Perfect Glinting Shadow Crystal",
					{[L["agility"]] = 7, [L["hit"]] = 7},
				},
				[3664] = {
					"purple",
					"Perfect Shifting Shadow Crystal",
					{[L["agility"]] = 7, [L["stamina"]] = 10},
				},
				[3665] = {
					"green",
					"Perfect Jagged Dark Jade",
					{[L["critical strike"]] = 7, [L["stamina"]] = 10},
				},
				[3666] = {
					"purple",
					"Perfect Glinting Shadow Crystal",
					{[L["agility"]] = 7, [L["hit"]] = 7},
				},
				[3667] = {
					"purple",
					"Perfect Shifting Shadow Crystal",
					{[L["agility"]] = 7, [L["stamina"]] = 10},
				},
				[3668] = {
					"green",
					"Perfect Regal Dark Jade",
					{[L["dodge"]] = 7, [L["stamina"]] = 10},
				},
				[3669] = {
					"purple",
					"Perfect Guardian's Shadow Crystal",
					{[L["expertise"]] = 7, [L["stamina"]] = 10},
				},
				[3670] = {
					"purple",
					"Perfect Defender's Shadow Crystal",
					{[L["parry"]] = 7, [L["stamina"]] = 10},
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
					{[L["intellect"]] = 7, [L["pvp power"]] = 7},
				},
				[3675] = {
					"purple",
					"Perfect Timeless Shadow Crystal",
					{[L["intellect"]] = 7, [L["stamina"]] = 10},
				},
				[3677] = {
					"orange",
					"Perfect Deft Huge Citrine",
					{[L["agility"]] = 7, [L["haste"]] = 7},
				},
				[3678] = {
					"orange",
					"Perfect Deft Huge Citrine",
					{[L["agility"]] = 7, [L["haste"]] = 7},
				},
				[3679] = {
					"purple",
					"Perfect Glinting Shadow Crystal",
					{[L["agility"]] = 7, [L["hit"]] = 7},
				},
				[3680] = {
					"orange",
					"Perfect Lucent Huge Citrine",
					{[L["agility"]] = 7, [L["pvp resilience"]] = 7},
				},
				[3681] = {
					"orange",
					"Perfect Inscribed Huge Citrine",
					{[L["critical strike"]] = 7, [L["strength"]] = 7},
				},
				[3682] = {
					"purple",
					"Perfect Etched Shadow Crystal",
					{[L["hit"]] = 7, [L["strength"]] = 7},
				},
				[3683] = {
					"orange",
					"Perfect Champion's Huge Citrine",
					{[L["dodge"]] = 7, [L["strength"]] = 7},
				},
				[3684] = {
					"orange",
					"Perfect Resplendent Huge Citrine",
					{[L["pvp resilience"]] = 7, [L["strength"]] = 7},
				},
				[3685] = {
					"orange",
					"Perfect Fierce Huge Citrine",
					{[L["haste"]] = 7, [L["strength"]] = 7},
				},
				[3686] = {
					"orange",
					"Perfect Deadly Huge Citrine",
					{[L["agility"]] = 7, [L["critical strike"]] = 7},
				},
				[3687] = {
					"purple",
					"Perfect Glinting Shadow Crystal",
					{[L["agility"]] = 7, [L["hit"]] = 7},
				},
				[3688] = {
					"orange",
					"Perfect Lucent Huge Citrine",
					{[L["agility"]] = 7, [L["pvp resilience"]] = 7},
				},
				[3689] = {
					"purple",
					"Perfect Purified Shadow Crystal",
					{[L["intellect"]] = 7, [L["spirit"]] = 7},
				},
				[3690] = {
					"orange",
					"Perfect Potent Huge Citrine",
					{[L["critical strike"]] = 7, [L["intellect"]] = 7},
				},
				[3691] = {
					"purple",
					"Perfect Veiled Shadow Crystal",
					{[L["hit"]] = 7, [L["intellect"]] = 7},
				},
				[3692] = {
					"orange",
					"Perfect Willful Huge Citrine",
					{[L["intellect"]] = 7, [L["pvp resilience"]] = 7},
				},
				[3693] = {
					"orange",
					"Perfect Reckless Huge Citrine",
					{[L["haste"]] = 7, [L["intellect"]] = 7},
				},
				[3694] = {
					"orange",
					"Perfect Stalwart Huge Citrine",
					{[L["dodge"]] = 7, [L["parry"]] = 7},
				},
				[3695] = {
					"orange",
					"Perfect Stalwart Huge Citrine",
					{[L["dodge"]] = 7, [L["parry"]] = 7},
				},
				[3696] = {
					"purple",
					"Perfect Accurate Shadow Crystal",
					{[L["expertise"]] = 7, [L["hit"]] = 7},
				},
				[3697] = {
					"orange",
					"Perfect Resolute Huge Citrine",
					{[L["dodge"]] = 7, [L["expertise"]] = 7},
				},
				[3698] = {
					"green",
					"Perfect Misty Dark Jade",
					{[L["critical strike"]] = 7, [L["spirit"]] = 7},
				},
				[3699] = {
					"green",
					"Perfect Jagged Dark Jade",
					{[L["critical strike"]] = 7, [L["stamina"]] = 10},
				},
				[3700] = {
					"green",
					"Perfect Regal Dark Jade",
					{[L["dodge"]] = 7, [L["stamina"]] = 10},
				},
				[3701] = {
					"green",
					"Perfect Energized Dark Jade",
					{[L["haste"]] = 7, [L["spirit"]] = 7},
				},
				[3702] = {
					"green",
					"Perfect Forceful Dark Jade",
					{[L["haste"]] = 7, [L["stamina"]] = 10},
				},
				[3703] = {
					"green",
					"Perfect Lightning Dark Jade",
					{[L["haste"]] = 7, [L["hit"]] = 7},
				},
				[3704] = {
					"green",
					"Perfect Nimble Dark Jade",
					{[L["dodge"]] = 7, [L["hit"]] = 7},
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
					{[L["pvp resilience"]] = 7, [L["spirit"]] = 7},
				},
				[3708] = {
					"green",
					"Perfect Steady Dark Jade",
					{[L["pvp resilience"]] = 7, [L["stamina"]] = 10},
				},
				[3709] = {
					"green",
					"Perfect Radiant Dark Jade",
					{[L["critical strike"]] = 7, [L["pvp power"]] = 7},
				},
				[3710] = {
					"green",
					"Perfect Misty Dark Jade",
					{[L["critical strike"]] = 7, [L["spirit"]] = 7},
				},
				[3711] = {
					"purple",
					"Perfect Purified Shadow Crystal",
					{[L["intellect"]] = 7, [L["spirit"]] = 7},
				},
				[3712] = {
					"green",
					"Perfect Lightning Dark Jade",
					{[L["haste"]] = 7, [L["hit"]] = 7},
				},
				[3713] = {
					"green",
					"Perfect Turbid Dark Jade",
					{[L["pvp resilience"]] = 7, [L["spirit"]] = 7},
				},
				[3714] = {
					"green",
					"Perfect Energized Dark Jade",
					{[L["haste"]] = 7, [L["spirit"]] = 7},
				},
				[3715] = {
					"green",
					"Perfect Radiant Dark Jade",
					{[L["critical strike"]] = 7, [L["pvp power"]] = 7},
				},
				[3716] = {
					"green",
					"Perfect Shattered Dark Jade",
					{[L["haste"]] = 7, [L["pvp power"]] = 7},
				},
				[3767] = {
					"orange",
					"Perfect Deadly Huge Citrine",
					{[L["agility"]] = 7, [L["critical strike"]] = 7},
				},
			},
			[8] = {
				[3887] = {
					"green",
					"Perfect Zen Jasper",
					{[L["mastery"]] = 18, [L["spirit"]] = 17},
				},
				[3888] = {
					"green",
					"Perfect Sensei's Jasper",
					{[L["hit"]] = 17, [L["mastery"]] = 18},
				},
				[3937] = {
					"purple",
					"Perfect Etched Nightstone",
					{[L["hit"]] = 17, [L["strength"]] = 18},
				},
				[3938] = {
					"purple",
					"Perfect Purified Nightstone",
					{[L["intellect"]] = 18, [L["spirit"]] = 17},
				},
				[3939] = {
					"purple",
					"Perfect Guardian's Nightstone",
					{[L["expertise"]] = 18, [L["stamina"]] = 26},
				},
				[3940] = {
					"purple",
					"Perfect Timeless Nightstone",
					{[L["intellect"]] = 18, [L["stamina"]] = 26},
				},
				[3941] = {
					"purple",
					"Perfect Defender's Nightstone",
					{[L["parry"]] = 18, [L["stamina"]] = 26},
				},
				[3942] = {
					"purple",
					"Perfect Shifting Nightstone",
					{[L["agility"]] = 18, [L["stamina"]] = 23},
				},
				[3943] = {
					"purple",
					"Perfect Sovereign Nightstone",
					{[L["stamina"]] = 26, [L["strength"]] = 18},
				},
				[3944] = {
					"yellow",
					"Perfect Fractured Alicite",
					{[L["mastery"]] = 35},
				},
				[3945] = {
					"yellow",
					"Perfect Quick Alicite",
					{[L["haste"]] = 35},
				},
				[3946] = {
					"yellow",
					"Perfect Mystic Alicite",
					{[L["pvp resilience"]] = 35},
				},
				[3947] = {
					"yellow",
					"Perfect Smooth Alicite",
					{[L["critical strike"]] = 35},
				},
				[3948] = {
					"yellow",
					"Perfect Subtle Alicite",
					{[L["dodge"]] = 35},
				},
				[3949] = {
					"blue",
					"Perfect Rigid Zephyrite",
					{[L["hit"]] = 35},
				},
				[3950] = {
					"blue",
					"Perfect Stormy Zephyrite",
					{[L["pvp power"]] = 35},
				},
				[3951] = {
					"blue",
					"Perfect Sparkling Zephyrite",
					{[L["spirit"]] = 35},
				},
				[3952] = {
					"blue",
					"Perfect Solid Zephyrite",
					{[L["stamina"]] = 53},
				},
				[3953] = {
					"red",
					"Perfect Precise Carnelian",
					{[L["expertise"]] = 35},
				},
				[3954] = {
					"red",
					"Perfect Brilliant Carnelian",
					{[L["intellect"]] = 35},
				},
				[3955] = {
					"red",
					"Perfect Flashing Carnelian",
					{[L["parry"]] = 35},
				},
				[3956] = {
					"red",
					"Perfect Delicate Carnelian",
					{[L["agility"]] = 35},
				},
				[3957] = {
					"red",
					"Perfect Bold Carnelian",
					{[L["strength"]] = 35},
				},
				[3958] = {
					"green",
					"Perfect Puissant Jasper",
					{[L["mastery"]] = 18, [L["stamina"]] = 26},
				},
				[3959] = {
					"green",
					"Perfect Lightning Jasper",
					{[L["haste"]] = 18, [L["hit"]] = 17},
				},
				[3960] = {
					"green",
					"Perfect Forceful Jasper",
					{[L["haste"]] = 18, [L["stamina"]] = 26},
				},
				[3961] = {
					"green",
					"Perfect Steady Jasper",
					{[L["pvp resilience"]] = 18, [L["stamina"]] = 26},
				},
				[3962] = {
					"green",
					"Perfect Piercing Jasper",
					{[L["critical strike"]] = 18, [L["hit"]] = 17},
				},
				[3963] = {
					"green",
					"Perfect Jagged Jasper",
					{[L["critical strike"]] = 18, [L["stamina"]] = 26},
				},
				[3964] = {
					"green",
					"Perfect Nimble Jasper",
					{[L["dodge"]] = 18, [L["hit"]] = 17},
				},
				[3965] = {
					"green",
					"Perfect Regal Jasper",
					{[L["dodge"]] = 18, [L["stamina"]] = 26},
				},
				[3966] = {
					"orange",
					"Perfect Keen Hessonite",
					{[L["expertise"]] = 18, [L["mastery"]] = 17},
				},
				[3967] = {
					"orange",
					"Perfect Artful Hessonite",
					{[L["intellect"]] = 18, [L["mastery"]] = 17},
				},
				[3968] = {
					"orange",
					"Perfect Fine Hessonite",
					{[L["mastery"]] = 17, [L["parry"]] = 18},
				},
				[3969] = {
					"orange",
					"Perfect Adept Hessonite",
					{[L["agility"]] = 18, [L["mastery"]] = 17},
				},
				[3970] = {
					"orange",
					"Perfect Skillful Hessonite",
					{[L["mastery"]] = 17, [L["strength"]] = 18},
				},
				[3971] = {
					"orange",
					"Perfect Reckless Hessonite",
					{[L["haste"]] = 17, [L["intellect"]] = 18},
				},
				[3972] = {
					"orange",
					"Perfect Deft Hessonite",
					{[L["agility"]] = 18, [L["haste"]] = 17},
				},
				[3973] = {
					"orange",
					"Perfect Fierce Hessonite",
					{[L["haste"]] = 17, [L["strength"]] = 18},
				},
				[3974] = {
					"orange",
					"Perfect Potent Hessonite",
					{[L["critical strike"]] = 17, [L["intellect"]] = 18},
				},
				[3975] = {
					"orange",
					"Perfect Deadly Hessonite",
					{[L["agility"]] = 18, [L["critical strike"]] = 17},
				},
				[3976] = {
					"orange",
					"Perfect Inscribed Hessonite",
					{[L["critical strike"]] = 17, [L["strength"]] = 18},
				},
				[3977] = {
					"orange",
					"Perfect Resolute Hessonite",
					{[L["dodge"]] = 17, [L["expertise"]] = 18},
				},
				[3978] = {
					"orange",
					"Perfect Polished Hessonite",
					{[L["agility"]] = 18, [L["dodge"]] = 17},
				},
				[3979] = {
					"purple",
					"Perfect Accurate Nightstone",
					{[L["expertise"]] = 18, [L["hit"]] = 17},
				},
				[3980] = {
					"purple",
					"Perfect Veiled Nightstone",
					{[L["hit"]] = 17, [L["intellect"]] = 18},
				},
				[3981] = {
					"purple",
					"Perfect Retaliating Nightstone",
					{[L["hit"]] = 17, [L["parry"]] = 18},
				},
				[3982] = {
					"purple",
					"Perfect Glinting Nightstone",
					{[L["agility"]] = 18, [L["hit"]] = 17},
				},
			},
			[11] = {
				[4520] = {
					"blue",
					"Perfect Rigid Lapis Lazuli",
					{[L["hit"]] = 320},
				},
				[4521] = {
					"blue",
					"Perfect Stormy Lapis Lazuli",
					{[L["pvp power"]] = 320},
				},
				[4522] = {
					"blue",
					"Perfect Sparkling Lapis Lazuli",
					{[L["spirit"]] = 320},
				},
				[4523] = {
					"blue",
					"Perfect Solid Lapis Lazuli",
					{[L["stamina"]] = 240},
				},
				[4524] = {
					"green",
					"Perfect Misty Alexandrite",
					{[L["critical strike"]] = 160, [L["spirit"]] = 160},
				},
				[4525] = {
					"green",
					"Perfect Piercing Alexandrite",
					{[L["critical strike"]] = 160, [L["hit"]] = 160},
				},
				[4526] = {
					"green",
					"Perfect Lightning Alexandrite",
					{[L["haste"]] = 160, [L["hit"]] = 160},
				},
				[4527] = {
					"green",
					"Perfect Sensei's Alexandrite",
					{[L["hit"]] = 160, [L["mastery"]] = 160},
				},
				[4528] = {
					"green",
					"Perfect Effulgent Alexandrite",
					{[L["mastery"]] = 160, [L["pvp power"]] = 160},
				},
				[4529] = {
					"green",
					"Perfect Zen Alexandrite",
					{[L["mastery"]] = 160, [L["spirit"]] = 160},
				},
				[4530] = {
					"green",
					"Perfect Balanced Alexandrite",
					{[L["hit"]] = 160, [L["pvp resilience"]] = 160},
				},
				[4531] = {
					"green",
					"Perfect Vivid Alexandrite",
					{[L["pvp power"]] = 160, [L["pvp resilience"]] = 160},
				},
				[4532] = {
					"green",
					"Perfect Turbid Alexandrite",
					{[L["pvp resilience"]] = 160, [L["spirit"]] = 160},
				},
				[4533] = {
					"green",
					"Perfect Radiant Alexandrite",
					{[L["critical strike"]] = 160, [L["pvp power"]] = 160},
				},
				[4535] = {
					"green",
					"Perfect Shattered Alexandrite",
					{[L["haste"]] = 160, [L["pvp power"]] = 160},
				},
				[4536] = {
					"green",
					"Perfect Energized Alexandrite",
					{[L["haste"]] = 160, [L["spirit"]] = 160},
				},
				[4537] = {
					"green",
					"Perfect Jagged Alexandrite",
					{[L["critical strike"]] = 160, [L["stamina"]] = 120},
				},
				[4538] = {
					"green",
					"Perfect Regal Alexandrite",
					{[L["dodge"]] = 160, [L["stamina"]] = 120},
				},
				[4539] = {
					"green",
					"Perfect Forceful Alexandrite",
					{[L["haste"]] = 160, [L["stamina"]] = 120},
				},
				[4540] = {
					"green",
					"Perfect Nimble Alexandrite",
					{[L["hit"]] = 160, [L["stamina"]] = 120},
				},
				[4541] = {
					"green",
					"Perfect Puissant Alexandrite",
					{[L["mastery"]] = 160, [L["stamina"]] = 120},
				},
				[4542] = {
					"green",
					"Perfect Steady Alexandrite",
					{[L["pvp resilience"]] = 160, [L["stamina"]] = 120},
				},
				[4543] = {
					"orange",
					"Perfect Deadly Tiger Opal",
					{[L["agility"]] = 80, [L["critical strike"]] = 160},
				},
				[4544] = {
					"orange",
					"Perfect Crafty Tiger Opal",
					{[L["critical strike"]] = 160, [L["expertise"]] = 160},
				},
				[4545] = {
					"orange",
					"Perfect Potent Tiger Opal",
					{[L["critical strike"]] = 160, [L["intellect"]] = 80},
				},
				[4546] = {
					"orange",
					"Perfect Inscribed Tiger Opal",
					{[L["critical strike"]] = 160, [L["strength"]] = 80},
				},
				[4547] = {
					"orange",
					"Perfect Polished Tiger Opal",
					{[L["agility"]] = 80, [L["dodge"]] = 160},
				},
				[4548] = {
					"orange",
					"Perfect Resolute Tiger Opal",
					{[L["dodge"]] = 160, [L["expertise"]] = 160},
				},
				[4549] = {
					"orange",
					"Perfect Stalwart Tiger Opal",
					{[L["dodge"]] = 160, [L["parry"]] = 160},
				},
				[4550] = {
					"orange",
					"Perfect Champion's Tiger Opal",
					{[L["dodge"]] = 160, [L["strength"]] = 80},
				},
				[4551] = {
					"orange",
					"Perfect Deft Tiger Opal",
					{[L["agility"]] = 80, [L["haste"]] = 160},
				},
				[4552] = {
					"orange",
					"Perfect Wicked Tiger Opal",
					{[L["expertise"]] = 160, [L["haste"]] = 160},
				},
				[4553] = {
					"orange",
					"Perfect Reckless Tiger Opal",
					{[L["haste"]] = 160, [L["intellect"]] = 80},
				},
				[4554] = {
					"orange",
					"Perfect Fierce Tiger Opal",
					{[L["haste"]] = 160, [L["strength"]] = 80},
				},
				[4555] = {
					"orange",
					"Perfect Adept Tiger Opal",
					{[L["agility"]] = 80, [L["mastery"]] = 160},
				},
				[4556] = {
					"orange",
					"Perfect Keen Tiger Opal",
					{[L["expertise"]] = 160, [L["mastery"]] = 160},
				},
				[4557] = {
					"orange",
					"Perfect Artful Tiger Opal",
					{[L["intellect"]] = 80, [L["mastery"]] = 160},
				},
				[4558] = {
					"orange",
					"Perfect Fine Tiger Opal",
					{[L["mastery"]] = 160, [L["parry"]] = 160},
				},
				[4559] = {
					"orange",
					"Perfect Skillful Tiger Opal",
					{[L["mastery"]] = 160, [L["strength"]] = 80},
				},
				[4560] = {
					"orange",
					"Perfect Lucent Tiger Opal",
					{[L["agility"]] = 80, [L["pvp resilience"]] = 160},
				},
				[4561] = {
					"orange",
					"Perfect Tenuous Tiger Opal",
					{[L["expertise"]] = 160, [L["pvp resilience"]] = 160},
				},
				[4562] = {
					"orange",
					"Perfect Willful Tiger Opal",
					{[L["intellect"]] = 80, [L["pvp resilience"]] = 160},
				},
				[4563] = {
					"orange",
					"Perfect Splendid Tiger Opal",
					{[L["parry"]] = 160, [L["pvp resilience"]] = 160},
				},
				[4564] = {
					"orange",
					"Perfect Resplendent Tiger Opal",
					{[L["pvp resilience"]] = 160, [L["strength"]] = 80},
				},
				[4565] = {
					"purple",
					"Perfect Glinting Roguestone",
					{[L["agility"]] = 80, [L["hit"]] = 160},
				},
				[4566] = {
					"purple",
					"Perfect Accurate Roguestone",
					{[L["expertise"]] = 160, [L["hit"]] = 160},
				},
				[4567] = {
					"purple",
					"Perfect Veiled Roguestone",
					{[L["hit"]] = 160, [L["intellect"]] = 80},
				},
				[4568] = {
					"purple",
					"Perfect Retaliating Roguestone",
					{[L["hit"]] = 160, [L["parry"]] = 160},
				},
				[4569] = {
					"purple",
					"Perfect Etched Roguestone",
					{[L["hit"]] = 160, [L["strength"]] = 80},
				},
				[4570] = {
					"purple",
					"Perfect Mysterious Roguestone",
					{[L["intellect"]] = 80, [L["pvp power"]] = 160},
				},
				[4571] = {
					"purple",
					"Perfect Purified Roguestone",
					{[L["intellect"]] = 80, [L["spirit"]] = 160},
				},
				[4572] = {
					"purple",
					"Perfect Shifting Roguestone",
					{[L["agility"]] = 80, [L["stamina"]] = 120},
				},
				[4573] = {
					"purple",
					"Perfect Guardian's Roguestone",
					{[L["expertise"]] = 160, [L["stamina"]] = 120},
				},
				[4574] = {
					"purple",
					"Perfect Timeless Roguestone",
					{[L["intellect"]] = 80, [L["stamina"]] = 120},
				},
				[4575] = {
					"purple",
					"Perfect Defender's Roguestone",
					{[L["parry"]] = 160, [L["stamina"]] = 120},
				},
				[4576] = {
					"purple",
					"Perfect Sovereign Roguestone",
					{[L["stamina"]] = 120, [L["strength"]] = 80},
				},
				[4577] = {
					"red",
					"Perfect Delicate Pandarian Garnet",
					{[L["agility"]] = 160},
				},
				[4578] = {
					"red",
					"Perfect Precise Pandarian Garnet",
					{[L["expertise"]] = 320},
				},
				[4579] = {
					"red",
					"Perfect Brilliant Pandarian Garnet",
					{[L["intellect"]] = 160},
				},
				[4580] = {
					"red",
					"Perfect Flashing Pandarian Garnet",
					{[L["parry"]] = 320},
				},
				[4581] = {
					"red",
					"Perfect Bold Pandarian Garnet",
					{[L["strength"]] = 160},
				},
				[4582] = {
					"yellow",
					"Perfect Smooth Sunstone",
					{[L["critical strike"]] = 320},
				},
				[4583] = {
					"yellow",
					"Perfect Subtle Sunstone",
					{[L["dodge"]] = 320},
				},
				[4584] = {
					"yellow",
					"Perfect Quick Sunstone",
					{[L["haste"]] = 320},
				},
				[4585] = {
					"yellow",
					"Perfect Fractured Sunstone",
					{[L["mastery"]] = 320},
				},
				[4586] = {
					"yellow",
					"Perfect Mystic Sunstone",
					{[L["pvp resilience"]] = 320},
				},
				[4986] = {
					"purple",
					"Perfect Tense Roguestone",
					{[L["pvp power"]] = 160, [L["strength"]] = 80},
				},
				[4989] = {
					"purple",
					"Perfect Assassin's Roguestone",
					{[L["agility"]] = 80, [L["pvp power"]] = 160},
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
					{[L["critical strike"]] = 10},
				},
				[2914] = {
					"yellow",
					"Smooth Ornate Dawnstone",
					{[L["critical strike"]] = 10},
				},
				[2916] = {
					"orange",
					"Potent Ornate Topaz",
					{[L["critical strike"]] = 5, [L["intellect"]] = 5},
				},
				[2945] = {
					"red",
					"Delicate Ornate Ruby",
					{[L["agility"]] = 10},
				},
				[2946] = {
					"orange",
					"Deadly Ornate Topaz",
					{[L["agility"]] = 5, [L["critical strike"]] = 5},
				},
				[3335] = {
					"red",
					"Delicate Ornate Ruby",
					{[L["agility"]] = 10},
				},
				[3336] = {
					"yellow",
					"Smooth Ornate Dawnstone",
					{[L["critical strike"]] = 10},
				},
				[3337] = {
					"orange",
					"Deadly Ornate Topaz",
					{[L["agility"]] = 5, [L["critical strike"]] = 5},
				},
				[3338] = {
					"orange",
					"Potent Ornate Topaz",
					{[L["critical strike"]] = 5, [L["intellect"]] = 5},
				},
				[3339] = {
					"red",
					"Brilliant Ornate Ruby",
					{[L["intellect"]] = 10},
				},
				[3340] = {
					"yellow",
					"Smooth Ornate Dawnstone",
					{[L["critical strike"]] = 10},
				},
			},
			[6] = {
				[3798] = {
					"meta",
					"Swift Starflare Diamond",
					{[L["critical strike"]] = 17, [L["minor run speed"]] = 1},
				},
				[3799] = {
					"meta",
					"Tireless Starflare Diamond",
					{[L["intellect"]] = 17, [L["minor run speed"]] = 1},
				},
				[3800] = {
					"meta",
					"Impassive Starflare Diamond",
					{[L["critical strike"]] = 17, [L["fear duration reduction (percent)"]] = 10},
				},
				[3801] = {
					"meta",
					"Enigmatic Starflare Diamond",
					{[L["critical strike"]] = 17, [L["snare/root duration reduction (percent)"]] = 10},
				},
				[3802] = {
					"meta",
					"Forlorn Starflare Diamond",
					{[L["intellect"]] = 17, [L["silence duration reduction (percent)"]] = 10},
				},
				[3803] = {
					"meta",
					"Persistent Earthshatter Diamond",
					{[L["critical strike"]] = 17, [L["snare/root duration reduction (percent)"]] = 10},
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
					{[L["critical strike"]] = 4, [L["stamina"]] = 3},
				},
				[2899] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike"]] = 4, [L["stamina"]] = 3},
				},
				[2918] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike"]] = 4, [L["stamina"]] = 3},
				},
				[2921] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike"]] = 4, [L["stamina"]] = 3},
				},
				[2923] = {
					"green",
					"Jagged Deep Peridot",
					{[L["critical strike"]] = 4, [L["stamina"]] = 3},
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
					{[L["critical strike"]] = 10, [L["minor run speed"]] = 1},
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
					{[L["pvp resilience"]] = 10},
				},
			},
			[7] = {
				[3792] = {
					"yellow",
					"Kharmaa's Grace",
					{[L["pvp resilience"]] = 20},
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
					{[L["haste"]] = 4, [L["intellect"]] = 5},
				},
				[3047] = {
					"green",
					"Jagged Chrysoprase",
					{[L["critical strike"]] = 5, [L["stamina"]] = 6},
				},
				[3048] = {
					"purple",
					"Shifting Tanzanite",
					{[L["agility"]] = 5, [L["stamina"]] = 6},
				},
				[3049] = {
					"green",
					"Misty Chrysoprase",
					{[L["critical strike"]] = 5, [L["spirit"]] = 4},
				},
				[3050] = {
					"orange",
					"Reckless Fire Opal",
					{[L["haste"]] = 4, [L["intellect"]] = 5},
				},
				[3051] = {
					"purple",
					"Timeless Tanzanite",
					{[L["intellect"]] = 5, [L["stamina"]] = 6},
				},
				[3052] = {
					"purple",
					"Glinting Tanzanite",
					{[L["agility"]] = 5, [L["hit"]] = 4},
				},
				[3053] = {
					"orange",
					"Stalwart Fire Opal",
					{[L["dodge"]] = 4, [L["parry"]] = 5},
				},
				[3054] = {
					"purple",
					"Timeless Tanzanite",
					{[L["intellect"]] = 5, [L["stamina"]] = 6},
				},
				[3055] = {
					"purple",
					"Glinting Tanzanite",
					{[L["agility"]] = 5, [L["hit"]] = 4},
				},
				[3056] = {
					"orange",
					"Stalwart Fire Opal",
					{[L["dodge"]] = 4, [L["parry"]] = 5},
				},
				[3057] = {
					"purple",
					"Etched Tanzanite",
					{[L["hit"]] = 4, [L["strength"]] = 5},
				},
				[3058] = {
					"green",
					"Misty Chrysoprase",
					{[L["critical strike"]] = 5, [L["spirit"]] = 4},
				},
				[3060] = {
					"green",
					"Regal Chrysoprase",
					{[L["dodge"]] = 5, [L["stamina"]] = 6},
				},
				[3061] = {
					"purple",
					"Veiled Tanzanite",
					{[L["hit"]] = 4, [L["intellect"]] = 5},
				},
				[3062] = {
					"green",
					"Jagged Chrysoprase",
					{[L["critical strike"]] = 5, [L["stamina"]] = 6},
				},
				[3063] = {
					"purple",
					"Defender's Tanzanite",
					{[L["parry"]] = 5, [L["stamina"]] = 6},
				},
				[3064] = {
					"purple",
					"Purified Tanzanite",
					{[L["intellect"]] = 5, [L["spirit"]] = 5},
				},
				[3066] = {
					"purple",
					"Mysterious Tanzanite",
					{[L["intellect"]] = 5, [L["pvp power"]] = 5},
				},
				[3067] = {
					"purple",
					"Shifting Tanzanite",
					{[L["agility"]] = 5, [L["stamina"]] = 6},
				},
				[3068] = {
					"green",
					"Nimble Chrysoprase",
					{[L["dodge"]] = 5, [L["hit"]] = 4},
				},
				[3069] = {
					"orange",
					"Willful Fire Opal",
					{[L["intellect"]] = 5, [L["pvp resilience"]] = 4},
				},
				[3070] = {
					"orange",
					"Deadly Fire Opal",
					{[L["agility"]] = 5, [L["critical strike"]] = 4},
				},
				[3071] = {
					"purple",
					"Timeless Tanzanite",
					{[L["intellect"]] = 5, [L["stamina"]] = 6},
				},
				[3072] = {
					"orange",
					"Inscribed Fire Opal",
					{[L["critical strike"]] = 4, [L["strength"]] = 5},
				},
				[3073] = {
					"orange",
					"Polished Fire Opal",
					{[L["agility"]] = 4, [L["dodge"]] = 5},
				},
				[3074] = {
					"purple",
					"Purified Tanzanite",
					{[L["intellect"]] = 5, [L["spirit"]] = 4},
				},
				[3075] = {
					"orange",
					"Champion's Fire Opal",
					{[L["dodge"]] = 4, [L["strength"]] = 5},
				},
				[3076] = {
					"orange",
					"Potent Fire Opal",
					{[L["critical strike"]] = 4, [L["intellect"]] = 5},
				},
				[3077] = {
					"purple",
					"Purified Tanzanite",
					{[L["intellect"]] = 5, [L["spirit"]] = 4},
				},
				[3078] = {
					"green",
					"Regal Chrysoprase",
					{[L["dodge"]] = 5, [L["stamina"]] = 6},
				},
				[3079] = {
					"orange",
					"Lucent Fire Opal",
					{[L["agility"]] = 5, [L["pvp resilience"]] = 4},
				},
				[3080] = {
					"green",
					"Steady Chrysoprase",
					{[L["pvp resilience"]] = 5, [L["stamina"]] = 6},
				},
				[3081] = {
					"orange",
					"Potent Fire Opal",
					{[L["critical strike"]] = 4, [L["intellect"]] = 5},
				},
				[3082] = {
					"green",
					"Regal Chrysoprase",
					{[L["dodge"]] = 5, [L["stamina"]] = 6},
				},
				[3083] = {
					"purple",
					"Purified Tanzanite",
					{[L["intellect"]] = 5, [L["spirit"]] = 4},
				},
				[3084] = {
					"green",
					"Steady Chrysoprase",
					{[L["pvp resilience"]] = 5, [L["stamina"]] = 6},
				},
				[3085] = {
					"green",
					"Jagged Chrysoprase",
					{[L["critical strike"]] = 5, [L["stamina"]] = 6},
				},
				[3086] = {
					"purple",
					"Purified Tanzanite",
					{[L["intellect"]] = 5, [L["spirit"]] = 4},
				},
				[3087] = {
					"orange",
					"Resplendent Fire Opal",
					{[L["pvp resilience"]] = 4, [L["strength"]] = 5},
				},
				[3088] = {
					"green",
					"Nimble Chrysoprase",
					{[L["dodge"]] = 4, [L["hit"]] = 5},
				},
				[3089] = {
					"green",
					"Lightning Chrysoprase",
					{[L["haste"]] = 4, [L["hit"]] = 5},
				},
				[3090] = {
					"orange",
					"Splendid Fire Opal",
					{[L["parry"]] = 5, [L["pvp resilience"]] = 4},
				},
				[3091] = {
					"green",
					"Radiant Chrysoprase",
					{[L["critical strike"]] = 5, [L["pvp power"]] = 5},
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
					{[L["hit"]] = 20},
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
					{[L["critical strike"]] = 12, [L["stun resist chance (percent)"]] = 5},
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
					"Shifting Amethyst",
					{[L["agility"]] = 5, [L["stamina"]] = 6},
				},
				[3157] = {
					"purple",
					"Timeless Amethyst",
					{[L["intellect"]] = 4, [L["stamina"]] = 6},
				},
				[3158] = {
					"purple",
					"Purified Amethyst",
					{[L["intellect"]] = 5, [L["spirit"]] = 4},
				},
				[3159] = {
					"orange",
					"Deadly Citrine",
					{[L["agility"]] = 5, [L["critical strike"]] = 4},
				},
				[3160] = {
					"orange",
					"Reckless Citrine",
					{[L["haste"]] = 4, [L["intellect"]] = 5},
				},
				[3161] = {
					"green",
					"Jagged Mossjewel",
					{[L["critical strike"]] = 4, [L["stamina"]] = 4},
				},
			},
			[4] = {
				[3262] = {
					"blue",
					"Charmed Amani Jewel",
					{[L["stamina"]] = 15},
				},
			},
			[14] = {
				[4996] = {
					"hydraulic",
					"Crystallized Dread",
					{[L["agility"]] = 500},
				},
				[4997] = {
					"hydraulic",
					"Crystallized Terror",
					{[L["strength"]] = 500},
				},
				[4998] = {
					"hydraulic",
					"Crystallized Horror",
					{[L["intellect"]] = 500},
				},
			},
		},
	},
}

local GemQualities = {}

local ilvls = {}

for gemSource, gems in pairs(ww_gems) do
	for gemType, gems in pairs(gems) do
		for gemQuality, gems in pairs(gems) do
			for gemId, gemInfo in pairs(gems) do
				GemQualities[gemId] = {
					source = gemSource,
					type = gemType,
					quality = gemQuality,
					info = gemInfo,
					minIlvl = gemQuality > 7 and 285 or 0,
				}
				ilvls[GemQualities[gemId].minIlvl] = true
			end
		end
	end
end

ww_gemMinIlvls = {}

for ilvl in pairs(ilvls) do
	table.insert(ww_gemMinIlvls, ilvl)
end
table.sort(ww_gemMinIlvls)

function WeightsWatcher.GemInfo(gemId)
	if type(gemId) == "string" then
		gemId = tonumber(gemId)
	end
	return GemQualities[gemId]
end
