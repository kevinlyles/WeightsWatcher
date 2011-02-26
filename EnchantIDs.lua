local normalWeapon = { "weapon", weapon = { [false] = { "fishing pole", "shield" } } }
local normalTwoHand = { "two-hand", ["two-hand"] = { [false] = { "fishing pole" } } }
local normalRanged = { "ranged", ranged = { [false] = { "wand" } } }

local EnchantIDs = {
	[15] = {
		itemID = { 2304 },
		name = {
			chest = "Light Armor Kit",
			feet = "Light Armor Kit",
			hands = "Light Armor Kit",
			legs = "Light Armor Kit",
		},
		stats = {
			armor = 8,
		},
	},
	[16] = {
		itemID = { 2313 },
		name = {
			chest = "Medium Armor Kit",
			feet = "Medium Armor Kit",
			hands = "Medium Armor Kit",
			legs = "Medium Armor Kit",
		},
		stats = {
			armor = 16,
		},
	},
	[17] = {
		itemID = { 4265 },
		name = {
			chest = "Heavy Armor Kit",
			feet = "Heavy Armor Kit",
			hands = "Heavy Armor Kit",
			legs = "Heavy Armor Kit",
		},
		stats = {
			armor = 24,
		},
	},
	[18] = {
		itemID = { 8173 },
		name = {
			chest = "Thick Armor Kit",
			feet = "Thick Armor Kit",
			hands = "Thick Armor Kit",
			legs = "Thick Armor Kit",
		},
		stats = {
			armor = 32,
		},
	},
	[24] = {
		itemID = { 38769 },
		name = {
			chest = "Enchant Chest - Minor Mana",
		},
		spellID = { 7443 },
		stats = {
			mana = 5,
		},
	},
	[30] = {
		itemID = { 4405 },
		name = {
			ranged = "Crude Scope",
		},
		stats = {
			["average ranged weapon damage"] = 1,
			["maximum ranged weapon damage"] = 1,
		},
	},
	[32] = {
		itemID = { 4406 },
		name = {
			ranged = "Standard Scope",
		},
		stats = {
			["average ranged weapon damage"] = 2,
			["maximum ranged weapon damage"] = 2,
		},
	},
	[33] = {
		itemID = { 4407 },
		name = {
			ranged = "Accurate Scope",
		},
		stats = {
			["average ranged weapon damage"] = 3,
			["maximum ranged weapon damage"] = 3,
		},
	},
	[34] = {
		itemID = { 6043 },
		name = {
			["two-hand"] = "Iron Counterweight",
		},
		stats = {
			["haste rating"] = 20,
		},
	},
	[36] = {
		itemID = { 5421 },
		name = {
			weapon = "Fiery Blaze Enchantment",
		},
		stats = {
			["enchant: fiery blaze"] = 1,
		},
	},
	[37] = {
		itemID = { 6041 },
		name = {
			weapon = "Steel Weapon Chain",
		},
		stats = {
			["disarm duration reduction (percent)"] = 60,
		},
	},
	[41] = {
		itemID = { 38679, 38766 },
		name = {
			chest = "Enchant Chest - Minor Health",
			wrist = "Enchant Bracer - Minor Health",
		},
		spellID = { 7418, 7420 },
		stats = {
			health = 5,
		},
	},
	[43] = {
		itemID = { 6042 },
		name = {
			["off hand"] = "Iron Shield Spike",
		},
		stats = {
			["maximum damage dealt on block"] = 12,
			["minimum damage dealt on block"] = 8,
		},
	},
	[44] = {
		itemID = { 38767 },
		name = {
			chest = "Enchant Chest - Minor Absorption",
		},
		spellID = { 7426 },
		stats = {
			["damage absorption (2% chance)"] = 10,
		},
	},
	[63] = {
		itemID = { 38798 },
		name = {
			chest = "Enchant Chest - Lesser Absorption",
		},
		spellID = { 13538 },
		stats = {
			["damage absorption (5% chance)"] = 25,
		},
	},
	[65] = {
		itemID = { 38770 },
		name = {
			back = "Enchant Cloak - Minor Resistance",
		},
		spellID = { 7454 },
		stats = {
			["all resistances"] = 1,
		},
	},
	[66] = {
		itemID = { 38771, 38785, 38787 },
		name = {
			feet = "Enchant Boots - Minor Stamina",
			["off hand"] = "Enchant Shield - Minor Stamina",
			wrist = "Enchant Bracer - Minor Stamina",
		},
		spellID = { 7457, 7863, 13378 },
		stats = {
			stamina = 1,
		},
	},
	[241] = {
		itemID = { 38772, 38794 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Minor Impact",
			weapon = "Enchant Weapon - Lesser Striking",
		},
		spellID = { 7745, 13503 },
		stats = {
			["average melee weapon damage"] = 2,
			["maximum melee weapon damage"] = 2,
		},
	},
	[242] = {
		itemID = { 38773 },
		name = {
			chest = "Enchant Chest - Lesser Health",
		},
		spellID = { 7748 },
		stats = {
			health = 15,
		},
	},
	[243] = {
		itemID = { 38774 },
		name = {
			wrist = "Enchant Bracer - Minor Spirit",
		},
		spellID = { 7766 },
		stats = {
			spirit = 1,
		},
	},
	[246] = {
		itemID = { 38776 },
		name = {
			chest = "Enchant Chest - Lesser Mana",
		},
		spellID = { 7776 },
		stats = {
			mana = 20,
		},
	},
	[247] = {
		itemID = { 38777, 38786, 38789 },
		name = {
			back = "Enchant Cloak - Minor Agility",
			feet = "Enchant Boots - Minor Agility",
			wrist = "Enchant Bracer - Minor Agility",
		},
		spellID = { 7779, 7867, 13419 },
		stats = {
			agility = 1,
		},
	},
	[248] = {
		itemID = { 38778 },
		name = {
			wrist = "Enchant Bracer - Minor Strength",
		},
		spellID = { 7782 },
		stats = {
			strength = 1,
		},
	},
	[249] = {
		itemID = { 38779 },
		name = {
			weapon = "Enchant Weapon - Minor Beastslayer",
		},
		spellID = { 7786 },
		stats = {
			["melee damage to beasts"] = 2,
		},
	},
	[250] = {
		itemID = { 38780 },
		name = {
			weapon = "Enchant Weapon - Minor Striking",
		},
		spellID = { 7788 },
		stats = {
			["average melee weapon damage"] = 1,
			["maximum melee weapon damage"] = 1,
		},
	},
	[254] = {
		itemID = { 38782 },
		name = {
			chest = "Enchant Chest - Health",
		},
		spellID = { 7857 },
		stats = {
			health = 25,
		},
	},
	[255] = {
		itemID = { 38783, 38788, 38792, 38819 },
		name = {
			feet = "Enchant Boots - Lesser Spirit",
			["off hand"] = "Enchant Shield - Lesser Spirit",
			["two-hand"] = "Enchant 2H Weapon - Lesser Spirit",
			wrist = "Enchant Bracer - Lesser Spirit",
		},
		spellID = { 7859, 13380, 13485, 13687 },
		stats = {
			spirit = 3,
		},
	},
	[256] = {
		itemID = { 38784 },
		name = {
			back = "Enchant Cloak - Lesser Fire Resistance",
		},
		spellID = { 7861 },
		stats = {
			["fire resistance"] = 5,
		},
	},
	[368] = {
		itemID = { 38940 },
		name = {
			back = "Enchant Cloak - Greater Agility",
		},
		spellID = { 34004 },
		stats = {
			agility = 12,
		},
	},
	[369] = {
		itemID = { 38937 },
		name = {
			wrist = "Enchant Bracer - Major Intellect",
		},
		spellID = { 34001 },
		stats = {
			intellect = 12,
		},
	},
	[463] = {
		itemID = { 7967 },
		name = {
			["off hand"] = "Mithril Shield Spike",
		},
		stats = {
			["maximum damage dealt on block"] = 20,
			["minimum damage dealt on block"] = 16,
		},
	},
	[464] = {
		itemID = { 7969 },
		name = {
			feet = "Mithril Spurs",
		},
		stats = {
			["mount speed (percent)"] = 4,
		},
	},
	[663] = {
		itemID = { 10546 },
		name = {
			ranged = "Deadly Scope",
		},
		stats = {
			["average ranged weapon damage"] = 5,
			["maximum ranged weapon damage"] = 5,
		},
	},
	[664] = {
		itemID = { 10548 },
		name = {
			ranged = "Sniper Scope",
		},
		stats = {
			["average ranged weapon damage"] = 7,
			["maximum ranged weapon damage"] = 7,
		},
	},
	[684] = {
		itemID = { 38933 },
		name = {
			hands = "Enchant Gloves - Major Strength",
		},
		spellID = { 33995 },
		stats = {
			strength = 15,
		},
	},
	[723] = {
		itemID = { 38781, 38803 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Lesser Intellect",
			wrist = "Enchant Bracer - Lesser Intellect",
		},
		spellID = { 7793, 13622 },
		stats = {
			intellect = 3,
		},
	},
	[724] = {
		itemID = { 38793, 38805, 38810 },
		name = {
			feet = "Enchant Boots - Lesser Stamina",
			["off hand"] = "Enchant Shield - Lesser Stamina",
			wrist = "Enchant Bracer - Lesser Stamina",
		},
		spellID = { 13501, 13631, 13644 },
		stats = {
			stamina = 3,
		},
	},
	[744] = {
		itemID = { 38790 },
		name = {
			back = "Enchant Cloak - Lesser Protection",
		},
		spellID = { 13421 },
		stats = {
			armor = 20,
		},
	},
	[783] = {
		itemID = { 38775 },
		name = {
			back = "Enchant Cloak - Minor Protection",
		},
		spellID = { 7771 },
		stats = {
			armor = 10,
		},
	},
	[803] = {
		itemID = { 38838 },
		name = {
			weapon = "Enchant Weapon - Fiery Weapon",
		},
		spellID = { 13898 },
		stats = {
			["fiery weapon"] = 1,
		},
	},
	[804] = {
		itemID = { 38795 },
		name = {
			back = "Enchant Cloak - Lesser Shadow Resistance",
		},
		spellID = { 13522 },
		stats = {
			["shadow resistance"] = 10,
		},
	},
	[805] = {
		itemID = { 38848 },
		name = {
			weapon = "Enchant Weapon - Greater Striking",
		},
		spellID = { 13943 },
		stats = {
			["average melee weapon damage"] = 4,
			["maximum melee weapon damage"] = 4,
		},
	},
	[823] = {
		itemID = { 38797 },
		name = {
			wrist = "Enchant Bracer - Lesser Strength",
		},
		spellID = { 13536 },
		stats = {
			strength = 3,
		},
	},
	[843] = {
		itemID = { 38799 },
		name = {
			chest = "Enchant Chest - Mana",
		},
		spellID = { 13607 },
		stats = {
			mana = 30,
		},
	},
	[844] = {
		itemID = { 38800 },
		name = {
			hands = "Enchant Gloves - Mining",
		},
		spellID = { 13612 },
		stats = {
			mining = 2,
		},
	},
	[845] = {
		itemID = { 38801 },
		name = {
			hands = "Enchant Gloves - Herbalism",
		},
		spellID = { 13617 },
		stats = {
			herbalism = 2,
		},
	},
	[846] = {
		itemID = { 19971, 50816 },
		name = {
			hands = "Enchant Gloves - Angler",
			["two-hand"] = "High Test Eternium Fishing Line",
		},
		spellID = { 71692 },
		stats = {
			fishing = 5,
		},
	},
	[847] = {
		itemID = { 38804 },
		name = {
			chest = "Enchant Chest - Minor Stats",
		},
		spellID = { 13626 },
		stats = {
			["all stats"] = 1,
		},
	},
	[848] = {
		itemID = { 38791, 38806 },
		name = {
			back = "Enchant Cloak - Defense",
			["off hand"] = "Enchant Shield - Lesser Protection",
		},
		spellID = { 13464, 13635 },
		stats = {
			armor = 30,
		},
	},
	[849] = {
		itemID = { 38807, 38835 },
		name = {
			back = "Enchant Cloak - Lesser Agility",
			feet = "Enchant Boots - Lesser Agility",
		},
		spellID = { 13637, 13882 },
		stats = {
			agility = 3,
		},
	},
	[850] = {
		itemID = { 38808 },
		name = {
			chest = "Enchant Chest - Greater Health",
		},
		spellID = { 13640 },
		stats = {
			health = 35,
		},
	},
	[851] = {
		itemID = { 38809, 38816, 38864 },
		name = {
			feet = "Enchant Boots - Spirit",
			["off hand"] = "Enchant Shield - Spirit",
			wrist = "Enchant Bracer - Spirit",
		},
		spellID = { 13642, 13659, 20024 },
		stats = {
			spirit = 5,
		},
	},
	[852] = {
		itemID = { 38812, 38828, 38830 },
		name = {
			feet = "Enchant Boots - Stamina",
			["off hand"] = "Enchant Shield - Stamina",
			wrist = "Enchant Bracer - Stamina",
		},
		spellID = { 13648, 13817, 13836 },
		stats = {
			stamina = 5,
		},
	},
	[853] = {
		itemID = { 38813 },
		name = {
			weapon = "Enchant Weapon - Lesser Beastslayer",
		},
		spellID = { 13653 },
		stats = {
			["melee damage to beasts"] = 6,
		},
	},
	[854] = {
		itemID = { 38814 },
		name = {
			weapon = "Enchant Weapon - Lesser Elemental Slayer",
		},
		spellID = { 13655 },
		stats = {
			["melee damage to elementals"] = 6,
		},
	},
	[856] = {
		itemID = { 38817, 38836 },
		name = {
			hands = "Enchant Gloves - Strength",
			wrist = "Enchant Bracer - Strength",
		},
		spellID = { 13661, 13887 },
		stats = {
			strength = 5,
		},
	},
	[857] = {
		itemID = { 38818 },
		name = {
			chest = "Enchant Chest - Greater Mana",
		},
		spellID = { 13663 },
		stats = {
			mana = 50,
		},
	},
	[863] = {
		itemID = { 38820 },
		name = {
			["off hand"] = "Enchant Shield - Lesser Block",
		},
		spellID = { 13689 },
		stats = {
			["parry rating"] = 10,
		},
	},
	[865] = {
		itemID = { 38823 },
		name = {
			hands = "Enchant Gloves - Skinning",
		},
		spellID = { 13698 },
		stats = {
			skinning = 5,
		},
	},
	[866] = {
		itemID = { 38824 },
		name = {
			chest = "Enchant Chest - Lesser Stats",
		},
		spellID = { 13700 },
		stats = {
			["all stats"] = 2,
		},
	},
	[884] = {
		itemID = { 38825 },
		name = {
			back = "Enchant Cloak - Greater Defense",
		},
		spellID = { 13746 },
		stats = {
			armor = 50,
		},
	},
	[903] = {
		itemID = { 38826 },
		name = {
			back = "Enchant Cloak - Resistance",
		},
		spellID = { 13794 },
		stats = {
			["all resistances"] = 3,
		},
	},
	[904] = {
		itemID = { 38827, 38844 },
		name = {
			feet = "Enchant Boots - Agility",
			hands = "Enchant Gloves - Agility",
		},
		spellID = { 13815, 13935 },
		stats = {
			agility = 5,
		},
	},
	[905] = {
		itemID = { 38829 },
		name = {
			wrist = "Enchant Bracer - Intellect",
		},
		spellID = { 13822 },
		stats = {
			intellect = 5,
		},
	},
	[906] = {
		itemID = { 38831 },
		name = {
			hands = "Enchant Gloves - Advanced Mining",
		},
		spellID = { 13841 },
		stats = {
			mining = 5,
		},
	},
	[907] = {
		itemID = { 38832, 38839 },
		name = {
			["off hand"] = "Enchant Shield - Greater Spirit",
			wrist = "Enchant Bracer - Greater Spirit",
		},
		spellID = { 13846, 13905 },
		stats = {
			spirit = 7,
		},
	},
	[908] = {
		itemID = { 38833 },
		name = {
			chest = "Enchant Chest - Superior Health",
		},
		spellID = { 13858 },
		stats = {
			health = 50,
		},
	},
	[909] = {
		itemID = { 38834 },
		name = {
			hands = "Enchant Gloves - Advanced Herbalism",
		},
		spellID = { 13868 },
		stats = {
			herbalism = 5,
		},
	},
	[910] = {
		itemID = { 38893 },
		name = {
			back = "Enchant Cloak - Stealth",
		},
		spellID = { 25083 },
		stats = {
			agility = 8,
			["dodge rating"] = 8,
		},
	},
	[911] = {
		itemID = { 38837 },
		name = {
			feet = "Enchant Boots - Minor Speed",
		},
		spellID = { 13890 },
		stats = {
			["minor run speed"] = 1,
		},
	},
	[912] = {
		itemID = { 38840 },
		name = {
			weapon = "Enchant Weapon - Demonslaying",
		},
		spellID = { 13915 },
		stats = {
			demonslaying = 1,
		},
	},
	[913] = {
		itemID = { 38841 },
		name = {
			chest = "Enchant Chest - Superior Mana",
		},
		spellID = { 13917 },
		stats = {
			mana = 65,
		},
	},
	[923] = {
		itemID = { 38842 },
		name = {
			wrist = "Enchant Bracer - Deflection",
		},
		spellID = { 13931 },
		stats = {
			["dodge rating"] = 5,
		},
	},
	[924] = {
		itemID = { 38768 },
		name = {
			wrist = "Enchant Bracer - Minor Deflection",
		},
		spellID = { 7428 },
		stats = {
			["dodge rating"] = 2,
		},
	},
	[925] = {
		itemID = { 38811 },
		name = {
			wrist = "Enchant Bracer - Lesser Deflection",
		},
		spellID = { 13646 },
		stats = {
			["dodge rating"] = 3,
		},
	},
	[926] = {
		itemID = { 38843 },
		name = {
			["off hand"] = "Enchant Shield - Frost Resistance",
		},
		spellID = { 13933 },
		stats = {
			["frost resistance"] = 8,
		},
	},
	[927] = {
		itemID = { 38846, 38857 },
		name = {
			hands = "Enchant Gloves - Greater Strength",
			wrist = "Enchant Bracer - Greater Strength",
		},
		spellID = { 13939, 20013 },
		stats = {
			strength = 7,
		},
	},
	[928] = {
		itemID = { 38847 },
		name = {
			chest = "Enchant Chest - Stats",
		},
		spellID = { 13941 },
		stats = {
			["all stats"] = 3,
		},
	},
	[929] = {
		itemID = { 38849, 38861, 38862 },
		name = {
			feet = "Enchant Boots - Greater Stamina",
			["off hand"] = "Enchant Shield - Greater Stamina",
			wrist = "Enchant Bracer - Greater Stamina",
		},
		spellID = { 13945, 20017, 20020 },
		stats = {
			stamina = 7,
		},
	},
	[930] = {
		itemID = { 38850 },
		name = {
			hands = "Enchant Gloves - Riding Skill",
		},
		spellID = { 13947 },
		stats = {
			["mount speed (percent)"] = 2,
		},
	},
	[931] = {
		itemID = { 38851 },
		name = {
			hands = "Enchant Gloves - Minor Haste",
		},
		spellID = { 13948 },
		stats = {
			["haste rating"] = 10,
		},
	},
	[943] = {
		itemID = { 38796, 38821 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Lesser Impact",
			weapon = "Enchant Weapon - Striking",
		},
		spellID = { 13529, 13693 },
		stats = {
			["average melee weapon damage"] = 3,
			["maximum melee weapon damage"] = 3,
		},
	},
	[963] = {
		itemID = { 38845, 38917 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Greater Impact",
			weapon = "Enchant Weapon - Major Striking",
		},
		spellID = { 13937, 27967 },
		stats = {
			["average melee weapon damage"] = 7,
			["maximum melee weapon damage"] = 7,
		},
	},
	[983] = {
		itemID = { 38959, 38976 },
		name = {
			back = "Enchant Cloak - Superior Agility",
			feet = "Enchant Boots - Superior Agility",
		},
		spellID = { 44500, 44589 },
		stats = {
			agility = 16,
		},
	},
	[1071] = {
		itemID = { 38945 },
		name = {
			["off hand"] = "Enchant Shield - Major Stamina",
		},
		spellID = { 34009 },
		stats = {
			stamina = 18,
		},
	},
	[1075] = {
		itemID = { 38966 },
		name = {
			feet = "Enchant Boots - Greater Fortitude",
		},
		spellID = { 44528 },
		stats = {
			stamina = 22,
		},
	},
	[1099] = {
		itemID = { 44457 },
		name = {
			back = "Enchant Cloak - Major Agility",
		},
		spellID = { 60663 },
		stats = {
			agility = 22,
		},
	},
	[1103] = {
		itemID = { 38995 },
		name = {
			weapon = "Enchant Weapon - Exceptional Agility",
		},
		spellID = { 44633 },
		stats = {
			agility = 26,
		},
	},
	[1119] = {
		itemID = { 38968 },
		name = {
			wrist = "Enchant Bracers - Exceptional Intellect",
		},
		spellID = { 44555 },
		stats = {
			intellect = 16,
		},
	},
	[1128] = {
		itemID = { 44455 },
		name = {
			["off hand"] = "Enchant Shield - Greater Intellect",
		},
		spellID = { 60653 },
		stats = {
			intellect = 25,
		},
	},
	[1144] = {
		itemID = { 38928 },
		name = {
			chest = "Enchant Chest - Major Spirit",
		},
		spellID = { 33990 },
		stats = {
			spirit = 15,
		},
	},
	[1147] = {
		itemID = { 38961, 38980 },
		name = {
			feet = "Enchant Boots - Greater Spirit",
			wrist = "Enchant Bracers - Major Spirit",
		},
		spellID = { 44508, 44593 },
		stats = {
			spirit = 18,
		},
	},
	[1257] = {
		itemID = { 38941 },
		name = {
			back = "Enchant Cloak - Greater Arcane Resistance",
		},
		spellID = { 34005 },
		stats = {
			["arcane resistance"] = 15,
		},
	},
	[1262] = {
		itemID = { 38982 },
		name = {
			back = "Enchant Cloak - Superior Arcane Resistance",
		},
		spellID = { 44596 },
		stats = {
			["arcane resistance"] = 20,
		},
	},
	[1354] = {
		itemID = { 38969 },
		name = {
			back = "Enchant Cloak - Superior Fire Resistance",
		},
		spellID = { 44556 },
		stats = {
			["fire resistance"] = 20,
		},
	},
	[1400] = {
		itemID = { 38956 },
		name = {
			back = "Enchant Cloak - Superior Nature Resistance",
		},
		spellID = { 44494 },
		stats = {
			["nature resistance"] = 20,
		},
	},
	[1441] = {
		itemID = { 38942 },
		name = {
			back = "Enchant Cloak - Greater Shadow Resistance",
		},
		spellID = { 34006 },
		stats = {
			["shadow resistance"] = 15,
		},
	},
	[1446] = {
		itemID = { 38977 },
		name = {
			back = "Enchant Cloak - Superior Shadow Resistance",
		},
		spellID = { 44590 },
		stats = {
			["shadow resistance"] = 20,
		},
	},
	[1483] = {
		itemID = { 11622 },
		name = {
			head = "Lesser Arcanum of Rumination",
			legs = "Lesser Arcanum of Rumination",
		},
		stats = {
			mana = 150,
		},
	},
	[1503] = {
		itemID = { 11642 },
		name = {
			head = "Lesser Arcanum of Constitution",
			legs = "Lesser Arcanum of Constitution",
		},
		stats = {
			health = 100,
		},
	},
	[1504] = {
		itemID = { 11643 },
		name = {
			head = "Lesser Arcanum of Tenacity",
			legs = "Lesser Arcanum of Tenacity",
		},
		stats = {
			armor = 125,
		},
	},
	[1505] = {
		itemID = { 11644 },
		name = {
			head = "Lesser Arcanum of Resilience",
			legs = "Lesser Arcanum of Resilience",
		},
		stats = {
			["fire resistance"] = 20,
		},
	},
	[1506] = {
		itemID = { 11645 },
		name = {
			head = "Lesser Arcanum of Voracity",
			legs = "Lesser Arcanum of Voracity",
		},
		stats = {
			strength = 8,
		},
	},
	[1507] = {
		itemID = { 11646 },
		name = {
			head = "Lesser Arcanum of Voracity",
			legs = "Lesser Arcanum of Voracity",
		},
		stats = {
			stamina = 8,
		},
	},
	[1508] = {
		itemID = { 11647 },
		name = {
			head = "Lesser Arcanum of Voracity",
			legs = "Lesser Arcanum of Voracity",
		},
		stats = {
			agility = 8,
		},
	},
	[1509] = {
		itemID = { 11648 },
		name = {
			head = "Lesser Arcanum of Voracity",
			legs = "Lesser Arcanum of Voracity",
		},
		stats = {
			intellect = 8,
		},
	},
	[1510] = {
		itemID = { 11649 },
		name = {
			head = "Lesser Arcanum of Voracity",
			legs = "Lesser Arcanum of Voracity",
		},
		stats = {
			spirit = 8,
		},
	},
	[1593] = {
		itemID = { 38938 },
		name = {
			wrist = "Enchant Bracer - Assault",
		},
		spellID = { 34002 },
		stats = {
			["attack power"] = 24,
		},
	},
	[1594] = {
		itemID = { 38934 },
		name = {
			hands = "Enchant Gloves - Assault",
		},
		spellID = { 33996 },
		stats = {
			["attack power"] = 26,
		},
	},
	[1597] = {
		itemID = { 44469 },
		name = {
			feet = "Enchant Boots - Greater Assault",
		},
		spellID = { 60763 },
		stats = {
			["attack power"] = 32,
		},
	},
	[1600] = {
		itemID = { 38971 },
		name = {
			wrist = "Enchant Bracers - Striking",
		},
		spellID = { 60616 },
		stats = {
			["attack power"] = 38,
		},
	},
	[1603] = {
		itemID = { 44458 },
		name = {
			hands = "Enchant Gloves - Crusher",
		},
		spellID = { 60668 },
		stats = {
			["attack power"] = 44,
		},
	},
	[1606] = {
		itemID = { 44453 },
		name = {
			weapon = "Enchant Weapon - Greater Potency",
		},
		spellID = { 60621 },
		stats = {
			["attack power"] = 50,
		},
	},
	[1704] = {
		itemID = { 12645 },
		name = {
			["off hand"] = "Thorium Shield Spike",
		},
		stats = {
			["maximum damage dealt on block"] = 30,
			["minimum damage dealt on block"] = 20,
		},
	},
	[1843] = {
		itemID = { 15564 },
		name = {
			chest = "Rugged Armor Kit",
			feet = "Rugged Armor Kit",
			hands = "Rugged Armor Kit",
			legs = "Rugged Armor Kit",
		},
		stats = {
			armor = 40,
		},
	},
	[1883] = {
		itemID = { 38852 },
		name = {
			wrist = "Enchant Bracer - Greater Intellect",
		},
		spellID = { 20008 },
		stats = {
			intellect = 7,
		},
	},
	[1884] = {
		itemID = { 38853 },
		name = {
			wrist = "Enchant Bracer - Superior Spirit",
		},
		spellID = { 20009 },
		stats = {
			spirit = 9,
		},
	},
	[1885] = {
		itemID = { 38854 },
		name = {
			wrist = "Enchant Bracer - Superior Strength",
		},
		spellID = { 20010 },
		stats = {
			strength = 9,
		},
	},
	[1886] = {
		itemID = { 38855 },
		name = {
			wrist = "Enchant Bracer - Superior Stamina",
		},
		spellID = { 20011 },
		stats = {
			stamina = 9,
		},
	},
	[1887] = {
		itemID = { 38856, 38863 },
		name = {
			feet = "Enchant Boots - Greater Agility",
			hands = "Enchant Gloves - Greater Agility",
		},
		spellID = { 20012, 20023 },
		stats = {
			agility = 7,
		},
	},
	[1888] = {
		itemID = { 38858, 38907 },
		name = {
			back = "Enchant Cloak - Greater Resistance",
			["off hand"] = "Enchant Shield - Resistance",
		},
		spellID = { 20014, 27947 },
		stats = {
			["all resistances"] = 5,
		},
	},
	[1889] = {
		itemID = { 38859 },
		name = {
			back = "Enchant Cloak - Superior Defense",
		},
		spellID = { 20015 },
		stats = {
			armor = 70,
		},
	},
	[1890] = {
		itemID = { 38860 },
		name = {
			["off hand"] = "Enchant Shield - Vitality",
		},
		spellID = { 20016 },
		stats = {
			spirit = 10,
			stamina = 10,
		},
	},
	[1891] = {
		itemID = { 38865, 38898 },
		name = {
			chest = "Enchant Chest - Greater Stats",
			wrist = "Enchant Bracer - Stats",
		},
		spellID = { 20025, 27905 },
		stats = {
			["all stats"] = 4,
		},
	},
	[1892] = {
		itemID = { 38866 },
		name = {
			chest = "Enchant Chest - Major Health",
		},
		spellID = { 20026 },
		stats = {
			health = 100,
		},
	},
	[1893] = {
		itemID = { 38867 },
		name = {
			chest = "Enchant Chest - Major Mana",
		},
		spellID = { 20028 },
		stats = {
			mana = 100,
		},
	},
	[1894] = {
		itemID = { 38868 },
		name = {
			weapon = "Enchant Weapon - Icy Chill",
		},
		spellID = { 20029 },
		stats = {
			["icy chill"] = 1,
		},
	},
	[1896] = {
		itemID = { 38869 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Superior Impact",
		},
		spellID = { 20030 },
		stats = {
			["average melee weapon damage"] = 9,
			["maximum melee weapon damage"] = 9,
		},
	},
	[1897] = {
		itemID = { 38822, 38870 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Impact",
			weapon = "Enchant Weapon - Superior Striking",
		},
		spellID = { 13695, 20031 },
		stats = {
			["average melee weapon damage"] = 5,
			["maximum melee weapon damage"] = 5,
		},
	},
	[1898] = {
		itemID = { 38871 },
		name = {
			weapon = "Enchant Weapon - Lifestealing",
		},
		spellID = { 20032 },
		stats = {
			lifestealing = 1,
		},
	},
	[1899] = {
		itemID = { 38872 },
		name = {
			weapon = "Enchant Weapon - Unholy Weapon",
		},
		spellID = { 20033 },
		stats = {
			["unholy weapon"] = 1,
		},
	},
	[1900] = {
		itemID = { 38873 },
		name = {
			weapon = "Enchant Weapon - Crusader",
		},
		spellID = { 20034 },
		stats = {
			crusader = 1,
		},
	},
	[1903] = {
		itemID = { 38874 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Major Spirit",
		},
		spellID = { 20035 },
		stats = {
			spirit = 9,
		},
	},
	[1904] = {
		itemID = { 38875 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Major Intellect",
		},
		spellID = { 20036 },
		stats = {
			intellect = 9,
		},
	},
	[1951] = {
		itemID = { 38978, 38999 },
		name = {
			back = "Enchant Cloak - Titanweave",
			chest = "Enchant Chest - Dodge",
		},
		spellID = { 44591, 46594 },
		stats = {
			["dodge rating"] = 16,
		},
	},
	[1952] = {
		itemID = { 38954 },
		name = {
			["off hand"] = "Enchant Shield - Dodge",
		},
		spellID = { 44489 },
		stats = {
			["dodge rating"] = 20,
		},
	},
	[1953] = {
		itemID = { 39002 },
		name = {
			chest = "Enchant Chest - Greater Dodge",
		},
		spellID = { 47766 },
		stats = {
			["dodge rating"] = 22,
		},
	},
	[2322] = {
		itemID = { 38936 },
		name = {
			hands = "Enchant Gloves - Major Healing",
		},
		spellID = { 33999 },
		stats = {
			["spell power"] = 19,
		},
	},
	[2326] = {
		itemID = { 38997 },
		name = {
			wrist = "Enchant Bracers - Greater Spellpower",
		},
		spellID = { 44635 },
		stats = {
			["spell power"] = 23,
		},
	},
	[2332] = {
		itemID = { 44470 },
		name = {
			wrist = "Enchant Bracer - Superior Spellpower",
		},
		spellID = { 60767 },
		stats = {
			["spell power"] = 30,
		},
	},
	[2381] = {
		itemID = { 38962 },
		name = {
			chest = "Enchant Chest - Greater Mana Restoration",
		},
		spellID = { 44509 },
		stats = {
			spirit = 20,
		},
	},
	[2443] = {
		itemID = { 38876 },
		name = {
			weapon = "Enchant Weapon - Winter's Might",
		},
		spellID = { 21931 },
		stats = {
			["frost spell damage"] = 7,
		},
	},
	[2463] = {
		itemID = { 38815 },
		name = {
			back = "Enchant Cloak - Fire Resistance",
		},
		spellID = { 13657 },
		stats = {
			["fire resistance"] = 7,
		},
	},
	[2483] = {
		itemID = { 18169 },
		name = {
			shoulder = "Flame Mantle of the Dawn",
		},
		stats = {
			["fire resistance"] = 5,
		},
	},
	[2484] = {
		itemID = { 18170 },
		name = {
			shoulder = "Frost Mantle of the Dawn",
		},
		stats = {
			["frost resistance"] = 5,
		},
	},
	[2485] = {
		itemID = { 18171 },
		name = {
			shoulder = "Arcane Mantle of the Dawn",
		},
		stats = {
			["arcane resistance"] = 5,
		},
	},
	[2486] = {
		itemID = { 18172 },
		name = {
			shoulder = "Nature Mantle of the Dawn",
		},
		stats = {
			["nature resistance"] = 5,
		},
	},
	[2487] = {
		itemID = { 18173 },
		name = {
			shoulder = "Shadow Mantle of the Dawn",
		},
		stats = {
			["shadow resistance"] = 5,
		},
	},
	[2488] = {
		itemID = { 18182 },
		name = {
			shoulder = "Chromatic Mantle of the Dawn",
		},
		stats = {
			["all resistances"] = 5,
		},
	},
	[2503] = {
		itemID = { 18251 },
		name = {
			chest = "Core Armor Kit",
			feet = "Core Armor Kit",
			hands = "Core Armor Kit",
			legs = "Core Armor Kit",
		},
		stats = {
			["dodge rating"] = 5,
		},
	},
	[2504] = {
		itemID = { 38877 },
		name = {
			weapon = "Enchant Weapon - Spellpower",
		},
		spellID = { 22749 },
		stats = {
			["spell power"] = 30,
		},
	},
	[2505] = {
		itemID = { 38878 },
		name = {
			weapon = "Enchant Weapon - Healing Power",
		},
		spellID = { 22750 },
		stats = {
			["spell power"] = 29,
		},
	},
	[2523] = {
		itemID = { 18283 },
		name = {
			ranged = "Biznicks 247x128 Accurascope",
		},
		stats = {
			["ranged hit rating"] = 30,
		},
	},
	[2543] = {
		itemID = { 18329 },
		name = {
			head = "Arcanum of Rapidity",
			legs = "Arcanum of Rapidity",
		},
		stats = {
			["haste rating"] = 10,
		},
	},
	[2544] = {
		itemID = { 18330 },
		name = {
			head = "Arcanum of Focus",
			legs = "Arcanum of Focus",
		},
		stats = {
			["spell power"] = 8,
		},
	},
	[2545] = {
		itemID = { 18331 },
		name = {
			head = "Arcanum of Protection",
			legs = "Arcanum of Protection",
		},
		stats = {
			["dodge rating"] = 12,
		},
	},
	[2563] = {
		itemID = { 38879 },
		name = {
			weapon = "Enchant Weapon - Strength",
		},
		spellID = { 23799 },
		stats = {
			strength = 15,
		},
	},
	[2564] = {
		itemID = { 38880, 38890 },
		name = {
			hands = "Enchant Gloves - Superior Agility",
			weapon = "Enchant Weapon - Agility",
		},
		spellID = { 23800, 25080 },
		stats = {
			agility = 15,
		},
	},
	[2565] = {
		itemID = { 38881 },
		name = {
			wrist = "Enchant Bracer - Mana Regeneration",
		},
		spellID = { 23801 },
		stats = {
			spirit = 9,
		},
	},
	[2567] = {
		itemID = { 38883 },
		name = {
			weapon = "Enchant Weapon - Mighty Spirit",
		},
		spellID = { 23803 },
		stats = {
			spirit = 20,
		},
	},
	[2568] = {
		itemID = { 38884 },
		name = {
			weapon = "Enchant Weapon - Mighty Intellect",
		},
		spellID = { 23804 },
		stats = {
			intellect = 22,
		},
	},
	[2583] = {
		itemID = { 19782 },
		name = {
			head = "Presence of Might",
			legs = "Presence of Might",
		},
		stats = {
			["dodge rating"] = 10,
			["parry rating"] = 10,
			stamina = 10,
		},
	},
	[2584] = {
		itemID = { 19783 },
		name = {
			head = "Syncretist's Sigil",
			legs = "Syncretist's Sigil",
		},
		stats = {
			["dodge rating"] = 10,
			intellect = 10,
			stamina = 10,
		},
	},
	[2587] = {
		itemID = { 19786 },
		name = {
			head = "Vodouisant's Vigilant Embrace",
			legs = "Vodouisant's Vigilant Embrace",
		},
		stats = {
			intellect = 15,
			["spell power"] = 13,
		},
	},
	[2588] = {
		itemID = { 19787 },
		name = {
			head = "Presence of Sight",
			legs = "Presence of Sight",
		},
		stats = {
			["hit rating"] = 8,
			["spell power"] = 18,
		},
	},
	[2589] = {
		itemID = { 19788 },
		name = {
			head = "Hoodoo Hex",
			legs = "Hoodoo Hex",
		},
		stats = {
			["spell power"] = 18,
			stamina = 10,
		},
	},
	[2590] = {
		itemID = { 19789 },
		name = {
			head = "Prophetic Aura",
			legs = "Prophetic Aura",
		},
		stats = {
			mp5 = 5,
			["spell power"] = 13,
			stamina = 10,
		},
	},
	[2591] = {
		itemID = { 19790 },
		name = {
			head = "Animist's Caress",
			legs = "Animist's Caress",
		},
		stats = {
			intellect = 10,
			["spell power"] = 12,
			stamina = 10,
		},
	},
	[2603] = {
		itemID = { 38802 },
		name = {
			hands = "Enchant Gloves - Fishing",
		},
		spellID = { 13620 },
		stats = {
			fishing = 2,
		},
	},
	[2604] = {
		itemID = { 20078 },
		name = {
			shoulder = "Zandalar Signet of Serenity",
		},
		stats = {
			["spell power"] = 18,
		},
	},
	[2605] = {
		itemID = { 20076 },
		name = {
			shoulder = "Zandalar Signet of Mojo",
		},
		stats = {
			["spell power"] = 18,
		},
	},
	[2606] = {
		itemID = { 20077 },
		name = {
			shoulder = "Zandalar Signet of Might",
		},
		stats = {
			["attack power"] = 30,
		},
	},
	[2613] = {
		itemID = { 38885 },
		name = {
			hands = "Enchant Gloves - Threat",
		},
		spellID = { 25072 },
		stats = {
			["threat (percent)"] = 2,
		},
	},
	[2614] = {
		itemID = { 38886 },
		name = {
			hands = "Enchant Gloves - Shadow Power",
		},
		spellID = { 25073 },
		stats = {
			["shadow spell damage"] = 20,
		},
	},
	[2615] = {
		itemID = { 38887 },
		name = {
			hands = "Enchant Gloves - Frost Power",
		},
		spellID = { 25074 },
		stats = {
			["frost spell damage"] = 20,
		},
	},
	[2616] = {
		itemID = { 38888 },
		name = {
			hands = "Enchant Gloves - Fire Power",
		},
		spellID = { 25078 },
		stats = {
			["fire spell damage"] = 20,
		},
	},
	[2617] = {
		itemID = { 38889 },
		name = {
			hands = "Enchant Gloves - Healing Power",
		},
		spellID = { 25079 },
		stats = {
			["spell power"] = 16,
		},
	},
	[2619] = {
		itemID = { 38891 },
		name = {
			back = "Enchant Cloak - Greater Fire Resistance",
		},
		spellID = { 25081 },
		stats = {
			["fire resistance"] = 15,
		},
	},
	[2620] = {
		itemID = { 38892 },
		name = {
			back = "Enchant Cloak - Greater Nature Resistance",
		},
		spellID = { 25082 },
		stats = {
			["nature resistance"] = 15,
		},
	},
	[2621] = {
		itemID = { 38894 },
		name = {
			back = "Enchant Cloak - Subtlety",
		},
		spellID = { 25084 },
		stats = {
			["threat reduction (percent)"] = 2,
		},
	},
	[2622] = {
		itemID = { 38895 },
		name = {
			back = "Enchant Cloak - Dodge",
		},
		spellID = { 25086 },
		stats = {
			["dodge rating"] = 12,
		},
	},
	[2646] = {
		itemID = { 38896 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Agility",
		},
		spellID = { 27837 },
		stats = {
			agility = 25,
		},
	},
	[2647] = {
		itemID = { 38897 },
		name = {
			wrist = "Enchant Bracer - Brawn",
		},
		spellID = { 27899 },
		stats = {
			strength = 12,
		},
	},
	[2648] = {
		itemID = { 38899, 39000 },
		name = {
			back = "Enchant Cloak - Steelweave",
			wrist = "Enchant Bracer - Greater Dodge",
		},
		spellID = { 27906, 47051 },
		stats = {
			["dodge rating"] = 12,
		},
	},
	[2649] = {
		itemID = { 38902, 38909 },
		name = {
			feet = "Enchant Boots - Fortitude",
			wrist = "Enchant Bracer - Fortitude",
		},
		spellID = { 27914, 27950 },
		stats = {
			stamina = 12,
		},
	},
	[2650] = {
		itemID = { 38882, 38900, 38903 },
		name = {
			wrist = { "Enchant Bracer - Healing Power", "Enchant Bracer - Spellpower", "Enchant Bracer - Superior Healing" },
		},
		spellID = { 23802, 27911, 27917 },
		stats = {
			["spell power"] = 15,
		},
	},
	[2653] = {
		itemID = { 38904 },
		name = {
			["off hand"] = "Enchant Shield - Tough Shield",
		},
		spellID = { 27944 },
		stats = {
			["dodge rating"] = 12,
		},
	},
	[2654] = {
		itemID = { 38905 },
		name = {
			["off hand"] = "Enchant Shield - Intellect",
		},
		spellID = { 27945 },
		stats = {
			intellect = 12,
		},
	},
	[2655] = {
		itemID = { 38906 },
		name = {
			["off hand"] = "Enchant Shield - Shield Block",
		},
		spellID = { 27946 },
		stats = {
			["parry rating"] = 15,
		},
	},
	[2656] = {
		itemID = { 38908 },
		name = {
			feet = "Enchant Boots - Vitality",
		},
		spellID = { 27948 },
		stats = {
			spirit = 10,
			stamina = 10,
		},
	},
	[2657] = {
		itemID = { 37603 },
		name = {
			feet = "Enchant Boots - Dexterity",
		},
		spellID = { 27951 },
		stats = {
			agility = 12,
		},
	},
	[2658] = {
		itemID = { 38910 },
		name = {
			feet = "Enchant Boots - Surefooted",
		},
		spellID = { 27954 },
		stats = {
			["critical strike rating"] = 10,
			["hit rating"] = 10,
		},
	},
	[2659] = {
		itemID = { 38911 },
		name = {
			chest = "Enchant Chest - Exceptional Health",
		},
		spellID = { 27957 },
		stats = {
			health = 150,
		},
	},
	[2661] = {
		itemID = { 38987 },
		name = {
			chest = "Enchant Chest - Exceptional Stats",
			wrist = "Enchant Bracers - Greater Stats",
		},
		spellID = { 27960, 44616 },
		stats = {
			["all stats"] = 6,
		},
	},
	[2662] = {
		itemID = { 38914 },
		name = {
			back = "Enchant Cloak - Major Armor",
		},
		spellID = { 27961 },
		stats = {
			armor = 120,
		},
	},
	[2664] = {
		itemID = { 38915 },
		name = {
			back = "Enchant Cloak - Major Resistance",
		},
		spellID = { 27962 },
		stats = {
			["all resistances"] = 7,
		},
	},
	[2666] = {
		itemID = { 38918 },
		name = {
			weapon = "Enchant Weapon - Major Intellect",
		},
		spellID = { 27968 },
		stats = {
			intellect = 30,
		},
	},
	[2667] = {
		itemID = { 38919 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Savagery",
		},
		spellID = { 27971 },
		stats = {
			["attack power"] = 70,
		},
	},
	[2668] = {
		itemID = { 38920 },
		name = {
			weapon = "Enchant Weapon - Potency",
		},
		spellID = { 27972 },
		stats = {
			strength = 20,
		},
	},
	[2669] = {
		itemID = { 38921 },
		name = {
			weapon = "Enchant Weapon - Major Spellpower",
		},
		spellID = { 27975 },
		stats = {
			["spell power"] = 40,
		},
	},
	[2670] = {
		itemID = { 38922 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Major Agility",
		},
		spellID = { 27977 },
		stats = {
			agility = 35,
		},
	},
	[2671] = {
		itemID = { 38923 },
		name = {
			weapon = "Enchant Weapon - Sunfire",
		},
		spellID = { 27981 },
		stats = {
			["arcane spell damage"] = 50,
			["fire spell damage"] = 50,
		},
	},
	[2672] = {
		itemID = { 38924 },
		name = {
			weapon = "Enchant Weapon - Soulfrost",
		},
		spellID = { 27982 },
		stats = {
			["frost spell damage"] = 54,
			["shadow spell damage"] = 54,
		},
	},
	[2673] = {
		itemID = { 38925 },
		name = {
			weapon = "Enchant Weapon - Mongoose",
		},
		spellID = { 27984 },
		stats = {
			mongoose = 1,
		},
	},
	[2674] = {
		itemID = { 38926 },
		name = {
			weapon = "Enchant Weapon - Spellsurge",
		},
		spellID = { 28003 },
		stats = {
			spellsurge = 1,
		},
	},
	[2675] = {
		itemID = { 38927 },
		name = {
			weapon = "Enchant Weapon - Battlemaster",
		},
		spellID = { 28004 },
		stats = {
			battlemaster = 1,
		},
	},
	[2679] = {
		itemID = { 38901 },
		name = {
			wrist = "Enchant Bracer - Restore Mana Prime",
		},
		spellID = { 27913 },
		stats = {
			spirit = 12,
		},
	},
	[2681] = {
		itemID = { 22635 },
		name = {
			head = "Savage Guard",
			legs = "Savage Guard",
		},
		stats = {
			["nature resistance"] = 10,
		},
	},
	[2682] = {
		itemID = { 22636 },
		name = {
			head = "Ice Guard",
			legs = "Ice Guard",
		},
		stats = {
			["frost resistance"] = 10,
		},
	},
	[2683] = {
		itemID = { 22638 },
		name = {
			head = "Shadow Guard",
			legs = "Shadow Guard",
		},
		stats = {
			["shadow resistance"] = 10,
		},
	},
	[2714] = {
		itemID = { 23530 },
		name = {
			["off hand"] = "Felsteel Shield Spike",
		},
		stats = {
			["maximum damage dealt on block"] = 38,
			["minimum damage dealt on block"] = 26,
		},
	},
	[2715] = {
		itemID = { 23547 },
		name = {
			shoulder = "Resilience of the Scourge",
		},
		stats = {
			mp5 = 6,
			["spell power"] = 16,
		},
	},
	[2716] = {
		itemID = { 23549 },
		name = {
			shoulder = "Fortitude of the Scourge",
		},
		stats = {
			armor = 100,
			stamina = 16,
		},
	},
	[2717] = {
		itemID = { 23548 },
		name = {
			shoulder = "Might of the Scourge",
		},
		stats = {
			["attack power"] = 26,
			["critical strike rating"] = 14,
		},
	},
	[2721] = {
		itemID = { 23545 },
		name = {
			shoulder = "Power of the Scourge",
		},
		stats = {
			["critical strike rating"] = 14,
			["spell power"] = 15,
		},
	},
	[2722] = {
		itemID = { 23764 },
		name = {
			ranged = "Adamantite Scope",
		},
		stats = {
			["average ranged weapon damage"] = 10,
			["maximum ranged weapon damage"] = 10,
		},
	},
	[2723] = {
		itemID = { 23765 },
		name = {
			ranged = "Khorium Scope",
		},
		stats = {
			["average ranged weapon damage"] = 12,
			["maximum ranged weapon damage"] = 12,
		},
	},
	[2724] = {
		itemID = { 23766 },
		name = {
			ranged = "Stabilized Eternium Scope",
		},
		stats = {
			["critical strike rating"] = 28,
		},
	},
	[2745] = {
		itemID = { 24275 },
		name = {
			legs = "Silver Spellthread",
		},
		stats = {
			["spell power"] = 25,
			stamina = 15,
		},
	},
	[2746] = {
		itemID = { 24276 },
		name = {
			legs = "Golden Spellthread",
		},
		stats = {
			["spell power"] = 35,
			stamina = 20,
		},
	},
	[2747] = {
		itemID = { 24273 },
		name = {
			legs = "Mystic Spellthread",
		},
		stats = {
			["spell power"] = 25,
			stamina = 15,
		},
	},
	[2748] = {
		itemID = { 24274 },
		name = {
			legs = "Runic Spellthread",
		},
		stats = {
			["spell power"] = 35,
			stamina = 20,
		},
	},
	[2792] = {
		itemID = { 25650 },
		name = {
			chest = "Knothide Armor Kit",
			feet = "Knothide Armor Kit",
			hands = "Knothide Armor Kit",
			legs = "Knothide Armor Kit",
		},
		stats = {
			stamina = 8,
		},
	},
	[2793] = {
		itemID = { 25651 },
		name = {
			chest = "Vindicator's Armor Kit",
			feet = "Vindicator's Armor Kit",
			hands = "Vindicator's Armor Kit",
			legs = "Vindicator's Armor Kit",
		},
		stats = {
			["dodge rating"] = 8,
		},
	},
	[2794] = {
		itemID = { 25652 },
		name = {
			chest = "Magister's Armor Kit",
			feet = "Magister's Armor Kit",
			hands = "Magister's Armor Kit",
			legs = "Magister's Armor Kit",
		},
		stats = {
			spirit = 8,
		},
	},
	[2841] = {
		itemID = { 34330 },
		name = {
			chest = "Heavy Knothide Armor Kit",
			feet = "Heavy Knothide Armor Kit",
			hands = "Heavy Knothide Armor Kit",
			head = "Heavy Knothide Armor Kit",
			legs = "Heavy Knothide Armor Kit",
			shoulder = "Heavy Knothide Armor Kit",
		},
		stats = {
			stamina = 10,
		},
	},
	[2928] = {
		name = {
			finger = "Enchant Ring - Spellpower",
		},
		spellID = { 27924 },
		stats = {
			["spell power"] = 12,
		},
	},
	[2929] = {
		name = {
			finger = "Enchant Ring - Striking",
		},
		spellID = { 27920 },
		stats = {
			["average melee weapon damage"] = 2,
			["average ranged weapon damage"] = 2,
			["maximum melee weapon damage"] = 2,
			["maximum ranged weapon damage"] = 2,
		},
	},
	[2930] = {
		name = {
			finger = "Enchant Ring - Healing Power",
		},
		spellID = { 27926 },
		stats = {
			["spell power"] = 12,
		},
	},
	[2931] = {
		name = {
			finger = "Enchant Ring - Stats",
		},
		spellID = { 27927 },
		stats = {
			["all stats"] = 4,
		},
	},
	[2933] = {
		itemID = { 38930 },
		name = {
			chest = "Enchant Chest - Major Resilience",
		},
		spellID = { 33992 },
		stats = {
			["resilience rating"] = 15,
		},
	},
	[2934] = {
		itemID = { 38931 },
		name = {
			hands = "Enchant Gloves - Blasting",
		},
		spellID = { 33993 },
		stats = {
			["critical strike rating"] = 10,
		},
	},
	[2935] = {
		itemID = { 38932 },
		name = {
			hands = "Enchant Gloves - Precise Strikes",
		},
		spellID = { 33994 },
		stats = {
			["hit rating"] = 15,
		},
	},
	[2937] = {
		itemID = { 38935 },
		name = {
			hands = "Enchant Gloves - Major Spellpower",
		},
		spellID = { 33997 },
		stats = {
			["spell power"] = 20,
		},
	},
	[2938] = {
		itemID = { 38939 },
		name = {
			back = "Enchant Cloak - Spell Penetration",
		},
		spellID = { 34003 },
		stats = {
			["spell penetration"] = 20,
		},
	},
	[2939] = {
		itemID = { 38943 },
		name = {
			feet = "Enchant Boots - Cat's Swiftness",
		},
		spellID = { 34007 },
		stats = {
			agility = 6,
			["minor run speed"] = 1,
		},
	},
	[2940] = {
		itemID = { 38944 },
		name = {
			feet = "Enchant Boots - Boar's Speed",
		},
		spellID = { 34008 },
		stats = {
			["minor run speed"] = 1,
			stamina = 9,
		},
	},
	[2977] = {
		itemID = { 28882 },
		name = {
			shoulder = "Inscription of Warding",
		},
		stats = {
			["dodge rating"] = 13,
		},
	},
	[2978] = {
		itemID = { 28889 },
		name = {
			shoulder = "Greater Inscription of Warding",
		},
		stats = {
			["dodge rating"] = 15,
			stamina = 15,
		},
	},
	[2979] = {
		itemID = { 28878 },
		name = {
			shoulder = "Inscription of Faith",
		},
		stats = {
			["spell power"] = 15,
		},
	},
	[2980] = {
		itemID = { 28887 },
		name = {
			shoulder = "Greater Inscription of Faith",
		},
		stats = {
			intellect = 15,
			spirit = 10,
		},
	},
	[2981] = {
		itemID = { 28881 },
		name = {
			shoulder = "Inscription of Discipline",
		},
		stats = {
			["spell power"] = 15,
		},
	},
	[2982] = {
		itemID = { 28886 },
		name = {
			shoulder = "Greater Inscription of Discipline",
		},
		stats = {
			["critical strike rating"] = 10,
			["spell power"] = 18,
		},
	},
	[2983] = {
		itemID = { 28885 },
		name = {
			shoulder = "Inscription of Vengeance",
		},
		stats = {
			["attack power"] = 26,
		},
	},
	[2984] = {
		itemID = { 29483 },
		name = {
			chest = "Shadow Armor Kit",
			feet = "Shadow Armor Kit",
			hands = "Shadow Armor Kit",
			legs = "Shadow Armor Kit",
		},
		stats = {
			["shadow resistance"] = 8,
		},
	},
	[2985] = {
		itemID = { 29485 },
		name = {
			chest = "Flame Armor Kit",
			feet = "Flame Armor Kit",
			hands = "Flame Armor Kit",
			legs = "Flame Armor Kit",
		},
		stats = {
			["fire resistance"] = 8,
		},
	},
	[2986] = {
		itemID = { 28888 },
		name = {
			shoulder = "Greater Inscription of Vengeance",
		},
		stats = {
			["attack power"] = 30,
			["critical strike rating"] = 10,
		},
	},
	[2987] = {
		itemID = { 29486 },
		name = {
			chest = "Frost Armor Kit",
			feet = "Frost Armor Kit",
			hands = "Frost Armor Kit",
			legs = "Frost Armor Kit",
		},
		stats = {
			["frost resistance"] = 8,
		},
	},
	[2988] = {
		itemID = { 29487 },
		name = {
			chest = "Nature Armor Kit",
			feet = "Nature Armor Kit",
			hands = "Nature Armor Kit",
			legs = "Nature Armor Kit",
		},
		stats = {
			["nature resistance"] = 8,
		},
	},
	[2989] = {
		itemID = { 29488 },
		name = {
			chest = "Arcane Armor Kit",
			feet = "Arcane Armor Kit",
			hands = "Arcane Armor Kit",
			legs = "Arcane Armor Kit",
		},
		stats = {
			["arcane resistance"] = 8,
		},
	},
	[2990] = {
		itemID = { 28908 },
		name = {
			shoulder = "Inscription of the Knight",
		},
		stats = {
			["dodge rating"] = 13,
		},
	},
	[2991] = {
		itemID = { 28911 },
		name = {
			shoulder = "Greater Inscription of the Knight",
		},
		stats = {
			["dodge rating"] = 10,
			["parry rating"] = 15,
		},
	},
	[2992] = {
		itemID = { 28904 },
		name = {
			shoulder = "Inscription of the Oracle",
		},
		stats = {
			spirit = 12,
		},
	},
	[2993] = {
		itemID = { 28912 },
		name = {
			shoulder = "Greater Inscription of the Oracle",
		},
		stats = {
			intellect = 10,
			spirit = 16,
		},
	},
	[2994] = {
		itemID = { 28903 },
		name = {
			shoulder = "Inscription of the Orb",
		},
		stats = {
			["critical strike rating"] = 13,
		},
	},
	[2995] = {
		itemID = { 28909 },
		name = {
			shoulder = "Greater Inscription of the Orb",
		},
		stats = {
			["critical strike rating"] = 15,
			["spell power"] = 12,
		},
	},
	[2996] = {
		itemID = { 28907 },
		name = {
			shoulder = "Inscription of the Blade",
		},
		stats = {
			["critical strike rating"] = 13,
		},
	},
	[2997] = {
		itemID = { 28910 },
		name = {
			shoulder = "Greater Inscription of the Blade",
		},
		stats = {
			["attack power"] = 20,
			["critical strike rating"] = 15,
		},
	},
	[2998] = {
		itemID = { 29187 },
		name = {
			shoulder = "Inscription of Endurance",
		},
		stats = {
			["all resistances"] = 7,
		},
	},
	[2999] = {
		itemID = { 29186 },
		name = {
			head = "Arcanum of the Defender",
		},
		stats = {
			["dodge rating"] = 17,
			["parry rating"] = 16,
		},
	},
	[3001] = {
		itemID = { 29189, 29190 },
		name = {
			head = "Arcanum of Renewal",
		},
		stats = {
			intellect = 16,
			spirit = 18,
		},
	},
	[3002] = {
		itemID = { 29191 },
		name = {
			head = "Arcanum of Power",
		},
		stats = {
			["hit rating"] = 14,
			["spell power"] = 22,
		},
	},
	[3003] = {
		itemID = { 29192 },
		name = {
			head = "Arcanum of Ferocity",
		},
		stats = {
			["attack power"] = 34,
			["hit rating"] = 16,
		},
	},
	[3004] = {
		itemID = { 29193 },
		name = {
			head = "Arcanum of the Gladiator",
		},
		stats = {
			["resilience rating"] = 20,
			stamina = 18,
		},
	},
	[3005] = {
		itemID = { 29194 },
		name = {
			head = "Arcanum of Nature Warding",
		},
		stats = {
			["nature resistance"] = 20,
		},
	},
	[3006] = {
		itemID = { 29195 },
		name = {
			head = "Arcanum of Arcane Warding",
		},
		stats = {
			["arcane resistance"] = 20,
		},
	},
	[3007] = {
		itemID = { 29196, 29197 },
		name = {
			head = "Arcanum of Fire Warding",
		},
		stats = {
			["fire resistance"] = 20,
		},
	},
	[3008] = {
		itemID = { 29198 },
		name = {
			head = "Arcanum of Frost Warding",
		},
		stats = {
			["frost resistance"] = 20,
		},
	},
	[3009] = {
		itemID = { 29199 },
		name = {
			head = "Arcanum of Shadow Warding",
		},
		stats = {
			["shadow resistance"] = 20,
		},
	},
	[3010] = {
		itemID = { 29533 },
		name = {
			legs = "Cobrahide Leg Armor",
		},
		stats = {
			["attack power"] = 40,
			["critical strike rating"] = 10,
		},
	},
	[3011] = {
		itemID = { 29534 },
		name = {
			legs = "Clefthide Leg Armor",
		},
		stats = {
			agility = 10,
			stamina = 30,
		},
	},
	[3012] = {
		itemID = { 29535 },
		name = {
			legs = "Nethercobra Leg Armor",
		},
		stats = {
			["attack power"] = 50,
			["critical strike rating"] = 12,
		},
	},
	[3013] = {
		itemID = { 29536 },
		name = {
			legs = "Nethercleft Leg Armor",
		},
		stats = {
			agility = 12,
			stamina = 40,
		},
	},
	[3096] = {
		itemID = { 30846 },
		name = {
			head = "Arcanum of the Outcast",
		},
		stats = {
			intellect = 16,
			strength = 17,
		},
	},
	[3150] = {
		itemID = { 38929 },
		name = {
			chest = "Enchant Chest - Restore Mana Prime",
		},
		spellID = { 33991 },
		stats = {
			spirit = 14,
		},
	},
	[3222] = {
		itemID = { 38947, 38967 },
		name = {
			hands = "Enchant Gloves - Major Agility",
			weapon = "Enchant Weapon - Greater Agility",
		},
		spellID = { 42620, 44529 },
		stats = {
			agility = 20,
		},
	},
	[3223] = {
		itemID = { 33185 },
		name = {
			weapon = "Adamantite Weapon Chain",
		},
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["parry rating"] = 15,
		},
	},
	[3225] = {
		itemID = { 38948 },
		name = {
			weapon = "Enchant Weapon - Executioner",
		},
		spellID = { 42974 },
		stats = {
			executioner = 1,
		},
	},
	[3229] = {
		itemID = { 38949 },
		name = {
			["off hand"] = "Enchant Shield - Resilience",
		},
		spellID = { 44383 },
		stats = {
			["resilience rating"] = 12,
		},
	},
	[3230] = {
		itemID = { 38950 },
		name = {
			back = "Enchant Cloak - Superior Frost Resistance",
		},
		spellID = { 44483 },
		stats = {
			["frost resistance"] = 20,
		},
	},
	[3231] = {
		itemID = { 38951, 38984 },
		name = {
			hands = "Enchant Gloves - Expertise",
			wrist = "Enchant Bracer - Expertise",
		},
		spellID = { 44484, 44598 },
		stats = {
			["expertise rating"] = 15,
		},
	},
	[3232] = {
		itemID = { 39006 },
		name = {
			feet = "Enchant Boots - Tuskarr's Vitality",
		},
		spellID = { 47901 },
		stats = {
			["minor run speed"] = 1,
			stamina = 15,
		},
	},
	[3233] = {
		itemID = { 38912 },
		name = {
			chest = "Enchant Chest - Exceptional Mana",
		},
		spellID = { 27958 },
		stats = {
			mana = 250,
		},
	},
	[3234] = {
		itemID = { 38953 },
		name = {
			hands = "Enchant Gloves - Precision",
		},
		spellID = { 44488 },
		stats = {
			["hit rating"] = 20,
		},
	},
	[3236] = {
		itemID = { 38955 },
		name = {
			chest = "Enchant Chest - Mighty Health",
		},
		spellID = { 44492 },
		stats = {
			health = 200,
		},
	},
	[3238] = {
		itemID = { 38960 },
		name = {
			hands = "Enchant Gloves - Gatherer",
		},
		spellID = { 44506 },
		stats = {
			herbalism = 5,
			mining = 5,
			skinning = 5,
		},
	},
	[3239] = {
		itemID = { 38965 },
		name = {
			weapon = "Enchant Weapon - Icebreaker",
		},
		spellID = { 44524 },
		stats = {
			icebreaker = 1,
		},
	},
	[3241] = {
		itemID = { 38972 },
		name = {
			weapon = "Enchant Weapon - Lifeward",
		},
		spellID = { 44576 },
		stats = {
			lifeward = 1,
		},
	},
	[3243] = {
		itemID = { 38973 },
		name = {
			back = "Enchant Cloak - Spell Piercing",
		},
		spellID = { 44582 },
		stats = {
			["spell penetration"] = 35,
		},
	},
	[3244] = {
		itemID = { 38974 },
		name = {
			feet = "Enchant Boots - Greater Vitality",
		},
		spellID = { 44584 },
		stats = {
			spirit = 14,
			stamina = 14,
		},
	},
	[3245] = {
		itemID = { 38975 },
		name = {
			chest = "Enchant Chest - Exceptional Resilience",
		},
		spellID = { 44588 },
		stats = {
			["resilience rating"] = 20,
		},
	},
	[3246] = {
		itemID = { 38979 },
		name = {
			hands = "Enchant Gloves - Exceptional Spellpower",
		},
		spellID = { 44592 },
		stats = {
			["spell power"] = 28,
		},
	},
	[3247] = {
		itemID = { 38981 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Scourgebane",
		},
		spellID = { 44595 },
		stats = {
			["attack power against undead"] = 140,
		},
	},
	[3251] = {
		itemID = { 38988 },
		name = {
			weapon = "Enchant Weapon - Giant Slayer",
		},
		spellID = { 44621 },
		stats = {
			["giant slayer"] = 1,
		},
	},
	[3252] = {
		itemID = { 38989 },
		name = {
			chest = "Enchant Chest - Super Stats",
		},
		spellID = { 44623 },
		stats = {
			["all stats"] = 8,
		},
	},
	[3253] = {
		itemID = { 38990 },
		name = {
			hands = "Enchant Gloves - Armsman",
		},
		spellID = { 44625 },
		stats = {
			["parry rating"] = 10,
			["threat (percent)"] = 2,
		},
	},
	[3256] = {
		itemID = { 38993 },
		name = {
			back = "Enchant Cloak - Shadow Armor",
		},
		spellID = { 44631 },
		stats = {
			agility = 10,
			armor = 40,
		},
	},
	[3260] = {
		itemID = { 34207 },
		name = {
			hands = "Glove Reinforcements",
		},
		stats = {
			armor = 240,
		},
	},
	[3269] = {
		itemID = { 34836 },
		name = {
			["two-hand"] = "Spun Truesilver Fishing Line",
		},
		stats = {
			fishing = 3,
		},
	},
	[3273] = {
		itemID = { 38998 },
		name = {
			weapon = "Enchant Weapon - Deathfrost",
		},
		spellID = { 46578 },
		stats = {
			deathfrost = 1,
		},
	},
	[3294] = {
		itemID = { 39001 },
		name = {
			back = "Enchant Cloak - Mighty Armor",
		},
		spellID = { 47672 },
		stats = {
			armor = 225,
		},
	},
	[3296] = {
		itemID = { 39004 },
		name = {
			back = "Enchant Cloak - Wisdom",
		},
		spellID = { 47899 },
		stats = {
			spirit = 10,
			["threat reduction (percent)"] = 2,
		},
	},
	[3297] = {
		itemID = { 39005 },
		name = {
			chest = "Enchant Chest - Super Health",
		},
		spellID = { 47900 },
		stats = {
			health = 275,
		},
	},
-- 	[3315] = {
-- 		stats = {
-- 			["mount speed (percent)"] = 3,
-- 		},
-- 	},
	[3325] = {
		itemID = { 38371 },
		name = {
			legs = "Jormungar Leg Armor",
		},
		stats = {
			agility = 15,
			stamina = 45,
		},
	},
	[3326] = {
		itemID = { 38372 },
		name = {
			legs = "Nerubian Leg Armor",
		},
		stats = {
			["attack power"] = 55,
			["critical strike rating"] = 15,
		},
	},
	[3327] = {
		name = {
			legs = "Jormungar Leg Reinforcements",
		},
		spellID = { 60583 },
		stats = {
			agility = 22,
			stamina = 55,
		},
	},
	[3328] = {
		name = {
			legs = "Nerubian Leg Reinforcements",
		},
		spellID = { 60584 },
		stats = {
			["attack power"] = 75,
			["critical strike rating"] = 22,
		},
	},
	[3329] = {
		itemID = { 38375 },
		name = {
			chest = "Borean Armor Kit",
			feet = "Borean Armor Kit",
			hands = "Borean Armor Kit",
			head = "Borean Armor Kit",
			legs = "Borean Armor Kit",
			shoulder = "Borean Armor Kit",
		},
		stats = {
			stamina = 12,
		},
	},
	[3330] = {
		itemID = { 38376 },
		name = {
			chest = "Heavy Borean Armor Kit",
			feet = "Heavy Borean Armor Kit",
			hands = "Heavy Borean Armor Kit",
			head = "Heavy Borean Armor Kit",
			legs = "Heavy Borean Armor Kit",
			shoulder = "Heavy Borean Armor Kit",
		},
		stats = {
			stamina = 18,
		},
	},
	[3365] = {
		name = {
			["two-hand"] = "Rune of Swordshattering",
		},
		spellID = { 53323 },
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["parry chance (percent)"] = 4,
		},
	},
	[3366] = {
		name = {
			weapon = "Rune of Lichbane",
		},
		spellID = { 53331 },
		stats = {
			["weapon damage (percent)"] = 2,
			["weapon damage vs undead (percent)"] = 2,
		},
	},
	[3367] = {
		name = {
			["two-hand"] = "Rune of Spellshattering",
		},
		spellID = { 53342 },
		stats = {
			["silence duration reduction (percent)"] = 50,
			["spell damage taken reduction (percent)"] = 4,
		},
	},
	[3368] = {
		name = {
			weapon = "Rune of the Fallen Crusader",
		},
		spellID = { 53344 },
		stats = {
			["rune of the fallen crusader"] = 1,
		},
	},
	[3369] = {
		name = {
			weapon = "Rune of Cinderglacier",
		},
		spellID = { 53341 },
		stats = {
			["rune of cinderglacier"] = 1,
		},
	},
	[3370] = {
		name = {
			weapon = "Rune of Razorice",
		},
		spellID = { 53343 },
		stats = {
			["rune of razorice"] = 1,
		},
	},
	[3594] = {
		name = {
			["one-hand"] = "Rune of Swordbreaking",
		},
		spellID = { 54446 },
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["parry chance (percent)"] = 2,
		},
	},
	[3595] = {
		name = {
			["one-hand"] = "Rune of Spellbreaking",
		},
		spellID = { 54447 },
		stats = {
			["silence duration reduction (percent)"] = 50,
			["spell damage taken reduction (percent)"] = 2,
		},
	},
	[3607] = {
		itemID = { 41146 },
		name = {
			ranged = "Sun Scope",
		},
		stats = {
			["ranged haste rating"] = 40,
		},
	},
	[3608] = {
		itemID = { 41167 },
		name = {
			ranged = "Heartseeker Scope",
		},
		stats = {
			["ranged critical strike rating"] = 40,
		},
	},
	[3718] = {
		itemID = { 41601 },
		name = {
			legs = "Shining Spellthread",
		},
		stats = {
			["spell power"] = 35,
			spirit = 12,
		},
	},
	[3719] = {
		itemID = { 41602 },
		name = {
			legs = "Brilliant Spellthread",
		},
		stats = {
			["spell power"] = 50,
			spirit = 20,
		},
	},
	[3720] = {
		itemID = { 41603 },
		name = {
			legs = "Azure Spellthread",
		},
		stats = {
			["spell power"] = 35,
			stamina = 20,
		},
	},
	[3721] = {
		itemID = { 41604 },
		name = {
			legs = "Sapphire Spellthread",
		},
		stats = {
			["spell power"] = 50,
			stamina = 30,
		},
	},
	[3722] = {
		name = {
			back = "Lightweave Embroidery",
		},
		spellID = { 55642 },
		stats = {
			["lightweave embroidery"] = 1,
		},
	},
	[3728] = {
		name = {
			back = "Darkglow Embroidery",
		},
		spellID = { 55769 },
		stats = {
			["darkglow embroidery"] = 1,
		},
	},
	[3729] = {
		itemID = { 41611, 55054 },
		name = {
			waist = { "Ebonsteel Belt Buckle", "Eternal Belt Buckle" },
		},
		stats = {
			["prismatic socket"] = 1,
		},
	},
	[3730] = {
		name = {
			back = "Swordguard Embroidery",
		},
		spellID = { 55777 },
		stats = {
			["swordguard embroidery"] = 1,
		},
	},
	[3731] = {
		itemID = { 41976 },
		name = {
			weapon = "Titanium Weapon Chain",
		},
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["hit rating"] = 28,
		},
	},
	[3748] = {
		itemID = { 42500 },
		name = {
			["off hand"] = "Titanium Shield Spike",
		},
		stats = {
			["maximum damage dealt on block"] = 67,
			["minimum damage dealt on block"] = 45,
		},
	},
	[3754] = {
		itemID = { 19785 },
		name = {
			head = "Falcon's Call",
			legs = "Falcon's Call",
		},
		stats = {
			["attack power"] = 24,
			["hit rating"] = 10,
			stamina = 10,
		},
	},
	[3755] = {
		itemID = { 19784 },
		name = {
			head = "Death's Embrace",
			legs = "Death's Embrace",
		},
		stats = {
			["attack power"] = 28,
			["dodge rating"] = 12,
		},
	},
	[3756] = {
		name = {
			wrist = "Fur Lining - Attack Power",
		},
		spellID = { 57683 },
		stats = {
			["attack power"] = 130,
		},
	},
	[3757] = {
		name = {
			wrist = "Fur Lining - Stamina",
		},
		spellID = { 57690 },
		stats = {
			stamina = 102,
		},
	},
	[3758] = {
		name = {
			wrist = "Fur Lining - Spell Power",
		},
		spellID = { 57691 },
		stats = {
			["spell power"] = 76,
		},
	},
	[3759] = {
		name = {
			wrist = "Fur Lining - Fire Resist",
		},
		spellID = { 57692 },
		stats = {
			["fire resistance"] = 70,
		},
	},
	[3760] = {
		name = {
			wrist = "Fur Lining - Frost Resist",
		},
		spellID = { 57694 },
		stats = {
			["frost resistance"] = 70,
		},
	},
	[3761] = {
		name = {
			wrist = "Fur Lining - Shadow Resist",
		},
		spellID = { 57696 },
		stats = {
			["shadow resistance"] = 70,
		},
	},
	[3762] = {
		name = {
			wrist = "Fur Lining - Nature Resist",
		},
		spellID = { 57699 },
		stats = {
			["nature resistance"] = 70,
		},
	},
	[3763] = {
		name = {
			wrist = "Fur Lining - Arcane Resist",
		},
		spellID = { 57701 },
		stats = {
			["arcane resistance"] = 70,
		},
	},
	[3788] = {
		itemID = { 44497 },
		name = {
			weapon = "Enchant Weapon - Accuracy",
		},
		spellID = { 59619 },
		stats = {
			["critical strike rating"] = 25,
			["hit rating"] = 25,
		},
	},
	[3789] = {
		itemID = { 44493 },
		name = {
			weapon = "Enchant Weapon - Berserking",
		},
		spellID = { 59621 },
		stats = {
			berserking = 1,
		},
	},
	[3790] = {
		itemID = { 43987 },
		name = {
			weapon = "Enchant Weapon - Black Magic",
		},
		spellID = { 59625 },
		stats = {
			["black magic"] = 1,
		},
	},
	[3791] = {
		name = {
			finger = "Enchant Ring - Stamina",
		},
		spellID = { 59636 },
		stats = {
			stamina = 30,
		},
	},
	[3793] = {
		itemID = { 44067 },
		name = {
			shoulder = "Inscription of Triumph",
		},
		stats = {
			["attack power"] = 40,
			["resilience rating"] = 15,
		},
	},
	[3794] = {
		itemID = { 44068 },
		name = {
			shoulder = "Inscription of Dominance",
		},
		stats = {
			["resilience rating"] = 15,
			["spell power"] = 23,
		},
	},
	[3795] = {
		itemID = { 44069 },
		name = {
			head = "Arcanum of Triumph",
		},
		stats = {
			["attack power"] = 50,
			["resilience rating"] = 20,
		},
	},
	[3797] = {
		itemID = { 44075 },
		name = {
			head = "Arcanum of Dominance",
		},
		stats = {
			["resilience rating"] = 20,
			["spell power"] = 29,
		},
	},
	[3806] = {
		itemID = { 44129 },
		name = {
			shoulder = "Lesser Inscription of the Storm",
		},
		stats = {
			["critical strike rating"] = 10,
			["spell power"] = 18,
		},
	},
	[3807] = {
		itemID = { 44130 },
		name = {
			shoulder = "Lesser Inscription of the Crag",
		},
		stats = {
			intellect = 15,
			spirit = 10,
		},
	},
	[3808] = {
		itemID = { 44133, 50335 },
		name = {
			shoulder = "Greater Inscription of the Axe",
		},
		stats = {
			["attack power"] = 40,
			["critical strike rating"] = 15,
		},
	},
	[3809] = {
		itemID = { 44134, 50336 },
		name = {
			shoulder = "Greater Inscription of the Crag",
		},
		stats = {
			intellect = 21,
			spirit = 16,
		},
	},
	[3810] = {
		itemID = { 44135, 50338 },
		name = {
			shoulder = "Greater Inscription of the Storm",
		},
		stats = {
			["critical strike rating"] = 15,
			["spell power"] = 24,
		},
	},
	[3811] = {
		itemID = { 44136, 50337 },
		name = {
			shoulder = "Greater Inscription of the Pinnacle",
		},
		stats = {
			["dodge rating"] = 20,
			stamina = 22,
		},
	},
	[3812] = {
		itemID = { 44137 },
		name = {
			head = "Arcanum of the Frosty Soul",
		},
		stats = {
			["frost resistance"] = 25,
			stamina = 30,
		},
	},
	[3813] = {
		itemID = { 44138 },
		name = {
			head = "Arcanum of Toxic Warding",
		},
		stats = {
			["nature resistance"] = 25,
			stamina = 30,
		},
	},
	[3814] = {
		itemID = { 44139 },
		name = {
			head = "Arcanum of the Fleeing Shadow",
		},
		stats = {
			["shadow resistance"] = 25,
			stamina = 30,
		},
	},
	[3815] = {
		itemID = { 44140 },
		name = {
			head = "Arcanum of the Eclipsed Moon",
		},
		stats = {
			["arcane resistance"] = 25,
			stamina = 30,
		},
	},
	[3816] = {
		itemID = { 44141 },
		name = {
			head = "Arcanum of the Flame's Soul",
		},
		stats = {
			["fire resistance"] = 25,
			stamina = 30,
		},
	},
	[3817] = {
		itemID = { 44149, 50367 },
		name = {
			head = "Arcanum of Torment",
		},
		stats = {
			["attack power"] = 50,
			["critical strike rating"] = 20,
		},
	},
	[3818] = {
		itemID = { 44150, 50369 },
		name = {
			head = "Arcanum of the Stalwart Protector",
		},
		stats = {
			["dodge rating"] = 20,
			stamina = 37,
		},
	},
	[3819] = {
		itemID = { 44152, 50370 },
		name = {
			head = "Arcanum of Blissful Mending",
		},
		stats = {
			intellect = 26,
			spirit = 20,
		},
	},
	[3820] = {
		itemID = { 44159, 50368 },
		name = {
			head = "Arcanum of Burning Mysteries",
		},
		stats = {
			["critical strike rating"] = 20,
			intellect = 26,
		},
	},
	[3822] = {
		itemID = { 38373 },
		name = {
			legs = "Frosthide Leg Armor",
		},
		stats = {
			agility = 22,
			stamina = 55,
		},
	},
	[3823] = {
		itemID = { 38374 },
		name = {
			legs = "Icescale Leg Armor",
		},
		stats = {
			["attack power"] = 75,
			["critical strike rating"] = 22,
		},
	},
	[3824] = {
		itemID = { 44449 },
		name = {
			feet = "Enchant Boots - Assault",
		},
		spellID = { 60606 },
		stats = {
			["attack power"] = 24,
		},
	},
	[3825] = {
		itemID = { 44456 },
		name = {
			back = "Enchant Cloak - Speed",
		},
		spellID = { 60609 },
		stats = {
			["haste rating"] = 15,
		},
	},
	[3826] = {
		itemID = { 38986 },
		name = {
			feet = "Enchant Boots - Icewalker",
		},
		spellID = { 60623 },
		stats = {
			["critical strike rating"] = 12,
			["hit rating"] = 12,
		},
	},
	[3827] = {
		itemID = { 44463 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Massacre",
		},
		spellID = { 60691 },
		stats = {
			["attack power"] = 110,
		},
	},
	[3828] = {
		itemID = { 38992 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Greater Savagery",
		},
		spellID = { 44630 },
		stats = {
			["attack power"] = 85,
		},
	},
	[3829] = {
		itemID = { 38964 },
		name = {
			hands = "Enchant Gloves - Greater Assault",
		},
		spellID = { 44513 },
		stats = {
			["attack power"] = 35,
		},
	},
	[3830] = {
		itemID = { 38991 },
		name = {
			weapon = "Enchant Weapon - Exceptional Spellpower",
		},
		spellID = { 44629 },
		stats = {
			["spell power"] = 50,
		},
	},
	[3831] = {
		itemID = { 39003 },
		name = {
			back = "Enchant Cloak - Greater Speed",
		},
		spellID = { 47898 },
		stats = {
			["haste rating"] = 23,
		},
	},
	[3832] = {
		itemID = { 44465 },
		name = {
			chest = "Enchant Chest - Powerful Stats",
		},
		spellID = { 60692 },
		stats = {
			["all stats"] = 10,
		},
	},
	[3833] = {
		itemID = { 44466 },
		name = {
			weapon = "Enchant Weapon - Superior Potency",
		},
		spellID = { 60707 },
		stats = {
			["attack power"] = 65,
		},
	},
	[3834] = {
		itemID = { 44467 },
		name = {
			weapon = "Enchant Weapon - Mighty Spellpower",
		},
		spellID = { 60714 },
		stats = {
			["spell power"] = 63,
		},
	},
	[3835] = {
		name = {
			shoulder = "Master's Inscription of the Axe",
		},
		spellID = { 61117 },
		stats = {
			["attack power"] = 120,
			["critical strike rating"] = 15,
		},
	},
	[3836] = {
		name = {
			shoulder = "Master's Inscription of the Crag",
		},
		spellID = { 61118 },
		stats = {
			intellect = 60,
			spirit = 15,
		},
	},
	[3837] = {
		name = {
			shoulder = "Master's Inscription of the Pinnacle",
		},
		spellID = { 61119 },
		stats = {
			["dodge rating"] = 60,
			["parry rating"] = 15,
		},
	},
	[3838] = {
		name = {
			shoulder = "Master's Inscription of the Storm",
		},
		spellID = { 61120 },
		stats = {
			["critical strike rating"] = 15,
			["spell power"] = 70,
		},
	},
	[3839] = {
		name = {
			finger = "Enchant Ring - Assault",
		},
		spellID = { 44645 },
		stats = {
			["attack power"] = 40,
		},
	},
	[3840] = {
		name = {
			finger = "Enchant Ring - Greater Spellpower",
		},
		spellID = { 44636 },
		stats = {
			["spell power"] = 23,
		},
	},
	[3842] = {
		itemID = { 44701, 44702, 50372, 50373 },
		name = {
			head = "Arcanum of the Savage Gladiator",
		},
		stats = {
			["resilience rating"] = 25,
			stamina = 30,
		},
	},
	[3843] = {
		itemID = { 44739 },
		name = {
			ranged = "Diamond-Cut Refractor Scope",
		},
		stats = {
			["average ranged weapon damage"] = 15,
			["maximum ranged weapon damage"] = 15,
		},
	},
	[3844] = {
		itemID = { 38963 },
		name = {
			weapon = "Enchant Weapon - Exceptional Spirit",
		},
		spellID = { 44510 },
		stats = {
			spirit = 45,
		},
	},
	[3845] = {
		itemID = { 44815 },
		name = {
			wrist = "Enchant Bracers - Greater Assault",
		},
		spellID = { 44575 },
		stats = {
			["attack power"] = 50,
		},
	},
	[3846] = {
		itemID = { 38946 },
		name = {
			weapon = "Enchant Weapon - Major Healing",
		},
		spellID = { 34010 },
		stats = {
			["spell power"] = 40,
		},
	},
	[3847] = {
		name = {
			["two-hand"] = "Rune of the Stoneskin Gargoyle",
		},
		spellID = { 62158 },
		stats = {
			["armor (percent)"] = 4,
			["stamina (percent)"] = 2,
		},
	},
	[3849] = {
		itemID = { 44936 },
		name = {
			["off hand"] = "Titanium Plating",
		},
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["parry rating"] = 26,
		},
	},
	[3850] = {
		itemID = { 44947 },
		name = {
			wrist = "Enchant Bracer - Major Stamina",
		},
		spellID = { 62256 },
		stats = {
			stamina = 40,
		},
	},
	[3852] = {
		itemID = { 44957 },
		name = {
			shoulder = "Greater Inscription of the Gladiator",
		},
		stats = {
			["resilience rating"] = 15,
			stamina = 30,
		},
	},
	[3853] = {
		itemID = { 44963 },
		name = {
			legs = "Earthen Leg Armor",
		},
		stats = {
			["resilience rating"] = 40,
			stamina = 28,
		},
	},
	[3854] = {
		itemID = { 45056 },
		name = {
			["two-hand"] = "Enchant Staff - Greater Spellpower",
		},
		spellID = { 62948 },
		stats = {
			["spell power"] = 81,
		},
	},
	[3855] = {
		itemID = { 45060 },
		name = {
			["two-hand"] = "Enchant Staff - Spellpower",
		},
		spellID = { 62959 },
		stats = {
			["spell power"] = 69,
		},
	},
	[3858] = {
		itemID = { 45628 },
		name = {
			feet = "Enchant Boots - Lesser Accuracy",
		},
		spellID = { 63746 },
		stats = {
			["hit rating"] = 5,
		},
	},
	[3869] = {
		itemID = { 46026 },
		name = {
			weapon = "Enchant Weapon - Blade Ward",
		},
		spellID = { 64441 },
		stats = {
			["blade ward"] = 1,
		},
	},
	[3870] = {
		itemID = { 46098 },
		name = {
			weapon = "Enchant Weapon - Blood Draining",
		},
		spellID = { 64579 },
		stats = {
			["blood draining"] = 1,
		},
	},
	[3872] = {
		name = {
			legs = "Sanctified Spellthread",
		},
		spellID = { 56039 },
		stats = {
			["spell power"] = 50,
			spirit = 20,
		},
	},
	[3873] = {
		name = {
			legs = "Master's Spellthread",
		},
		spellID = { 56034 },
		stats = {
			["spell power"] = 50,
			stamina = 30,
		},
	},
	[3875] = {
		itemID = { 44131 },
		name = {
			shoulder = "Lesser Inscription of the Axe",
		},
		stats = {
			["attack power"] = 30,
			["critical strike rating"] = 10,
		},
	},
	[3876] = {
		itemID = { 44132 },
		name = {
			shoulder = "Lesser Inscription of the Pinnacle",
		},
		stats = {
			["dodge rating"] = 15,
			["parry rating"] = 10,
		},
	},
	[3883] = {
		name = {
			["one-hand"] = "Rune of the Nerubian Carapace",
		},
		spellID = { 70164 },
		stats = {
			["armor (percent)"] = 2,
			["stamina (percent)"] = 1,
		},
	},
	[4061] = {
		itemID = { 52687 },
		name = {
			hands = "Enchant Gloves - Mastery",
		},
		spellID = { 74132 },
		stats = {
			["mastery rating"] = 50,
		},
	},
	[4062] = {
		itemID = { 52743 },
		name = {
			feet = "Enchant Boots - Earthen Vitality",
		},
		spellID = { 74189 },
		stats = {
			["minor run speed"] = 1,
			stamina = 30,
		},
	},
	[4063] = {
		itemID = { 52744 },
		name = {
			chest = "Enchant Chest - Mighty Stats",
		},
		spellID = { 74191 },
		stats = {
			["all stats"] = 15,
		},
	},
	[4064] = {
		itemID = { 52745 },
		name = {
			back = "Enchant Cloak - Greater Spell Piercing",
		},
		spellID = { 74192 },
		stats = {
			["spell penetration"] = 70,
		},
	},
	[4065] = {
		itemID = { 52746 },
		name = {
			wrist = "Enchant Bracer - Speed",
		},
		spellID = { 74193 },
		stats = {
			["haste rating"] = 50,
		},
	},
	[4066] = {
		itemID = { 52747 },
		name = {
			weapon = "Enchant Weapon - Mending",
		},
		spellID = { 74195 },
		stats = {
			["sometimes heal you when you deal damage"] = 1,
		},
	},
	[4067] = {
		itemID = { 52748 },
		name = {
			weapon = "Enchant Weapon - Avalanche",
		},
		spellID = { 74197 },
		stats = {
			avalanche = 1,
		},
	},
	[4068] = {
		itemID = { 52749 },
		name = {
			hands = "Enchant Gloves - Haste",
		},
		spellID = { 74198 },
		stats = {
			["haste rating"] = 50,
		},
	},
	[4069] = {
		itemID = { 52750 },
		name = {
			feet = "Enchant Boots - Haste",
		},
		spellID = { 74199 },
		stats = {
			["haste rating"] = 50,
		},
	},
	[4070] = {
		itemID = { 52751 },
		name = {
			chest = "Enchant Chest - Stamina",
		},
		spellID = { 74200 },
		stats = {
			stamina = 55,
		},
	},
	[4071] = {
		itemID = { 52752 },
		name = {
			wrist = "Enchant Bracer - Critical Strike",
		},
		spellID = { 74201 },
		stats = {
			["critical strike rating"] = 50,
		},
	},
	[4072] = {
		itemID = { 52753 },
		name = {
			back = "Enchant Cloak - Intellect",
		},
		spellID = { 74202 },
		stats = {
			intellect = 30,
		},
	},
	[4073] = {
		itemID = { 52754 },
		name = {
			["off hand"] = "Enchant Shield - Protection",
		},
		spellID = { 74207 },
		stats = {
			armor = 160,
		},
	},
	[4074] = {
		itemID = { 52755 },
		name = {
			weapon = "Enchant Weapon - Elemental Slayer",
		},
		spellID = { 74211 },
		stats = {
			["Elemental Slayer"] = 1,
		},
	},
	[4075] = {
		itemID = { 52756 },
		name = {
			hands = "Enchant Gloves - Exceptional Strength",
		},
		spellID = { 74212 },
		stats = {
			strength = 35,
		},
	},
	[4076] = {
		itemID = { 52757 },
		name = {
			feet = "Enchant Boots - Major Agility",
		},
		spellID = { 74213 },
		stats = {
			agility = 35,
		},
	},
	[4077] = {
		itemID = { 52758 },
		name = {
			chest = "Enchant Chest - Mighty Resilience",
		},
		spellID = { 74214 },
		stats = {
			["resilience rating"] = 40,
		},
	},
	[4078] = {
		name = {
			finger = "Enchant Ring - Strength",
		},
		spellID = { 74215 },
		stats = {
			strength = 40,
		},
	},
	[4079] = {
		name = {
			finger = "Enchant Ring - Agility",
		},
		spellID = { 74216 },
		stats = {
			agility = 40,
		},
	},
	[4080] = {
		name = {
			finger = "Enchant Ring - Intellect",
		},
		spellID = { 74217 },
		stats = {
			intellect = 40,
		},
	},
	[4081] = {
		name = {
			finger = "Enchant Ring - Greater Stamina",
		},
		spellID = { 74218 },
		stats = {
			stamina = 60,
		},
	},
	[4082] = {
		itemID = { 52759 },
		name = {
			hands = "Enchant Gloves - Greater Expertise",
		},
		spellID = { 74220 },
		stats = {
			["expertise rating"] = 50,
		},
	},
	[4083] = {
		itemID = { 52760 },
		name = {
			weapon = "Enchant Weapon - Hurricane",
		},
		spellID = { 74223 },
		stats = {
			hurricane = 1,
		},
	},
	[4084] = {
		itemID = { 52761 },
		name = {
			weapon = "Enchant Weapon - Heartsong",
		},
		spellID = { 74225 },
		stats = {
			heartsong = 1,
		},
	},
	[4085] = {
		itemID = { 52762 },
		name = {
			["off hand"] = "Enchant Shield - Mastery",
		},
		spellID = { 74226 },
		stats = {
			["mastery rating"] = 50,
		},
	},
	[4086] = {
		itemID = { 52763 },
		name = {
			wrist = "Enchant Bracer - Dodge",
		},
		spellID = { 74229 },
		stats = {
			["dodge rating"] = 50,
		},
	},
	[4087] = {
		itemID = { 52764 },
		name = {
			back = "Enchant Cloak - Critical Strike",
		},
		spellID = { 74230 },
		stats = {
			["critical strike rating"] = 50,
		},
	},
	[4088] = {
		itemID = { 52765 },
		name = {
			chest = "Enchant Chest - Exceptional Spirit",
		},
		spellID = { 74231 },
		stats = {
			spirit = 40,
		},
	},
	[4089] = {
		itemID = { 52766 },
		name = {
			wrist = "Enchant Bracer - Precision",
		},
		spellID = { 74232 },
		stats = {
			["hit rating"] = 50,
		},
	},
	[4090] = {
		itemID = { 52767 },
		name = {
			back = "Enchant Cloak - Protection",
		},
		spellID = { 74234 },
		stats = {
			armor = 250,
		},
	},
	[4091] = {
		itemID = { 52768 },
		name = {
			["held in off-hand"] = "Enchant Off-Hand - Superior Intellect",
			["off hand"] = "Enchant Off-Hand - Superior Intellect",
		},
		spellID = { 74235 },
		stats = {
			intellect = 40,
		},
	},
	[4092] = {
		itemID = { 52769 },
		name = {
			feet = "Enchant Boots - Precision",
		},
		spellID = { 74236 },
		stats = {
			["hit rating"] = 50,
		},
	},
	[4093] = {
		itemID = { 52770 },
		name = {
			wrist = "Enchant Bracer - Exceptional Spirit",
		},
		spellID = { 74237 },
		stats = {
			spirit = 50,
		},
	},
	[4094] = {
		itemID = { 52771 },
		name = {
			feet = "Enchant Boots - Mastery",
		},
		spellID = { 74238 },
		stats = {
			["mastery rating"] = 50,
		},
	},
	[4095] = {
		itemID = { 52772 },
		name = {
			wrist = "Enchant Bracer - Greater Expertise",
		},
		spellID = { 74239 },
		stats = {
			["expertise rating"] = 50,
		},
	},
	[4096] = {
		itemID = { 52773 },
		name = {
			back = "Enchant Cloak - Greater Intellect",
		},
		spellID = { 74240 },
		stats = {
			intellect = 50,
		},
	},
	[4097] = {
		itemID = { 52774 },
		name = {
			weapon = "Enchant Weapon - Power Torrent",
		},
		spellID = { 74242 },
		stats = {
			["Power Torrent"] = 1,
		},
	},
	[4098] = {
		itemID = { 52775 },
		name = {
			weapon = "Enchant Weapon - Windwalk",
		},
		spellID = { 74244 },
		stats = {
			windwalk = 1,
		},
	},
	[4099] = {
		itemID = { 52776 },
		name = {
			weapon = "Enchant Weapon - Landslide",
		},
		spellID = { 74246 },
		stats = {
			landslide = 1,
		},
	},
	[4100] = {
		itemID = { 52777 },
		name = {
			back = "Enchant Cloak - Greater Critical Strike",
		},
		spellID = { 74247 },
		stats = {
			["critical strike rating"] = 65,
		},
	},
	[4101] = {
		itemID = { 52778 },
		name = {
			wrist = "Enchant Bracer - Greater Critical Strike",
		},
		spellID = { 74248 },
		stats = {
			["critical strike rating"] = 65,
		},
	},
	[4102] = {
		itemID = { 52779 },
		name = {
			chest = "Enchant Chest - Peerless Stats",
		},
		spellID = { 74250 },
		stats = {
			["all stats"] = 20,
		},
	},
	[4103] = {
		itemID = { 52780 },
		name = {
			chest = "Enchant Chest - Greater Stamina",
		},
		spellID = { 74251 },
		stats = {
			stamina = 75,
		},
	},
	[4104] = {
		itemID = { 52782 },
		name = {
			feet = "Enchant Boots - Lavawalker",
		},
		spellID = { 74253 },
		stats = {
			["mastery rating"] = 35,
			["minor run speed"] = 1,
		},
	},
	[4105] = {
		itemID = { 52781 },
		name = {
			feet = "Enchant Boots - Assassin's Step",
		},
		spellID = { 74252 },
		stats = {
			agility = 25,
			["minor run speed"] = 1,
		},
	},
	[4106] = {
		itemID = { 52783 },
		name = {
			hands = "Enchant Gloves - Mighty Strength",
		},
		spellID = { 74254 },
		stats = {
			strength = 50,
		},
	},
	[4107] = {
		itemID = { 52784 },
		name = {
			hands = "Enchant Gloves - Greater Mastery",
		},
		spellID = { 74255 },
		stats = {
			["mastery rating"] = 65,
		},
	},
	[4108] = {
		itemID = { 52785 },
		name = {
			wrist = "Enchant Bracer - Greater Speed",
		},
		spellID = { 74256 },
		stats = {
			["haste rating"] = 65,
		},
	},
	[4109] = {
		itemID = { 54449 },
		name = {
			legs = "Ghostly Spellthread",
		},
		stats = {
			intellect = 55,
			spirit = 45,
		},
	},
	[4110] = {
		itemID = { 54450 },
		name = {
			legs = "Powerful Ghostly Spellthread",
		},
		stats = {
			intellect = 95,
			spirit = 55,
		},
	},
	[4111] = {
		itemID = { 54447 },
		name = {
			legs = "Enchanted Spellthread",
		},
		stats = {
			intellect = 55,
			stamina = 65,
		},
	},
	[4112] = {
		itemID = { 54448 },
		name = {
			legs = "Powerful Enchanted Spellthread",
		},
		stats = {
			intellect = 95,
			stamina = 80,
		},
	},
	[4113] = {
		name = {
			legs = "Master's Spellthread",
		},
		spellID = { 75154 },
		stats = {
			intellect = 95,
			stamina = 80,
		},
	},
	[4114] = {
		name = {
			legs = "Sanctified Spellthread",
		},
		spellID = { 75155 },
		stats = {
			intellect = 95,
			spirit = 55,
		},
	},
	[4115] = {
		name = {
			back = "Lightweave Embroidery",
		},
		spellID = { 75172 },
		stats = {
			-- TODO: properly handle this when procs are handled
			["lightweave embroidery"] = 2,
		},
	},
	[4116] = {
		name = {
			back = "Darkglow Ebroidery",
		},
		spellID = { 75175 },
		stats = {
			-- TODO: properly handle this when procs are handled
			["darkglow embroidery"] = 2,
		},
	},
	[4118] = {
		name = {
			back = "Swordguard Embroidery",
		},
		spellID = { 75178 },
		stats = {
			-- TODO: properly handle this when procs are handled
			["swordguard embroidery"] = 2,
		},
	},
	[4120] = {
		itemID = { 56477 },
		name = {
			chest = "Savage Armor Kit",
			feet = "Savage Armor Kit",
			hands = "Savage Armor Kit",
			head = "Savage Armor Kit",
			legs = "Savage Armor Kit",
			shoulder = "Savage Armor Kit",
		},
		stats = {
			stamina = 36,
		},
	},
	[4121] = {
		itemID = { 56517 },
		name = {
			chest = "Heavy Savage Armor Kit",
			feet = "Heavy Savage Armor Kit",
			hands = "Heavy Savage Armor Kit",
			head = "Heavy Savage Armor Kit",
			legs = "Heavy Savage Armor Kit",
			shoulder = "Heavy Savage Armor Kit",
		},
		stats = {
			stamina = 44,
		},
	},
	[4122] = {
		itemID = { 56502 },
		name = {
			legs = "Scorched Leg Armor",
		},
		stats = {
			["attack power"] = 110,
			["critical strike rating"] = 45,
		},
	},
	[4124] = {
		itemID = { 56503 },
		name = {
			legs = "Twilight Leg Armor",
		},
		stats = {
			agility = 45,
			stamina = 85,
		},
	},
	[4126] = {
		itemID = { 56550 },
		name = {
			legs = { "Dragonbone Leg Reinforcements", "Dragonscale Leg Armor" },
		},
		spellID = { 85067 },
		stats = {
			["attack power"] = 190,
			["critical strike rating"] = 55,
		},
	},
	[4127] = {
		itemID = { 56551 },
		name = {
			legs = { "Charscale Leg Armor", "Charscale Leg Reinforcements" },
		},
		spellID = { 85068 },
		stats = {
			agility = 55,
			stamina = 145,
		},
	},
	[4175] = {
		itemID = { 59594 },
		name = {
			ranged = "Gnomish X-Ray Scope",
		},
		stats = {
			["gnomish x-ray scope"] = 1,
		},
	},
	[4176] = {
		itemID = { 59595 },
		name = {
			ranged = "R19 Threatfinder",
		},
		stats = {
			["ranged hit rating"] = 88,
		},
	},
	[4177] = {
		itemID = { 59596 },
		name = {
			ranged = "Safety Catch Removal Kit",
		},
		stats = {
			["ranged haste rating"] = 88,
		},
	},
	[4189] = {
		name = {
			wrist = "Draconic Embossment - Stamina",
		},
		spellID = { 85007 },
		stats = {
			stamina = 195,
		},
	},
	[4190] = {
		name = {
			wrist = "Draconic Embossment - Agility",
		},
		spellID = { 85008 },
		stats = {
			agility = 130,
		},
	},
	[4191] = {
		name = {
			wrist = "Draconic Embossment - Strength",
		},
		spellID = { 85009 },
		stats = {
			strength = 130,
		},
	},
	[4192] = {
		name = {
			wrist = "Draconic Embossment - Intellect",
		},
		spellID = { 85010 },
		stats = {
			intellect = 130,
		},
	},
	[4193] = {
		name = {
			shoulder = "Swiftsteel Inscription",
		},
		spellID = { 86375 },
		stats = {
			agility = 130,
			["mastery rating"] = 25,
		},
	},
	[4194] = {
		name = {
			shoulder = "Lionsmane Inscription",
		},
		spellID = { 86401 },
		stats = {
			["critical strike rating"] = 25,
			strength = 130,
		},
	},
	[4195] = {
		name = {
			shoulder = "Inscription of the Earth Prince",
		},
		spellID = { 86402 },
		stats = {
			["dodge rating"] = 25,
			stamina = 195,
		},
	},
	[4196] = {
		name = {
			shoulder = "Felfire Inscription",
		},
		spellID = { 86403 },
		stats = {
			["haste rating"] = 25,
			intellect = 130,
		},
	},
	[4197] = {
		itemID = { 62321 },
		name = {
			shoulder = "Lesser Inscription of Unbreakable Quartz",
		},
		stats = {
			["dodge rating"] = 20,
			stamina = 45,
		},
	},
	[4198] = {
		itemID = { 62333 },
		name = {
			shoulder = "Greater Inscription of Unbreakable Quartz",
		},
		stats = {
			["dodge rating"] = 25,
			stamina = 75,
		},
	},
	[4199] = {
		itemID = { 62342 },
		name = {
			shoulder = "Lesser Inscription of Charged Lodestone",
		},
		stats = {
			["haste rating"] = 20,
			intellect = 30,
		},
	},
	[4200] = {
		itemID = { 62343 },
		name = {
			shoulder = "Greater Inscription of Charged Lodestone",
		},
		stats = {
			["haste rating"] = 25,
			intellect = 50,
		},
	},
	[4201] = {
		itemID = { 62344 },
		name = {
			shoulder = "Lesser Inscription of Jagged Stone",
		},
		stats = {
			["critical strike rating"] = 20,
			strength = 30,
		},
	},
	[4202] = {
		itemID = { 62345 },
		name = {
			shoulder = "Greater Inscription of Jagged Stone",
		},
		stats = {
			["critical strike rating"] = 25,
			strength = 50,
		},
	},
	[4204] = {
		itemID = { 62346 },
		name = {
			shoulder = "Greater Inscription of Shattered Crystal",
		},
		stats = {
			agility = 50,
			["mastery rating"] = 25,
		},
	},
	[4205] = {
		itemID = { 62347 },
		name = {
			shoulder = "Lesser Inscription of Shattered Crystal",
		},
		stats = {
			agility = 30,
			["mastery rating"] = 20,
		},
	},
	[4206] = {
		itemID = { 62366 },
		name = {
			head = "Arcanum of the Earthen Ring",
		},
		stats = {
			["dodge rating"] = 35,
			stamina = 90,
		},
	},
	[4207] = {
		itemID = { 62367 },
		name = {
			head = "Arcanum of Hyjal",
		},
		stats = {
			["critical strike rating"] = 35,
			intellect = 60,
		},
	},
	[4208] = {
		itemID = { 62368, 62422 },
		name = {
			head = { "Arcanum of the Dragonmaw", "Arcanum of the Wildhammer" },
		},
		stats = {
			["mastery rating"] = 35,
			strength = 60,
		},
	},
	[4209] = {
		itemID = { 62369 },
		name = {
			head = "Arcanum of the Ramkahen",
		},
		stats = {
			agility = 60,
			["haste rating"] = 35,
		},
	},
	[4215] = {
		itemID = { 55055 },
		name = {
			["off hand"] = "Elementium Shield Spike",
		},
		stats = {
			["elementium shield spike"] = 1,
		},
	},
	[4216] = {
		itemID = { 55056 },
		name = {
			["off hand"] = "Pyrium Shield Spike",
		},
		stats = {
			["pyrium shield spike"] = 1,
		},
	},
	[4217] = {
		itemID = { 55057 },
		name = {
			weapon = "Pyrium Weapon Chain",
		},
		stacks = false,
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["hit rating"] = 40,
		},
	},
	[4227] = {
		itemID = { 68134 },
		name = {
			["two-hand"] = "Enchant 2H Weapon - Mighty Agility",
		},
		spellID = { 95471 },
		stats = {
			agility = 130,
		},
	},
	[4245] = {
		itemID = { 68770 },
		name = {
			head = "Arcanum of Vicious Intellect",
		},
		stats = {
			intellect = 60,
			["resilience rating"] = 35,
		},
	},
	[4246] = {
		itemID = { 68769 },
		name = {
			head = "Arcanum of Vicious Agility",
		},
		stats = {
			agility = 60,
			["resilience rating"] = 35,
		},
	},
	[4247] = {
		itemID = { 68768 },
		name = {
			head = "Arcanum of Vicious Strength",
		},
		stats = {
			["resilience rating"] = 35,
			strength = 60,
		},
	},
	[4248] = {
		itemID = { 68772 },
		name = {
			shoulder = "Greater Inscription of Vicious Intellect",
		},
		stats = {
			intellect = 50,
			["resilience rating"] = 25,
		},
	},
	[4249] = {
		itemID = { 68773 },
		name = {
			shoulder = "Greater Inscription of Vicious Strength",
		},
		stats = {
			["resilience rating"] = 25,
			strength = 50,
		},
	},
	[4250] = {
		itemID = { 68774 },
		name = {
			shoulder = "Greater Inscription of Vicious Agility",
		},
		stats = {
			agility = 50,
			["resilience rating"] = 25,
		},
	},
	[4256] = {
		name = {
			wrist = "Enchant Bracer - Major Strength",
		},
		spellID = { 96261 },
		stats = {
			strength = 50,
		},
	},
	[4257] = {
		name = {
			wrist = "Enchant Bracer - Mighty Intellect",
		},
		spellID = { 96262 },
		stats = {
			intellect = 50,
		},
	},
	[4258] = {
		name = {
			wrist = "Enchant Bracer - Agility",
		},
		spellID = { 96264 },
		stats = {
			agility = 50,
		},
	},
	[4259] = {
		itemID = { 68796 },
		name = {
			["two-hand"] = "Reinforced Fishing Line",
		},
		stats = {
			fishing = 1,
		},
	},
}

-- Each level holds the first rep value over that level
ww_reputations = {
	[0] = -42000, -- minimum (completely hated)
	[1] = -6000, -- Hated,
	[2] = -3000, -- Hostile
	[3] = 0, -- Unfriendly
	[4] = 3000, -- Neutral
	[5] = 9000, -- Friendly
	[6] = 21000, -- Honored
	[7] = 42000, -- Revered
	[8] = 43000, -- Exalted
}

local EnchantItems = {
	[2304] = {
		enchID = 15,
		name = "Light Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 2831,
	},
	[2313] = {
		enchID = 16,
		name = "Medium Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 2832,
	},
	[4265] = {
		enchID = 17,
		minIlvl = 15,
		name = "Heavy Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 2833,
	},
	[4405] = {
		enchID = 30,
		name = "Crude Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 3974,
	},
	[4406] = {
		enchID = 32,
		name = "Standard Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 3975,
	},
	[4407] = {
		enchID = 33,
		name = "Accurate Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 3976,
	},
	[5421] = {
		enchID = 36,
		name = "Fiery Blaze Enchantment",
		slot = normalWeapon,
		source = "Unavailable",
		spell = 6296,
	},
	[6041] = {
		enchID = 37,
		name = "Steel Weapon Chain",
		slot = normalWeapon,
		source = "Crafted",
		spell = 7220,
		stacks = false,
	},
	[6042] = {
		enchID = 43,
		name = "Iron Shield Spike",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
		spell = 7216,
	},
	[6043] = {
		enchID = 34,
		name = "Iron Counterweight",
		slot = {
			"two-hand",
			["two-hand"] = {
				[true] = { "sword", "mace", "axe", "polearm" },
			},
		},
		source = "Crafted",
		spell = 7218,
	},
	[7967] = {
		enchID = 463,
		name = "Mithril Shield Spike",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
		spell = 9781,
	},
	[7969] = {
		enchID = 464,
		maxLvl = 70,
		name = "Mithril Spurs",
		slot = { "feet" },
		source = "Crafted",
		spell = 9783,
	},
	[8173] = {
		enchID = 18,
		minIlvl = 25,
		name = "Thick Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 10344,
	},
	[10546] = {
		enchID = 663,
		name = "Deadly Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 12459,
	},
	[10548] = {
		enchID = 664,
		name = "Sniper Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 12460,
	},
	[11622] = {
		enchID = 1483,
		minLvl = 50,
		name = "Lesser Arcanum of Rumination",
		slot = { "legs", "head" },
		source = "Quest",
		spell = 15340,
	},
	[11642] = {
		enchID = 1503,
		minLvl = 50,
		name = "Lesser Arcanum of Constitution",
		slot = { "legs", "head" },
		source = "Quest",
		spell = 15389,
	},
	[11643] = {
		enchID = 1504,
		minLvl = 50,
		name = "Lesser Arcanum of Tenacity",
		slot = { "legs", "head" },
		source = "Quest",
		spell = 15391,
	},
	[11644] = {
		enchID = 1505,
		minLvl = 50,
		name = "Lesser Arcanum of Resilience",
		slot = { "legs", "head" },
		source = "Quest",
		spell = 15394,
	},
	[11645] = {
		enchID = 1506,
		minLvl = 50,
		name = "Lesser Arcanum of Voracity",
		slot = { "legs", "head" },
		source = "Quest",
		spell = 15397,
	},
	[11646] = {
		enchID = 1507,
		minLvl = 50,
		name = "Lesser Arcanum of Voracity",
		slot = { "legs", "head" },
		source = "Quest",
		spell = 15400,
	},
	[11647] = {
		enchID = 1508,
		minLvl = 50,
		name = "Lesser Arcanum of Voracity",
		slot = { "legs", "head" },
		source = "Quest",
		spell = 15402,
	},
	[11648] = {
		enchID = 1509,
		minLvl = 50,
		name = "Lesser Arcanum of Voracity",
		slot = { "legs", "head" },
		source = "Quest",
		spell = 15404,
	},
	[11649] = {
		enchID = 1510,
		minLvl = 50,
		name = "Lesser Arcanum of Voracity",
		slot = { "legs", "head" },
		source = "Quest",
		spell = 15406,
	},
	[12645] = {
		enchID = 1704,
		name = "Thorium Shield Spike",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
		spell = 16623,
	},
	[15564] = {
		enchID = 1843,
		minIlvl = 35,
		name = "Rugged Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 1843,
	},
	[18169] = {
		enchID = 2483,
		minLvl = 50,
		name = "Flame Mantle of the Dawn",
		slot = { "shoulder" },
		source = "Vendor",
		spell = 22593,
	},
	[18170] = {
		enchID = 2484,
		minLvl = 50,
		name = "Frost Mantle of the Dawn",
		slot = { "shoulder" },
		source = "Vendor",
		spell = 22594,
	},
	[18171] = {
		enchID = 2485,
		minLvl = 50,
		name = "Arcane Mantle of the Dawn",
		slot = { "shoulder" },
		source = "Vendor",
		spell = 22598,
	},
	[18172] = {
		enchID = 2486,
		minLvl = 50,
		name = "Nature Mantle of the Dawn",
		slot = { "shoulder" },
		source = "Vendor",
		spell = 22597,
	},
	[18173] = {
		enchID = 2487,
		minLvl = 50,
		name = "Shadow Mantle of the Dawn",
		slot = { "shoulder" },
		source = "Vendor",
		spell = 22596,
	},
	[18182] = {
		enchID = 2488,
		minLvl = 50,
		name = "Chromatic Mantle of the Dawn",
		slot = { "shoulder" },
		source = "Vendor",
		spell = 22599,
	},
	[18251] = {
		enchID = 2503,
		minLvl = 50,
		name = "Core Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 22725,
	},
	[18283] = {
		enchID = 2523,
		minLvl = 50,
		name = "Biznicks 247x128 Accurascope",
		slot = normalRanged,
		source = "Crafted",
		spell = 22779,
	},
	[18329] = {
		enchID = 2543,
		minLvl = 50,
		name = "Arcanum of Rapidity",
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 22840,
	},
	[18330] = {
		enchID = 2544,
		minLvl = 50,
		name = "Arcanum of Focus",
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 22844,
	},
	[18331] = {
		enchID = 2545,
		minLvl = 50,
		name = "Arcanum of Protection",
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 22846,
	},
	[19782] = {
		class = "WARRIOR",
		enchID = 2583,
		minLvl = 60,
		name = "Presence of Might",
		rep = {
			["Zandalar Tribe"] = 5,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 24149,
	},
	[19783] = {
		class = "PALADIN",
		enchID = 2584,
		minLvl = 60,
		name = "Syncretist's Sigil",
		rep = {
			["Zandalar Tribe"] = 5,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 24160,
	},
	[19784] = {
		class = "ROGUE",
		enchID = 3755,
		minLvl = 60,
		name = "Death's Embrace",
		rep = {
			["Zandalar Tribe"] = 5,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 24161,
	},
	[19785] = {
		class = "HUNTER",
		enchID = 3754,
		minLvl = 60,
		name = "Falcon's Call",
		rep = {
			["Zandalar Tribe"] = 5,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 24162,
	},
	[19786] = {
		class = "SHAMAN",
		enchID = 2587,
		minLvl = 60,
		name = "Vodouisant's Vigilant Embrace",
		rep = {
			["Zandalar Tribe"] = 5,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 24163,
	},
	[19787] = {
		class = "MAGE",
		enchID = 2588,
		minLvl = 60,
		name = "Presence of Sight",
		rep = {
			["Zandalar Tribe"] = 5,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 24164,
	},
	[19788] = {
		class = "WARLOCK",
		enchID = 2589,
		minLvl = 60,
		name = "Hoodoo Hex",
		rep = {
			["Zandalar Tribe"] = 5,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 24165,
	},
	[19789] = {
		class = "PRIEST",
		enchID = 2590,
		minLvl = 60,
		name = "Prophetic Aura",
		rep = {
			["Zandalar Tribe"] = 5,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 24167,
	},
	[19790] = {
		class = "DRUID",
		enchID = 2591,
		minLvl = 60,
		name = "Animist's Caress",
		rep = {
			["Zandalar Tribe"] = 5,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 24168,
	},
	[19971] = {
		enchID = 846,
		name = "High Test Eternium Fishing Line",
		skill = {
			Fishing = 150,
		},
		slot = {
			"two-hand",
			["two-hand"] = {
				[true] = { "fishing pole" },
			},
		},
		source = "Quest",
		spell = 24302,
	},
	[20076] = {
		enchID = 2605,
		minLvl = 55,
		name = "Zandalar Signet of Mojo",
		rep = {
			["Zandalar Tribe"] = 8,
		},
		slot = { "shoulder" },
		source = "Unavailable",
		spell = 24421,
	},
	[20077] = {
		enchID = 2606,
		minLvl = 55,
		name = "Zandalar Signet of Might",
		rep = {
			["Zandalar Tribe"] = 8,
		},
		slot = { "shoulder" },
		source = "Unavailable",
		spell = 24422,
	},
	[20078] = {
		enchID = 2604,
		minLvl = 55,
		name = "Zandalar Signet of Serenity",
		rep = {
			["Zandalar Tribe"] = 8,
		},
		slot = { "shoulder" },
		source = "Unavailable",
		spell = 24420,
	},
	[22635] = {
		enchID = 2681,
		minLvl = 55,
		name = "Savage Guard",
		rep = {
			["Zandalar Tribe"] = 6,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 28161,
	},
	[22636] = {
		enchID = 2682,
		minLvl = 55,
		name = "Ice Guard",
		rep = {
			["Zandalar Tribe"] = 6,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 28163,
	},
	[22638] = {
		enchID = 2683,
		minLvl = 55,
		name = "Shadow Guard",
		rep = {
			["Zandalar Tribe"] = 6,
		},
		slot = { "legs", "head" },
		source = "Unavailable",
		spell = 28165,
	},
	[23530] = {
		enchID = 2714,
		name = "Felsteel Shield Spike",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
		spell = 29454,
	},
	[23545] = {
		enchID = 2721,
		minLvl = 60,
		name = "Power of the Scourge",
		slot = { "shoulder" },
		source = "Unavailable",
		spell = 29467,
	},
	[23547] = {
		enchID = 2715,
		minLvl = 60,
		name = "Resilience of the Scourge",
		slot = { "shoulder" },
		source = "Unavailable",
		spell = 29475,
	},
	[23548] = {
		enchID = 2717,
		minLvl = 60,
		name = "Might of the Scourge",
		slot = { "shoulder" },
		source = "Unavailable",
		spell = 29483,
	},
	[23549] = {
		enchID = 2716,
		minLvl = 60,
		name = "Fortitude of the Scourge",
		slot = { "shoulder" },
		source = "Unavailable",
		spell = 29480,
	},
	[23764] = {
		enchID = 2722,
		minLvl = 55,
		name = "Adamantite Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 30250,
	},
	[23765] = {
		enchID = 2723,
		minLvl = 55,
		name = "Khorium Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 30252,
	},
	[23766] = {
		enchID = 2724,
		minLvl = 60,
		name = "Stabilized Eternium Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 30260,
	},
	[24273] = {
		enchID = 2747,
		minLvl = 50,
		name = "Mystic Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 31371,
	},
	[24274] = {
		enchID = 2748,
		minLvl = 60,
		name = "Runic Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 31372,
	},
	[24275] = {
		enchID = 2745,
		minLvl = 50,
		name = "Silver Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 31369,
	},
	[24276] = {
		enchID = 2746,
		minLvl = 60,
		name = "Golden Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 31370,
	},
	[25650] = {
		enchID = 2792,
		minIlvl = 55,
		minLvl = 50,
		name = "Knothide Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 32397,
	},
	[25651] = {
		enchID = 2793,
		minLvl = 55,
		name = "Vindicator's Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 32398,
	},
	[25652] = {
		enchID = 2794,
		minLvl = 55,
		name = "Magister's Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 32399,
	},
	[28878] = {
		enchID = 2979,
		minLvl = 64,
		name = "Inscription of Faith",
		rep = {
			["The Aldor"] = 6,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35403,
	},
	[28881] = {
		enchID = 2981,
		minLvl = 64,
		name = "Inscription of Discipline",
		rep = {
			["The Aldor"] = 6,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35405,
	},
	[28882] = {
		enchID = 2977,
		minLvl = 64,
		name = "Inscription of Warding",
		rep = {
			["The Aldor"] = 6,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35355,
	},
	[28885] = {
		enchID = 2983,
		minLvl = 64,
		name = "Inscription of Vengeance",
		rep = {
			["The Aldor"] = 6,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35407,
	},
	[28886] = {
		enchID = 2982,
		minLvl = 70,
		name = "Greater Inscription of Discipline",
		rep = {
			["The Aldor"] = 8,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35406,
	},
	[28887] = {
		enchID = 2980,
		minLvl = 70,
		name = "Greater Inscription of Faith",
		rep = {
			["The Aldor"] = 8,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35404,
	},
	[28888] = {
		enchID = 2986,
		minLvl = 70,
		name = "Greater Inscription of Vengeance",
		rep = {
			["The Aldor"] = 8,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35417,
	},
	[28889] = {
		enchID = 2978,
		minLvl = 70,
		name = "Greater Inscription of Warding",
		rep = {
			["The Aldor"] = 8,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35402,
	},
	[28903] = {
		enchID = 2994,
		minLvl = 64,
		name = "Inscription of the Orb",
		rep = {
			["The Scryers"] = 6,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35436,
	},
	[28904] = {
		enchID = 2992,
		minLvl = 64,
		name = "Inscription of the Oracle",
		rep = {
			["The Scryers"] = 6,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35434,
	},
	[28907] = {
		enchID = 2996,
		minLvl = 64,
		name = "Inscription of the Blade",
		rep = {
			["The Scryers"] = 6,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35438,
	},
	[28908] = {
		enchID = 2990,
		minLvl = 64,
		name = "Inscription of the Knight",
		rep = {
			["The Scryers"] = 6,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35432,
	},
	[28909] = {
		enchID = 2995,
		minLvl = 70,
		name = "Greater Inscription of the Orb",
		rep = {
			["The Scryers"] = 8,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35437,
	},
	[28910] = {
		enchID = 2997,
		minLvl = 70,
		name = "Greater Inscription of the Blade",
		rep = {
			["The Scryers"] = 8,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35439,
	},
	[28911] = {
		enchID = 2991,
		minLvl = 70,
		name = "Greater Inscription of the Knight",
		rep = {
			["The Scryers"] = 8,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35433,
	},
	[28912] = {
		enchID = 2993,
		minLvl = 70,
		name = "Greater Inscription of the Oracle",
		rep = {
			["The Scryers"] = 8,
		},
		slot = { "shoulder" },
		source = "Quest",
		spell = 35435,
	},
	[29186] = {
		enchID = 2999,
		minLvl = 70,
		name = "Arcanum of the Defender",
		rep = {
			["Keepers of Time"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35443,
	},
	[29187] = {
		enchID = 2998,
		minLvl = 70,
		name = "Inscription of Endurance",
		rep = {
			["The Violet Eye"] = 6,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 35441,
	},
	[29189] = {
		enchID = 3001,
		minLvl = 70,
		name = "Arcanum of Renewal",
		rep = {
			["Honor Hold"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35445,
	},
	[29190] = {
		enchID = 3001,
		minLvl = 70,
		name = "Arcanum of Renewal",
		rep = {
			Thrallmar = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35445,
	},
	[29191] = {
		enchID = 3002,
		minLvl = 70,
		name = "Arcanum of Power",
		rep = {
			["The Sha'tar"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35447,
	},
	[29192] = {
		enchID = 3003,
		minLvl = 70,
		name = "Arcanum of Ferocity",
		rep = {
			["Cenarion Expedition"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35452,
	},
	[29193] = {
		enchID = 3004,
		minLvl = 70,
		name = "Arcanum of the Gladiator",
		rep = {
			["Shattered Sun Offensive"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35453,
	},
	[29194] = {
		enchID = 3005,
		minLvl = 70,
		name = "Arcanum of Nature Warding",
		rep = {
			["Cenarion Expedition"] = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35454,
	},
	[29195] = {
		enchID = 3006,
		minLvl = 70,
		name = "Arcanum of Arcane Warding",
		rep = {
			["The Sha'tar"] = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35455,
	},
	[29196] = {
		enchID = 3007,
		minLvl = 70,
		name = "Arcanum of Fire Warding",
		rep = {
			["Honor Hold"] = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35456,
	},
	[29197] = {
		enchID = 3007,
		minLvl = 70,
		name = "Arcanum of Fire Warding",
		rep = {
			Thrallmar = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35456,
	},
	[29198] = {
		enchID = 3008,
		minLvl = 70,
		name = "Arcanum of Frost Warding",
		rep = {
			["Keepers of Time"] = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35457,
	},
	[29199] = {
		enchID = 3009,
		minLvl = 70,
		name = "Arcanum of Shadow Warding",
		rep = {
			["Lower City"] = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 35458,
	},
	[29483] = {
		enchID = 2984,
		minLvl = 65,
		name = "Shadow Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 35415,
	},
	[29485] = {
		enchID = 2985,
		minLvl = 65,
		name = "Flame Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 35416,
	},
	[29486] = {
		enchID = 2987,
		minLvl = 65,
		name = "Frost Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 35418,
	},
	[29487] = {
		enchID = 2988,
		minLvl = 65,
		name = "Nature Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 35419,
	},
	[29488] = {
		enchID = 2989,
		minLvl = 65,
		name = "Arcane Armor Kit",
		slot = { "chest", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 35420,
	},
	[29533] = {
		enchID = 3010,
		minLvl = 50,
		name = "Cobrahide Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 35488,
	},
	[29534] = {
		enchID = 3011,
		minLvl = 50,
		name = "Clefthide Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 35489,
	},
	[29535] = {
		enchID = 3012,
		minLvl = 60,
		name = "Nethercobra Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 35490,
	},
	[29536] = {
		enchID = 3013,
		minLvl = 60,
		name = "Nethercleft Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 35495,
	},
	[30846] = {
		enchID = 3096,
		minLvl = 70,
		name = "Arcanum of the Outcast",
		rep = {
			["Lower City"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 37891,
	},
	[33185] = {
		enchID = 3223,
		minLvl = 50,
		name = "Adamantite Weapon Chain",
		slot = normalWeapon,
		source = "Crafted",
		spell = 42687,
		stacks = false,
	},
	[34207] = {
		enchID = 3260,
		minIlvl = 60,
		minLvl = 60,
		name = "Glove Reinforcements",
		slot = { "hands" },
		source = "Crafted",
		spell = 44769,
	},
	[34330] = {
		enchID = 2841,
		minIlvl = 60,
		minLvl = 60,
		name = "Heavy Knothide Armor Kit",
		slot = { "head", "chest", "shoulder", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 44968,
	},
	[34836] = {
		enchID = 3269,
		name = "Spun Truesilver Fishing Line",
		skill = {
			Fishing = 300,
		},
		slot = {
			"two-hand",
			["two-hand"] = {
				[true] = { "fishing pole" },
			},
		},
		source = "Quest",
		spell = 45697,
	},
	[37603] = {
		name = "Scroll of Enchant Boots - Dexterity",
		spell = 27951,
	},
	[38371] = {
		enchID = 3325,
		minLvl = 70,
		name = "Jormungar Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 50901,
	},
	[38372] = {
		enchID = 3326,
		minLvl = 70,
		name = "Nerubian Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 50902,
	},
	[38373] = {
		enchID = 3822,
		minLvl = 80,
		name = "Frosthide Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 60581,
	},
	[38374] = {
		enchID = 3823,
		minLvl = 80,
		name = "Icescale Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 60582,
	},
	[38375] = {
		enchID = 3329,
		minLvl = 70,
		name = "Borean Armor Kit",
		slot = { "head", "chest", "shoulder", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 50906,
	},
	[38376] = {
		enchID = 3330,
		minLvl = 70,
		name = "Heavy Borean Armor Kit",
		slot = { "head", "chest", "shoulder", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 50909,
	},
	[38679] = {
		name = "Scroll of Enchant Bracer - Minor Health",
		spell = 7418,
	},
	[38766] = {
		name = "Scroll of Enchant Chest - Minor Health",
		spell = 7420,
	},
	[38767] = {
		name = "Scroll of Enchant Chest - Minor Absorption",
		spell = 7426,
	},
	[38768] = {
		name = "Scroll of Enchant Bracer - Minor Deflection",
		spell = 7428,
	},
	[38769] = {
		name = "Scroll of Enchant Chest - Minor Mana",
		spell = 7443,
	},
	[38770] = {
		name = "Scroll of Enchant Cloak - Minor Resistance",
		spell = 7454,
	},
	[38771] = {
		name = "Scroll of Enchant Bracer - Minor Stamina",
		spell = 7457,
	},
	[38772] = {
		name = "Scroll of Enchant 2H Weapon - Minor Impact",
		spell = 7745,
	},
	[38773] = {
		name = "Scroll of Enchant Chest - Lesser Health",
		spell = 7748,
	},
	[38774] = {
		name = "Scroll of Enchant Bracer - Minor Spirit",
		spell = 7766,
	},
	[38775] = {
		name = "Scroll of Enchant Cloak - Minor Protection",
		spell = 7771,
	},
	[38776] = {
		name = "Scroll of Enchant Chest - Lesser Mana",
		spell = 7776,
	},
	[38777] = {
		name = "Scroll of Enchant Bracer - Minor Agility",
		spell = 7779,
	},
	[38778] = {
		name = "Scroll of Enchant Bracer - Minor Strength",
		spell = 7782,
	},
	[38779] = {
		name = "Scroll of Enchant Weapon - Minor Beastslayer",
		spell = 7786,
	},
	[38780] = {
		name = "Scroll of Enchant Weapon - Minor Striking",
		spell = 7788,
	},
	[38781] = {
		name = "Scroll of Enchant 2H Weapon - Lesser Intellect",
		spell = 7793,
	},
	[38782] = {
		name = "Scroll of Enchant Chest - Health",
		spell = 7857,
	},
	[38783] = {
		name = "Scroll of Enchant Bracer - Lesser Spirit",
		spell = 7859,
	},
	[38784] = {
		name = "Scroll of Enchant Cloak - Lesser Fire Resistance",
		spell = 7861,
	},
	[38785] = {
		name = "Scroll of Enchant Boots - Minor Stamina",
		spell = 7863,
	},
	[38786] = {
		name = "Scroll of Enchant Boots - Minor Agility",
		spell = 7867,
	},
	[38787] = {
		name = "Scroll of Enchant Shield - Minor Stamina",
		spell = 13378,
	},
	[38788] = {
		name = "Scroll of Enchant 2H Weapon - Lesser Spirit",
		spell = 13380,
	},
	[38789] = {
		name = "Scroll of Enchant Cloak - Minor Agility",
		spell = 13419,
	},
	[38790] = {
		name = "Scroll of Enchant Cloak - Lesser Protection",
		spell = 13421,
	},
	[38791] = {
		name = "Scroll of Enchant Shield - Lesser Protection",
		spell = 13464,
	},
	[38792] = {
		name = "Scroll of Enchant Shield - Lesser Spirit",
		spell = 13485,
	},
	[38793] = {
		name = "Scroll of Enchant Bracer - Lesser Stamina",
		spell = 13501,
	},
	[38794] = {
		name = "Scroll of Enchant Weapon - Lesser Striking",
		spell = 13503,
	},
	[38795] = {
		name = "Scroll of Enchant Cloak - Lesser Shadow Resistance",
		spell = 13522,
	},
	[38796] = {
		name = "Scroll of Enchant 2H Weapon - Lesser Impact",
		spell = 13529,
	},
	[38797] = {
		name = "Scroll of Enchant Bracer - Lesser Strength",
		spell = 13536,
	},
	[38798] = {
		name = "Scroll of Enchant Chest - Lesser Absorption",
		spell = 13538,
	},
	[38799] = {
		name = "Scroll of Enchant Chest - Mana",
		spell = 13607,
	},
	[38800] = {
		name = "Scroll of Enchant Gloves - Mining",
		spell = 13612,
	},
	[38801] = {
		name = "Scroll of Enchant Gloves - Herbalism",
		spell = 13617,
	},
	[38802] = {
		name = "Scroll of Enchant Gloves - Fishing",
		spell = 13620,
	},
	[38803] = {
		name = "Scroll of Enchant Bracer - Lesser Intellect",
		spell = 13622,
	},
	[38804] = {
		name = "Scroll of Enchant Chest - Minor Stats",
		spell = 13626,
	},
	[38805] = {
		name = "Scroll of Enchant Shield - Lesser Stamina",
		spell = 13631,
	},
	[38806] = {
		name = "Scroll of Enchant Cloak - Defense",
		spell = 13635,
	},
	[38807] = {
		name = "Scroll of Enchant Boots - Lesser Agility",
		spell = 13637,
	},
	[38808] = {
		name = "Scroll of Enchant Chest - Greater Health",
		spell = 13640,
	},
	[38809] = {
		name = "Scroll of Enchant Bracer - Spirit",
		spell = 13642,
	},
	[38810] = {
		name = "Scroll of Enchant Boots - Lesser Stamina",
		spell = 13644,
	},
	[38811] = {
		name = "Scroll of Enchant Bracer - Lesser Deflection",
		spell = 13646,
	},
	[38812] = {
		name = "Scroll of Enchant Bracer - Stamina",
		spell = 13648,
	},
	[38813] = {
		name = "Scroll of Enchant Weapon - Lesser Beastslayer",
		spell = 13653,
	},
	[38814] = {
		name = "Scroll of Enchant Weapon - Lesser Elemental Slayer",
		spell = 13655,
	},
	[38815] = {
		name = "Scroll of Enchant Cloak - Fire Resistance",
		spell = 13657,
	},
	[38816] = {
		name = "Scroll of Enchant Shield - Spirit",
		spell = 13659,
	},
	[38817] = {
		name = "Scroll of Enchant Bracer - Strength",
		spell = 13661,
	},
	[38818] = {
		name = "Scroll of Enchant Chest - Greater Mana",
		spell = 13663,
	},
	[38819] = {
		name = "Scroll of Enchant Boots - Lesser Spirit",
		spell = 13687,
	},
	[38820] = {
		name = "Scroll of Enchant Shield - Lesser Block",
		spell = 13689,
	},
	[38821] = {
		name = "Scroll of Enchant Weapon - Striking",
		spell = 13693,
	},
	[38822] = {
		name = "Scroll of Enchant 2H Weapon - Impact",
		spell = 13695,
	},
	[38823] = {
		name = "Scroll of Enchant Gloves - Skinning",
		spell = 13698,
	},
	[38824] = {
		name = "Scroll of Enchant Chest - Lesser Stats",
		spell = 13700,
	},
	[38825] = {
		name = "Scroll of Enchant Cloak - Greater Defense",
		spell = 13746,
	},
	[38826] = {
		name = "Scroll of Enchant Cloak - Resistance",
		spell = 13794,
	},
	[38827] = {
		name = "Scroll of Enchant Gloves - Agility",
		spell = 13815,
	},
	[38828] = {
		name = "Scroll of Enchant Shield - Stamina",
		spell = 13817,
	},
	[38829] = {
		name = "Scroll of Enchant Bracer - Intellect",
		spell = 13822,
	},
	[38830] = {
		name = "Scroll of Enchant Boots - Stamina",
		spell = 13836,
	},
	[38831] = {
		name = "Scroll of Enchant Gloves - Advanced Mining",
		spell = 13841,
	},
	[38832] = {
		name = "Scroll of Enchant Bracer - Greater Spirit",
		spell = 13846,
	},
	[38833] = {
		name = "Scroll of Enchant Chest - Superior Health",
		spell = 13858,
	},
	[38834] = {
		name = "Scroll of Enchant Gloves - Advanced Herbalism",
		spell = 13868,
	},
	[38835] = {
		name = "Scroll of Enchant Cloak - Lesser Agility",
		spell = 13882,
	},
	[38836] = {
		name = "Scroll of Enchant Gloves - Strength",
		spell = 13887,
	},
	[38837] = {
		name = "Scroll of Enchant Boots - Minor Speed",
		spell = 13890,
	},
	[38838] = {
		name = "Scroll of Enchant Weapon - Fiery Weapon",
		spell = 13898,
	},
	[38839] = {
		name = "Scroll of Enchant Shield - Greater Spirit",
		spell = 13905,
	},
	[38840] = {
		name = "Scroll of Enchant Weapon - Demonslaying",
		spell = 13915,
	},
	[38841] = {
		name = "Scroll of Enchant Chest - Superior Mana",
		spell = 13917,
	},
	[38842] = {
		name = "Scroll of Enchant Bracer - Deflection",
		spell = 13931,
	},
	[38843] = {
		name = "Scroll of Enchant Shield - Frost Resistance",
		spell = 13933,
	},
	[38844] = {
		name = "Scroll of Enchant Boots - Agility",
		spell = 13935,
	},
	[38845] = {
		name = "Scroll of Enchant 2H Weapon - Greater Impact",
		spell = 13937,
	},
	[38846] = {
		name = "Scroll of Enchant Bracer - Greater Strength",
		spell = 13939,
	},
	[38847] = {
		name = "Scroll of Enchant Chest - Stats",
		spell = 13941,
	},
	[38848] = {
		name = "Scroll of Enchant Weapon - Greater Striking",
		spell = 13943,
	},
	[38849] = {
		name = "Scroll of Enchant Bracer - Greater Stamina",
		spell = 13945,
	},
	[38850] = {
		name = "Scroll of Enchant Gloves - Riding Skill",
		spell = 13947,
	},
	[38851] = {
		name = "Scroll of Enchant Gloves - Minor Haste",
		spell = 13948,
	},
	[38852] = {
		name = "Scroll of Enchant Bracer - Greater Intellect",
		spell = 20008,
	},
	[38853] = {
		name = "Scroll of Enchant Bracer - Superior Spirit",
		spell = 20009,
	},
	[38854] = {
		name = "Scroll of Enchant Bracer - Superior Strength",
		spell = 20010,
	},
	[38855] = {
		name = "Scroll of Enchant Bracer - Superior Stamina",
		spell = 20011,
	},
	[38856] = {
		name = "Scroll of Enchant Gloves - Greater Agility",
		spell = 20012,
	},
	[38857] = {
		name = "Scroll of Enchant Gloves - Greater Strength",
		spell = 20013,
	},
	[38858] = {
		name = "Scroll of Enchant Cloak - Greater Resistance",
		spell = 20014,
	},
	[38859] = {
		name = "Scroll of Enchant Cloak - Superior Defense",
		spell = 20015,
	},
	[38860] = {
		name = "Scroll of Enchant Shield - Vitality",
		spell = 20016,
	},
	[38861] = {
		name = "Scroll of Enchant Shield - Greater Stamina",
		spell = 20017,
	},
	[38862] = {
		name = "Scroll of Enchant Boots - Greater Stamina",
		spell = 20020,
	},
	[38863] = {
		name = "Scroll of Enchant Boots - Greater Agility",
		spell = 20023,
	},
	[38864] = {
		name = "Scroll of Enchant Boots - Spirit",
		spell = 20024,
	},
	[38865] = {
		name = "Scroll of Enchant Chest - Greater Stats",
		spell = 20025,
	},
	[38866] = {
		name = "Scroll of Enchant Chest - Major Health",
		spell = 20026,
	},
	[38867] = {
		name = "Scroll of Enchant Chest - Major Mana",
		spell = 20028,
	},
	[38868] = {
		name = "Scroll of Enchant Weapon - Icy Chill",
		spell = 20029,
	},
	[38869] = {
		name = "Scroll of Enchant 2H Weapon - Superior Impact",
		spell = 20030,
	},
	[38870] = {
		name = "Scroll of Enchant Weapon - Superior Striking",
		spell = 20031,
	},
	[38871] = {
		name = "Scroll of Enchant Weapon - Lifestealing",
		spell = 20032,
	},
	[38872] = {
		name = "Scroll of Enchant Weapon - Unholy Weapon",
		spell = 20033,
	},
	[38873] = {
		name = "Scroll of Enchant Weapon - Crusader",
		spell = 20034,
	},
	[38874] = {
		name = "Scroll of Enchant 2H Weapon - Major Spirit",
		spell = 20035,
	},
	[38875] = {
		name = "Scroll of Enchant 2H Weapon - Major Intellect",
		spell = 20036,
	},
	[38876] = {
		name = "Scroll of Enchant Weapon - Winter's Might",
		spell = 21931,
	},
	[38877] = {
		name = "Scroll of Enchant Weapon - Spellpower",
		spell = 22749,
	},
	[38878] = {
		name = "Scroll of Enchant Weapon - Healing Power",
		spell = 22750,
	},
	[38879] = {
		name = "Scroll of Enchant Weapon - Strength",
		spell = 23799,
	},
	[38880] = {
		name = "Scroll of Enchant Weapon - Agility",
		spell = 23800,
	},
	[38881] = {
		name = "Scroll of Enchant Bracer - Mana Regeneration",
		spell = 23801,
	},
	[38882] = {
		name = "Scroll of Enchant Bracer - Healing Power",
		spell = 23802,
	},
	[38883] = {
		name = "Scroll of Enchant Weapon - Mighty Spirit",
		spell = 23803,
	},
	[38884] = {
		name = "Scroll of Enchant Weapon - Mighty Intellect",
		spell = 23804,
	},
	[38885] = {
		name = "Scroll of Enchant Gloves - Threat",
		spell = 25072,
	},
	[38886] = {
		name = "Scroll of Enchant Gloves - Shadow Power",
		spell = 25073,
	},
	[38887] = {
		name = "Scroll of Enchant Gloves - Frost Power",
		spell = 25074,
	},
	[38888] = {
		name = "Scroll of Enchant Gloves - Fire Power",
		spell = 25078,
	},
	[38889] = {
		name = "Scroll of Enchant Gloves - Healing Power",
		spell = 25079,
	},
	[38890] = {
		name = "Scroll of Enchant Gloves - Superior Agility",
		spell = 25080,
	},
	[38891] = {
		name = "Scroll of Enchant Cloak - Greater Fire Resistance",
		spell = 25081,
	},
	[38892] = {
		name = "Scroll of Enchant Cloak - Greater Nature Resistance",
		spell = 25082,
	},
	[38893] = {
		name = "Scroll of Enchant Cloak - Stealth",
		spell = 25083,
	},
	[38894] = {
		name = "Scroll of Enchant Cloak - Subtlety",
		spell = 25084,
	},
	[38895] = {
		name = "Scroll of Enchant Cloak - Dodge",
		spell = 25086,
	},
	[38896] = {
		name = "Scroll of Enchant 2H Weapon - Agility",
		spell = 27837,
	},
	[38897] = {
		name = "Scroll of Enchant Bracer - Brawn",
		spell = 27899,
	},
	[38898] = {
		name = "Scroll of Enchant Bracer - Stats",
		spell = 27905,
	},
	[38899] = {
		name = "Scroll of Enchant Bracer - Greater Dodge",
		spell = 27906,
	},
	[38900] = {
		name = "Scroll of Enchant Bracer - Superior Healing",
		spell = 27911,
	},
	[38901] = {
		name = "Scroll of Enchant Bracer - Restore Mana Prime",
		spell = 27913,
	},
	[38902] = {
		name = "Scroll of Enchant Bracer - Fortitude",
		spell = 27914,
	},
	[38903] = {
		name = "Scroll of Enchant Bracer - Spellpower",
		spell = 27917,
	},
	[38904] = {
		name = "Scroll of Enchant Shield - Tough Shield",
		spell = 27944,
	},
	[38905] = {
		name = "Scroll of Enchant Shield - Intellect",
		spell = 27945,
	},
	[38906] = {
		name = "Scroll of Enchant Shield - Shield Block",
		spell = 27946,
	},
	[38907] = {
		name = "Scroll of Enchant Shield - Resistance",
		spell = 27947,
	},
	[38908] = {
		name = "Scroll of Enchant Boots - Vitality",
		spell = 27948,
	},
	[38909] = {
		name = "Scroll of Enchant Boots - Fortitude",
		spell = 27950,
	},
	[38910] = {
		name = "Scroll of Enchant Boots - Surefooted",
		spell = 27954,
	},
	[38911] = {
		name = "Scroll of Enchant Chest - Exceptional Health",
		spell = 27957,
	},
	[38912] = {
		name = "Scroll of Enchant Chest - Exceptional Mana",
		spell = 27958,
	},
	[38914] = {
		name = "Scroll of Enchant Cloak - Major Armor",
		spell = 27961,
	},
	[38915] = {
		name = "Scroll of Enchant Cloak - Major Resistance",
		spell = 27962,
	},
	[38917] = {
		name = "Scroll of Enchant Weapon - Major Striking",
		spell = 27967,
	},
	[38918] = {
		name = "Scroll of Enchant Weapon - Major Intellect",
		spell = 27968,
	},
	[38919] = {
		name = "Scroll of Enchant 2H Weapon - Savagery",
		spell = 27971,
	},
	[38920] = {
		name = "Scroll of Enchant Weapon - Potency",
		spell = 27972,
	},
	[38921] = {
		name = "Scroll of Enchant Weapon - Major Spellpower",
		spell = 27975,
	},
	[38922] = {
		name = "Scroll of Enchant 2H Weapon - Major Agility",
		spell = 27977,
	},
	[38923] = {
		name = "Scroll of Enchant Weapon - Sunfire",
		spell = 27981,
	},
	[38924] = {
		name = "Scroll of Enchant Weapon - Soulfrost",
		spell = 27982,
	},
	[38925] = {
		name = "Scroll of Enchant Weapon - Mongoose",
		spell = 27984,
	},
	[38926] = {
		name = "Scroll of Enchant Weapon - Spellsurge",
		spell = 28003,
	},
	[38927] = {
		name = "Scroll of Enchant Weapon - Battlemaster",
		spell = 28004,
	},
	[38928] = {
		name = "Scroll of Enchant Chest - Major Spirit",
		spell = 33990,
	},
	[38929] = {
		name = "Scroll of Enchant Chest - Restore Mana Prime",
		spell = 33991,
	},
	[38930] = {
		name = "Scroll of Enchant Chest - Major Resilience",
		spell = 33992,
	},
	[38931] = {
		name = "Scroll of Enchant Gloves - Blasting",
		spell = 33993,
	},
	[38932] = {
		name = "Scroll of Enchant Gloves - Precise Strikes",
		spell = 33994,
	},
	[38933] = {
		name = "Scroll of Enchant Gloves - Major Strength",
		spell = 33995,
	},
	[38934] = {
		name = "Scroll of Enchant Gloves - Assault",
		spell = 33996,
	},
	[38935] = {
		name = "Scroll of Enchant Gloves - Major Spellpower",
		spell = 33997,
	},
	[38936] = {
		name = "Scroll of Enchant Gloves - Major Healing",
		spell = 33999,
	},
	[38937] = {
		name = "Scroll of Enchant Bracer - Major Intellect",
		spell = 34001,
	},
	[38938] = {
		name = "Scroll of Enchant Bracer - Assault",
		spell = 34002,
	},
	[38939] = {
		name = "Scroll of Enchant Cloak - Spell Penetration",
		spell = 34003,
	},
	[38940] = {
		name = "Scroll of Enchant Cloak - Greater Agility",
		spell = 34004,
	},
	[38941] = {
		name = "Scroll of Enchant Cloak - Greater Arcane Resistance",
		spell = 34005,
	},
	[38942] = {
		name = "Scroll of Enchant Cloak - Greater Shadow Resistance",
		spell = 34006,
	},
	[38943] = {
		name = "Scroll of Enchant Boots - Cat's Swiftness",
		spell = 34007,
	},
	[38944] = {
		name = "Scroll of Enchant Boots - Boar's Speed",
		spell = 34008,
	},
	[38945] = {
		name = "Scroll of Enchant Shield - Major Stamina",
		spell = 34009,
	},
	[38946] = {
		name = "Scroll of Enchant Weapon - Major Healing",
		spell = 34010,
	},
	[38947] = {
		name = "Scroll of Enchant Weapon - Greater Agility",
		spell = 42620,
	},
	[38948] = {
		name = "Scroll of Enchant Weapon - Executioner",
		spell = 42974,
	},
	[38949] = {
		name = "Scroll of Enchant Shield - Resilience",
		spell = 44383,
	},
	[38950] = {
		name = "Scroll of Enchant Cloak - Superior Frost Resistance",
		spell = 44483,
	},
	[38951] = {
		name = "Scroll of Enchant Gloves - Expertise",
		spell = 44484,
	},
	[38953] = {
		name = "Scroll of Enchant Gloves - Precision",
		spell = 44488,
	},
	[38954] = {
		name = "Scroll of Enchant Shield - Dodge",
		spell = 44489,
	},
	[38955] = {
		name = "Scroll of Enchant Chest - Mighty Health",
		spell = 44492,
	},
	[38956] = {
		name = "Scroll of Enchant Cloak - Superior Nature Resistance",
		spell = 44494,
	},
	[38959] = {
		name = "Scroll of Enchant Cloak - Superior Agility",
		spell = 44500,
	},
	[38960] = {
		name = "Scroll of Enchant Gloves - Gatherer",
		spell = 44506,
	},
	[38961] = {
		name = "Scroll of Enchant Boots - Greater Spirit",
		spell = 44508,
	},
	[38962] = {
		name = "Scroll of Enchant Chest - Greater Mana Restoration",
		spell = 44509,
	},
	[38963] = {
		name = "Scroll of Enchant Weapon - Exceptional Spirit",
		spell = 44510,
	},
	[38964] = {
		name = "Scroll of Enchant Gloves - Greater Assault",
		spell = 44513,
	},
	[38965] = {
		name = "Scroll of Enchant Weapon - Icebreaker",
		spell = 44524,
	},
	[38966] = {
		name = "Scroll of Enchant Boots - Greater Fortitude",
		spell = 44528,
	},
	[38967] = {
		name = "Scroll of Enchant Gloves - Major Agility",
		spell = 44529,
	},
	[38968] = {
		name = "Scroll of Enchant Bracers - Exceptional Intellect",
		spell = 44555,
	},
	[38969] = {
		name = "Scroll of Enchant Cloak - Superior Fire Resistance",
		spell = 44556,
	},
	[38971] = {
		name = "Scroll of Enchant Bracers - Striking",
		spell = 60616,
	},
	[38972] = {
		name = "Scroll of Enchant Weapon - Lifeward",
		spell = 44576,
	},
	[38973] = {
		name = "Scroll of Enchant Cloak - Spell Piercing",
		spell = 44582,
	},
	[38974] = {
		name = "Scroll of Enchant Boots - Greater Vitality",
		spell = 44584,
	},
	[38975] = {
		name = "Scroll of Enchant Chest - Exceptional Resilience",
		spell = 44588,
	},
	[38976] = {
		name = "Scroll of Enchant Boots - Superior Agility",
		spell = 44589,
	},
	[38977] = {
		name = "Scroll of Enchant Cloak - Superior Shadow Resistance",
		spell = 44590,
	},
	[38978] = {
		name = "Scroll of Enchant Cloak - Titanweave",
		spell = 44591,
	},
	[38979] = {
		name = "Scroll of Enchant Gloves - Exceptional Spellpower",
		spell = 44592,
	},
	[38980] = {
		name = "Scroll of Enchant Bracers - Major Spirit",
		spell = 44593,
	},
	[38981] = {
		name = "Scroll of Enchant 2H Weapon - Scourgebane",
		spell = 44595,
	},
	[38982] = {
		name = "Scroll of Enchant Cloak - Superior Arcane Resistance",
		spell = 44596,
	},
	[38984] = {
		name = "Scroll of Enchant Bracer - Expertise",
		spell = 44598,
	},
	[38986] = {
		name = "Scroll of Enchant Boots - Icewalker",
		spell = 60623,
	},
	[38987] = {
		name = "Scroll of Enchant Bracers - Greater Stats",
		spell = 44616,
	},
	[38988] = {
		name = "Scroll of Enchant Weapon - Giant Slayer",
		spell = 44621,
	},
	[38989] = {
		name = "Scroll of Enchant Chest - Super Stats",
		spell = 44623,
	},
	[38990] = {
		name = "Scroll of Enchant Gloves - Armsman",
		spell = 44625,
	},
	[38991] = {
		name = "Scroll of Enchant Weapon - Exceptional Spellpower",
		spell = 44629,
	},
	[38992] = {
		name = "Scroll of Enchant 2H Weapon - Greater Savagery",
		spell = 44630,
	},
	[38993] = {
		name = "Scroll of Enchant Cloak - Shadow Armor",
		spell = 44631,
	},
	[38995] = {
		name = "Scroll of Enchant Weapon - Exceptional Agility",
		spell = 44633,
	},
	[38997] = {
		name = "Scroll of Enchant Bracers - Greater Spellpower",
		spell = 44635,
	},
	[38998] = {
		name = "Scroll of Enchant Weapon - Deathfrost",
		spell = 46578,
	},
	[38999] = {
		name = "Scroll of Enchant Chest - Dodge",
		spell = 46594,
	},
	[39000] = {
		name = "Scroll of Enchant Cloak - Steelweave",
		spell = 47051,
	},
	[39001] = {
		name = "Scroll of Enchant Cloak - Mighty Armor",
		spell = 47672,
	},
	[39002] = {
		name = "Scroll of Enchant Chest - Greater Dodge",
		spell = 47766,
	},
	[39003] = {
		name = "Scroll of Enchant Cloak - Greater Speed",
		spell = 47898,
	},
	[39004] = {
		name = "Scroll of Enchant Cloak - Wisdom",
		spell = 47899,
	},
	[39005] = {
		name = "Scroll of Enchant Chest - Super Health",
		spell = 47900,
	},
	[39006] = {
		name = "Scroll of Enchant Boots - Tuskarr's Vitality",
		spell = 47901,
	},
	[41146] = {
		enchID = 3607,
		minLvl = 70,
		name = "Sun Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 55076,
	},
	[41167] = {
		enchID = 3608,
		minLvl = 70,
		name = "Heartseeker Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 55135,
	},
	[41601] = {
		enchID = 3718,
		minLvl = 70,
		name = "Shining Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 55630,
	},
	[41602] = {
		enchID = 3719,
		minLvl = 70,
		name = "Brilliant Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 55631,
	},
	[41603] = {
		enchID = 3720,
		minLvl = 70,
		name = "Azure Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 55632,
	},
	[41604] = {
		enchID = 3721,
		minLvl = 70,
		name = "Sapphire Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 55634,
	},
	[41611] = {
		enchID = 3729,
		maxIlvl = 299,
		minLvl = 70,
		name = "Eternal Belt Buckle",
		slot = { "waist" },
		source = "Crafted (undetectable)",
		spell = 55655,
	},
	[41976] = {
		enchID = 3731,
		minLvl = 70,
		name = "Titanium Weapon Chain",
		slot = normalWeapon,
		source = "Crafted",
		spell = 55836,
	},
	[42500] = {
		enchID = 3748,
		minLvl = 70,
		name = "Titanium Shield Spike",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
		spell = 56353,
	},
	[43987] = {
		name = "Scroll of Enchant Weapon - Black Magic",
		spell = 59625,
	},
	[44067] = {
		enchID = 3793,
		minLvl = 80,
		name = "Inscription of Triumph",
		slot = { "shoulder" },
		source = "PVP-Vendor",
		spell = 59771,
	},
	[44068] = {
		enchID = 3794,
		minLvl = 80,
		name = "Inscription of Dominance",
		slot = { "shoulder" },
		source = "PVP-Vendor",
		spell = 59773,
	},
	[44069] = {
		enchID = 3795,
		minLvl = 80,
		name = "Arcanum of Triumph",
		slot = { "head" },
		source = "PVP-Vendor",
		spell = 59777,
	},
	[44075] = {
		enchID = 3797,
		minLvl = 80,
		name = "Arcanum of Dominance",
		slot = { "head" },
		source = "PVP-Vendor",
		spell = 59784,
	},
	[44129] = {
		enchID = 3806,
		minLvl = 80,
		name = "Lesser Inscription of the Storm",
		rep = {
			["The Sons of Hodir"] = 6,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59927,
	},
	[44130] = {
		enchID = 3807,
		minLvl = 80,
		name = "Lesser Inscription of the Crag",
		rep = {
			["The Sons of Hodir"] = 6,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59928,
	},
	[44131] = {
		enchID = 3875,
		minLvl = 80,
		name = "Lesser Inscription of the Axe",
		rep = {
			["The Sons of Hodir"] = 6,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59929,
	},
	[44132] = {
		enchID = 3876,
		minLvl = 80,
		name = "Lesser Inscription of the Pinnacle",
		rep = {
			["The Sons of Hodir"] = 6,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59932,
	},
	[44133] = {
		boa = true,
		enchID = 3808,
		minLvl = 80,
		name = "Greater Inscription of the Axe",
		rep = {
			["The Sons of Hodir"] = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59934,
	},
	[44134] = {
		boa = true,
		enchID = 3809,
		minLvl = 80,
		name = "Greater Inscription of the Crag",
		rep = {
			["The Sons of Hodir"] = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59936,
	},
	[44135] = {
		boa = true,
		enchID = 3810,
		minLvl = 80,
		name = "Greater Inscription of the Storm",
		rep = {
			["The Sons of Hodir"] = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59937,
	},
	[44136] = {
		boa = true,
		enchID = 3811,
		minLvl = 80,
		name = "Greater Inscription of the Pinnacle",
		rep = {
			["The Sons of Hodir"] = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59941,
	},
	[44137] = {
		enchID = 3812,
		minLvl = 80,
		name = "Arcanum of the Frosty Soul",
		rep = {
			["The Sons of Hodir"] = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59944,
	},
	[44138] = {
		enchID = 3813,
		minLvl = 80,
		name = "Arcanum of Toxic Warding",
		rep = {
			["Knights of the Ebon Blade"] = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59945,
	},
	[44139] = {
		enchID = 3814,
		minLvl = 80,
		name = "Arcanum of the Fleeing Shadow",
		rep = {
			["Argent Crusade"] = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59946,
	},
	[44140] = {
		enchID = 3815,
		minLvl = 80,
		name = "Arcanum of the Eclipsed Moon",
		rep = {
			["The Wyrmrest Accord"] = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59947,
	},
	[44141] = {
		enchID = 3816,
		minLvl = 80,
		name = "Arcanum of the Flame's Soul",
		rep = {
			["Kirin Tor"] = 6,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59948,
	},
	[44149] = {
		boa = true,
		enchID = 3817,
		minLvl = 80,
		name = "Arcanum of Torment",
		rep = {
			["Knights of the Ebon Blade"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59954,
	},
	[44150] = {
		boa = true,
		enchID = 3818,
		minLvl = 80,
		name = "Arcanum of the Stalwart Protector",
		rep = {
			["Argent Crusade"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59955,
	},
	[44152] = {
		boa = true,
		enchID = 3819,
		minLvl = 80,
		name = "Arcanum of Blissful Mending",
		rep = {
			["The Wyrmrest Accord"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59960,
	},
	[44159] = {
		boa = true,
		enchID = 3820,
		minLvl = 80,
		name = "Arcanum of Burning Mysteries",
		rep = {
			["Kirin Tor"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59970,
	},
	[44449] = {
		name = "Scroll of Enchant Boots - Assault",
		spell = 60606,
	},
	[44453] = {
		name = "Scroll of Enchant Weapon - Greater Potency",
		spell = 60621,
	},
	[44455] = {
		name = "Shield Enchant - Intellect III",
		spell = 60653,
	},
	[44456] = {
		name = "Scroll of Enchant Cloak - Speed",
		spell = 60609,
	},
	[44457] = {
		name = "Scroll of Enchant Cloak - Major Agility",
		spell = 60663,
	},
	[44458] = {
		name = "Scroll of Enchant Gloves - Crusher",
		spell = 60668,
	},
	[44463] = {
		name = "Scroll of Enchant 2H Weapon - Massacre",
		spell = 60691,
	},
	[44465] = {
		name = "Scroll of Enchant Chest - Powerful Stats",
		spell = 60692,
	},
	[44466] = {
		name = "Scroll of Enchant Weapon - Superior Potency",
		spell = 60707,
	},
	[44467] = {
		name = "Scroll of Enchant Weapon - Mighty Spellpower",
		spell = 60714,
	},
	[44469] = {
		name = "Scroll of Enchant Boots - Greater Assault",
		spell = 60763,
	},
	[44470] = {
		name = "Scroll of Enchant Bracer - Superior Spellpower",
		spell = 60767,
	},
	[44493] = {
		name = "Scroll of Enchant Weapon - Berserking",
		spell = 59621,
	},
	[44497] = {
		name = "Scroll of Enchant Weapon - Accuracy",
		spell = 59619,
	},
	[44701] = {
		boa = true,
		enchID = 3842,
		minLvl = 80,
		name = "Arcanum of the Savage Gladiator",
		rep = {
			["Alliance Vanguard"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 61271,
	},
	[44702] = {
		boa = true,
		enchID = 3842,
		minLvl = 80,
		name = "Arcanum of the Savage Gladiator",
		rep = {
			["Horde Expedition"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 61271,
	},
	[44739] = {
		enchID = 3843,
		minLvl = 70,
		name = "Diamond-Cut Refractor Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 61468,
	},
	[44815] = {
		name = "Scroll of Enchant Bracers - Greater Assault",
		spell = 44575,
	},
	[44936] = {
		enchID = 3849,
		minLvl = 70,
		name = "Titanium Plating",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
		spell = 62201,
	},
	[44947] = {
		name = "Scroll of Enchant Bracer - Major Stamina",
		spell = 62256,
	},
	[44957] = {
		enchID = 3852,
		minLvl = 70,
		name = "Greater Inscription of the Gladiator",
		slot = { "shoulder" },
		source = "PVP-Vendor",
		spell = 62384,
	},
	[44963] = {
		enchID = 3853,
		minLvl = 80,
		name = "Earthen Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 62447,
	},
	[45056] = {
		name = "Scroll of Enchant Staff - Greater Spellpower",
		spell = 62948,
	},
	[45060] = {
		name = "Scroll of Enchant Staff - Spellpower",
		spell = 62959,
	},
	[45628] = {
		name = "Scroll of Enchant Boots - Lesser Accuracy",
		spell = 63746,
	},
	[46026] = {
		name = "Scroll of Enchant Weapon - Blade Ward",
		spell = 64441,
	},
	[46098] = {
		name = "Scroll of Enchant Weapon - Blood Draining",
		spell = 64579,
	},
	[50335] = {
		boa = true,
		enchID = 3808,
		minLvl = 80,
		name = "Greater Inscription of the Axe",
		rep = {
			["The Sons of Hodir"] = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59934,
	},
	[50336] = {
		boa = true,
		enchID = 3809,
		minLvl = 80,
		name = "Greater Inscription of the Crag",
		rep = {
			["The Sons of Hodir"] = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59936,
	},
	[50337] = {
		boa = true,
		enchID = 3811,
		minLvl = 80,
		name = "Greater Inscription of the Pinnacle",
		rep = {
			["The Sons of Hodir"] = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59941,
	},
	[50338] = {
		boa = true,
		enchID = 3810,
		minLvl = 80,
		name = "Greater Inscription of the Storm",
		rep = {
			["The Sons of Hodir"] = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 59937,
	},
	[50367] = {
		boa = true,
		enchID = 3817,
		minLvl = 80,
		name = "Arcanum of Torment",
		rep = {
			["Knights of the Ebon Blade"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59954,
	},
	[50368] = {
		boa = true,
		enchID = 3820,
		minLvl = 80,
		name = "Arcanum of Burning Mysteries",
		rep = {
			["Kirin Tor"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59970,
	},
	[50369] = {
		boa = true,
		enchID = 3818,
		minLvl = 80,
		name = "Arcanum of the Stalwart Protector",
		rep = {
			["Argent Crusade"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59955,
	},
	[50370] = {
		boa = true,
		enchID = 3819,
		minLvl = 80,
		name = "Arcanum of Blissful Mending",
		rep = {
			["The Wyrmrest Accord"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 59960,
	},
	[50372] = {
		boa = true,
		enchID = 3842,
		minLvl = 80,
		name = "Arcanum of the Savage Gladiator",
		rep = {
			["Alliance Vanguard"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 61271,
	},
	[50373] = {
		boa = true,
		enchID = 3842,
		minLvl = 80,
		name = "Arcanum of the Savage Gladiator",
		rep = {
			["Horde Expedition"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 61271,
	},
	[50816] = {
		name = "Scroll of Enchant Gloves - Angler",
		spell = 71692,
	},
	[52687] = {
		name = "Enchant Gloves - Mastery",
		spell = 74132,
	},
	[52743] = {
		name = "Enchant Boots - Earthen Vitality",
		spell = 74189,
	},
	[52744] = {
		name = "Enchant Chest - Mighty Stats",
		spell = 74191,
	},
	[52745] = {
		name = "Enchant Cloak - Greater Spell Piercing",
		spell = 74192,
	},
	[52746] = {
		name = "Enchant Bracer - Speed",
		spell = 74193,
	},
	[52747] = {
		name = "Enchant Weapon - Mending",
		spell = 74195,
	},
	[52748] = {
		name = "Enchant Weapon - Avalanche",
		spell = 74197,
	},
	[52749] = {
		name = "Enchant Gloves - Haste",
		spell = 74198,
	},
	[52750] = {
		name = "Enchant Boots - Haste",
		spell = 74199,
	},
	[52751] = {
		name = "Enchant Chest - Stamina",
		spell = 74200,
	},
	[52752] = {
		name = "Enchant Bracer - Critical Strike",
		spell = 74201,
	},
	[52753] = {
		name = "Enchant Cloak - Intellect",
		spell = 74202,
	},
	[52754] = {
		name = "Enchant Shield - Protection",
		spell = 74207,
	},
	[52755] = {
		name = "Enchant Weapon - Elemental Slayer",
		spell = 74211,
	},
	[52756] = {
		name = "Enchant Gloves - Exceptional Strength",
		spell = 74212,
	},
	[52757] = {
		name = "Enchant Boots - Major Agility",
		spell = 74213,
	},
	[52758] = {
		name = "Enchant Chest - Mighty Resilience",
		spell = 74214,
	},
	[52759] = {
		name = "Enchant Gloves - Greater Expertise",
		spell = 74220,
	},
	[52760] = {
		name = "Enchant Weapon - Hurricane",
		spell = 74223,
	},
	[52761] = {
		name = "Enchant Weapon - Heartsong",
		spell = 74225,
	},
	[52762] = {
		name = "Enchant Shield - Mastery",
		spell = 74226,
	},
	[52763] = {
		name = "Enchant Bracer - Dodge",
		spell = 74229,
	},
	[52764] = {
		name = "Enchant Cloak - Critical Strike",
		spell = 74230,
	},
	[52765] = {
		name = "Enchant Chest - Exceptional Spirit",
		spell = 74231,
	},
	[52766] = {
		name = "Enchant Bracer - Precision",
		spell = 74232,
	},
	[52767] = {
		name = "Enchant Cloak - Protection",
		spell = 74234,
	},
	[52768] = {
		name = "Enchant Off-Hand - Superior Intellect",
		spell = 74235,
	},
	[52769] = {
		name = "Enchant Boots - Precision",
		spell = 74236,
	},
	[52770] = {
		name = "Enchant Bracer - Exceptional Spirit",
		spell = 74237,
	},
	[52771] = {
		name = "Enchant Boots - Mastery",
		spell = 74238,
	},
	[52772] = {
		name = "Enchant Bracer - Greater Expertise",
		spell = 74239,
	},
	[52773] = {
		name = "Enchant Cloak - Greater Intellect",
		spell = 74240,
	},
	[52774] = {
		name = "Enchant Weapon - Power Torrent",
		spell = 74242,
	},
	[52775] = {
		name = "Enchant Weapon - Windwalk",
		spell = 74244,
	},
	[52776] = {
		name = "Enchant Weapon - Landslide",
		spell = 74246,
	},
	[52777] = {
		name = "Enchant Cloak - Greater Critical Strike",
		spell = 74247,
	},
	[52778] = {
		name = "Enchant Bracer - Greater Critical Strike",
		spell = 74248,
	},
	[52779] = {
		name = "Enchant Chest - Peerless Stats",
		spell = 74250,
	},
	[52780] = {
		name = "Enchant Chest - Greater Stamina",
		spell = 74251,
	},
	[52781] = {
		name = "Enchant Boots - Assassin's Step",
		spell = 74252,
	},
	[52782] = {
		name = "Enchant Boots - Lavawalker",
		spell = 74253,
	},
	[52783] = {
		name = "Enchant Gloves - Mighty Strength",
		spell = 74254,
	},
	[52784] = {
		name = "Enchant Gloves - Greater Mastery",
		spell = 74255,
	},
	[52785] = {
		name = "Enchant Bracer - Greater Speed",
		spell = 74256,
	},
	[54447] = {
		enchID = 4111,
		minLvl = 80,
		name = "Enchanted Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 75151,
	},
	[54448] = {
		enchID = 4112,
		minLvl = 85,
		name = "Powerful Enchanted Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 75152,
	},
	[54449] = {
		enchID = 4109,
		minLvl = 80,
		name = "Ghostly Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 75149,
	},
	[54450] = {
		enchID = 4110,
		minLvl = 85,
		name = "Powerful Ghostly Spellthread",
		slot = { "legs" },
		source = "Crafted",
		spell = 75150,
	},
	[55054] = {
		enchID = 3729,
		maxIlvl = 499,
		minLvl = 80,
		name = "Ebonsteel Belt Buckle",
		slot = { "waist" },
		source = "Crafted (undetectable)",
		spell = 76168,
	},
	[55055] = {
		enchID = 4215,
		minLvl = 80,
		name = "Elementium Shield Spike",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
		spell = 92433,
	},
	[55056] = {
		enchID = 4216,
		minLvl = 85,
		name = "Pyrium Shield Spike",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
		spell = 92437,
	},
	[55057] = {
		enchID = 4217,
		minLvl = 81,
		name = "Pyrium Weapon Chain",
		slot = normalWeapon,
		source = "Crafted",
		spell = 93448,
		stacks = false,
	},
	[56477] = {
		enchID = 4120,
		minLvl = 78,
		name = "Savage Armor Kit",
		slot = { "head", "chest", "shoulder", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 78165,
	},
	[56502] = {
		enchID = 4122,
		minLvl = 80,
		name = "Scorched Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 78169,
	},
	[56503] = {
		enchID = 4124,
		minLvl = 80,
		name = "Twilight Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 78170,
	},
	[56517] = {
		enchID = 4121,
		minLvl = 81,
		name = "Heavy Savage Armor Kit",
		slot = { "head", "chest", "shoulder", "legs", "hands", "feet" },
		source = "Crafted",
		spell = 78166,
	},
	[56550] = {
		enchID = 4126,
		minLvl = 85,
		name = "Dragonscale Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 78171,
	},
	[56551] = {
		enchID = 4127,
		minLvl = 85,
		name = "Charscale Leg Armor",
		slot = { "legs" },
		source = "Crafted",
		spell = 78172,
	},
	[59594] = {
		enchID = 4175,
		minLvl = 80,
		name = "Gnomish X-Ray Scope",
		slot = normalRanged,
		source = "Crafted",
		spell = 81932,
	},
	[59595] = {
		enchID = 4176,
		minLvl = 80,
		name = "R19 Threatfinder",
		slot = normalRanged,
		source = "Crafted",
		spell = 81933,
	},
	[59596] = {
		enchID = 4177,
		minLvl = 80,
		name = "Safety Catch Removal Kit",
		slot = normalRanged,
		source = "Crafted",
		spell = 81934,
	},
	[62321] = {
		enchID = 4197,
		minLvl = 85,
		name = "Lesser Inscription of Unbreakable Quartz",
		rep = {
			Therazane = 6,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 86847,
	},
	[62333] = {
		enchID = 4198,
		minLvl = 85,
		name = "Greater Inscription of Unbreakable Quartz",
		rep = {
			Therazane = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 86854,
	},
	[62342] = {
		enchID = 4199,
		minLvl = 85,
		name = "Lesser Inscription of Charged Lodestone",
		rep = {
			Therazane = 6,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 86898,
	},
	[62343] = {
		enchID = 4200,
		minLvl = 85,
		name = "Greater Inscription of Charged Lodestone",
		rep = {
			Therazane = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 86899,
	},
	[62344] = {
		enchID = 4201,
		minLvl = 85,
		name = "Lesser Inscription of Jagged Stone",
		rep = {
			Therazane = 6,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 86900,
	},
	[62345] = {
		enchID = 4202,
		minLvl = 85,
		name = "Greater Inscription of Jagged Stone",
		rep = {
			Therazane = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 86901,
	},
	[62346] = {
		enchID = 4204,
		minLvl = 85,
		name = "Greater Inscription of Shattered Crystal",
		rep = {
			Therazane = 8,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 86907,
	},
	[62347] = {
		enchID = 4205,
		minLvl = 85,
		name = "Lesser Inscription of Shattered Crystal",
		rep = {
			Therazane = 6,
		},
		slot = { "shoulder" },
		source = "Vendor",
		spell = 86909,
	},
	[62366] = {
		boa = true,
		enchID = 4206,
		minLvl = 85,
		name = "Arcanum of the Earthen Ring",
		rep = {
			["The Earthen Ring"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 86931,
	},
	[62367] = {
		boa = true,
		enchID = 4207,
		minLvl = 85,
		name = "Arcanum of Hyjal",
		rep = {
			["Guardians of Hyjal"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 86932,
	},
	[62368] = {
		boa = true,
		enchID = 4208,
		minLvl = 85,
		name = "Arcanum of the Dragonmaw",
		rep = {
			["Dragonmaw Clan"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 86933,
	},
	[62369] = {
		boa = true,
		enchID = 4209,
		minLvl = 85,
		name = "Arcanum of the Ramkahen",
		rep = {
			Ramkahen = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 86934,
	},
	[62422] = {
		boa = true,
		enchID = 4208,
		minLvl = 85,
		name = "Arcanum of the Wildhammer",
		rep = {
			["Wildhammer Clan"] = 7,
		},
		slot = { "head" },
		source = "Vendor",
		spell = 86933,
	},
	[68134] = {
		name = "Enchant 2H Weapon - Mighty Agility",
		spell = 95471,
	},
	[68768] = {
		enchID = 4247,
		minLvl = 85,
		name = "Arcanum of Vicious Strength",
		slot = { "head" },
		source = "PVP-Vendor",
	},
	[68769] = {
		enchID = 4246,
		minLvl = 85,
		name = "Arcanum of Vicious Agility",
		slot = { "head" },
		source = "PVP-Vendor",
	},
	[68770] = {
		enchID = 4245,
		minLvl = 85,
		name = "Arcanum of Vicious Intellect",
		slot = { "head" },
		source = "PVP-Vendor",
	},
	[68772] = {
		enchID = 4248,
		minLvl = 85,
		name = "Greater Inscription of Vicious Intellect",
		slot = { "shoulder" },
		source = "PVP-Vendor",
	},
	[68773] = {
		enchID = 4249,
		minLvl = 85,
		name = "Greater Inscription of Vicious Strength",
		slot = { "shoulder" },
		source = "PVP-Vendor",
	},
	[68774] = {
		enchID = 4250,
		minLvl = 85,
		name = "Greater Inscription of Vicious Agility",
		slot = { "shoulder" },
		source = "PVP-Vendor",
	},
	[68784] = {
		name = "Enchant Bracer - Agility",
		spell = 96264,
	},
	[68785] = {
		name = "Enchant Bracer - Major Strength",
		spell = 96261,
	},
	[68786] = {
		name = "Enchant Bracer - Mighty Intellect",
		spell = 96262,
	},
	[68796] = {
		enchID = 4259,
		name = "Reinforced Fishing Line",
		slot = {
			"two-hand",
			["two-hand"] = {
				[true] = { "fishing pole" },
			},
		},
		source = "Unavailable",
	},
}

local EnchantSpells = {
	[7418] = {
		enchID = 41,
		name = "Enchant Bracer - Minor Health",
		slot = { "wrist" },
		source = "Crafted",
	},
	[7420] = {
		enchID = 41,
		name = "Enchant Chest - Minor Health",
		slot = { "chest" },
		source = "Crafted",
	},
	[7426] = {
		enchID = 44,
		name = "Enchant Chest - Minor Absorption",
		slot = { "chest" },
		source = "Crafted",
	},
	[7428] = {
		enchID = 924,
		name = "Enchant Bracer - Minor Deflection",
		slot = { "wrist" },
		source = "Crafted",
	},
	[7443] = {
		enchID = 24,
		name = "Enchant Chest - Minor Mana",
		slot = { "chest" },
		source = "Crafted",
	},
	[7454] = {
		enchID = 65,
		name = "Enchant Cloak - Minor Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[7457] = {
		enchID = 66,
		name = "Enchant Bracer - Minor Stamina",
		slot = { "wrist" },
		source = "Crafted",
	},
	[7745] = {
		enchID = 241,
		name = "Enchant 2H Weapon - Minor Impact",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[7748] = {
		enchID = 242,
		name = "Enchant Chest - Lesser Health",
		slot = { "chest" },
		source = "Crafted",
	},
	[7766] = {
		enchID = 243,
		name = "Enchant Bracer - Minor Spirit",
		slot = { "wrist" },
		source = "Crafted",
	},
	[7771] = {
		enchID = 783,
		name = "Enchant Cloak - Minor Protection",
		slot = { "back" },
		source = "Crafted",
	},
	[7776] = {
		enchID = 246,
		name = "Enchant Chest - Lesser Mana",
		slot = { "chest" },
		source = "Crafted",
	},
	[7779] = {
		enchID = 247,
		name = "Enchant Bracer - Minor Agility",
		slot = { "wrist" },
		source = "Crafted",
	},
	[7782] = {
		enchID = 248,
		name = "Enchant Bracer - Minor Strength",
		slot = { "wrist" },
		source = "Crafted",
	},
	[7786] = {
		enchID = 249,
		name = "Enchant Weapon - Minor Beastslayer",
		slot = normalWeapon,
		source = "Crafted",
	},
	[7788] = {
		enchID = 250,
		name = "Enchant Weapon - Minor Striking",
		slot = normalWeapon,
		source = "Crafted",
	},
	[7793] = {
		enchID = 723,
		name = "Enchant 2H Weapon - Lesser Intellect",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[7857] = {
		enchID = 254,
		name = "Enchant Chest - Health",
		slot = { "chest" },
		source = "Crafted",
	},
	[7859] = {
		enchID = 255,
		name = "Enchant Bracer - Lesser Spirit",
		slot = { "wrist" },
		source = "Crafted",
	},
	[7861] = {
		enchID = 256,
		name = "Enchant Cloak - Lesser Fire Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[7863] = {
		enchID = 66,
		name = "Enchant Boots - Minor Stamina",
		slot = { "feet" },
		source = "Crafted",
	},
	[7867] = {
		enchID = 247,
		minIlvl = 60,
		name = "Enchant Boots - Minor Agility",
		slot = { "feet" },
		source = "Crafted",
	},
	[13378] = {
		enchID = 66,
		name = "Enchant Shield - Minor Stamina",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[13380] = {
		enchID = 255,
		name = "Enchant 2H Weapon - Lesser Spirit",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[13419] = {
		enchID = 247,
		name = "Enchant Cloak - Minor Agility",
		slot = { "back" },
		source = "Crafted",
	},
	[13421] = {
		enchID = 744,
		name = "Enchant Cloak - Lesser Protection",
		slot = { "back" },
		source = "Crafted",
	},
	[13464] = {
		enchID = 848,
		name = "Enchant Shield - Lesser Protection",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[13485] = {
		enchID = 255,
		name = "Enchant Shield - Lesser Spirit",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[13501] = {
		enchID = 724,
		name = "Enchant Bracer - Lesser Stamina",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13503] = {
		enchID = 241,
		name = "Enchant Weapon - Lesser Striking",
		slot = normalWeapon,
		source = "Crafted",
	},
	[13522] = {
		enchID = 804,
		name = "Enchant Cloak - Lesser Shadow Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[13529] = {
		enchID = 943,
		name = "Enchant 2H Weapon - Lesser Impact",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[13536] = {
		enchID = 823,
		name = "Enchant Bracer - Lesser Strength",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13538] = {
		enchID = 63,
		name = "Enchant Chest - Lesser Absorption",
		slot = { "chest" },
		source = "Crafted",
	},
	[13607] = {
		enchID = 843,
		name = "Enchant Chest - Mana",
		slot = { "chest" },
		source = "Crafted",
	},
	[13612] = {
		enchID = 844,
		name = "Enchant Gloves - Mining",
		slot = { "hands" },
		source = "Crafted",
	},
	[13617] = {
		enchID = 845,
		name = "Enchant Gloves - Herbalism",
		slot = { "hands" },
		source = "Crafted",
	},
	[13620] = {
		enchID = 2603,
		name = "Enchant Gloves - Fishing",
		slot = { "hands" },
		source = "Crafted",
	},
	[13622] = {
		enchID = 723,
		name = "Enchant Bracer - Lesser Intellect",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13626] = {
		enchID = 847,
		name = "Enchant Chest - Minor Stats",
		slot = { "chest" },
		source = "Crafted",
	},
	[13631] = {
		enchID = 724,
		name = "Enchant Shield - Lesser Stamina",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[13635] = {
		enchID = 848,
		name = "Enchant Cloak - Defense",
		slot = { "back" },
		source = "Crafted",
	},
	[13637] = {
		enchID = 849,
		name = "Enchant Boots - Lesser Agility",
		slot = { "feet" },
		source = "Crafted",
	},
	[13640] = {
		enchID = 850,
		name = "Enchant Chest - Greater Health",
		slot = { "chest" },
		source = "Crafted",
	},
	[13642] = {
		enchID = 851,
		name = "Enchant Bracer - Spirit",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13644] = {
		enchID = 724,
		name = "Enchant Boots - Lesser Stamina",
		slot = { "feet" },
		source = "Crafted",
	},
	[13646] = {
		enchID = 925,
		name = "Enchant Bracer - Lesser Deflection",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13648] = {
		enchID = 852,
		name = "Enchant Bracer - Stamina",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13653] = {
		enchID = 853,
		name = "Enchant Weapon - Lesser Beastslayer",
		slot = normalWeapon,
		source = "Crafted",
	},
	[13655] = {
		enchID = 854,
		name = "Enchant Weapon - Lesser Elemental Slayer",
		slot = normalWeapon,
		source = "Crafted",
	},
	[13657] = {
		enchID = 2463,
		name = "Enchant Cloak - Fire Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[13659] = {
		enchID = 851,
		name = "Enchant Shield - Spirit",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[13661] = {
		enchID = 856,
		name = "Enchant Bracer - Strength",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13663] = {
		enchID = 857,
		name = "Enchant Chest - Greater Mana",
		slot = { "chest" },
		source = "Crafted",
	},
	[13687] = {
		enchID = 255,
		name = "Enchant Boots - Lesser Spirit",
		slot = { "feet" },
		source = "Crafted",
	},
	[13689] = {
		enchID = 863,
		name = "Enchant Shield - Lesser Block",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[13693] = {
		enchID = 943,
		name = "Enchant Weapon - Striking",
		slot = normalWeapon,
		source = "Crafted",
	},
	[13695] = {
		enchID = 1897,
		name = "Enchant 2H Weapon - Impact",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[13698] = {
		enchID = 865,
		name = "Enchant Gloves - Skinning",
		slot = { "hands" },
		source = "Crafted",
	},
	[13700] = {
		enchID = 866,
		name = "Enchant Chest - Lesser Stats",
		slot = { "chest" },
		source = "Crafted",
	},
	[13746] = {
		enchID = 884,
		name = "Enchant Cloak - Greater Defense",
		slot = { "back" },
		source = "Crafted",
	},
	[13794] = {
		enchID = 903,
		name = "Enchant Cloak - Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[13815] = {
		enchID = 904,
		name = "Enchant Gloves - Agility",
		slot = { "hands" },
		source = "Crafted",
	},
	[13817] = {
		enchID = 852,
		name = "Enchant Shield - Stamina",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[13822] = {
		enchID = 905,
		name = "Enchant Bracer - Intellect",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13836] = {
		enchID = 852,
		name = "Enchant Boots - Stamina",
		slot = { "feet" },
		source = "Crafted",
	},
	[13841] = {
		enchID = 906,
		name = "Enchant Gloves - Advanced Mining",
		slot = { "hands" },
		source = "Crafted",
	},
	[13846] = {
		enchID = 907,
		name = "Enchant Bracer - Greater Spirit",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13858] = {
		enchID = 908,
		name = "Enchant Chest - Superior Health",
		slot = { "chest" },
		source = "Crafted",
	},
	[13868] = {
		enchID = 909,
		name = "Enchant Gloves - Advanced Herbalism",
		slot = { "hands" },
		source = "Crafted",
	},
	[13882] = {
		enchID = 849,
		name = "Enchant Cloak - Lesser Agility",
		slot = { "back" },
		source = "Crafted",
	},
	[13887] = {
		enchID = 856,
		name = "Enchant Gloves - Strength",
		slot = { "hands" },
		source = "Crafted",
	},
	[13890] = {
		enchID = 911,
		name = "Enchant Boots - Minor Speed",
		slot = { "feet" },
		source = "Crafted",
	},
	[13898] = {
		enchID = 803,
		name = "Enchant Weapon - Fiery Weapon",
		slot = normalWeapon,
		source = "Crafted",
	},
	[13905] = {
		enchID = 907,
		name = "Enchant Shield - Greater Spirit",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[13915] = {
		enchID = 912,
		name = "Enchant Weapon - Demonslaying",
		slot = normalWeapon,
		source = "Crafted",
	},
	[13917] = {
		enchID = 913,
		name = "Enchant Chest - Superior Mana",
		slot = { "chest" },
		source = "Crafted",
	},
	[13931] = {
		enchID = 923,
		name = "Enchant Bracer - Deflection",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13933] = {
		enchID = 926,
		name = "Enchant Shield - Frost Resistance",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[13935] = {
		enchID = 904,
		name = "Enchant Boots - Agility",
		slot = { "feet" },
		source = "Crafted",
	},
	[13937] = {
		enchID = 963,
		name = "Enchant 2H Weapon - Greater Impact",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[13939] = {
		enchID = 927,
		name = "Enchant Bracer - Greater Strength",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13941] = {
		enchID = 928,
		name = "Enchant Chest - Stats",
		slot = { "chest" },
		source = "Crafted",
	},
	[13943] = {
		enchID = 805,
		name = "Enchant Weapon - Greater Striking",
		slot = normalWeapon,
		source = "Crafted",
	},
	[13945] = {
		enchID = 929,
		name = "Enchant Bracer - Greater Stamina",
		slot = { "wrist" },
		source = "Crafted",
	},
	[13947] = {
		enchID = 930,
		maxLvl = 70,
		name = "Enchant Gloves - Riding Skill",
		slot = { "hands" },
		source = "Crafted",
	},
	[13948] = {
		enchID = 931,
		name = "Enchant Gloves - Minor Haste",
		slot = { "hands" },
		source = "Crafted",
	},
	[20008] = {
		enchID = 1883,
		name = "Enchant Bracer - Greater Intellect",
		slot = { "wrist" },
		source = "Crafted",
	},
	[20009] = {
		enchID = 1884,
		name = "Enchant Bracer - Superior Spirit",
		slot = { "wrist" },
		source = "Crafted",
	},
	[20010] = {
		enchID = 1885,
		name = "Enchant Bracer - Superior Strength",
		slot = { "wrist" },
		source = "Crafted",
	},
	[20011] = {
		enchID = 1886,
		name = "Enchant Bracer - Superior Stamina",
		slot = { "wrist" },
		source = "Crafted",
	},
	[20012] = {
		enchID = 1887,
		name = "Enchant Gloves - Greater Agility",
		slot = { "hands" },
		source = "Crafted",
	},
	[20013] = {
		enchID = 927,
		name = "Enchant Gloves - Greater Strength",
		slot = { "hands" },
		source = "Crafted",
	},
	[20014] = {
		enchID = 1888,
		name = "Enchant Cloak - Greater Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[20015] = {
		enchID = 1889,
		name = "Enchant Cloak - Superior Defense",
		slot = { "back" },
		source = "Crafted",
	},
	[20016] = {
		enchID = 1890,
		name = "Enchant Shield - Vitality",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[20017] = {
		enchID = 929,
		name = "Enchant Shield - Greater Stamina",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[20020] = {
		enchID = 929,
		name = "Enchant Boots - Greater Stamina",
		slot = { "feet" },
		source = "Crafted",
	},
	[20023] = {
		enchID = 1887,
		name = "Enchant Boots - Greater Agility",
		slot = { "feet" },
		source = "Crafted",
	},
	[20024] = {
		enchID = 851,
		name = "Enchant Boots - Spirit",
		slot = { "feet" },
		source = "Crafted",
	},
	[20025] = {
		enchID = 1891,
		name = "Enchant Chest - Greater Stats",
		slot = { "chest" },
		source = "Crafted",
	},
	[20026] = {
		enchID = 1892,
		name = "Enchant Chest - Major Health",
		slot = { "chest" },
		source = "Crafted",
	},
	[20028] = {
		enchID = 1893,
		name = "Enchant Chest - Major Mana",
		slot = { "chest" },
		source = "Crafted",
	},
	[20029] = {
		enchID = 1894,
		maxLvl = 60,
		name = "Enchant Weapon - Icy Chill",
		slot = normalWeapon,
		source = "Crafted",
	},
	[20030] = {
		enchID = 1896,
		name = "Enchant 2H Weapon - Superior Impact",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[20031] = {
		enchID = 1897,
		name = "Enchant Weapon - Superior Striking",
		slot = normalWeapon,
		source = "Crafted",
	},
	[20032] = {
		enchID = 1898,
		maxLvl = 60,
		name = "Enchant Weapon - Lifestealing",
		slot = normalWeapon,
		source = "Crafted",
	},
	[20033] = {
		enchID = 1899,
		name = "Enchant Weapon - Unholy Weapon",
		slot = normalWeapon,
		source = "Crafted",
	},
	[20034] = {
		enchID = 1900,
		maxLvl = 60,
		name = "Enchant Weapon - Crusader",
		slot = normalWeapon,
		source = "Crafted",
	},
	[20035] = {
		enchID = 1903,
		name = "Enchant 2H Weapon - Major Spirit",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[20036] = {
		enchID = 1904,
		name = "Enchant 2H Weapon - Major Intellect",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[21931] = {
		enchID = 2443,
		name = "Enchant Weapon - Winter's Might",
		slot = normalWeapon,
		source = "Crafted",
	},
	[22749] = {
		enchID = 2504,
		name = "Enchant Weapon - Spellpower",
		slot = normalWeapon,
		source = "Crafted",
	},
	[22750] = {
		enchID = 2505,
		name = "Enchant Weapon - Healing Power",
		slot = normalWeapon,
		source = "Crafted",
	},
	[23799] = {
		enchID = 2563,
		name = "Enchant Weapon - Strength",
		slot = normalWeapon,
		source = "Crafted",
	},
	[23800] = {
		enchID = 2564,
		name = "Enchant Weapon - Agility",
		slot = normalWeapon,
		source = "Crafted",
	},
	[23801] = {
		enchID = 2565,
		name = "Enchant Bracer - Mana Regeneration",
		slot = { "wrist" },
		source = "Crafted",
	},
	[23802] = {
		enchID = 2650,
		name = "Enchant Bracer - Healing Power",
		slot = { "wrist" },
		source = "Crafted",
	},
	[23803] = {
		enchID = 2567,
		name = "Enchant Weapon - Mighty Spirit",
		slot = normalWeapon,
		source = "Crafted",
	},
	[23804] = {
		enchID = 2568,
		name = "Enchant Weapon - Mighty Intellect",
		slot = normalWeapon,
		source = "Crafted",
	},
	[25072] = {
		enchID = 2613,
		name = "Enchant Gloves - Threat",
		slot = { "hands" },
		source = "Crafted",
	},
	[25073] = {
		enchID = 2614,
		name = "Enchant Gloves - Shadow Power",
		slot = { "hands" },
		source = "Crafted",
	},
	[25074] = {
		enchID = 2615,
		name = "Enchant Gloves - Frost Power",
		slot = { "hands" },
		source = "Crafted",
	},
	[25078] = {
		enchID = 2616,
		name = "Enchant Gloves - Fire Power",
		slot = { "hands" },
		source = "Crafted",
	},
	[25079] = {
		enchID = 2617,
		name = "Enchant Gloves - Healing Power",
		slot = { "hands" },
		source = "Crafted",
	},
	[25080] = {
		enchID = 2564,
		name = "Enchant Gloves - Superior Agility",
		slot = { "hands" },
		source = "Crafted",
	},
	[25081] = {
		enchID = 2619,
		name = "Enchant Cloak - Greater Fire Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[25082] = {
		enchID = 2620,
		name = "Enchant Cloak - Greater Nature Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[25083] = {
		enchID = 910,
		name = "Enchant Cloak - Stealth",
		slot = { "back" },
		source = "Crafted",
	},
	[25084] = {
		enchID = 2621,
		name = "Enchant Cloak - Subtlety",
		slot = { "back" },
		source = "Crafted",
	},
	[25086] = {
		enchID = 2622,
		name = "Enchant Cloak - Dodge",
		slot = { "back" },
		source = "Crafted",
	},
	[27837] = {
		enchID = 2646,
		name = "Enchant 2H Weapon - Agility",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[27899] = {
		enchID = 2647,
		minIlvl = 35,
		name = "Enchant Bracer - Brawn",
		slot = { "wrist" },
		source = "Crafted",
	},
	[27905] = {
		enchID = 1891,
		minIlvl = 35,
		name = "Enchant Bracer - Stats",
		slot = { "wrist" },
		source = "Crafted",
	},
	[27906] = {
		enchID = 2648,
		minIlvl = 35,
		name = "Enchant Bracer - Greater Dodge",
		slot = { "wrist" },
		source = "Crafted",
	},
	[27911] = {
		enchID = 2650,
		minIlvl = 35,
		name = "Enchant Bracer - Superior Healing",
		slot = { "wrist" },
		source = "Crafted",
	},
	[27913] = {
		enchID = 2679,
		minIlvl = 35,
		name = "Enchant Bracer - Restore Mana Prime",
		slot = { "wrist" },
		source = "Crafted",
	},
	[27914] = {
		enchID = 2649,
		minIlvl = 35,
		name = "Enchant Bracer - Fortitude",
		slot = { "wrist" },
		source = "Crafted",
	},
	[27917] = {
		enchID = 2650,
		minIlvl = 35,
		name = "Enchant Bracer - Spellpower",
		slot = { "wrist" },
		source = "Crafted",
	},
	[27920] = {
		enchID = 2929,
		minIlvl = 35,
		name = "Enchant Ring - Striking",
		skill = {
			Enchanting = 360,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[27924] = {
		enchID = 2928,
		minIlvl = 35,
		name = "Enchant Ring - Spellpower",
		skill = {
			Enchanting = 360,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[27926] = {
		enchID = 2930,
		minIlvl = 35,
		name = "Enchant Ring - Healing Power",
		skill = {
			Enchanting = 370,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[27927] = {
		enchID = 2931,
		minIlvl = 35,
		name = "Enchant Ring - Stats",
		skill = {
			Enchanting = 375,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[27944] = {
		enchID = 2653,
		minIlvl = 35,
		name = "Enchant Shield - Tough Shield",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[27945] = {
		enchID = 2654,
		minIlvl = 35,
		name = "Enchant Shield - Intellect",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[27946] = {
		enchID = 2655,
		minIlvl = 35,
		name = "Enchant Shield - Shield Block",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[27947] = {
		enchID = 1888,
		minIlvl = 35,
		name = "Enchant Shield - Resistance",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[27948] = {
		enchID = 2656,
		minIlvl = 35,
		name = "Enchant Boots - Vitality",
		slot = { "feet" },
		source = "Crafted",
	},
	[27950] = {
		enchID = 2649,
		minIlvl = 35,
		name = "Enchant Boots - Fortitude",
		slot = { "feet" },
		source = "Crafted",
	},
	[27951] = {
		enchID = 2657,
		minIlvl = 35,
		name = "Enchant Boots - Dexterity",
		slot = { "feet" },
		source = "Crafted",
	},
	[27954] = {
		enchID = 2658,
		minIlvl = 35,
		name = "Enchant Boots - Surefooted",
		slot = { "feet" },
		source = "Crafted",
	},
	[27957] = {
		enchID = 2659,
		minIlvl = 35,
		name = "Enchant Chest - Exceptional Health",
		slot = { "chest" },
		source = "Crafted",
	},
	[27958] = {
		enchID = 3233,
		minIlvl = 35,
		name = "Enchant Chest - Exceptional Mana",
		slot = { "chest" },
		source = "Crafted",
	},
	[27960] = {
		enchID = 2661,
		minIlvl = 35,
		name = "Enchant Chest - Exceptional Stats",
		slot = { "chest" },
		source = "Crafted",
	},
	[27961] = {
		enchID = 2662,
		minIlvl = 35,
		name = "Enchant Cloak - Major Armor",
		slot = { "back" },
		source = "Crafted",
	},
	[27962] = {
		enchID = 2664,
		minIlvl = 35,
		name = "Enchant Cloak - Major Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[27967] = {
		enchID = 963,
		minIlvl = 35,
		name = "Enchant Weapon - Major Striking",
		slot = normalWeapon,
		source = "Crafted",
	},
	[27968] = {
		enchID = 2666,
		minIlvl = 35,
		name = "Enchant Weapon - Major Intellect",
		slot = normalWeapon,
		source = "Crafted",
	},
	[27971] = {
		enchID = 2667,
		minIlvl = 35,
		name = "Enchant 2H Weapon - Savagery",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[27972] = {
		enchID = 2668,
		minIlvl = 35,
		name = "Enchant Weapon - Potency",
		slot = normalWeapon,
		source = "Crafted",
	},
	[27975] = {
		enchID = 2669,
		minIlvl = 35,
		name = "Enchant Weapon - Major Spellpower",
		slot = normalWeapon,
		source = "Crafted",
	},
	[27977] = {
		enchID = 2670,
		minIlvl = 35,
		name = "Enchant 2H Weapon - Major Agility",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[27981] = {
		enchID = 2671,
		minIlvl = 35,
		name = "Enchant Weapon - Sunfire",
		slot = normalWeapon,
		source = "Crafted",
	},
	[27982] = {
		enchID = 2672,
		minIlvl = 35,
		name = "Enchant Weapon - Soulfrost",
		slot = normalWeapon,
		source = "Crafted",
	},
	[27984] = {
		enchID = 2673,
		minIlvl = 35,
		name = "Enchant Weapon - Mongoose",
		slot = normalWeapon,
		source = "Crafted",
	},
	[28003] = {
		enchID = 2674,
		minIlvl = 35,
		name = "Enchant Weapon - Spellsurge",
		slot = normalWeapon,
		source = "Crafted",
	},
	[28004] = {
		enchID = 2675,
		minIlvl = 35,
		name = "Enchant Weapon - Battlemaster",
		slot = normalWeapon,
		source = "Crafted",
	},
	[33990] = {
		enchID = 1144,
		minIlvl = 35,
		name = "Enchant Chest - Major Spirit",
		slot = { "chest" },
		source = "Crafted",
	},
	[33991] = {
		enchID = 3150,
		name = "Enchant Chest - Restore Mana Prime",
		slot = { "chest" },
		source = "Crafted",
	},
	[33992] = {
		enchID = 2933,
		minIlvl = 35,
		name = "Enchant Chest - Major Resilience",
		slot = { "chest" },
		source = "Crafted",
	},
	[33993] = {
		enchID = 2934,
		minIlvl = 35,
		name = "Enchant Gloves - Blasting",
		slot = { "hands" },
		source = "Crafted",
	},
	[33994] = {
		enchID = 2935,
		minIlvl = 35,
		name = "Enchant Gloves - Precise Strikes",
		slot = { "hands" },
		source = "Crafted",
	},
	[33995] = {
		enchID = 684,
		minIlvl = 35,
		name = "Enchant Gloves - Major Strength",
		slot = { "hands" },
		source = "Crafted",
	},
	[33996] = {
		enchID = 1594,
		minIlvl = 35,
		name = "Enchant Gloves - Assault",
		slot = { "hands" },
		source = "Crafted",
	},
	[33997] = {
		enchID = 2937,
		minIlvl = 35,
		name = "Enchant Gloves - Major Spellpower",
		slot = { "hands" },
		source = "Crafted",
	},
	[33999] = {
		enchID = 2322,
		minIlvl = 35,
		name = "Enchant Gloves - Major Healing",
		slot = { "hands" },
		source = "Crafted",
	},
	[34001] = {
		enchID = 369,
		minIlvl = 35,
		name = "Enchant Bracer - Major Intellect",
		slot = { "wrist" },
		source = "Crafted",
	},
	[34002] = {
		enchID = 1593,
		name = "Enchant Bracer - Assault",
		slot = { "wrist" },
		source = "Crafted",
	},
	[34003] = {
		enchID = 2938,
		minIlvl = 35,
		name = "Enchant Cloak - Spell Penetration",
		slot = { "back" },
		source = "Crafted",
	},
	[34004] = {
		enchID = 368,
		minIlvl = 35,
		name = "Enchant Cloak - Greater Agility",
		slot = { "back" },
		source = "Crafted",
	},
	[34005] = {
		enchID = 1257,
		minIlvl = 35,
		name = "Enchant Cloak - Greater Arcane Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[34006] = {
		enchID = 1441,
		minIlvl = 35,
		name = "Enchant Cloak - Greater Shadow Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[34007] = {
		enchID = 2939,
		name = "Enchant Boots - Cat's Swiftness",
		slot = { "feet" },
		source = "Crafted",
	},
	[34008] = {
		enchID = 2940,
		minIlvl = 35,
		name = "Enchant Boots - Boar's Speed",
		slot = { "feet" },
		source = "Crafted",
	},
	[34009] = {
		enchID = 1071,
		minIlvl = 35,
		name = "Enchant Shield - Major Stamina",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[34010] = {
		enchID = 3846,
		minIlvl = 35,
		name = "Enchant Weapon - Major Healing",
		slot = normalWeapon,
		source = "Crafted",
	},
	[42620] = {
		enchID = 3222,
		minIlvl = 35,
		name = "Enchant Weapon - Greater Agility",
		slot = normalWeapon,
		source = "Crafted",
	},
	[42974] = {
		enchID = 3225,
		minIlvl = 60,
		name = "Enchant Weapon - Executioner",
		slot = normalWeapon,
		source = "Crafted",
	},
	[44383] = {
		enchID = 3229,
		minIlvl = 35,
		name = "Enchant Shield - Resilience",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[44483] = {
		enchID = 3230,
		minIlvl = 60,
		name = "Enchant Cloak - Superior Frost Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[44484] = {
		enchID = 3231,
		minIlvl = 60,
		name = "Enchant Gloves - Expertise",
		slot = { "hands" },
		source = "Crafted",
	},
	[44488] = {
		enchID = 3234,
		minIlvl = 60,
		name = "Enchant Gloves - Precision",
		slot = { "hands" },
		source = "Crafted",
	},
	[44489] = {
		enchID = 1952,
		minIlvl = 60,
		name = "Enchant Shield - Dodge",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[44492] = {
		enchID = 3236,
		minIlvl = 60,
		name = "Enchant Chest - Mighty Health",
		slot = { "chest" },
		source = "Crafted",
	},
	[44494] = {
		enchID = 1400,
		minIlvl = 60,
		name = "Enchant Cloak - Superior Nature Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[44500] = {
		enchID = 983,
		minIlvl = 60,
		name = "Enchant Cloak - Superior Agility",
		slot = { "back" },
		source = "Crafted",
	},
	[44506] = {
		enchID = 3238,
		minIlvl = 60,
		name = "Enchant Gloves - Gatherer",
		slot = { "hands" },
		source = "Crafted",
	},
	[44508] = {
		enchID = 1147,
		minIlvl = 60,
		name = "Enchant Boots - Greater Spirit",
		slot = { "feet" },
		source = "Crafted",
	},
	[44509] = {
		enchID = 2381,
		minIlvl = 60,
		name = "Enchant Chest - Greater Mana Restoration",
		slot = { "chest" },
		source = "Crafted",
	},
	[44510] = {
		enchID = 3844,
		minIlvl = 60,
		name = "Enchant Weapon - Exceptional Spirit",
		slot = normalWeapon,
		source = "Crafted",
	},
	[44513] = {
		enchID = 3829,
		minIlvl = 60,
		name = "Enchant Gloves - Greater Assault",
		slot = { "hands" },
		source = "Crafted",
	},
	[44524] = {
		enchID = 3239,
		minIlvl = 60,
		name = "Enchant Weapon - Icebreaker",
		slot = normalWeapon,
		source = "Crafted",
	},
	[44528] = {
		enchID = 1075,
		minIlvl = 60,
		name = "Enchant Boots - Greater Fortitude",
		slot = { "feet" },
		source = "Crafted",
	},
	[44529] = {
		enchID = 3222,
		minIlvl = 60,
		name = "Enchant Gloves - Major Agility",
		slot = { "hands" },
		source = "Crafted",
	},
	[44555] = {
		enchID = 1119,
		minIlvl = 60,
		name = "Enchant Bracers - Exceptional Intellect",
		slot = { "wrist" },
		source = "Crafted",
	},
	[44556] = {
		enchID = 1354,
		minIlvl = 60,
		name = "Enchant Cloak - Superior Fire Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[44575] = {
		enchID = 3845,
		minIlvl = 60,
		name = "Enchant Bracers - Greater Assault",
		slot = { "wrist" },
		source = "Crafted",
	},
	[44576] = {
		enchID = 3241,
		minIlvl = 60,
		name = "Enchant Weapon - Lifeward",
		slot = normalWeapon,
		source = "Crafted",
	},
	[44582] = {
		enchID = 3243,
		minIlvl = 60,
		name = "Enchant Cloak - Spell Piercing",
		slot = { "back" },
		source = "Crafted",
	},
	[44584] = {
		enchID = 3244,
		minIlvl = 60,
		name = "Enchant Boots - Greater Vitality",
		slot = { "feet" },
		source = "Crafted",
	},
	[44588] = {
		enchID = 3245,
		minIlvl = 60,
		name = "Enchant Chest - Exceptional Resilience",
		slot = { "chest" },
		source = "Crafted",
	},
	[44589] = {
		enchID = 983,
		minIlvl = 60,
		name = "Enchant Boots - Superior Agility",
		slot = { "feet" },
		source = "Crafted",
	},
	[44590] = {
		enchID = 1446,
		minIlvl = 60,
		name = "Enchant Cloak - Superior Shadow Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[44591] = {
		enchID = 1951,
		minIlvl = 60,
		name = "Enchant Cloak - Titanweave",
		slot = { "back" },
		source = "Crafted",
	},
	[44592] = {
		enchID = 3246,
		minIlvl = 60,
		name = "Enchant Gloves - Exceptional Spellpower",
		slot = { "hands" },
		source = "Crafted",
	},
	[44593] = {
		enchID = 1147,
		minIlvl = 60,
		name = "Enchant Bracers - Major Spirit",
		slot = { "wrist" },
		source = "Crafted",
	},
	[44595] = {
		enchID = 3247,
		minIlvl = 60,
		name = "Enchant 2H Weapon - Scourgebane",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[44596] = {
		enchID = 1262,
		minIlvl = 60,
		name = "Enchant Cloak - Superior Arcane Resistance",
		slot = { "back" },
		source = "Crafted",
	},
	[44598] = {
		enchID = 3231,
		minIlvl = 60,
		name = "Enchant Bracer - Expertise",
		slot = { "wrist" },
		source = "Crafted",
	},
	[44616] = {
		enchID = 2661,
		minIlvl = 60,
		name = "Enchant Bracers - Greater Stats",
		slot = { "wrist" },
		source = "Crafted",
	},
	[44621] = {
		enchID = 3251,
		minIlvl = 60,
		name = "Enchant Weapon - Giant Slayer",
		slot = normalWeapon,
		source = "Crafted",
	},
	[44623] = {
		enchID = 3252,
		minIlvl = 60,
		name = "Enchant Chest - Super Stats",
		slot = { "chest" },
		source = "Crafted",
	},
	[44625] = {
		enchID = 3253,
		minIlvl = 60,
		name = "Enchant Gloves - Armsman",
		slot = { "hands" },
		source = "Crafted",
	},
	[44629] = {
		enchID = 3830,
		minIlvl = 60,
		name = "Enchant Weapon - Exceptional Spellpower",
		slot = normalWeapon,
		source = "Crafted",
	},
	[44630] = {
		enchID = 3828,
		minIlvl = 60,
		name = "Enchant 2H Weapon - Greater Savagery",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[44631] = {
		enchID = 3256,
		minIlvl = 60,
		name = "Enchant Cloak - Shadow Armor",
		slot = { "back" },
		source = "Crafted",
	},
	[44633] = {
		enchID = 1103,
		minIlvl = 60,
		name = "Enchant Weapon - Exceptional Agility",
		slot = normalWeapon,
		source = "Crafted",
	},
	[44635] = {
		enchID = 2326,
		minIlvl = 60,
		name = "Enchant Bracers - Greater Spellpower",
		slot = { "wrist" },
		source = "Crafted",
	},
	[44636] = {
		enchID = 3840,
		name = "Enchant Ring - Greater Spellpower",
		skill = {
			Enchanting = 400,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[44645] = {
		enchID = 3839,
		name = "Enchant Ring - Assault",
		skill = {
			Enchanting = 400,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[46578] = {
		enchID = 3273,
		minIlvl = 60,
		name = "Enchant Weapon - Deathfrost",
		slot = normalWeapon,
		source = "Crafted",
	},
	[46594] = {
		enchID = 1951,
		minIlvl = 35,
		name = "Enchant Chest - Dodge",
		slot = { "chest" },
		source = "Crafted",
	},
	[47051] = {
		enchID = 2648,
		minIlvl = 35,
		name = "Enchant Cloak - Steelweave",
		slot = { "back" },
		source = "Crafted",
	},
	[47672] = {
		enchID = 3294,
		minIlvl = 60,
		name = "Enchant Cloak - Mighty Armor",
		slot = { "back" },
		source = "Crafted",
	},
	[47766] = {
		enchID = 1953,
		minIlvl = 60,
		name = "Enchant Chest - Greater Dodge",
		slot = { "chest" },
		source = "Crafted",
	},
	[47898] = {
		enchID = 3831,
		minIlvl = 60,
		name = "Enchant Cloak - Greater Speed",
		slot = { "back" },
		source = "Crafted",
	},
	[47899] = {
		enchID = 3296,
		minIlvl = 60,
		name = "Enchant Cloak - Wisdom",
		slot = { "back" },
		source = "Crafted",
	},
	[47900] = {
		enchID = 3297,
		minIlvl = 60,
		name = "Enchant Chest - Super Health",
		slot = { "chest" },
		source = "Crafted",
	},
	[47901] = {
		enchID = 3232,
		minIlvl = 60,
		name = "Enchant Boots - Tuskarr's Vitality",
		slot = { "feet" },
		source = "Crafted",
	},
	[53323] = {
		class = "DEATHKNIGHT",
		enchID = 3365,
		minLvl = 63,
		name = "Rune of Swordshattering",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[53331] = {
		class = "DEATHKNIGHT",
		enchID = 3366,
		minLvl = 60,
		name = "Rune of Lichbane",
		slot = normalWeapon,
		source = "Crafted",
	},
	[53341] = {
		class = "DEATHKNIGHT",
		enchID = 3369,
		minLvl = 55,
		name = "Rune of Cinderglacier",
		slot = normalWeapon,
		source = "Crafted",
	},
	[53342] = {
		class = "DEATHKNIGHT",
		enchID = 3367,
		minLvl = 57,
		name = "Rune of Spellshattering",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[53343] = {
		class = "DEATHKNIGHT",
		enchID = 3370,
		minLvl = 55,
		name = "Rune of Razorice",
		slot = normalWeapon,
		source = "Crafted",
	},
	[53344] = {
		class = "DEATHKNIGHT",
		enchID = 3368,
		minLvl = 70,
		name = "Rune of the Fallen Crusader",
		slot = normalWeapon,
		source = "Crafted",
	},
	[54446] = {
		class = "DEATHKNIGHT",
		enchID = 3594,
		minLvl = 63,
		name = "Rune of Swordbreaking",
		slot = {
			"one-hand",
			["one-hand"] = {
				[false] = { "fishing pole", "shield" },
			},
		},
		source = "Crafted",
	},
	[54447] = {
		class = "DEATHKNIGHT",
		enchID = 3595,
		minLvl = 57,
		name = "Rune of Spellbreaking",
		slot = {
			"one-hand",
			["one-hand"] = {
				[false] = { "fishing pole", "shield" },
			},
		},
		source = "Crafted",
	},
	[55642] = {
		enchID = 3722,
		name = "Lightweave Embroidery",
		skill = {
			Tailoring = 420,
		},
		slot = { "back" },
		source = "Crafted",
	},
	[55769] = {
		enchID = 3728,
		name = "Darkglow Embroidery",
		skill = {
			Tailoring = 420,
		},
		slot = { "back" },
		source = "Crafted",
	},
	[55777] = {
		enchID = 3730,
		name = "Swordguard Embroidery",
		skill = {
			Tailoring = 420,
		},
		slot = { "back" },
		source = "Crafted",
	},
	[56034] = {
		enchID = 3873,
		name = "Master's Spellthread",
		skill = {
			Tailoring = 405,
		},
		slot = { "legs" },
		source = "Crafted",
	},
	[56039] = {
		enchID = 3872,
		name = "Sanctified Spellthread",
		skill = {
			Tailoring = 405,
		},
		slot = { "legs" },
		source = "Crafted",
	},
	[57683] = {
		enchID = 3756,
		name = "Fur Lining - Attack Power",
		skill = {
			Leatherworking = 400,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[57690] = {
		enchID = 3757,
		name = "Fur Lining - Stamina",
		skill = {
			Leatherworking = 400,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[57691] = {
		enchID = 3758,
		name = "Fur Lining - Spell Power",
		skill = {
			Leatherworking = 400,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[57692] = {
		enchID = 3759,
		name = "Fur Lining - Fire Resist",
		skill = {
			Leatherworking = 400,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[57694] = {
		enchID = 3760,
		name = "Fur Lining - Frost Resist",
		skill = {
			Leatherworking = 400,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[57696] = {
		enchID = 3761,
		name = "Fur Lining - Shadow Resist",
		skill = {
			Leatherworking = 400,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[57699] = {
		enchID = 3762,
		name = "Fur Lining - Nature Resist",
		skill = {
			Leatherworking = 400,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[57701] = {
		enchID = 3763,
		name = "Fur Lining - Arcane Resist",
		skill = {
			Leatherworking = 400,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[59619] = {
		enchID = 3788,
		minIlvl = 60,
		name = "Enchant Weapon - Accuracy",
		slot = normalWeapon,
		source = "Crafted",
	},
	[59621] = {
		enchID = 3789,
		minIlvl = 60,
		name = "Enchant Weapon - Berserking",
		slot = normalWeapon,
		source = "Crafted",
	},
	[59625] = {
		enchID = 3790,
		minIlvl = 60,
		name = "Enchant Weapon - Black Magic",
		slot = normalWeapon,
		source = "Crafted",
	},
	[59636] = {
		enchID = 3791,
		name = "Enchant Ring - Stamina",
		skill = {
			Enchanting = 400,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[60583] = {
		enchID = 3327,
		name = "Jormungar Leg Reinforcements",
		skill = {
			Leatherworking = 405,
		},
		slot = { "legs" },
		source = "Crafted",
	},
	[60584] = {
		enchID = 3328,
		name = "Nerubian Leg Reinforcements",
		skill = {
			Leatherworking = 400,
		},
		slot = { "legs" },
		source = "Crafted",
	},
	[60606] = {
		enchID = 3824,
		minIlvl = 60,
		name = "Enchant Boots - Assault",
		slot = { "feet" },
		source = "Crafted",
	},
	[60609] = {
		enchID = 3825,
		minIlvl = 35,
		name = "Enchant Cloak - Speed",
		slot = { "back" },
		source = "Crafted",
	},
	[60616] = {
		enchID = 1600,
		minIlvl = 60,
		name = "Enchant Bracers - Striking",
		slot = { "wrist" },
		source = "Crafted",
	},
	[60621] = {
		enchID = 1606,
		minIlvl = 60,
		name = "Enchant Weapon - Greater Potency",
		slot = normalWeapon,
		source = "Crafted",
	},
	[60623] = {
		enchID = 3826,
		minIlvl = 60,
		name = "Enchant Boots - Icewalker",
		slot = { "feet" },
		source = "Crafted",
	},
	[60653] = {
		enchID = 1128,
		minIlvl = 60,
		name = "Enchant Shield - Greater Intellect",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[60663] = {
		enchID = 1099,
		minIlvl = 60,
		name = "Enchant Cloak - Major Agility",
		slot = { "back" },
		source = "Crafted",
	},
	[60668] = {
		enchID = 1603,
		minIlvl = 60,
		name = "Enchant Gloves - Crusher",
		slot = { "hands" },
		source = "Crafted",
	},
	[60691] = {
		enchID = 3827,
		minIlvl = 60,
		name = "Enchant 2H Weapon - Massacre",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[60692] = {
		enchID = 3832,
		minIlvl = 60,
		name = "Enchant Chest - Powerful Stats",
		slot = { "chest" },
		source = "Crafted",
	},
	[60707] = {
		enchID = 3833,
		minIlvl = 60,
		name = "Enchant Weapon - Superior Potency",
		slot = normalWeapon,
		source = "Crafted",
	},
	[60714] = {
		enchID = 3834,
		minIlvl = 60,
		name = "Enchant Weapon - Mighty Spellpower",
		slot = normalWeapon,
		source = "Crafted",
	},
	[60763] = {
		enchID = 1597,
		minIlvl = 60,
		name = "Enchant Boots - Greater Assault",
		slot = { "feet" },
		source = "Crafted",
	},
	[60767] = {
		enchID = 2332,
		minIlvl = 60,
		name = "Enchant Bracer - Superior Spellpower",
		slot = { "wrist" },
		source = "Crafted",
	},
	[61117] = {
		enchID = 3835,
		name = "Master's Inscription of the Axe",
		skill = {
			Inscription = 400,
		},
		slot = { "shoulder" },
		source = "Crafted",
	},
	[61118] = {
		enchID = 3836,
		name = "Master's Inscription of the Crag",
		skill = {
			Inscription = 400,
		},
		slot = { "shoulder" },
		source = "Crafted",
	},
	[61119] = {
		enchID = 3837,
		name = "Master's Inscription of the Pinnacle",
		skill = {
			Inscription = 400,
		},
		slot = { "shoulder" },
		source = "Crafted",
	},
	[61120] = {
		enchID = 3838,
		name = "Master's Inscription of the Storm",
		skill = {
			Inscription = 400,
		},
		slot = { "shoulder" },
		source = "Crafted",
	},
	[62158] = {
		class = "DEATHKNIGHT",
		enchID = 3847,
		minLvl = 72,
		name = "Rune of the Stoneskin Gargoyle",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[62256] = {
		enchID = 3850,
		minIlvl = 60,
		name = "Enchant Bracer - Major Stamina",
		slot = { "wrist" },
		source = "Crafted",
	},
	[62948] = {
		enchID = 3854,
		minIlvl = 60,
		name = "Enchant Staff - Greater Spellpower",
		slot = {
			"two-hand",
			["two-hand"] = {
				[true] = { "staff" },
			},
		},
		source = "Crafted",
	},
	[62959] = {
		enchID = 3855,
		minIlvl = 60,
		name = "Enchant Staff - Spellpower",
		slot = {
			"two-hand",
			["two-hand"] = {
				[true] = { "staff" },
			},
		},
		source = "Crafted",
	},
	[63746] = {
		enchID = 3858,
		name = "Enchant Boots - Lesser Accuracy",
		slot = { "feet" },
		source = "Crafted",
	},
	[64441] = {
		enchID = 3869,
		minLvl = 75,
		name = "Enchant Weapon - Blade Ward",
		slot = normalWeapon,
		source = "Crafted",
	},
	[64579] = {
		enchID = 3870,
		minLvl = 75,
		name = "Enchant Weapon - Blood Draining",
		slot = normalWeapon,
		source = "Crafted",
	},
	[70164] = {
		class = "DEATHKNIGHT",
		enchID = 3883,
		minLvl = 72,
		name = "Rune of the Nerubian Carapace",
		slot = {
			"one-hand",
			["one-hand"] = {
				[false] = { "fishing pole", "shield" },
			},
		},
		source = "Crafted",
	},
	[71692] = {
		enchID = 846,
		name = "Enchant Gloves - Angler",
		slot = { "hands" },
		source = "Crafted",
	},
	[74132] = {
		enchID = 4061,
		minIlvl = 300,
		name = "Enchant Gloves - Mastery",
		slot = { "hands" },
		source = "Crafted",
	},
	[74189] = {
		enchID = 4062,
		minIlvl = 300,
		name = "Enchant Boots - Earthen Vitality",
		slot = { "feet" },
		source = "Crafted",
	},
	[74191] = {
		enchID = 4063,
		minIlvl = 300,
		name = "Enchant Chest - Mighty Stats",
		slot = { "chest" },
		source = "Crafted",
	},
	[74192] = {
		enchID = 4064,
		minIlvl = 300,
		name = "Enchant Cloak - Greater Spell Piercing",
		slot = { "back" },
		source = "Crafted",
	},
	[74193] = {
		enchID = 4065,
		minIlvl = 300,
		name = "Enchant Bracer - Speed",
		slot = { "wrist" },
		source = "Crafted",
	},
	[74195] = {
		enchID = 4066,
		minIlvl = 300,
		name = "Enchant Weapon - Mending",
		slot = normalWeapon,
		source = "Crafted",
	},
	[74197] = {
		enchID = 4067,
		minIlvl = 300,
		name = "Enchant Weapon - Avalanche",
		slot = normalWeapon,
		source = "Crafted",
	},
	[74198] = {
		enchID = 4068,
		minIlvl = 300,
		name = "Enchant Gloves - Haste",
		slot = { "hands" },
		source = "Crafted",
	},
	[74199] = {
		enchID = 4069,
		minIlvl = 300,
		name = "Enchant Boots - Haste",
		slot = { "feet" },
		source = "Crafted",
	},
	[74200] = {
		enchID = 4070,
		minIlvl = 300,
		name = "Enchant Chest - Stamina",
		slot = { "chest" },
		source = "Crafted",
	},
	[74201] = {
		enchID = 4071,
		minIlvl = 300,
		name = "Enchant Bracer - Critical Strike",
		slot = { "wrist" },
		source = "Crafted",
	},
	[74202] = {
		enchID = 4072,
		minIlvl = 300,
		name = "Enchant Cloak - Intellect",
		slot = { "back" },
		source = "Crafted",
	},
	[74207] = {
		enchID = 4073,
		minIlvl = 300,
		name = "Enchant Shield - Protection",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[74211] = {
		enchID = 4074,
		minIlvl = 300,
		name = "Enchant Weapon - Elemental Slayer",
		slot = normalWeapon,
		source = "Crafted",
	},
	[74212] = {
		enchID = 4075,
		minIlvl = 300,
		name = "Enchant Gloves - Exceptional Strength",
		slot = { "hands" },
		source = "Crafted",
	},
	[74213] = {
		enchID = 4076,
		minIlvl = 300,
		name = "Enchant Boots - Major Agility",
		slot = { "feet" },
		source = "Crafted",
	},
	[74214] = {
		enchID = 4077,
		minIlvl = 300,
		name = "Enchant Chest - Mighty Resilience",
		slot = { "chest" },
		source = "Crafted",
	},
	[74215] = {
		enchID = 4078,
		name = "Enchant Ring - Strength",
		skill = {
			Enchanting = 475,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[74216] = {
		enchID = 4079,
		name = "Enchant Ring - Agility",
		skill = {
			Enchanting = 475,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[74217] = {
		enchID = 4080,
		name = "Enchant Ring - Intellect",
		skill = {
			Enchanting = 475,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[74218] = {
		enchID = 4081,
		name = "Enchant Ring - Greater Stamina",
		skill = {
			Enchanting = 475,
		},
		slot = { "finger" },
		source = "Crafted",
	},
	[74220] = {
		enchID = 4082,
		minIlvl = 300,
		name = "Enchant Gloves - Greater Expertise",
		slot = { "hands" },
		source = "Crafted",
	},
	[74223] = {
		enchID = 4083,
		minIlvl = 300,
		name = "Enchant Weapon - Hurricane",
		slot = normalWeapon,
		source = "Crafted",
	},
	[74225] = {
		enchID = 4084,
		minIlvl = 300,
		name = "Enchant Weapon - Heartsong",
		slot = normalWeapon,
		source = "Crafted",
	},
	[74226] = {
		enchID = 4085,
		minIlvl = 300,
		name = "Enchant Shield - Mastery",
		slot = {
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[74229] = {
		enchID = 4086,
		minIlvl = 300,
		name = "Enchant Bracer - Dodge",
		slot = { "wrist" },
		source = "Crafted",
	},
	[74230] = {
		enchID = 4087,
		minIlvl = 300,
		name = "Enchant Cloak - Critical Strike",
		slot = { "back" },
		source = "Crafted",
	},
	[74231] = {
		enchID = 4088,
		minIlvl = 300,
		name = "Enchant Chest - Exceptional Spirit",
		slot = { "chest" },
		source = "Crafted",
	},
	[74232] = {
		enchID = 4089,
		minIlvl = 300,
		name = "Enchant Bracer - Precision",
		slot = { "wrist" },
		source = "Crafted",
	},
	[74234] = {
		enchID = 4090,
		minIlvl = 300,
		name = "Enchant Cloak - Protection",
		slot = { "back" },
		source = "Crafted",
	},
	[74235] = {
		enchID = 4091,
		minIlvl = 300,
		name = "Enchant Off-Hand - Superior Intellect",
		slot = {
			"held in off-hand",
			"off hand",
			["off hand"] = {
				[true] = { "shield" },
			},
		},
		source = "Crafted",
	},
	[74236] = {
		enchID = 4092,
		minIlvl = 300,
		name = "Enchant Boots - Precision",
		slot = { "feet" },
		source = "Crafted",
	},
	[74237] = {
		enchID = 4093,
		minIlvl = 300,
		name = "Enchant Bracer - Exceptional Spirit",
		slot = { "wrist" },
		source = "Crafted",
	},
	[74238] = {
		enchID = 4094,
		minIlvl = 300,
		name = "Enchant Boots - Mastery",
		slot = { "feet" },
		source = "Crafted",
	},
	[74239] = {
		enchID = 4095,
		minIlvl = 300,
		name = "Enchant Bracer - Greater Expertise",
		slot = { "wrist" },
		source = "Crafted",
	},
	[74240] = {
		enchID = 4096,
		minIlvl = 300,
		name = "Enchant Cloak - Greater Intellect",
		slot = { "back" },
		source = "Crafted",
	},
	[74242] = {
		enchID = 4097,
		minIlvl = 300,
		name = "Enchant Weapon - Power Torrent",
		slot = normalWeapon,
		source = "Crafted",
	},
	[74244] = {
		enchID = 4098,
		minIlvl = 300,
		name = "Enchant Weapon - Windwalk",
		slot = normalWeapon,
		source = "Crafted",
	},
	[74246] = {
		enchID = 4099,
		minIlvl = 300,
		name = "Enchant Weapon - Landslide",
		slot = normalWeapon,
		source = "Crafted",
	},
	[74247] = {
		enchID = 4100,
		minIlvl = 300,
		name = "Enchant Cloak - Greater Critical Strike",
		slot = { "back" },
		source = "Crafted",
	},
	[74248] = {
		enchID = 4101,
		minIlvl = 300,
		name = "Enchant Bracer - Greater Critical Strike",
		slot = { "wrist" },
		source = "Crafted",
	},
	[74250] = {
		enchID = 4102,
		minIlvl = 300,
		name = "Enchant Chest - Peerless Stats",
		slot = { "chest" },
		source = "Crafted",
	},
	[74251] = {
		enchID = 4103,
		minIlvl = 300,
		name = "Enchant Chest - Greater Stamina",
		slot = { "chest" },
		source = "Crafted",
	},
	[74252] = {
		enchID = 4105,
		minIlvl = 300,
		name = "Enchant Boots - Assassin's Step",
		slot = { "feet" },
		source = "Crafted",
	},
	[74253] = {
		enchID = 4104,
		minIlvl = 300,
		name = "Enchant Boots - Lavawalker",
		slot = { "feet" },
		source = "Crafted",
	},
	[74254] = {
		enchID = 4106,
		minIlvl = 300,
		name = "Enchant Gloves - Mighty Strength",
		slot = { "hands" },
		source = "Crafted",
	},
	[74255] = {
		enchID = 4107,
		minIlvl = 300,
		name = "Enchant Gloves - Greater Mastery",
		slot = { "hands" },
		source = "Crafted",
	},
	[74256] = {
		enchID = 4108,
		minIlvl = 300,
		name = "Enchant Bracer - Greater Speed",
		slot = { "wrist" },
		source = "Crafted",
	},
	[75154] = {
		enchID = 4113,
		name = "Master's Spellthread",
		skill = {
			Tailoring = 475,
		},
		slot = { "legs" },
		source = "Crafted",
	},
	[75155] = {
		enchID = 4114,
		name = "Sanctified Spellthread",
		skill = {
			Tailoring = 475,
		},
		slot = { "legs" },
		source = "Crafted",
	},
	[75172] = {
		enchID = 4115,
		name = "Lightweave Embroidery",
		skill = {
			Tailoring = 500,
		},
		slot = { "back" },
		source = "Crafted",
	},
	[75175] = {
		enchID = 4116,
		name = "Darkglow Ebroidery",
		skill = {
			Tailoring = 500,
		},
		slot = { "back" },
		source = "Crafted",
	},
	[75178] = {
		enchID = 4118,
		name = "Swordguard Embroidery",
		skill = {
			Tailoring = 500,
		},
		slot = { "back" },
		source = "Crafted",
	},
	[85007] = {
		enchID = 4189,
		name = "Draconic Embossment - Stamina",
		skill = {
			Leatherworking = 500,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[85008] = {
		enchID = 4190,
		name = "Draconic Embossment - Agility",
		skill = {
			Leatherworking = 500,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[85009] = {
		enchID = 4191,
		name = "Draconic Embossment - Strength",
		skill = {
			Leatherworking = 500,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[85010] = {
		enchID = 4192,
		name = "Draconic Embossment - Intellect",
		skill = {
			Leatherworking = 500,
		},
		slot = { "wrist" },
		source = "Crafted",
	},
	[85067] = {
		enchID = 4126,
		name = "Dragonbone Leg Reinforcements",
		skill = {
			Leatherworking = 465,
		},
		slot = { "legs" },
		source = "Crafted",
	},
	[85068] = {
		enchID = 4127,
		name = "Charscale Leg Reinforcements",
		skill = {
			Leatherworking = 465,
		},
		slot = { "legs" },
		source = "Crafted",
	},
	[86375] = {
		enchID = 4193,
		name = "Swiftsteel Inscription",
		skill = {
			Inscription = 500,
		},
		slot = { "shoulder" },
		source = "Crafted",
	},
	[86401] = {
		enchID = 4194,
		name = "Lionsmane Inscription",
		skill = {
			Inscription = 500,
		},
		slot = { "shoulder" },
		source = "Crafted",
	},
	[86402] = {
		enchID = 4195,
		name = "Inscription of the Earth Prince",
		skill = {
			Inscription = 500,
		},
		slot = { "shoulder" },
		source = "Crafted",
	},
	[86403] = {
		enchID = 4196,
		name = "Felfire Inscription",
		skill = {
			Inscription = 500,
		},
		slot = { "shoulder" },
		source = "Crafted",
	},
	[95471] = {
		enchID = 4227,
		minIlvl = 300,
		name = "Enchant 2H Weapon - Mighty Agility",
		slot = normalTwoHand,
		source = "Crafted",
	},
	[96261] = {
		enchID = 4256,
		minIlvl = 300,
		name = "Enchant Bracer - Major Strength",
		slot = { "wrist" },
		source = "Crafted",
	},
	[96262] = {
		enchID = 4257,
		minIlvl = 300,
		name = "Enchant Bracer - Mighty Intellect",
		slot = { "wrist" },
		source = "Crafted",
	},
	[96264] = {
		enchID = 4258,
		minIlvl = 300,
		name = "Enchant Bracer - Agility",
		slot = { "wrist" },
		source = "Crafted",
	},
}

local EnchantOptions = {}

ww_slotsToCheck = {
	back = {"back"},
	chest = {"chest"},
	feet = {"feet"},
	finger = {"finger"},
	hands = {"hands"},
	head = {"head"},
	["held in off-hand"] = {"held in off-hand"},
	legs = {"legs"},
	["main hand"] = {"main hand", "one hand", "weapon"},
	neck = {"neck"},
	["off hand"] = {"off hand", "one hand", "weapon"},
	["one-hand"] = {"one-hand", "weapon"},
	projectile = {"projectile"},
	ranged = {"ranged"},
	relic = {"relic"},
	shirt = {"shirt"},
	shoulder = {"shoulder"},
	tabard = {"tabard"},
	thrown = {"thrown"},
	trinket = {"trinket"},
	["two-hand"] = {"two-hand", "weapon"},
	waist = {"waist"},
	wrist = {"wrist"},
}

ww_factionsToTrack = {}
ww_professionsToTrack = {}

for item, info in pairs(EnchantItems) do
	if info.enchID and info.source ~= "Unavailable" then
		local class = info.class or "all"
		if not EnchantOptions[class] then
			EnchantOptions[class] = {}
		end
		for _, slot in ipairs(info.slot) do
			if not EnchantOptions[class][slot] then
				EnchantOptions[class][slot] = {}
			end
			local subslots = {}
			if info.slot[slot] then
				if info.slot[slot][true] then
					for _, subslot in ipairs(info.slot[slot][true]) do
						subslots[subslot] = true
					end
				elseif info.slot[slot][false] then
					for subslot in pairs(ww_slotsToSubslots[slot]) do
						subslots[subslot] = true
					end
					for _, subslot in ipairs(info.slot[slot][false]) do
						subslots[subslot] = nil
					end
				end
			else
				subslots["all"] = true
			end
			for subslot in pairs(subslots) do
				if not EnchantOptions[class][slot][subslot] then
					EnchantOptions[class][slot][subslot] = {}
				end
				if not EnchantOptions[class][slot][subslot][info.source] then
					EnchantOptions[class][slot][subslot][info.source] = {}
				end
				if not EnchantOptions[class][slot][subslot][info.source][info.boa or false] then
					EnchantOptions[class][slot][subslot][info.source][info.boa or false] = {}
				end
				local reputations = info.rep or { ["none"] = 0 }
				for faction, reputation in pairs(reputations) do
					ww_factionsToTrack[faction] = true
					if not EnchantOptions[class][slot][subslot][info.source][info.boa or false][faction] then
						EnchantOptions[class][slot][subslot][info.source][info.boa or false][faction] = IntervalTree.create()
					end
					local repInterval = EnchantOptions[class][slot][subslot][info.source][info.boa or false][faction].findInterval(reputation, math.huge)
					if not repInterval then
						repInterval = {}
						EnchantOptions[class][slot][subslot][info.source][info.boa or false][faction].insert(reputation, math.huge, repInterval)
					end
					local skills = info.skill or { ["none"] = 0 }
					for skill, level in pairs(skills) do
						ww_professionsToTrack[skill] = true
						if not repInterval[skill] then
							repInterval[skill] = IntervalTree.create()
						end
						local skillInterval = repInterval[skill].findInterval(level, math.huge)
						if not skillInterval then
							skillInterval = IntervalTree.create()
							repInterval[skill].insert(level, math.huge, skillInterval)
						end
						local iLvlInterval = skillInterval.findInterval(info.minIlvl or 0, info.maxIlvl or math.huge)
						if not iLvlInterval then
							iLvlInterval = IntervalTree.create()
							skillInterval.insert(info.minIlvl or 0, info.maxIlvl or math.huge, iLvlInterval)
						end
						local pLvlInterval = iLvlInterval.findInterval(info.minLvl or 0, info.maxLvl or math.huge)
						if not pLvlInterval then
							pLvlInterval = {}
							iLvlInterval.insert(info.minLvl or 0, info.maxLvl or math.huge, pLvlInterval)
						end
						if not pLvlInterval[info.name] then
							pLvlInterval[info.name] = {}
						end
						pLvlInterval[info.name][info.enchID] = true
					end
				end
			end
		end
	end
end

for item, info in pairs(EnchantSpells) do
	if info.source ~= "Unavailable" and info.source ~= "Crafted (undetectable)" then
		local class = info.class or "all"
		if not EnchantOptions[class] then
			EnchantOptions[class] = {}
		end
		for _, slot in ipairs(info.slot) do
			if not EnchantOptions[class][slot] then
				EnchantOptions[class][slot] = {}
			end
			local subslots = {}
			if info.slot[slot] then
				if info.slot[slot][true] then
					for _, subslot in ipairs(info.slot[slot][true]) do
						subslots[subslot] = true
					end
				elseif info.slot[slot][false] then
					for subslot in pairs(ww_slotsToSubslots[slot]) do
						subslots[subslot] = true
					end
					for _, subslot in ipairs(info.slot[slot][false]) do
						subslots[subslot] = nil
					end
				end
			else
				subslots["all"] = true
			end
			for subslot in pairs(subslots) do
				if not EnchantOptions[class][slot][subslot] then
					EnchantOptions[class][slot][subslot] = {}
				end
				if not EnchantOptions[class][slot][subslot][info.source] then
					EnchantOptions[class][slot][subslot][info.source] = {}
				end
				if not EnchantOptions[class][slot][subslot][info.source][info.boa or false] then
					EnchantOptions[class][slot][subslot][info.source][info.boa or false] = {}
				end
				local reputations = info.rep or { ["none"] = 0 }
				for faction, reputation in pairs(reputations) do
					ww_factionsToTrack[faction] = true
					if not EnchantOptions[class][slot][subslot][info.source][info.boa or false][faction] then
						EnchantOptions[class][slot][subslot][info.source][info.boa or false][faction] = IntervalTree.create()
					end
					local repInterval = EnchantOptions[class][slot][subslot][info.source][info.boa or false][faction].findInterval(reputation, math.huge)
					if not repInterval then
						repInterval = {}
						EnchantOptions[class][slot][subslot][info.source][info.boa or false][faction].insert(reputation, math.huge, repInterval)
					end
					local skills = info.skill or { ["none"] = 0 }
					for skill, level in pairs(skills) do
						ww_professionsToTrack[skill] = true
						if not repInterval[skill] then
							repInterval[skill] = IntervalTree.create()
						end
						local skillInterval = repInterval[skill].findInterval(level, math.huge)
						if not skillInterval then
							skillInterval = IntervalTree.create()
							repInterval[skill].insert(level, math.huge, skillInterval)
						end
						local iLvlInterval = skillInterval.findInterval(info.minIlvl or 0, info.maxIlvl or math.huge)
						if not iLvlInterval then
							iLvlInterval = IntervalTree.create()
							skillInterval.insert(info.minIlvl or 0, info.maxIlvl or math.huge, iLvlInterval)
						end
						local pLvlInterval = iLvlInterval.findInterval(info.minLvl or 0, info.maxLvl or math.huge)
						if not pLvlInterval then
							pLvlInterval = {}
							iLvlInterval.insert(info.minLvl or 0, info.maxLvl or math.huge, pLvlInterval)
						end
						if not pLvlInterval[info.name] then
							pLvlInterval[info.name] = {}
						end
						pLvlInterval[info.name][info.enchID] = true
					end
				end
			end
		end
	end
end

local enchantItemMetatable = {
	__index = function(tbl, key)
		local bestScore, bestEnchants = 0, {}
		local bareStats = ww_bareItemCache[key]
		if bareStats.nonStats.slot then
			for _, choices in ipairs(tbl.enchants) do
				for _, slot in ipairs(ww_slotsToCheck[bareStats.nonStats.slot]) do
					if choices[slot] then
						local subslots = { "all" }
						table.insert(subslots, bareStats.nonStats.subslot)
						for _, subslot in ipairs(subslots) do
							for source, enchants in pairs(choices[slot][subslot] or {}) do
								for boa, enchants in pairs(enchants) do
									for faction, enchantIntervals in pairs(enchants) do
										for _, enchants in ipairs(enchantIntervals.find(ww_vars.options.useBoa and boa and #(ww_reputations) or WeightsWatcher.getRepLevel(faction))) do
											for profession, intervals in pairs(enchants) do
												for _, intervals in ipairs(intervals.find(WeightsWatcher.getSkillLevel(profession))) do
													for _, intervals in ipairs(intervals.find(bareStats.normalStats["item level"] or 1)) do
														for _, interval in ipairs(intervals.find(WeightsWatcher.player.level)) do
															for name, ids in pairs(interval) do
																for id in pairs(ids) do
																	local score = WeightsWatcher.calculateWeight({}, { enchantStats = WeightsWatcher.enchantStats(id) }, tbl.weight)
																	if score > bestScore then
																		bestScore = score
																		bestEnchants = { [name] = { id } }
																	elseif score == bestScore then
																		if not bestEnchants[name] then
																			bestEnchants[name] = {}
																		end
																		table.insert(bestEnchants[name], id)
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
		tbl[key] = bestEnchants
		return tbl[key]
	end,
}

local enchantWeightMetatable = {
	__index = function(tbl, key)
		tbl[key] = setmetatable({ enchants = tbl.enchants, weight = ww_vars.weightsList[tbl.class][key] }, enchantItemMetatable)
		return tbl[key]
	end,
}

local enchantClassMetatable = {
	__index = function(tbl, key)
		local enchants = {}
		for _, class in ipairs({ key, "all" }) do
			table.insert(enchants, EnchantOptions[class])
		end
		tbl[key] = setmetatable({ class = key, enchants = enchants }, enchantWeightMetatable)
		return tbl[key]
	end,
}

function WeightsWatcher.ResetEnchantCache()
	ww_bestEnchantsCache = setmetatable({}, enchantClassMetatable)
end

function WeightsWatcher.enchantStats(id)
	if type(id) == "string" then
		id = tonumber(id)
	end
	return EnchantIDs[id] or {}
end
