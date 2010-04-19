if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

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

GemIds = {
	["Vendor"] = {
		["Normal"] = {
			[1] = {
				[2956] = {
					"red",
					"Bold Tourmaline",
					{["strength"] = 4},
				},
				[2957] = {
					"red",
					"Delicate Tourmaline",
					{["agility"] = 4},
				},
				[2958] = {
					"red",
					"Teardrop Tourmaline",
					{["spell power"] = 5},
				},
				[2959] = {
					"red",
					"Runed Tourmaline",
					{["spell power"] = 5},
				},
				[2960] = {
					"red",
					"Bright Tourmaline",
					{["attack power"] = 8},
				},
				[2961] = {
					"blue",
					"Solid Zircon",
					{["stamina"] = 6},
				},
				[2962] = {
					"blue",
					"Sparkling Zircon",
					{["spirit"] = 4},
				},
				[2963] = {
					"blue",
					"Lustrous Zircon",
					{["mp5"] = 2},
				},
				[2964] = {
					"yellow",
					"Brilliant Amber",
					{["intellect"] = 4},
				},
				[2965] = {
					"yellow",
					"Smooth Amber",
					{["critical strike rating"] = 4},
				},
				[2966] = {
					"yellow",
					"Rigid Amber",
					{["hit rating"] = 4},
				},
				[2967] = {
					"yellow",
					"Gleaming Amber",
					{["critical strike rating"] = 4},
				},
				[2968] = {
					"yellow",
					"Thick Amber",
					{["defense rating"] = 4},
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
					{["spell power"] = 7},
				},
				[2691] = {
					"red",
					"Bold Blood Garnet",
					{["strength"] = 6},
				},
				[2692] = {
					"red",
					"Runed Blood Garnet",
					{["spell power"] = 7},
				},
				[2693] = {
					"red",
					"Delicate Blood Garnet",
					{["agility"] = 6},
				},
				[2694] = {
					"yellow",
					"Brilliant Golden Draenite",
					{["intellect"] = 6},
				},
				[2695] = {
					"yellow",
					"Smooth Golden Draenite",
					{["critical strike rating"] = 6},
				},
				[2696] = {
					"yellow",
					"Thick Golden Draenite",
					{["defense rating"] = 6},
				},
				[2697] = {
					"yellow",
					"Rigid Golden Draenite",
					{["hit rating"] = 6},
				},
				[2698] = {
					"blue",
					"Solid Azure Moonstone",
					{["stamina"] = 9},
				},
				[2699] = {
					"blue",
					"Sparkling Azure Moonstone",
					{["spirit"] = 6},
				},
				[2700] = {
					"blue",
					"Stormy Azure Moonstone",
					{["spell penetration"] = 8},
				},
				[2701] = {
					"blue",
					"Lustrous Azure Moonstone",
					{["mp5"] = 3},
				},
				[2705] = {
					"orange",
					"Luminous Flame Spessarite",
					{["spell power"] = 4, ["intellect"] = 3},
				},
				[2706] = {
					"green",
					"Enduring Deep Peridot",
					{["defense rating"] = 3, ["stamina"] = 4},
				},
				[2707] = {
					"green",
					"Dazzling Deep Peridot",
					{["intellect"] = 3, ["mp5"] = 2},
				},
				[2708] = {
					"purple",
					"Glowing Shadow Draenite",
					{["spell power"] = 4, ["stamina"] = 4},
				},
				[2709] = {
					"purple",
					"Royal Shadow Draenite",
					{["spell power"] = 4, ["mp5"] = 2},
				},
				[2710] = {
					"purple",
					"Shifting Shadow Draenite",
					{["agility"] = 3, ["stamina"] = 4},
				},
				[2711] = {
					"purple",
					"Sovereign Shadow Draenite",
					{["strength"] = 3, ["stamina"] = 4},
				},
				[2752] = {
					"orange",
					"Inscribed Flame Spesarite",
					{["critical strike rating"] = 3, ["strength"] = 3},
				},
				[2755] = {
					"orange",
					"Glinting Flame Spessarite",
					{["hit rating"] = 3, ["agility"] = 3},
				},
				[2757] = {
					"green",
					"Jagged Deep Peridot",
					{["critical strike rating"] = 3, ["stamina"] = 4},
				},
				[2760] = {
					"orange",
					"Potent Flame Spessarite",
					{["critical strike rating"] = 3, ["spell power"] = 4},
				},
				[2762] = {
					"green",
					"Radiant Deep Peridot",
					{["critical strike rating"] = 3, ["spell penetration"] = 4},
				},
				[2942] = {
					"yellow",
					"Gleaming Golden Draenite",
					{["critical strike rating"] = 6},
				},
				[2971] = {
					"red",
					"Bright Blood Garnet",
					{["attack power"] = 12},
				},
				[3104] = {
					"yellow",
					"Great Golden Draenite",
					{["hit rating"] = 6},
				},
				[3106] = {
					"purple",
					"Balanced Shadow Draenite",
					{["attack power"] = 6, ["stamina"] = 4},
				},
				[3108] = {
					"purple",
					"Infused Shadow Draenite",
					{["attack power"] = 6, ["mp5"] = 1},
				},
				[3110] = {
					"orange",
					"Veiled Flame Spessarite",
					{["hit rating"] = 3, ["spell power"] = 4},
				},
				[3113] = {
					"orange",
					"Wicked Flame Spessarite",
					{["critical strike rating"] = 3, ["attack power"] = 6},
				},
				[3201] = {
					"purple",
					"Purified Jaggal Pearl",
					{["spell power"] = 4, ["spirit"] = 3},
				},
			},
			[3] = {
				[2725] = {
					"red",
					"Bold Living Ruby",
					{["strength"] = 8},
				},
				[2726] = {
					"red",
					"Delicate Living Ruby",
					{["agility"] = 8},
				},
				[2727] = {
					"red",
					"Teardrop Living Ruby",
					{["spell power"] = 9},
				},
				[2728] = {
					"red",
					"Runed Living Ruby",
					{["spell power"] = 9},
				},
				[2729] = {
					"red",
					"Bright Living Ruby",
					{["attack power"] = 16},
				},
				[2730] = {
					"red",
					"Subtle Living Ruby",
					{["dodge rating"] = 8},
				},
				[2731] = {
					"blue",
					"Solid Star of Elune",
					{["stamina"] = 12},
				},
				[2732] = {
					"blue",
					"Sparkling Star of Elune",
					{["spirit"] = 8},
				},
				[2733] = {
					"blue",
					"Lustrous Star of Elune",
					{["mp5"] = 4},
				},
				[2734] = {
					"yellow",
					"Brilliant Dawnstone",
					{["intellect"] = 8},
				},
				[2735] = {
					"yellow",
					"Smooth Dawnstone",
					{["critical strike rating"] = 8},
				},
				[2736] = {
					"yellow",
					"Gleaming Dawnstone",
					{["critical strike rating"] = 8},
				},
				[2737] = {
					"yellow",
					"Thick Dawnstone",
					{["defense rating"] = 8},
				},
				[2738] = {
					"purple",
					"Sovereign Nightseye",
					{["strength"] = 4, ["stamina"] = 6},
				},
				[2739] = {
					"purple",
					"Shifting Nightseye",
					{["agility"] = 4, ["stamina"] = 6},
				},
				[2740] = {
					"purple",
					"Glowing Nightseye",
					{["spell power"] = 5, ["stamina"] = 6},
				},
				[2741] = {
					"purple",
					"Royal Nightseye",
					{["spell power"] = 5, ["mp5"] = 2},
				},
				[2742] = {
					"orange",
					"Luminous Noble Topaz",
					{["spell power"] = 5, ["intellect"] = 4},
				},
				[2743] = {
					"green",
					"Enduring Talasite",
					{["defense rating"] = 4, ["stamina"] = 6},
				},
				[2744] = {
					"green",
					"Dazzling Talasite",
					{["intellect"] = 4, ["mp5"] = 2},
				},
				[2753] = {
					"orange",
					"Inscribed Noble Topaz",
					{["critical strike rating"] = 4, ["strength"] = 4},
				},
				[2754] = {
					"red",
					"Flashing Living Ruby",
					{["parry rating"] = 8},
				},
				[2756] = {
					"orange",
					"Glinting Noble Topaz",
					{["hit rating"] = 4, ["agility"] = 4},
				},
				[2758] = {
					"green",
					"Jagged Talasite",
					{["critical strike rating"] = 4, ["stamina"] = 6},
				},
				[2759] = {
					"yellow",
					"Mystic Dawnstone",
					{["resilience rating"] = 8},
				},
				[2761] = {
					"orange",
					"Potent Noble Topaz",
					{["critical strike rating"] = 4, ["spell power"] = 5},
				},
				[2763] = {
					"green",
					"Radiant Talasite",
					{["critical strike rating"] = 4, ["spell penetration"] = 5},
				},
				[2764] = {
					"yellow",
					"Great Dawnstone",
					{["hit rating"] = 8},
				},
				[2765] = {
					"blue",
					"Stormy Star of Elune",
					{["spell penetration"] = 10},
				},
				[2827] = {
					"meta",
					"Destructive Skyfire Diamond",
					{["critical strike rating"] = 14, ["spell reflect (percent)"] = 1},
				},
				[2828] = {
					"meta",
					"Mystical Skyfire Diamond",
					{["chance to increase spell haste"] = 1},
				},
				[2829] = {
					"meta",
					"Swift Skyfire Diamond",
					{["attack power"] = 24, ["minor run speed"] = 1},
				},
				[2830] = {
					"meta",
					"Egnimatic Skyfire Diamond",
					{["critical strike rating"] = 12, ["snare/root duration reduction (percent)"] = 10},
				},
				[2831] = {
					"meta",
					"Powerful Earthstorm Diamond",
					{["stamina"] = 18, ["stun duration reduction (percent)"] = 15},
				},
				[2832] = {
					"meta",
					"Bracing Earthstorm Diamond",
					{["spell power"] = 14, ["threat reduction (percent)"] = 2},
				},
				[2833] = {
					"meta",
					"Tenacious Earthstorm Diamond",
					{["defense rating"] = 12, ["chance to restore health on hit"] = 1},
				},
				[2834] = {
					"meta",
					"Brutal Earthstorm Diamond",
					{["melee damage"] = 3, ["chance to stun target"] = 1},
				},
				[2835] = {
					"meta",
					"Insightful Earthstorm Diamond",
					{["intellect"] = 12, ["chance to restore mana on spellcast"] = 1},
				},
				[2947] = {
					"Prismatic",
					"Prismatic Sphere",
					{["all resistances"] = 3},
				},
				[3105] = {
					"yellow",
					"Rigid Dawnstone",
					{["hit rating"] = 8},
				},
				[3107] = {
					"purple",
					"Balanced Nightseye",
					{["attack power"] = 8, ["stamina"] = 6},
				},
				[3109] = {
					"purple",
					"Infused Nightseye",
					{["attack power"] = 8, ["mp5"] = 2},
				},
				[3111] = {
					"orange",
					"Veiled Noble Topaz",
					{["hit rating"] = 4, ["spell power"] = 5},
				},
				[3112] = {
					"orange",
					"Wicked Noble Topaz",
					{["critical strike rating"] = 4, ["attack power"] = 8},
				},
				[3154] = {
					"meta",
					"Relentless Earthstorm Diamond",
					{["agility"] = 12, ["critical damage (percent)"] = 3},
				},
				[3155] = {
					"meta",
					"Thundering Skyfire Diamond",
					{["chance to increase physical haste"] = 1},
				},
				[3202] = {
					"purple",
					"Purified Shadow Pearl",
					{["spell power"] = 5, ["spirit"] = 4},
				},
				[3226] = {
					"green",
					"Steady Talasite",
					{["resilience rating"] = 4, ["stamina"] = 6},
				},
				[3261] = {
					"meta",
					"Chaotic Skyfire Diamond",
					{["critical strike rating"] = 12, ["critical damage (percent)"] = 3},
				},
				[3270] = {
					"yellow",
					"Quick Dawnstone",
					{["haste rating"] = 8},
				},
				[3271] = {
					"orange",
					"Reckless Noble Topaz",
					{["haste rating"] = 4, ["spell power"] = 5},
				},
				[3272] = {
					"green",
					"Foreceful Talasite",
					{["haste rating"] = 4, ["stamina"] = 6},
				},
				[3274] = {
					"meta",
					"Eternal Earthstorm Diamond",
					{["defense rating"] = 12, ["block value (percent)"] = 5},
				},
				[3275] = {
					"meta",
					"Ember Skyfire Diamond",
					{["spell power"] = 14, ["intellect (percent)"] = 2},
				},
				[3280] = {
					"purple",
					"Regal Nightseye",
					{["dodge rating"] = 4, ["stamina"] = 6},
				},
			},
			[4] = {
				[2948] = {
					"Prismatic",
					"Void Sphere",
					{["all resistances"] = 4},
				},
				[3115] = {
					"red",
					"Bold Crimson Spinel",
					{["strength"] = 10},
				},
				[3116] = {
					"red",
					"Delicate Crimson Spinel",
					{["agility"] = 10},
				},
				[3117] = {
					"red",
					"Teardrop Crimson Spinel",
					{["spell power"] = 12},
				},
				[3118] = {
					"red",
					"Runed Crimson Spinel",
					{["spell power"] = 12},
				},
				[3119] = {
					"red",
					"Bright Crimson Spinel",
					{["attack power"] = 20},
				},
				[3120] = {
					"red",
					"Subtle Crimson Spinel",
					{["dodge rating"] = 10},
				},
				[3121] = {
					"red",
					"Flashing Crimson Spinel",
					{["parry rating"] = 10},
				},
				[3122] = {
					"blue",
					"Solid Empyrean Sapphire",
					{["stamina"] = 15},
				},
				[3123] = {
					"blue",
					"Sparkling Empyrean Sapphire",
					{["spirit"] = 10},
				},
				[3124] = {
					"blue",
					"Lustrous Empyrean Sapphire",
					{["mp5"] = 5},
				},
				[3125] = {
					"blue",
					"Stormy Empyrean Sapphire",
					{["spell penetration"] = 13},
				},
				[3126] = {
					"yellow",
					"Brilliant Lionseye",
					{["intellect"] = 10},
				},
				[3127] = {
					"yellow",
					"Smooth Lionseye",
					{["critical strike rating"] = 10},
				},
				[3128] = {
					"yellow",
					"Rigid Lionseye",
					{["hit rating"] = 10},
				},
				[3129] = {
					"yellow",
					"Gleaming Lionseye",
					{["critical strike rating"] = 10},
				},
				[3130] = {
					"yellow",
					"Thick Lionseye",
					{["defense rating"] = 10},
				},
				[3131] = {
					"yellow",
					"Mystic Lionseye",
					{["resilience rating"] = 10},
				},
				[3132] = {
					"yellow",
					"Great Lionseye",
					{["hit rating"] = 10},
				},
				[3133] = {
					"purple",
					"Sovereign Shadowsong Amethyst",
					{["strength"] = 5, ["stamina"] = 7},
				},
				[3134] = {
					"purple",
					"Shifting Shadowsong Amethyst",
					{["agility"] = 5, ["stamina"] = 7},
				},
				[3135] = {
					"purple",
					"Balanced Shadowsong Amethyst",
					{["attack power"] = 10, ["stamina"] = 7},
				},
				[3136] = {
					"purple",
					"Infused Shadowsong Amethyst",
					{["attack power"] = 10, ["mp5"] = 3},
				},
				[3137] = {
					"purple",
					"Glowing Shadowsong Amethyst",
					{["spell power"] = 6, ["stamina"] = 7},
				},
				[3138] = {
					"purple",
					"Royal Shadowsong Amethyst",
					{["spell power"] = 6, ["mp5"] = 3},
				},
				[3139] = {
					"orange",
					"Inscribed Pyrestone",
					{["critical strike rating"] = 5, ["strength"] = 5},
				},
				[3140] = {
					"orange",
					"Potent Pyrestone",
					{["critical strike rating"] = 5, ["spell power"] = 6},
				},
				[3141] = {
					"orange",
					"Luminous Pyrestone",
					{["spell power"] = 6, ["intellect"] = 5},
				},
				[3142] = {
					"orange",
					"Glinting Pyrestone",
					{["hit rating"] = 5, ["agility"] = 5},
				},
				[3143] = {
					"orange",
					"Shining Fire Opal",
					{["hit rating"] = 5, ["spell power"] = 6},
				},
				[3144] = {
					"orange",
					"Wicked Pyrestone",
					{["critical strike rating"] = 5, ["attack power"] = 10},
				},
				[3145] = {
					"green",
					"Enduring Seaspray Emerald",
					{["defense rating"] = 5, ["stamina"] = 7},
				},
				[3146] = {
					"green",
					"Radiant Seaspray Emerald",
					{["critical strike rating"] = 5, ["spell penetration"] = 6},
				},
				[3147] = {
					"green",
					"Dazzling Seaspray Emerald",
					{["intellect"] = 5, ["mp5"] = 3},
				},
				[3148] = {
					"green",
					"Jagged Seaspray Emerald",
					{["critical strike rating"] = 5, ["stamina"] = 7},
				},
				[3284] = {
					"green",
					"Steady Seaspray Emerald",
					{["resilience rating"] = 5, ["stamina"] = 7},
				},
				[3285] = {
					"green",
					"Forceful Seaspray Emerald",
					{["haste rating"] = 5, ["stamina"] = 7},
				},
				[3286] = {
					"orange",
					"Reckless Pyrestone",
					{["haste rating"] = 5, ["spell power"] = 6},
				},
				[3287] = {
					"yellow",
					"Quick Lionseye",
					{["haste rating"] = 10},
				},
				[3318] = {
					"purple",
					"Purified Shadowsong Amethyst",
					{["spell power"] = 6, ["spirit"] = 5},
				},
			},
			[5] = {
				[3371] = {
					"red",
					"Bold Bloodstone",
					{["strength"] = 12},
				},
				[3374] = {
					"red",
					"Delicate Bloodstone",
					{["agility"] = 12},
				},
				[3375] = {
					"red",
					"Bright Bloodstone",
					{["attack power"] = 24},
				},
				[3376] = {
					"red",
					"Subtle Bloodstone",
					{["dodge rating"] = 12},
				},
				[3377] = {
					"red",
					"Flashing Bloodstone",
					{["parry rating"] = 12},
				},
				[3378] = {
					"red",
					"Fractured Bloodstone",
					{["armor penetration rating"] = 12},
				},
				[3379] = {
					"red",
					"Precise Bloodstone",
					{["expertise rating"] = 12},
				},
				[3380] = {
					"red",
					"Runed Bloodstone",
					{["spell power"] = 14},
				},
				[3381] = {
					"yellow",
					"Brilliant Sun Crystal",
					{["intellect"] = 12},
				},
				[3382] = {
					"yellow",
					"Smooth Sun Crystal",
					{["critical strike rating"] = 12},
				},
				[3383] = {
					"yellow",
					"Rigid Sun Crystal",
					{["hit rating"] = 12},
				},
				[3384] = {
					"yellow",
					"Thick Sun Crystal",
					{["defense rating"] = 12},
				},
				[3385] = {
					"yellow",
					"Mystic Sun Crystal",
					{["resilience rating"] = 12},
				},
				[3386] = {
					"yellow",
					"Quick Sun Crystal",
					{["haste rating"] = 12},
				},
				[3387] = {
					"blue",
					"Solid Chalcedony",
					{["stamina"] = 18},
				},
				[3388] = {
					"blue",
					"Sparkling Chalcedony",
					{["spirit"] = 12},
				},
				[3389] = {
					"blue",
					"Lustrous Chalcedony",
					{["mp5"] = 6},
				},
				[3390] = {
					"blue",
					"Stormy Chalcedony",
					{["spell penetration"] = 15},
				},
				[3391] = {
					"purple",
					"Puissant Shadow Crystal",
					{["armor penetration rating"] = 6, ["stamina"] = 9},
				},
				[3392] = {
					"purple",
					"Sovereign Shadow Crystal",
					{["strength"] = 6, ["stamina"] = 9},
				},
				[3393] = {
					"purple",
					"Shifting Shadow Crystal",
					{["agility"] = 6, ["stamina"] = 9},
				},
				[3394] = {
					"purple",
					"Glowing Shadow Crystal",
					{["spell power"] = 7, ["stamina"] = 9},
				},
				[3395] = {
					"purple",
					"Balanced Shadow Crystal",
					{["attack power"] = 12, ["stamina"] = 9},
				},
				[3396] = {
					"purple",
					"Regal Shadow Crystal",
					{["dodge rating"] = 6, ["stamina"] = 9},
				},
				[3397] = {
					"purple",
					"Defender's Shadow Crystal",
					{["parry rating"] = 6, ["stamina"] = 9},
				},
				[3398] = {
					"purple",
					"Guardian's Shadow Crystal",
					{["expertise rating"] = 6, ["stamina"] = 9},
				},
				[3399] = {
					"purple",
					"Purified Shadow Crystal",
					{["spell power"] = 7, ["spirit"] = 6},
				},
				[3400] = {
					"purple",
					"Tenuous Shadow Crystal",
					{["agility"] = 6, ["mp5"] = 3},
				},
				[3401] = {
					"purple",
					"Royal Shadow Crystal",
					{["spell power"] = 7, ["mp5"] = 3},
				},
				[3402] = {
					"purple",
					"Infused Shadow Crystal",
					{["attack power"] = 12, ["mp5"] = 3},
				},
				[3403] = {
					"purple",
					"Mysterious Shadow Crystal",
					{["spell power"] = 7, ["spell penetration"] = 8},
				},
				[3404] = {
					"orange",
					"Luminous Huge Citrine",
					{["spell power"] = 7, ["intellect"] = 6},
				},
				[3405] = {
					"orange",
					"Inscribed Huge Citrine",
					{["strength"] = 6, ["critical strike rating"] = 6},
				},
				[3406] = {
					"orange",
					"Glinting Huge Citrine",
					{["agility"] = 6, ["hit rating"] = 6},
				},
				[3407] = {
					"orange",
					"Champion's Huge Citrine",
					{["strength"] = 6, ["defense rating"] = 6},
				},
				[3408] = {
					"orange",
					"Resplendent Huge Citrine",
					{["strength"] = 6, ["resilience rating"] = 6},
				},
				[3409] = {
					"orange",
					"Fierce Huge Citrine",
					{["strength"] = 6, ["haste rating"] = 6},
				},
				[3410] = {
					"orange",
					"Deadly Huge Ditrine",
					{["agility"] = 6, ["critical strike rating"] = 6},
				},
				[3411] = {
					"orange",
					"Etched Huge Citrine",
					{["strength"] = 6, ["hit rating"] = 6},
				},
				[3412] = {
					"orange",
					"Lucent Huge Citrine",
					{["agility"] = 6, ["resilience rating"] = 6},
				},
				[3413] = {
					"orange",
					"Deft Huge Citrine",
					{["agility"] = 6, ["haste rating"] = 6},
				},
				[3414] = {
					"orange",
					"Potent Huge Citrine",
					{["spell power"] = 7, ["critical strike rating"] = 6},
				},
				[3415] = {
					"orange",
					"Veiled Huge Citrine",
					{["spell power"] = 7, ["hit rating"] = 6},
				},
				[3416] = {
					"orange",
					"Durable Huge Citrine",
					{["spell power"] = 7, ["resilience rating"] = 6},
				},
				[3417] = {
					"orange",
					"Reckless Huge Citrine",
					{["spell power"] = 7, ["haste rating"] = 6},
				},
				[3418] = {
					"orange",
					"Swalwart Huge Citrine",
					{["dodge rating"] = 6, ["defense rating"] = 6},
				},
				[3419] = {
					"orange",
					"Glimmering Huge Citrine",
					{["parry rating"] = 6, ["defense rating"] = 6},
				},
				[3420] = {
					"orange",
					"Accurate Huge Citrine",
					{["expertise rating"] = 6, ["hit rating"] = 6},
				},
				[3421] = {
					"orange",
					"Resolute Huge Citrine",
					{["expertise rating"] = 6, ["defense rating"] = 6},
				},
				[3422] = {
					"orange",
					"Wicked Huge Citrine",
					{["attack power"] = 12, ["critical strike rating"] = 6},
				},
				[3423] = {
					"orange",
					"Pristine Huge Citrine",
					{["attack power"] = 12, ["hit rating"] = 6},
				},
				[3424] = {
					"orange",
					"Empowered Huge Citrine",
					{["attack power"] = 12, ["resilience rating"] = 6},
				},
				[3426] = {
					"orange",
					"Stark Huge Citrine",
					{["attack power"] = 12, ["haste rating"] = 6},
				},
				[3427] = {
					"green",
					"Timeless Dark Jade",
					{["intellect"] = 6, ["stamina"] = 9},
				},
				[3428] = {
					"green",
					"Jagged Dark Jade",
					{["critical strike rating"] = 6, ["stamina"] = 9},
				},
				[3429] = {
					"green",
					"Vivid Dark Jade",
					{["hit rating"] = 6, ["stamina"] = 9},
				},
				[3430] = {
					"green",
					"Enduring Dark Jade",
					{["defense rating"] = 6, ["stamina"] = 9},
				},
				[3431] = {
					"green",
					"Steady Dark Jade",
					{["resilience rating"] = 6, ["stamina"] = 9},
				},
				[3432] = {
					"green",
					"Forceful Dark Jade",
					{["haste rating"] = 6, ["stamina"] = 9},
				},
				[3433] = {
					"green",
					"Seer's Dark Jade",
					{["intellect"] = 6, ["spirit"] = 6},
				},
				[3434] = {
					"green",
					"Misty Dark Jade",
					{["critical strike rating"] = 6, ["spirit"] = 6},
				},
				[3435] = {
					"green",
					"Shining Dark Jade",
					{["hit rating"] = 6, ["spirit"] = 6},
				},
				[3436] = {
					"green",
					"Turbid Dark Jade",
					{["resilience rating"] = 6, ["spirit"] = 6},
				},
				[3437] = {
					"green",
					"Intricate Dark Jade",
					{["haste rating"] = 6, ["spirit"] = 6},
				},
				[3438] = {
					"green",
					"Dazzling Dark Jade",
					{["intellect"] = 6, ["mp5"] = 3},
				},
				[3439] = {
					"green",
					"Sundered Dark Jade",
					{["critical strike rating"] = 6, ["mp5"] = 3},
				},
				[3440] = {
					"green",
					"Lambent Dark Jade",
					{["hit rating"] = 6, ["mp5"] = 3},
				},
				[3441] = {
					"green",
					"Opaque Dark Jade",
					{["resilience rating"] = 6, ["mp5"] = 3},
				},
				[3442] = {
					"green",
					"Energized Dark Jade",
					{["haste rating"] = 6, ["mp5"] = 3},
				},
				[3443] = {
					"green",
					"Radiant Dark Jade",
					{["critical strike rating"] = 6, ["spell penetration"] = 8},
				},
				[3444] = {
					"green",
					"Tense Dark Jade",
					{["hit rating"] = 6, ["spell penetration"] = 8},
				},
				[3445] = {
					"green",
					"Shattered Dark Jade",
					{["haste rating"] = 6, ["spell penetration"] = 8},
				},
			},
			[6] = {
				[3446] = {
					"red",
					"Bold Scarlet Ruby",
					{["strength"] = 16},
				},
				[3447] = {
					"red",
					"Delicate Scarlet Ruby",
					{["agility"] = 16},
				},
				[3448] = {
					"red",
					"Runed Scarlet Ruby",
					{["spell power"] = 19},
				},
				[3449] = {
					"red",
					"Bright Scarlet Ruby",
					{["attack power"] = 32},
				},
				[3450] = {
					"red",
					"Subtle Scarlet Ruby",
					{["dodge rating"] = 16},
				},
				[3451] = {
					"red",
					"Flashing Scarlet Ruby",
					{["parry rating"] = 16},
				},
				[3452] = {
					"red",
					"Fractured Scarlet Ruby",
					{["armor penetration rating"] = 16},
				},
				[3453] = {
					"red",
					"Precise Scarlet Ruby",
					{["expertise rating"] = 16},
				},
				[3454] = {
					"blue",
					"Solid Sky Sapphire",
					{["stamina"] = 24},
				},
				[3455] = {
					"blue",
					"Sparkling Sky Sapphire",
					{["spirit"] = 16},
				},
				[3456] = {
					"blue",
					"Lustrous Sky Sapphire",
					{["mp5"] = 8},
				},
				[3457] = {
					"blue",
					"Stormy Sky Sapphire",
					{["spell penetration"] = 20},
				},
				[3458] = {
					"yellow",
					"Brilliant Autumn's Glow",
					{["intellect"] = 16},
				},
				[3459] = {
					"yellow",
					"Smooth Autumn's Glow",
					{["critical strike rating"] = 16},
				},
				[3460] = {
					"yellow",
					"Rigid Autumn's Glow",
					{["hit rating"] = 16},
				},
				[3461] = {
					"yellow",
					"Thick Autumn's Glow",
					{["defense rating"] = 16},
				},
				[3462] = {
					"yellow",
					"Mystic Autumn's Glow",
					{["resilience rating"] = 16},
				},
				[3463] = {
					"yellow",
					"Quick Autumn's Glow",
					{["haste rating"] = 16},
				},
				[3464] = {
					"purple",
					"Sovereign Twilight Opal",
					{["strength"] = 8, ["stamina"] = 12},
				},
				[3465] = {
					"purple",
					"Shifting Twilight Opal",
					{["agility"] = 8, ["stamina"] = 12},
				},
				[3466] = {
					"purple",
					"Glowing Twilight Opal",
					{["spell power"] = 9, ["stamina"] = 12},
				},
				[3467] = {
					"purple",
					"Balanced Twilight Opal",
					{["attack power"] = 16, ["stamina"] = 12},
				},
				[3468] = {
					"purple",
					"Regal Twilight Opal",
					{["dodge rating"] = 8, ["stamina"] = 12},
				},
				[3469] = {
					"purple",
					"Defender's Twilight Opal",
					{["parry rating"] = 8, ["stamina"] = 12},
				},
				[3470] = {
					"purple",
					"Puissant Twilight Opal",
					{["armor penetration rating"] = 8, ["stamina"] = 12},
				},
				[3471] = {
					"purple",
					"Guardian's Twilight Opal",
					{["expertise rating"] = 8, ["stamina"] = 12},
				},
				[3472] = {
					"purple",
					"Purified Twilight Opal",
					{["spell power"] = 9, ["spirit"] = 8},
				},
				[3473] = {
					"purple",
					"Royal Twilight Opal",
					{["spell power"] = 9, ["mp5"] = 4},
				},
				[3474] = {
					"purple",
					"Tenuous Twilight Opal",
					{["agility"] = 8, ["mp5"] = 4},
				},
				[3475] = {
					"purple",
					"Infused Twilight Opal",
					{["attack power"] = 16, ["mp5"] = 4},
				},
				[3476] = {
					"purple",
					"Mysterious Twilight Opal",
					{["spell power"] = 9, ["spell penetration"] = 10},
				},
				[3477] = {
					"orange",
					"Inscribed Monarch Topaz",
					{["strength"] = 8, ["critical strike rating"] = 8},
				},
				[3478] = {
					"orange",
					"Etched Monarch Topaz",
					{["strength"] = 8, ["hit rating"] = 8},
				},
				[3479] = {
					"orange",
					"Champion's Monarch Topaz",
					{["strength"] = 8, ["defense rating"] = 8},
				},
				[3480] = {
					"orange",
					"Resplendent Monarch Topaz",
					{["strength"] = 8, ["resilience rating"] = 8},
				},
				[3481] = {
					"orange",
					"Fierce Monarch Topaz",
					{["strength"] = 8, ["haste rating"] = 8},
				},
				[3482] = {
					"orange",
					"Deadly Monarch Topaz",
					{["agility"] = 8, ["critical strike rating"] = 8},
				},
				[3483] = {
					"orange",
					"Glinting Monarch Topaz",
					{["agility"] = 8, ["hit rating"] = 8},
				},
				[3484] = {
					"orange",
					"Lucent Monarch Topaz",
					{["agility"] = 8, ["resilience rating"] = 8},
				},
				[3485] = {
					"orange",
					"Deft Monarch Topaz",
					{["agility"] = 8, ["haste rating"] = 8},
				},
				[3486] = {
					"orange",
					"Luminous Monarch Topaz",
					{["spell power"] = 9, ["intellect"] = 8},
				},
				[3487] = {
					"orange",
					"Potent Monarch Topaz",
					{["spell power"] = 9, ["critical strike rating"] = 8},
				},
				[3488] = {
					"orange",
					"Veiled Monarch Topaz",
					{["spell power"] = 9, ["hit rating"] = 8},
				},
				[3489] = {
					"orange",
					"Durable Monarch Topaz",
					{["spell power"] = 9, ["resilience rating"] = 8},
				},
				[3490] = {
					"orange",
					"Reckless Monarch Topaz",
					{["spell power"] = 9, ["haste rating"] = 8},
				},
				[3491] = {
					"orange",
					"Wicked Monarch Topaz",
					{["attack power"] = 16, ["critical strike rating"] = 8},
				},
				[3492] = {
					"orange",
					"Pristine Monarch Topaz",
					{["attack power"] = 16, ["hit rating"] = 8},
				},
				[3493] = {
					"orange",
					"Empowered Monarch Topaz",
					{["attack power"] = 16, ["resilience rating"] = 8},
				},
				[3494] = {
					"orange",
					"Stark Monarch Topaz",
					{["attack power"] = 16, ["haste rating"] = 8},
				},
				[3495] = {
					"orange",
					"Stalwart Monarch Topaz",
					{["dodge rating"] = 8, ["defense rating"] = 8},
				},
				[3496] = {
					"orange",
					"Glimmering Monarch Topaz",
					{["parry rating"] = 8, ["defense rating"] = 8},
				},
				[3497] = {
					"orange",
					"Accurate Monarch Topaz",
					{["expertise rating"] = 8, ["hit rating"] = 8},
				},
				[3498] = {
					"orange",
					"Resolute Monarch Topaz",
					{["expertise rating"] = 8, ["defense rating"] = 8},
				},
				[3499] = {
					"green",
					"Timeless Forest Emerald",
					{["intellect"] = 8, ["stamina"] = 12},
				},
				[3500] = {
					"green",
					"Jagged Forest Emerald",
					{["critical strike rating"] = 8, ["stamina"] = 12},
				},
				[3501] = {
					"green",
					"Vivid Forest Emerald",
					{["hit rating"] = 8, ["stamina"] = 12},
				},
				[3502] = {
					"green",
					"Enduring Forest Emerald",
					{["defense rating"] = 8, ["stamina"] = 12},
				},
				[3503] = {
					"green",
					"Steady Forest Emerald",
					{["resilience rating"] = 8, ["stamina"] = 12},
				},
				[3504] = {
					"green",
					"Forceful Forest Emerald",
					{["haste rating"] = 8, ["stamina"] = 12},
				},
				[3505] = {
					"green",
					"Seer's Forest Emerald",
					{["intellect"] = 8, ["spirit"] = 8},
				},
				[3506] = {
					"green",
					"Misty Forest Emerald",
					{["critical strike rating"] = 8, ["spirit"] = 8},
				},
				[3507] = {
					"green",
					"Shining Forest Emerald",
					{["hit rating"] = 8, ["spirit"] = 8},
				},
				[3508] = {
					"green",
					"Turbid Forest Emerald",
					{["resilience rating"] = 8, ["spirit"] = 8},
				},
				[3509] = {
					"green",
					"Intricate Forest Emerald",
					{["haste rating"] = 8, ["spirit"] = 8},
				},
				[3510] = {
					"green",
					"Dazzling Forest Emerald",
					{["intellect"] = 8, ["mp5"] = 4},
				},
				[3511] = {
					"green",
					"Sundered Forest Emerald",
					{["critical strike rating"] = 8, ["mp5"] = 4},
				},
				[3512] = {
					"green",
					"Lambent Forest Emerald",
					{["hit rating"] = 8, ["mp5"] = 4},
				},
				[3513] = {
					"green",
					"Opaque Forest Emerald",
					{["resilience rating"] = 8, ["mp5"] = 4},
				},
				[3514] = {
					"green",
					"Energized Forest Emerald",
					{["haste rating"] = 8, ["mp5"] = 4},
				},
				[3515] = {
					"green",
					"Radiant Forest Emerald",
					{["critical strike rating"] = 8, ["spell penetration"] = 10},
				},
				[3516] = {
					"green",
					"Tense Forest Emerald",
					{["hit rating"] = 8, ["spell penetration"] = 10},
				},
				[3517] = {
					"green",
					"Shattered Forest Emerald",
					{["haste rating"] = 8, ["spell penetration"] = 10},
				},
				[3621] = {
					"meta",
					"Chaotic Skyflare Diamond",
					{["critical strike rating"] = 21, ["critical damage (percent)"] = 3},
				},
				[3622] = {
					"meta",
					"Destructive Skyflare Diamond",
					{["critical strike rating"] = 25, ["spell reflect (percent)"] = 1},
				},
				[3623] = {
					"meta",
					"Ember Skyflare Diamond",
					{["spell power"] = 25, ["intellect (percent)"] = 2},
				},
				[3624] = {
					"meta",
					"Egnimatic Skyflare Diamond",
					{["critical strike rating"] = 21, ["snare/root duration reduction (percent)"] = 10},
				},
				[3625] = {
					"meta",
					"Swift Skyflare Diamond",
					{["attack power"] = 42, ["minor run speed"] = 1},
				},
				[3626] = {
					"meta",
					"Bracing Earthsiege Diamond",
					{["spell power"] = 25, ["threat reduction (percent)"] = 2},
				},
				[3627] = {
					"meta",
					"Insightful Earthsiege Diamond",
					{["intellect"] = 21, ["chance to restore mana on spellcast"] = 1},
				},
				[3628] = {
					"meta",
					"Relentless Earthsiege Diamond",
					{["agility"] = 21, ["critical damage (percent)"] = 3},
				},
				[3631] = {
					"meta",
					"Eternal Earthsiege Diamond",
					{["defense rating"] = 21, ["block value (percent)"] = 5},
				},
				[3632] = {
					"meta",
					"Tireless Skyflare Diamond",
					{["spell power"] = 25, ["minor run speed"] = 1},
				},
				[3633] = {
					"meta",
					"Revitalizing Skyflare Diamond",
					{["mp5"] = 11, ["critical healing (percent)"] = 3},
				},
				[3634] = {
					"meta",
					"Effulgent Skyflare Diamond",
					{["stamina"] = 32, ["spell damage taken reduction (percent)"] = 2},
				},
				[3635] = {
					"meta",
					"Forlorn Skyflare Diamond",
					{["spell power"] = 25, ["silence duration reduction (percent)"] = 10},
				},
				[3636] = {
					"meta",
					"Impassive Skyflare Diamond",
					{["critical strike rating"] = 21, ["fear duration reduction (percent)"] = 10},
				},
				[3637] = {
					"meta",
					"Austere Earthsiege Diamond",
					{["stamina"] = 32, ["armor from items (percent)"] = 2},
				},
				[3638] = {
					"meta",
					"Persistent Earthsiege Diamond",
					{["attack power"] = 42, ["stun duration reduction (percent)"] = 10},
				},
				[3639] = {
					"meta",
					"Trenchant Earthsiege Diamond",
					{["spell power"] = 25, ["stun duration reduction (percent)"] = 10},
				},
				[3640] = {
					"meta",
					"Invigorating Earthsiege Diamond",
					{["attack power"] = 42, ["sometimes heal on your crits"] = 1},
				},
				[3641] = {
					"meta",
					"Beaming Earthsiege Diamond",
					{["critical strike rating"] = 21, ["mana (percent)"] = 2},
				},
				[3642] = {
					"meta",
					"Powerful Earthsiege Diamond",
					{["stamina"] = 32, ["stun duration reduction (percent)"] = 10},
				},
				[3643] = {
					"meta",
					"Thundering Skyflare Diamond",
					{["chance to increase physical haste"] = 1},
				},
			},
			[7] = {
				[3518] = {
					"red",
					"Bold Cardinal Ruby",
					{["strength"] = 20},
				},
				[3519] = {
					"red",
					"Delicate Cardinal Ruby",
					{["agility"] = 20},
				},
				[3520] = {
					"red",
					"Runed Cardinal Ruby",
					{["spell power"] = 23},
				},
				[3521] = {
					"red",
					"Bright Cardinal Ruby",
					{["attack power"] = 40},
				},
				[3522] = {
					"red",
					"Subtle Cardinal Ruby",
					{["dodge rating"] = 20},
				},
				[3523] = {
					"red",
					"Flashing Cardinal Ruby",
					{["parry rating"] = 20},
				},
				[3524] = {
					"red",
					"Precise Cardinal Ruby",
					{["expertise rating"] = 20},
				},
				[3525] = {
					"red",
					"Fractured Cardinal Ruby",
					{["armor penetration rating"] = 20},
				},
				[3526] = {
					"yellow",
					"Brilliant King's Amber",
					{["intellect"] = 20},
				},
				[3527] = {
					"yellow",
					"Smooth King's Amber",
					{["critical strike rating"] = 20},
				},
				[3528] = {
					"yellow",
					"Rigid King's Amber",
					{["hit rating"] = 20},
				},
				[3529] = {
					"yellow",
					"Thick King's Amber",
					{["defense rating"] = 20},
				},
				[3530] = {
					"yellow",
					"Mystic King's Amber",
					{["resilience rating"] = 20},
				},
				[3531] = {
					"yellow",
					"Quick King's Amber",
					{["haste rating"] = 20},
				},
				[3532] = {
					"blue",
					"Solid Majestic Zircon",
					{["stamina"] = 30},
				},
				[3533] = {
					"blue",
					"Sparkling Majestic Zircon",
					{["spirit"] = 20},
				},
				[3534] = {
					"blue",
					"Lustrous Majestic Zircon",
					{["mp5"] = 10},
				},
				[3535] = {
					"blue",
					"Stormy Majestic Zircon",
					{["spell penetration"] = 25},
				},
				[3536] = {
					"purple",
					"Sovereign Dreadstone",
					{["strength"] = 10, ["stamina"] = 15},
				},
				[3537] = {
					"purple",
					"Shifting Dreadstone",
					{["agility"] = 10, ["stamina"] = 15},
				},
				[3538] = {
					"purple",
					"Glowing Dreadstone",
					{["spell power"] = 12, ["stamina"] = 15},
				},
				[3539] = {
					"purple",
					"Balanced Dreadstone",
					{["attack power"] = 20, ["stamina"] = 15},
				},
				[3540] = {
					"purple",
					"Regal Dreadstone",
					{["dodge rating"] = 10, ["stamina"] = 15},
				},
				[3541] = {
					"purple",
					"Defender's Dreadstone",
					{["parry rating"] = 10, ["stamina"] = 15},
				},
				[3542] = {
					"purple",
					"Guardian's Dreadstone",
					{["expertise rating"] = 10, ["stamina"] = 15},
				},
				[3543] = {
					"purple",
					"Puissant Dreadstone",
					{["armor penetration rating"] = 10, ["stamina"] = 15},
				},
				[3544] = {
					"purple",
					"Tenuous Dreadstone",
					{["agility"] = 10, ["mp5"] = 5},
				},
				[3545] = {
					"purple",
					"Purified Dreadstone",
					{["spell power"] = 12, ["spirit"] = 10},
				},
				[3546] = {
					"purple",
					"Royal Dreadstone",
					{["spell power"] = 12, ["mp5"] = 5},
				},
				[3547] = {
					"purple",
					"Infused Dreadstone",
					{["attack power"] = 20, ["mp5"] = 5},
				},
				[3548] = {
					"purple",
					"Mysterious Dreadstone",
					{["spell power"] = 12, ["spell penetration"] = 13},
				},
				[3549] = {
					"orange",
					"Inscribed Ametrine",
					{["strength"] = 10, ["critical strike rating"] = 10},
				},
				[3550] = {
					"orange",
					"Etched Ametrine",
					{["strength"] = 10, ["hit rating"] = 10},
				},
				[3551] = {
					"orange",
					"Champion's Ametrine",
					{["strength"] = 10, ["defense rating"] = 10},
				},
				[3552] = {
					"orange",
					"Resplendent Ametrine",
					{["strength"] = 10, ["resilience rating"] = 10},
				},
				[3553] = {
					"orange",
					"Fierce Ametrine",
					{["strength"] = 10, ["haste rating"] = 10},
				},
				[3554] = {
					"orange",
					"Deadly Ametrine",
					{["agility"] = 10, ["critical strike rating"] = 10},
				},
				[3555] = {
					"orange",
					"Glinting Ametrine",
					{["agility"] = 10, ["hit rating"] = 10},
				},
				[3556] = {
					"orange",
					"Lucent Ametrine",
					{["agility"] = 10, ["resilience rating"] = 10},
				},
				[3557] = {
					"orange",
					"Deft Ametrine",
					{["agility"] = 10, ["haste rating"] = 10},
				},
				[3558] = {
					"orange",
					"Luminous Ametrine",
					{["spell power"] = 12, ["intellect"] = 10},
				},
				[3559] = {
					"orange",
					"Potent Ametrine",
					{["spell power"] = 12, ["critical strike rating"] = 10},
				},
				[3560] = {
					"orange",
					"Veiled Ametrine",
					{["spell power"] = 12, ["hit rating"] = 10},
				},
				[3561] = {
					"orange",
					"Durable Ametrine",
					{["spell power"] = 12, ["resilience rating"] = 10},
				},
				[3563] = {
					"orange",
					"Reckless Ametrine",
					{["spell power"] = 12, ["haste rating"] = 10},
				},
				[3564] = {
					"orange",
					"Wicked Ametrine",
					{["attack power"] = 20, ["critical strike rating"] = 10},
				},
				[3565] = {
					"orange",
					"Pristine Ametrine",
					{["attack power"] = 20, ["hit rating"] = 10},
				},
				[3566] = {
					"orange",
					"Empowered Ametrine",
					{["attack power"] = 20, ["resilience rating"] = 10},
				},
				[3567] = {
					"orange",
					"Stark Ametrine",
					{["attack power"] = 20, ["haste rating"] = 10},
				},
				[3568] = {
					"orange",
					"Stalwart Ametrine",
					{["dodge rating"] = 10, ["defense rating"] = 10},
				},
				[3569] = {
					"orange",
					"Glimmering Ametrine",
					{["parry rating"] = 10, ["defense rating"] = 10},
				},
				[3570] = {
					"orange",
					"Accurate Ametrine",
					{["expertise rating"] = 10, ["hit rating"] = 10},
				},
				[3571] = {
					"orange",
					"Resolute Ametrine",
					{["expertise rating"] = 10, ["defense rating"] = 10},
				},
				[3572] = {
					"green",
					"Timeless Eye of Zul",
					{["intellect"] = 10, ["stamina"] = 15},
				},
				[3573] = {
					"green",
					"Jagged Eye of Zul",
					{["critical strike rating"] = 10, ["stamina"] = 15},
				},
				[3574] = {
					"green",
					"Vivid Eye of Zul",
					{["hit rating"] = 10, ["stamina"] = 15},
				},
				[3575] = {
					"green",
					"Enduring Eye of Zul",
					{["defense rating"] = 10, ["stamina"] = 15},
				},
				[3576] = {
					"green",
					"Steady Eye of Zul",
					{["resilience rating"] = 10, ["stamina"] = 15},
				},
				[3577] = {
					"green",
					"Forceful Eye of Zul",
					{["haste rating"] = 10, ["stamina"] = 15},
				},
				[3578] = {
					"green",
					"Seer's Eye of Zul",
					{["intellect"] = 10, ["spirit"] = 10},
				},
				[3579] = {
					"green",
					"Misty Eye of Zul",
					{["critical strike rating"] = 10, ["spirit"] = 10},
				},
				[3580] = {
					"green",
					"Shining Eye of Zul",
					{["hit rating"] = 10, ["spirit"] = 10},
				},
				[3581] = {
					"green",
					"Turbid Eye of Zul",
					{["resilience rating"] = 10, ["spirit"] = 10},
				},
				[3582] = {
					"green",
					"Intricate Eye of Zul",
					{["haste rating"] = 10, ["spirit"] = 10},
				},
				[3583] = {
					"green",
					"Dazzling Eye of Zul",
					{["intellect"] = 10, ["mp5"] = 5},
				},
				[3584] = {
					"green",
					"Sundered Eye of Zul",
					{["critical strike rating"] = 10, ["mp5"] = 5},
				},
				[3585] = {
					"green",
					"Lambent Eye of Zul",
					{["hit rating"] = 10, ["mp5"] = 5},
				},
				[3586] = {
					"green",
					"Opaque Eye of Zul",
					{["resilience rating"] = 10, ["mp5"] = 5},
				},
				[3587] = {
					"green",
					"Energized Eye of Zul",
					{["haste rating"] = 10, ["mp5"] = 5},
				},
				[3588] = {
					"green",
					"Radiant Eye of Zul",
					{["critical strike rating"] = 10, ["spell penetration"] = 13},
				},
				[3589] = {
					"green",
					"Tense Eye of Zul",
					{["hit rating"] = 10, ["spell penetration"] = 13},
				},
				[3590] = {
					"green",
					"Shattered Eye of Zul",
					{["haste rating"] = 10, ["spell penetration"] = 13},
				},
			},
		},
		["Unique-Equipped"] = {
			[5] = {
				[3749] = {
					"Prismatic",
					"Enchanted Pearl",
					{["all stats"] = 4},
				},
			},
			[6] = {
				[3750] = {
					"Prismatic",
					"Enchanted Tear",
					{["all stats"] = 6},
				},
			},
			[7] = {
				[3879] = {
					"Prismatic",
					"Nightmare Tear",
					{["all stats"] = 10},
				},
			},
		},
		["Jewelcrafter-Only"] = {
			[4] = {
				[3208] = {
					"red",
					"Crimson Sun",
					{["attack power"] = 24},
				},
				[3210] = {
					"red",
					"Don Julio's Heart",
					{["spell power"] = 14},
				},
				[3211] = {
					"red",
					"Kailee's Rose",
					{["spell power"] = 14},
				},
				[3212] = {
					"blue",
					"Falling Star",
					{["stamina"] = 18},
				},
				[3217] = {
					"yellow",
					"Blood of Amber",
					{["critical strike rating"] = 12},
				},
				[3220] = {
					"yellow",
					"Stone of Blades",
					{["critical strike rating"] = 12},
				},
				[3221] = {
					"yellow",
					"Facet of Eternity",
					{["defense rating"] = 12},
				},
			},
			[7] = {
				[3292] = {
					"red",
					"Bright Dragon's Eye",
					{["attack power"] = 68},
				},
				[3293] = {
					"blue",
					"Solid Dragon's Eye",
					{["stamina"] = 51},
				},
				[3732] = {
					"red",
					"Bold Dragon's Eye",
					{["strength"] = 34},
				},
				[3733] = {
					"red",
					"Delicate Dragon's Eye",
					{["agility"] = 34},
				},
				[3734] = {
					"red",
					"Runed Dragon's Eye",
					{["spell power"] = 39},
				},
				[3735] = {
					"blue",
					"Sparkling Dragon's Eye",
					{["spirit"] = 34},
				},
				[3736] = {
					"blue",
					"Lustrous Dragon's Eye",
					{["mp5"] = 17},
				},
				[3737] = {
					"yellow",
					"Brilliant Dragon's Eye",
					{["intellect"] = 34},
				},
				[3738] = {
					"yellow",
					"Smooth Dragon's Eye",
					{["critical strike rating"] = 34},
				},
				[3739] = {
					"yellow",
					"Quick Dragon's Eye",
					{["haste rating"] = 34},
				},
				[3740] = {
					"red",
					"Subtle Dragon's Eye",
					{["dodge rating"] = 34},
				},
				[3741] = {
					"red",
					"Flashing Dragon's Eye",
					{["parry rating"] = 34},
				},
				[3742] = {
					"yellow",
					"Rigid Dragon's Eye",
					{["hit rating"] = 34},
				},
				[3743] = {
					"yellow",
					"Thick Dragon's Eye",
					{["defense rating"] = 34},
				},
				[3744] = {
					"yellow",
					"Mystic Dragon's Eye",
					{["resilience rating"] = 34},
				},
				[3745] = {
					"red",
					"Fractured Dragon's Eye",
					{["armor penetration rating"] = 34},
				},
				[3746] = {
					"red",
					"Precise Dragon's Eye",
					{["expertise rating"] = 34},
				},
				[3747] = {
					"blue",
					"Stormy Dragon's Eye",
					{["spell penetration"] = 43},
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
					{["agility"] = 14},
				},
				[3646] = {
					"red",
					"Perfect Subtle Bloodstone",
					{["dodge rating"] = 14},
				},
				[3647] = {
					"red",
					"Perfect Precise Bloodstone",
					{["expertise rating"] = 14},
				},
				[3648] = {
					"red",
					"Perfect Flashing Bloodstone",
					{["parry rating"] = 14},
				},
				[3649] = {
					"red",
					"Perfect Bold Bloodstone",
					{["strength"] = 14},
				},
				[3650] = {
					"red",
					"Perfect Runed Bloodstone",
					{["spell power"] = 16},
				},
				[3651] = {
					"red",
					"Perfect Bright Bloodstone",
					{["attack power"] = 28},
				},
				[3652] = {
					"red",
					"Perfect Fractured Bloodstone",
					{["armor penetration rating"] = 14},
				},
				[3653] = {
					"blue",
					"Perfect Sparkling Chalcedony",
					{["spirit"] = 14},
				},
				[3654] = {
					"blue",
					"Perfect Lustrous Chalcedony",
					{["mp5"] = 7},
				},
				[3655] = {
					"blue",
					"Perfect Solid Chalcedony",
					{["stamina"] = 21},
				},
				[3656] = {
					"blue",
					"Perfect Stormy Chalcedony",
					{["spell penetration"] = 18},
				},
				[3657] = {
					"yellow",
					"Perfect Smooth Sun Crystal",
					{["critical strike rating"] = 14},
				},
				[3658] = {
					"yellow",
					"Perfect Thick Sun Crystal",
					{["defense rating"] = 14},
				},
				[3659] = {
					"yellow",
					"Perfect Quick Sun Crystal",
					{["haste rating"] = 14},
				},
				[3660] = {
					"yellow",
					"Perfect Rigid Sun Crystal",
					{["hit rating"] = 14},
				},
				[3661] = {
					"yellow",
					"Perfect Brilliant Sun Crystal",
					{["intellect"] = 14},
				},
				[3662] = {
					"yellow",
					"Perfect Mystic Sun Crystal",
					{["resilience rating"] = 14},
				},
				[3663] = {
					"purple",
					"Perfect Infused Shadow Crystal",
					{["attack power"] = 14, ["mp5"] = 4},
				},
				[3664] = {
					"purple",
					"Perfect Balanced Shadow Crystal",
					{["attack power"] = 14, ["stamina"] = 11},
				},
				[3665] = {
					"purple",
					"Perfect Puissant Shadow Crystal",
					{["armor penetration rating"] = 7, ["stamina"] = 11},
				},
				[3666] = {
					"purple",
					"Perfect Tenuous Shadow Crystal",
					{["agility"] = 7, ["mp5"] = 4},
				},
				[3667] = {
					"purple",
					"Perfect Shifting Shadow Crystal",
					{["agility"] = 7, ["stamina"] = 11},
				},
				[3668] = {
					"purple",
					"Perfect Regal Shadow Crystal",
					{["dodge rating"] = 7, ["stamina"] = 11},
				},
				[3669] = {
					"purple",
					"Perfect Guardian's Shadow Crystal",
					{["expertise rating"] = 7, ["stamina"] = 11},
				},
				[3670] = {
					"purple",
					"Perfect Defender's Shadow Crystal",
					{["parry rating"] = 7, ["stamina"] = 11},
				},
				[3671] = {
					"purple",
					"Perfect Sovereign Shadow Crystal",
					{["strength"] = 7, ["stamina"] = 11},
				},
				[3672] = {
					"purple",
					"Perfect Royal Shadow Crystal",
					{["spell power"] = 8, ["mp5"] = 4},
				},
				[3673] = {
					"purple",
					"Perfect Purified Shadow Crystal",
					{["spell power"] = 8, ["spirit"] = 7},
				},
				[3674] = {
					"purple",
					"Perfect Mysterious Shadow Crystal",
					{["spell power"] = 8, ["spell penetration"] = 9},
				},
				[3675] = {
					"purple",
					"Perfect Glowing Shadow Crystal",
					{["spell power"] = 8, ["stamina"] = 11},
				},
				[3677] = {
					"orange",
					"Perfect Deft Huge Citrine",
					{["agility"] = 7, ["haste rating"] = 7},
				},
				[3678] = {
					"orange",
					"Perfect Stark Huge Citrine",
					{["attack power"] = 14, ["haste rating"] = 7},
				},
				[3679] = {
					"orange",
					"Perfect Pristine Huge Citrine",
					{["attack power"] = 14, ["hit rating"] = 7},
				},
				[3680] = {
					"orange",
					"Perfect Empowered Huge Citrine",
					{["attack power"] = 14, ["resilience rating"] = 7},
				},
				[3681] = {
					"orange",
					"Perfect Inscribed Huge Citrine",
					{["strength"] = 7, ["critical strike rating"] = 7},
				},
				[3682] = {
					"orange",
					"Perfect Etched Huge Citrine",
					{["strength"] = 7, ["hit rating"] = 7},
				},
				[3683] = {
					"orange",
					"Perfect Champion's Huge Citrine",
					{["strength"] = 7, ["defense rating"] = 7},
				},
				[3684] = {
					"orange",
					"Perfect Resplendent Huge Citrine",
					{["strength"] = 7, ["resilience rating"] = 7},
				},
				[3685] = {
					"orange",
					"Perfect Fierce Huge Citrine",
					{["strength"] = 7, ["haste rating"] = 7},
				},
				[3686] = {
					"orange",
					"Perfect Deadly Huge Citrine",
					{["agility"] = 7, ["critical strike rating"] = 7},
				},
				[3687] = {
					"orange",
					"Perfect Glinting Huge Citrine",
					{["agility"] = 7, ["hit rating"] = 7},
				},
				[3688] = {
					"orange",
					"Perfect Lucent Huge Citrine",
					{["agility"] = 7, ["resilience rating"] = 7},
				},
				[3689] = {
					"orange",
					"Perfect Luminous Huge Citrine",
					{["spell power"] = 8, ["intellect"] = 7},
				},
				[3690] = {
					"orange",
					"Perfect Potent Huge Citrine",
					{["spell power"] = 8, ["critical strike rating"] = 7},
				},
				[3691] = {
					"orange",
					"Perfect Veiled Huge Citrine",
					{["spell power"] = 8, ["hit rating"] = 7},
				},
				[3692] = {
					"orange",
					"Perfect Durable Huge Citrine",
					{["spell power"] = 8, ["resilience rating"] = 7},
				},
				[3693] = {
					"orange",
					"Perfect Reckless Huge Citrine",
					{["spell power"] = 8, ["haste rating"] = 7},
				},
				[3694] = {
					"orange",
					"Perfect Stalwart Huge Citrine",
					{["dodge rating"] = 7, ["defense rating"] = 7},
				},
				[3695] = {
					"orange",
					"Perfect Glimmering Huge Citrine",
					{["parry rating"] = 7, ["defense rating"] = 7},
				},
				[3696] = {
					"orange",
					"Perfect Accurate Huge Citrine",
					{["expertise rating"] = 7, ["hit rating"] = 7},
				},
				[3697] = {
					"orange",
					"Perfect Resolute Huge Citrine",
					{["expertise rating"] = 7, ["defense rating"] = 7},
				},
				[3698] = {
					"green",
					"Perfect Misty Dark Jade",
					{["critical strike rating"] = 7, ["spirit"] = 7},
				},
				[3699] = {
					"green",
					"Perfect Jagged Dark Jade",
					{["critical strike rating"] = 7, ["stamina"] = 11},
				},
				[3700] = {
					"green",
					"Perfect Enduring Dark Jade",
					{["defense rating"] = 7, ["stamina"] = 11},
				},
				[3701] = {
					"green",
					"Perfect Intricate Dark Jade",
					{["haste rating"] = 7, ["spirit"] = 7},
				},
				[3702] = {
					"green",
					"Perfect Forceful Dark Jade",
					{["haste rating"] = 7, ["stamina"] = 11},
				},
				[3703] = {
					"green",
					"Perfect Shining Dark Jade",
					{["hit rating"] = 7, ["spirit"] = 7},
				},
				[3704] = {
					"green",
					"Perfect Vivid Dark Jade",
					{["hit rating"] = 7, ["stamina"] = 11},
				},
				[3705] = {
					"green",
					"Perfect Seer's Dark Jade",
					{["intellect"] = 7, ["spirit"] = 7},
				},
				[3706] = {
					"green",
					"Perfect Timeless Dark Jade",
					{["intellect"] = 7, ["stamina"] = 11},
				},
				[3707] = {
					"green",
					"Perfect Turbid Dark Jade",
					{["resilience rating"] = 7, ["spirit"] = 7},
				},
				[3708] = {
					"green",
					"Perfect Steady Dark Jade",
					{["resilience rating"] = 7, ["stamina"] = 11},
				},
				[3709] = {
					"green",
					"Perfect Radiant Dark Jade",
					{["critical strike rating"] = 7, ["spell penetration"] = 9},
				},
				[3710] = {
					"green",
					"Perfect Sundered Dark Jade",
					{["critical strike rating"] = 7, ["mp5"] = 4},
				},
				[3711] = {
					"green",
					"Perfect Dazzling Dark Jade",
					{["intellect"] = 7, ["mp5"] = 4},
				},
				[3712] = {
					"green",
					"Perfect Lambent Dark Jade",
					{["hit rating"] = 7, ["mp5"] = 4},
				},
				[3713] = {
					"green",
					"Perfect Opaque Dark Jade",
					{["resilience rating"] = 7, ["mp5"] = 4},
				},
				[3714] = {
					"green",
					"Perfect Energized Dark Jade",
					{["haste rating"] = 7, ["mp5"] = 4},
				},
				[3715] = {
					"green",
					"Perfect Tense Dark Jade",
					{["hit rating"] = 7, ["spell penetration"] = 9},
				},
				[3716] = {
					"green",
					"Perfect Shattered Dark Jade",
					{["haste rating"] = 7, ["spell penetration"] = 9},
				},
				[3767] = {
					"orange",
					"Perfect Wicked Huge Citrine",
					{["attack power"] = 14, ["critical strike rating"] = 7},
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
					{["spell power"] = 12},
				},
				[2913] = {
					"yellow",
					"Smooth Ornate Dawnstone",
					{["critical strike rating"] = 10},
				},
				[2914] = {
					"yellow",
					"Gleaming Ornate Dawnstone",
					{["critical strike rating"] = 10},
				},
				[2916] = {
					"orange",
					"Potent Ornate Topaz",
					{["critical strike rating"] = 5, ["spell power"] = 6},
				},
				[2945] = {
					"red",
					"Bold Ornate Ruby",
					{["attack power"] = 20},
				},
				[2946] = {
					"orange",
					"Inscribed Ornate Topaz",
					{["attack power"] = 10, ["critical strike rating"] = 5},
				},
				[2949] = {
					"red",
					"Bold Ornate Ruby",
					{["attack power"] = 20},
				},
				[3335] = {
					"red",
					"Bold Ornate Ruby",
					{["attack power"] = 20},
				},
				[3336] = {
					"yellow",
					"Gleaming Ornate Dawnstone",
					{["critical strike rating"] = 10},
				},
				[3337] = {
					"orange",
					"Inscribed Ornate Topaz",
					{["attack power"] = 10, ["critical strike rating"] = 5},
				},
				[3338] = {
					"orange",
					"Potent Ornate Topaz",
					{["spell power"] = 6, ["critical strike rating"] = 5},
				},
				[3339] = {
					"red",
					"Runed Ornate Ruby",
					{["spell power"] = 12},
				},
				[3340] = {
					"yellow",
					"Smooth Ornate Dawnstone",
					{["critical strike rating"] = 10},
				},
			},
			[6] = {
				[3798] = {
					"meta",
					"Swift Starflare Diamond",
					{["attack power"] = 34, ["minor run speed"] = 1},
				},
				[3799] = {
					"meta",
					"Tireless Starflare Diamond",
					{["spell power"] = 20, ["minor run speed"] = 1},
				},
				[3800] = {
					"meta",
					"Impassive Starflare Diamond",
					{["critical strike rating"] = 17, ["fear duration reduction (percent)"] = 10},
				},
				[3801] = {
					"meta",
					"Egnimatic Starflare Diamond",
					{["critical strike rating"] = 17, ["snare/root duration reduction (percent)"] = 10},
				},
				[3802] = {
					"meta",
					"Forlorn Starflare Diamond",
					{["spell power"] = 20, ["silence duration reduction (percent)"] = 10},
				},
				[3803] = {
					"meta",
					"Persistent Earthshatter Diamond",
					{["attack power"] = 34, ["stun duration reduction (percent)"] = 10},
				},
				[3804] = {
					"meta",
					"Powerful Earthshatter Diamond",
					{["stamina"] = 26, ["stun duration reduction (percent)"] = 10},
				},
				[3805] = {
					"meta",
					"Trenchant Earthshatter Diamond",
					{["spell power"] = 20, ["stun duration reduction (percent)"] = 10},
				},
			},
		},
		["Unique-Equipped"] = {
			[3] = {
				[2896] = {
					"red",
					"Stark Blood Garnet",
					{["spell power"] = 8},
				},
				[2898] = {
					"green",
					"Notched Deep Peridot",
					{["stamina"] = 3, ["critical strike rating"] = 4},
				},
				[2899] = {
					"green",
					"Barbed Deep Peridot",
					{["stamina"] = 3, ["critical strike rating"] = 4},
				},
				[2921] = {
					"green",
					"Barbed Deep Peridot",
					{["stamina"] = 3, ["critical strike rating"] = 4},
				},
				[2923] = {
					"green",
					"Notched Deep Peridot",
					{["stamina"] = 3, ["critical strike rating"] = 4},
				},
				[2924] = {
					"red",
					"Stark Blood Garnet",
					{["spell power"] = 8},
				},
				[2943] = {
					"red",
					"Mighty Blood Garnet",
					{["attack power"] = 14},
				},
				[2944] = {
					"red",
					"Mighty Blood Garnet",
					{["attack power"] = 14},
				},
				[2969] = {
					"meta",
					"Swift Windfire Diamond",
					{["attack power"] = 20, ["minor run speed"] = 1},
				},
				[2970] = {
					"meta",
					"Swift Starfire Diamond",
					{["spell power"] = 12, ["minor run speed"] = 1},
				},
				[3065] = {
					"red",
					"Don Rodrigo's Heart",
					{["strength"] = 8},
				},
				[3103] = {
					"red",
					"Don Amancio's Heart",
					{["strength"] = 8},
				},
			},
			[4] = {
				[2891] = {
					"yellow",
					"Sublime Mystic Dawnstone",
					{["resilience rating"] = 10},
				},
			},
			[7] = {
				[3792] = {
					"yellow",
					"Kharmaa's Grace",
					{["resilience rating"] = 20},
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
					{["strength"] = 5, ["stamina"] = 6},
				},
				[3046] = {
					"orange",
					"Luminous Fire Opal",
					{["spell power"] = 6, ["intellect"] = 4},
				},
				[3047] = {
					"green",
					"Polished Chrysoprase",
					{["stamina"] = 6, ["critical strike rating"] = 5},
				},
				[3048] = {
					"purple",
					"Shifting Tanzanite",
					{["agility"] = 5, ["stamina"] = 6},
				},
				[3049] = {
					"green",
					"Sundered Chrysoprase",
					{["critical strike rating"] = 5, ["mp5"] = 2},
				},
				[3050] = {
					"orange",
					"Infused Fire Opal",
					{["spell power"] = 6, ["intellect"] = 4},
				},
				[3051] = {
					"purple",
					"Blessed Tanzanite",
					{["spell power"] = 6, ["stamina"] = 6},
				},
				[3052] = {
					"orange",
					"Pristine Fire Opal",
					{["attack power"] = 10, ["hit rating"] = 4},
				},
				[3053] = {
					"orange",
					"Stalwart Fire Opal",
					{["defense rating"] = 5, ["dodge rating"] = 4},
				},
				[3054] = {
					"purple",
					"Glowing Tanzanite",
					{["spell power"] = 6, ["stamina"] = 6},
				},
				[3055] = {
					"orange",
					"Glinting Fire Opal",
					{["agility"] = 5, ["hit rating"] = 4},
				},
				[3056] = {
					"orange",
					"Glimmering Fire Opal",
					{["parry rating"] = 5, ["defense rating"] = 4},
				},
				[3057] = {
					"orange",
					"Etched Fire Opal",
					{["strength"] = 5, ["hit rating"] = 4},
				},
				[3058] = {
					"green",
					"Rune Covered Chrysoprase",
					{["critical strike rating"] = 5, ["mp5"] = 2},
				},
				[3060] = {
					"purple",
					"Regal Tanzanite",
					{["dodge rating"] = 5, ["stamina"] = 6},
				},
				[3061] = {
					"orange",
					"Shining Fire Opal",
					{["hit rating"] = 5, ["spell power"] = 6},
				},
				[3062] = {
					"orange",
					"Assassin's Fire Opal",
					{["critical strike rating"] = 6, ["dodge rating"] = 5},
				},
				[3063] = {
					"purple",
					"Defender's Tanzanite",
					{["parry rating"] = 5, ["stamina"] = 6},
				},
				[3064] = {
					"purple",
					"Imperial Tanzanite",
					{["spirit"] = 5, ["spell power"] = 5},
				},
				[3066] = {
					"orange",
					"Mysterious Fire Opal",
					{["spell power"] = 6, ["spell penetration"] = 5},
				},
				[3067] = {
					"purple",
					"Brutal Tanzanite",
					{["attack power"] = 10, ["stamina"] = 6},
				},
				[3068] = {
					"orange",
					"Nimble Fire Opal",
					{["dodge rating"] = 5, ["hit rating"] = 4},
				},
				[3069] = {
					"orange",
					"Durable Fire Opal",
					{["spell power"] = 6, ["resilience rating"] = 4},
				},
				[3070] = {
					"orange",
					"Deadly Fire Opal",
					{["attack power"] = 8, ["critical strike rating"] = 5},
				},
				[3071] = {
					"green",
					"Timeless Chrysoprase",
					{["intellect"] = 5, ["stamina"] = 6},
				},
				[3072] = {
					"orange",
					"Enscribed Fire Opal", -- No, that's not a typo (on my part, anyway)
					{["strength"] = 5, ["critical strike rating"] = 4},
				},
				[3073] = {
					"orange",
					"Glistening Fire Opal",
					{["agility"] = 4, ["defense rating"] = 5},
				},
				[3074] = {
					"green",
					"Seer's Chrysoprase",
					{["intellect"] = 4, ["spirit"] = 5},
				},
				[3075] = {
					"orange",
					"Champion's Fire Opal",
					{["strength"] = 5, ["defense rating"] = 4},
				},
				[3076] = {
					"orange",
					"Potent Fire Opal",
					{["critical strike rating"] = 4, ["spell power"] = 6},
				},
				[3077] = {
					"green",
					"Dazzling Chrysoprase",
					{["intellect"] = 5, ["mp5"] = 2},
				},
				[3078] = {
					"green",
					"Enduring Chrysoprase",
					{["stamina"] = 6, ["defense rating"] = 5},
				},
				[3079] = {
					"orange",
					"Empowered Fire Opal",
					{["attack power"] = 8, ["resilience rating"] = 5},
				},
				[3080] = {
					"green",
					"Steady Chrysoprase",
					{["stamina"] = 6, ["resilience rating"] = 5},
				},
				[3081] = {
					"orange",
					"Iridescent Fire Opal",
					{["spell power"] = 6, ["critical strike rating"] = 4},
				},
				[3082] = {
					"green",
					"Effulgent Chrysoprase",
					{["defense rating"] = 5, ["mp5"] = 2},
				},
				[3083] = {
					"purple",
					"Fluorescent Tanzanite",
					{["spell power"] = 6, ["spirit"] = 4},
				},
				[3084] = {
					"orange",
					"Beaming Fire Opal",
					{["dodge rating"] = 5, ["resilience rating"] = 4},
				},
				[3085] = {
					"green",
					"Jagged Chrysoprase",
					{["stamina"] = 6, ["critical strike rating"] = 5},
				},
				[3086] = {
					"purple",
					"Royal Tanzanite",
					{["spell power"] = 6, ["mp5"] = 2},
				},
				[3087] = {
					"orange",
					"Resplendent Fire Opal",
					{["strength"] = 5, ["resilience rating"] = 4},
				},
				[3088] = {
					"green",
					"Vivid Chrysoprase",
					{["hit rating"] = 5, ["stamina"] = 6},
				},
				[3089] = {
					"green",
					"Lambent Chrysoprase",
					{["hit rating"] = 5, ["mp5"] = 2},
				},
				[3090] = {
					"orange",
					"Splendid Fire Opal",
					{["parry rating"] = 5, ["resilience rating"] = 4},
				},
				[3091] = {
					"green",
					"Radiant Chrysoprase",
					{["critical strike rating"] = 5, ["spell penetration"] = 5},
				},
			},
			[7] = {
				[3861] = {
					"red",
					"Bold Stormjewel",
					{["strength"] = 20},
				},
				[3862] = {
					"red",
					"Delicate Stormjewel",
					{["agility"] = 20},
				},
				[3863] = {
					"blue",
					"Solid Stormjewel",
					{["stamina"] = 30},
				},
				[3864] = {
					"blue",
					"Sparkling Stormjewel",
					{["spirit"] = 20},
				},
				[3865] = {
					"yellow",
					"Brilliant Stormjewel",
					{["intellect"] = 20},
				},
				[3866] = {
					"red",
					"Runed Stormjewel",
					{["spell power"] = 23},
				},
				[3867] = {
					"yellow",
					"Rigid Stormjewel",
					{["hit rating"] = 20},
				},
			},
		},
		["Unique-Equipped"] = {
			[3] = {
				[3268] = {
					"blue",
					"Eye of the Sea",
					{["stamina"] = 15},
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
					{["attack power"] = 24, ["stun resistance (percent)"] = 5},
				},
				[3163] = {
					"meta",
					"Imbued Unstable Diamond",
					{["spell power"] = 14, ["stun resistance (percent)"] = 5},
				},
			},
			[4] = {
				[3099] = {
					"purple",
					"Infused Amethyst",
					{["spell power"] = 6, ["stamina"] = 6},
				},
				[3100] = {
					"purple",
					"Soothing Amethyst",
					{["spell power"] = 6, ["stamina"] = 6},
				},
				[3101] = {
					"purple",
					"Pulsing Amethyst",
					{["attack power"] = 10, ["stamina"] = 6},
				},
				[3276] = {
					"red",
					"Bright Crimson Spinel",
					{["attack power"] = 20},
				},
				[3277] = {
					"red",
					"Runed Crimson Spinel",
					{["spell power"] = 12},
				},
				[3278] = {
					"red",
					"Teardrop Crimson Spinel",
					{["spell power"] = 12},
				},
				[3281] = {
					"red",
					"Bright Crimson Spinel",
					{["attack power"] = 20},
				},
				[3282] = {
					"red",
					"Runed Crimson Spinel",
					{["spell power"] = 12},
				},
				[3283] = {
					"red",
					"Teardrop Crimson Spinel",
					{["spell power"] = 12},
				},
			},
		},
		["Unique-Equipped"] = {
			[3] = {
				[3156] = {
					"purple",
					"Unstable Amethyst",
					{["attack power"] = 8, ["stamina"] = 6},
				},
				[3157] = {
					"green",
					"Unstable Peridot",
					{["intellect"] = 4, ["stamina"] = 6},
				},
				[3158] = {
					"blue",
					"Unstable Sapphire",
					{["spell power"] = 5, ["spirit"] = 4},
				},
				[3159] = {
					"orange",
					"Unstable Citrine",
					{["attack power"] = 8, ["critical strike rating"] = 4},
				},
				[3160] = {
					"orange",
					"Unstable Topaz",
					{["spell power"] = 5, ["intellect"] = 4},
				},
				[3161] = {
					"green",
					"Unstable Talasite",
					{["stamina"] = 4, ["critical strike rating"] = 4},
				},
			},
			[4] = {
				[3262] = {
					"blue",
					"Charmed Amani Jewel",
					{["stamina"] = 15},
				},
			},
		},
	},
}

GemQualities = {}

for gemType, gems in pairs(GemIds) do
	for gemSource, gems in pairs(gems) do
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
