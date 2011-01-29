local normalWeapon = { "weapon", weapon = { [false] = { "fishing pole", "shield" } } }
local normalTwoHand = { "two-hand", ["two-hand"] = { [false] = { "fishing pole" } } }
local normalRanged = { "ranged", ranged = { [false] = { "wand" } } }

EnchantIDs = {
	[15] = {
		itemID = { 2304 },
		stats = {
			armor = 8,
		},
	},
	[16] = {
		itemID = { 2313 },
		stats = {
			armor = 16,
		},
	},
	[17] = {
		itemID = { 4265 },
		stats = {
			armor = 24,
		},
	},
	[18] = {
		itemID = { 8173 },
		stats = {
			armor = 32,
		},
	},
	[24] = {
		itemID = { 38769 },
		spellID = { 7443 },
		stats = {
			mana = 5,
		},
	},
	[30] = {
		itemID = { 4405 },
		stats = {
			["average ranged weapon damage"] = 1,
			["maximum ranged weapon damage"] = 1,
		},
	},
	[32] = {
		itemID = { 4406 },
		stats = {
			["average ranged weapon damage"] = 2,
			["maximum ranged weapon damage"] = 2,
		},
	},
	[33] = {
		itemID = { 4407 },
		stats = {
			["average ranged weapon damage"] = 3,
			["maximum ranged weapon damage"] = 3,
		},
	},
	[34] = {
		itemID = { 6043 },
		stats = {
			["haste rating"] = 20,
		},
	},
	[36] = {
		itemID = { 5421 },
		stats = {
			["enchant: fiery blaze"] = 1,
		},
	},
	[37] = {
		itemID = { 6041 },
		stats = {
			["disarm duration reduction (percent)"] = 60,
		},
	},
	[41] = {
		itemID = { 38679, 38766 },
		spellID = { 7418, 7420 },
		stats = {
			health = 5,
		},
	},
	[43] = {
		itemID = { 6042 },
		stats = {
			["maximum damage dealt on block"] = 12,
			["minimum damage dealt on block"] = 8,
		},
	},
	[44] = {
		itemID = { 38767 },
		spellID = { 7426 },
		stats = {
			["damage absorption (2% chance)"] = 10,
		},
	},
	[63] = {
		itemID = { 38798 },
		spellID = { 13538 },
		stats = {
			["damage absorption (5% chance)"] = 25,
		},
	},
	[65] = {
		itemID = { 38770 },
		spellID = { 7454 },
		stats = {
			["all resistances"] = 1,
		},
	},
	[66] = {
		itemID = { 38771, 38785, 38787 },
		spellID = { 7457, 7863, 13378 },
		stats = {
			stamina = 1,
		},
	},
	[241] = {
		itemID = { 38772, 38794 },
		spellID = { 7745, 13503 },
		stats = {
			["average melee weapon damage"] = 2,
			["maximum melee weapon damage"] = 2,
		},
	},
	[242] = {
		itemID = { 38773 },
		spellID = { 7748 },
		stats = {
			health = 15,
		},
	},
	[243] = {
		itemID = { 38774 },
		spellID = { 7766 },
		stats = {
			spirit = 1,
		},
	},
	[246] = {
		itemID = { 38776 },
		spellID = { 7776 },
		stats = {
			mana = 20,
		},
	},
	[247] = {
		itemID = { 38777, 38786, 38789 },
		spellID = { 7779, 7867, 13419 },
		stats = {
			agility = 1,
		},
	},
	[248] = {
		itemID = { 38778 },
		spellID = { 7782 },
		stats = {
			strength = 1,
		},
	},
	[249] = {
		itemID = { 38779 },
		spellID = { 7786 },
		stats = {
			["melee damage to beasts"] = 2,
		},
	},
	[250] = {
		itemID = { 38780 },
		spellID = { 7788 },
		stats = {
			["average melee weapon damage"] = 1,
			["maximum melee weapon damage"] = 1,
		},
	},
	[254] = {
		itemID = { 38782 },
		spellID = { 7857 },
		stats = {
			health = 25,
		},
	},
	[255] = {
		itemID = { 38783, 38788, 38792, 38819 },
		spellID = { 7859, 13380, 13485, 13687 },
		stats = {
			spirit = 3,
		},
	},
	[256] = {
		itemID = { 38784 },
		spellID = { 7861 },
		stats = {
			["fire resistance"] = 5,
		},
	},
	[368] = {
		itemID = { 38940 },
		spellID = { 34004 },
		stats = {
			agility = 12,
		},
	},
	[369] = {
		itemID = { 38937 },
		spellID = { 34001 },
		stats = {
			intellect = 12,
		},
	},
	[463] = {
		itemID = { 7967 },
		stats = {
			["maximum damage dealt on block"] = 20,
			["minimum damage dealt on block"] = 16,
		},
	},
	[464] = {
		itemID = { 7969 },
		stats = {
			["mount speed (percent)"] = 4,
		},
	},
	[663] = {
		itemID = { 10546 },
		stats = {
			["average ranged weapon damage"] = 5,
			["maximum ranged weapon damage"] = 5,
		},
	},
	[664] = {
		itemID = { 10548 },
		stats = {
			["average ranged weapon damage"] = 7,
			["maximum ranged weapon damage"] = 7,
		},
	},
	[684] = {
		itemID = { 38933 },
		spellID = { 33995 },
		stats = {
			strength = 15,
		},
	},
	[723] = {
		itemID = { 38781, 38803 },
		spellID = { 7793, 13622 },
		stats = {
			intellect = 3,
		},
	},
	[724] = {
		itemID = { 38793, 38805, 38810 },
		spellID = { 13501, 13631, 13644 },
		stats = {
			stamina = 3,
		},
	},
	[744] = {
		itemID = { 38790 },
		spellID = { 13421 },
		stats = {
			armor = 20,
		},
	},
	[783] = {
		itemID = { 38775 },
		spellID = { 7771 },
		stats = {
			armor = 10,
		},
	},
	[803] = {
		itemID = { 38838 },
		spellID = { 13898 },
		stats = {
			["fiery weapon"] = 1,
		},
	},
	[804] = {
		itemID = { 38795 },
		spellID = { 13522 },
		stats = {
			["shadow resistance"] = 10,
		},
	},
	[805] = {
		itemID = { 38848 },
		spellID = { 13943 },
		stats = {
			["average melee weapon damage"] = 4,
			["maximum melee weapon damage"] = 4,
		},
	},
	[823] = {
		itemID = { 38797 },
		spellID = { 13536 },
		stats = {
			strength = 3,
		},
	},
	[843] = {
		itemID = { 38799 },
		spellID = { 13607 },
		stats = {
			mana = 30,
		},
	},
	[844] = {
		itemID = { 38800 },
		spellID = { 13612 },
		stats = {
			mining = 2,
		},
	},
	[845] = {
		itemID = { 38801 },
		spellID = { 13617 },
		stats = {
			herbalism = 2,
		},
	},
	[846] = {
		itemID = { 19971, 50816 },
		spellID = { 71692 },
		stats = {
			fishing = 5,
		},
	},
	[847] = {
		itemID = { 38804 },
		spellID = { 13626 },
		stats = {
			["all stats"] = 1,
		},
	},
	[848] = {
		itemID = { 38791, 38806 },
		spellID = { 13464, 13635 },
		stats = {
			armor = 30,
		},
	},
	[849] = {
		itemID = { 38807, 38835 },
		spellID = { 13637, 13882 },
		stats = {
			agility = 3,
		},
	},
	[850] = {
		itemID = { 38808 },
		spellID = { 13640 },
		stats = {
			health = 35,
		},
	},
	[851] = {
		itemID = { 38809, 38816, 38864 },
		spellID = { 13642, 13659, 20024 },
		stats = {
			spirit = 5,
		},
	},
	[852] = {
		itemID = { 38812, 38828, 38830 },
		spellID = { 13648, 13817, 13836 },
		stats = {
			stamina = 5,
		},
	},
	[853] = {
		itemID = { 38813 },
		spellID = { 13653 },
		stats = {
			["melee damage to beasts"] = 6,
		},
	},
	[854] = {
		itemID = { 38814 },
		spellID = { 13655 },
		stats = {
			["melee damage to elementals"] = 6,
		},
	},
	[856] = {
		itemID = { 38817, 38836 },
		spellID = { 13661, 13887 },
		stats = {
			strength = 5,
		},
	},
	[857] = {
		itemID = { 38818 },
		spellID = { 13663 },
		stats = {
			mana = 50,
		},
	},
	[863] = {
		itemID = { 38820 },
		spellID = { 13689 },
		stats = {
			["parry rating"] = 10,
		},
	},
	[865] = {
		itemID = { 38823 },
		spellID = { 13698 },
		stats = {
			skinning = 5,
		},
	},
	[866] = {
		itemID = { 38824 },
		spellID = { 13700 },
		stats = {
			["all stats"] = 2,
		},
	},
	[884] = {
		itemID = { 38825 },
		spellID = { 13746 },
		stats = {
			armor = 50,
		},
	},
	[903] = {
		itemID = { 38826 },
		spellID = { 13794 },
		stats = {
			["all resistances"] = 3,
		},
	},
	[904] = {
		itemID = { 38827, 38844 },
		spellID = { 13815, 13935 },
		stats = {
			agility = 5,
		},
	},
	[905] = {
		itemID = { 38829 },
		spellID = { 13822 },
		stats = {
			intellect = 5,
		},
	},
	[906] = {
		itemID = { 38831 },
		spellID = { 13841 },
		stats = {
			mining = 5,
		},
	},
	[907] = {
		itemID = { 38832, 38839 },
		spellID = { 13846, 13905 },
		stats = {
			spirit = 7,
		},
	},
	[908] = {
		itemID = { 38833 },
		spellID = { 13858 },
		stats = {
			health = 50,
		},
	},
	[909] = {
		itemID = { 38834 },
		spellID = { 13868 },
		stats = {
			herbalism = 5,
		},
	},
	[910] = {
		itemID = { 38893 },
		spellID = { 25083 },
		stats = {
			agility = 8,
			["dodge rating"] = 8,
		},
	},
	[911] = {
		itemID = { 38837 },
		spellID = { 13890 },
		stats = {
			["minor run speed"] = 1,
		},
	},
	[912] = {
		itemID = { 38840 },
		spellID = { 13915 },
		stats = {
			demonslaying = 1,
		},
	},
	[913] = {
		itemID = { 38841 },
		spellID = { 13917 },
		stats = {
			mana = 65,
		},
	},
	[923] = {
		itemID = { 38842 },
		spellID = { 13931 },
		stats = {
			["dodge rating"] = 5,
		},
	},
	[924] = {
		itemID = { 38768 },
		spellID = { 7428 },
		stats = {
			["dodge rating"] = 2,
		},
	},
	[925] = {
		itemID = { 38811 },
		spellID = { 13646 },
		stats = {
			["dodge rating"] = 3,
		},
	},
	[926] = {
		itemID = { 38843 },
		spellID = { 13933 },
		stats = {
			["frost resistance"] = 8,
		},
	},
	[927] = {
		itemID = { 38846, 38857 },
		spellID = { 13939, 20013 },
		stats = {
			strength = 7,
		},
	},
	[928] = {
		itemID = { 38847 },
		spellID = { 13941 },
		stats = {
			["all stats"] = 3,
		},
	},
	[929] = {
		itemID = { 38849, 38861, 38862 },
		spellID = { 13945, 20017, 20020 },
		stats = {
			stamina = 7,
		},
	},
	[930] = {
		itemID = { 38850 },
		spellID = { 13947 },
		stats = {
			["mount speed (percent)"] = 2,
		},
	},
	[931] = {
		itemID = { 38851 },
		spellID = { 13948 },
		stats = {
			["haste rating"] = 10,
		},
	},
	[943] = {
		itemID = { 38796, 38821 },
		spellID = { 13529, 13693 },
		stats = {
			["average melee weapon damage"] = 3,
			["maximum melee weapon damage"] = 3,
		},
	},
	[963] = {
		itemID = { 38845, 38917 },
		spellID = { 13937, 27967 },
		stats = {
			["average melee weapon damage"] = 7,
			["maximum melee weapon damage"] = 7,
		},
	},
	[983] = {
		itemID = { 38959, 38976 },
		spellID = { 44500, 44589 },
		stats = {
			agility = 16,
		},
	},
	[1071] = {
		itemID = { 38945 },
		spellID = { 34009 },
		stats = {
			stamina = 18,
		},
	},
	[1075] = {
		itemID = { 38966 },
		spellID = { 44528 },
		stats = {
			stamina = 22,
		},
	},
	[1099] = {
		itemID = { 44457 },
		spellID = { 60663 },
		stats = {
			agility = 22,
		},
	},
	[1103] = {
		itemID = { 38995 },
		spellID = { 44633 },
		stats = {
			agility = 26,
		},
	},
	[1119] = {
		itemID = { 38968 },
		spellID = { 44555 },
		stats = {
			intellect = 16,
		},
	},
	[1128] = {
		itemID = { 44455 },
		spellID = { 60653 },
		stats = {
			intellect = 25,
		},
	},
	[1144] = {
		itemID = { 38928 },
		spellID = { 33990 },
		stats = {
			spirit = 15,
		},
	},
	[1147] = {
		itemID = { 38961, 38980 },
		spellID = { 44508, 44593 },
		stats = {
			spirit = 18,
		},
	},
	[1257] = {
		itemID = { 38941 },
		spellID = { 34005 },
		stats = {
			["arcane resistance"] = 15,
		},
	},
	[1262] = {
		itemID = { 38982 },
		spellID = { 44596 },
		stats = {
			["arcane resistance"] = 20,
		},
	},
	[1354] = {
		itemID = { 38969 },
		spellID = { 44556 },
		stats = {
			["fire resistance"] = 20,
		},
	},
	[1400] = {
		itemID = { 38956 },
		spellID = { 44494 },
		stats = {
			["nature resistance"] = 20,
		},
	},
	[1441] = {
		itemID = { 38942 },
		spellID = { 34006 },
		stats = {
			["shadow resistance"] = 15,
		},
	},
	[1446] = {
		itemID = { 38977 },
		spellID = { 44590 },
		stats = {
			["shadow resistance"] = 20,
		},
	},
	[1483] = {
		itemID = { 11622 },
		stats = {
			mana = 150,
		},
	},
	[1503] = {
		itemID = { 11642 },
		stats = {
			health = 100,
		},
	},
	[1504] = {
		itemID = { 11643 },
		stats = {
			armor = 125,
		},
	},
	[1505] = {
		itemID = { 11644 },
		stats = {
			["fire resistance"] = 20,
		},
	},
	[1506] = {
		itemID = { 11645 },
		stats = {
			strength = 8,
		},
	},
	[1507] = {
		itemID = { 11646 },
		stats = {
			stamina = 8,
		},
	},
	[1508] = {
		itemID = { 11647 },
		stats = {
			agility = 8,
		},
	},
	[1509] = {
		itemID = { 11648 },
		stats = {
			intellect = 8,
		},
	},
	[1510] = {
		itemID = { 11649 },
		stats = {
			spirit = 8,
		},
	},
	[1593] = {
		itemID = { 38938 },
		spellID = { 34002 },
		stats = {
			["attack power"] = 24,
		},
	},
	[1594] = {
		itemID = { 38934 },
		spellID = { 33996 },
		stats = {
			["attack power"] = 26,
		},
	},
	[1597] = {
		itemID = { 44469 },
		spellID = { 60763 },
		stats = {
			["attack power"] = 32,
		},
	},
	[1600] = {
		itemID = { 38971 },
		spellID = { 60616 },
		stats = {
			["attack power"] = 38,
		},
	},
	[1603] = {
		itemID = { 44458 },
		spellID = { 60668 },
		stats = {
			["attack power"] = 44,
		},
	},
	[1606] = {
		itemID = { 44453 },
		spellID = { 60621 },
		stats = {
			["attack power"] = 50,
		},
	},
	[1704] = {
		itemID = { 12645 },
		stats = {
			["maximum damage dealt on block"] = 30,
			["minimum damage dealt on block"] = 20,
		},
	},
	[1843] = {
		itemID = { 15564 },
		stats = {
			armor = 40,
		},
	},
	[1883] = {
		itemID = { 38852 },
		spellID = { 20008 },
		stats = {
			intellect = 7,
		},
	},
	[1884] = {
		itemID = { 38853 },
		spellID = { 20009 },
		stats = {
			spirit = 9,
		},
	},
	[1885] = {
		itemID = { 38854 },
		spellID = { 20010 },
		stats = {
			strength = 9,
		},
	},
	[1886] = {
		itemID = { 38855 },
		spellID = { 20011 },
		stats = {
			stamina = 9,
		},
	},
	[1887] = {
		itemID = { 38856, 38863 },
		spellID = { 20012, 20023 },
		stats = {
			agility = 7,
		},
	},
	[1888] = {
		itemID = { 38858, 38907 },
		spellID = { 20014, 27947 },
		stats = {
			["all resistances"] = 5,
		},
	},
	[1889] = {
		itemID = { 38859 },
		spellID = { 20015 },
		stats = {
			armor = 70,
		},
	},
	[1890] = {
		itemID = { 38860 },
		spellID = { 20016 },
		stats = {
			spirit = 10,
			stamina = 10,
		},
	},
	[1891] = {
		itemID = { 38865, 38898 },
		spellID = { 20025, 27905 },
		stats = {
			["all stats"] = 4,
		},
	},
	[1892] = {
		itemID = { 38866 },
		spellID = { 20026 },
		stats = {
			health = 100,
		},
	},
	[1893] = {
		itemID = { 38867 },
		spellID = { 20028 },
		stats = {
			mana = 100,
		},
	},
	[1894] = {
		itemID = { 38868 },
		spellID = { 20029 },
		stats = {
			["icy chill"] = 1,
		},
	},
	[1896] = {
		itemID = { 38869 },
		spellID = { 20030 },
		stats = {
			["average melee weapon damage"] = 9,
			["maximum melee weapon damage"] = 9,
		},
	},
	[1897] = {
		itemID = { 38822, 38870 },
		spellID = { 13695, 20031 },
		stats = {
			["average melee weapon damage"] = 5,
			["maximum melee weapon damage"] = 5,
		},
	},
	[1898] = {
		itemID = { 38871 },
		spellID = { 20032 },
		stats = {
			lifestealing = 1,
		},
	},
	[1899] = {
		itemID = { 38872 },
		spellID = { 20033 },
		stats = {
			["unholy weapon"] = 1,
		},
	},
	[1900] = {
		itemID = { 38873 },
		spellID = { 20034 },
		stats = {
			crusader = 1,
		},
	},
	[1903] = {
		itemID = { 38874 },
		spellID = { 20035 },
		stats = {
			spirit = 9,
		},
	},
	[1904] = {
		itemID = { 38875 },
		spellID = { 20036 },
		stats = {
			intellect = 9,
		},
	},
	[1951] = {
		itemID = { 38978, 38999 },
		spellID = { 44591, 46594 },
		stats = {
			["dodge rating"] = 16,
		},
	},
	[1952] = {
		itemID = { 38954 },
		spellID = { 44489 },
		stats = {
			["dodge rating"] = 20,
		},
	},
	[1953] = {
		itemID = { 39002 },
		spellID = { 47766 },
		stats = {
			["dodge rating"] = 22,
		},
	},
	[2322] = {
		itemID = { 38936 },
		spellID = { 33999 },
		stats = {
			["spell power"] = 19,
		},
	},
	[2326] = {
		itemID = { 38997 },
		spellID = { 44635 },
		stats = {
			["spell power"] = 23,
		},
	},
	[2332] = {
		itemID = { 44470 },
		spellID = { 60767 },
		stats = {
			["spell power"] = 30,
		},
	},
	[2381] = {
		itemID = { 38962 },
		spellID = { 44509 },
		stats = {
			spirit = 20,
		},
	},
	[2443] = {
		itemID = { 38876 },
		spellID = { 21931 },
		stats = {
			["frost spell damage"] = 7,
		},
	},
	[2463] = {
		itemID = { 38815 },
		spellID = { 13657 },
		stats = {
			["fire resistance"] = 7,
		},
	},
	[2483] = {
		itemID = { 18169 },
		stats = {
			["fire resistance"] = 5,
		},
	},
	[2484] = {
		itemID = { 18170 },
		stats = {
			["frost resistance"] = 5,
		},
	},
	[2485] = {
		itemID = { 18171 },
		stats = {
			["arcane resistance"] = 5,
		},
	},
	[2486] = {
		itemID = { 18172 },
		stats = {
			["nature resistance"] = 5,
		},
	},
	[2487] = {
		itemID = { 18173 },
		stats = {
			["shadow resistance"] = 5,
		},
	},
	[2488] = {
		itemID = { 18182 },
		stats = {
			["all resistances"] = 5,
		},
	},
	[2503] = {
		itemID = { 18251 },
		stats = {
			["dodge rating"] = 5,
		},
	},
	[2504] = {
		itemID = { 38877 },
		spellID = { 22749 },
		stats = {
			["spell power"] = 30,
		},
	},
	[2505] = {
		itemID = { 38878 },
		spellID = { 22750 },
		stats = {
			["spell power"] = 29,
		},
	},
	[2523] = {
		itemID = { 18283 },
		stats = {
			["ranged hit rating"] = 30,
		},
	},
	[2543] = {
		itemID = { 18329 },
		stats = {
			["haste rating"] = 10,
		},
	},
	[2544] = {
		itemID = { 18330 },
		stats = {
			["spell power"] = 8,
		},
	},
	[2545] = {
		itemID = { 18331 },
		stats = {
			["dodge rating"] = 12,
		},
	},
	[2563] = {
		itemID = { 38879 },
		spellID = { 23799 },
		stats = {
			strength = 15,
		},
	},
	[2564] = {
		itemID = { 38880, 38890 },
		spellID = { 23800, 25080 },
		stats = {
			agility = 15,
		},
	},
	[2565] = {
		itemID = { 38881 },
		spellID = { 23801 },
		stats = {
			spirit = 9,
		},
	},
	[2567] = {
		itemID = { 38883 },
		spellID = { 23803 },
		stats = {
			spirit = 20,
		},
	},
	[2568] = {
		itemID = { 38884 },
		spellID = { 23804 },
		stats = {
			intellect = 22,
		},
	},
	[2583] = {
		itemID = { 19782 },
		stats = {
			["dodge rating"] = 10,
			["parry rating"] = 10,
			stamina = 10,
		},
	},
	[2584] = {
		itemID = { 19783 },
		stats = {
			["dodge rating"] = 10,
			intellect = 10,
			stamina = 10,
		},
	},
	[2587] = {
		itemID = { 19786 },
		stats = {
			intellect = 15,
			["spell power"] = 13,
		},
	},
	[2588] = {
		itemID = { 19787 },
		stats = {
			["hit rating"] = 8,
			["spell power"] = 18,
		},
	},
	[2589] = {
		itemID = { 19788 },
		stats = {
			["spell power"] = 18,
			stamina = 10,
		},
	},
	[2590] = {
		itemID = { 19789 },
		stats = {
			mp5 = 5,
			["spell power"] = 13,
			stamina = 10,
		},
	},
	[2591] = {
		itemID = { 19790 },
		stats = {
			intellect = 10,
			["spell power"] = 12,
			stamina = 10,
		},
	},
	[2603] = {
		itemID = { 38802 },
		spellID = { 13620 },
		stats = {
			fishing = 2,
		},
	},
	[2604] = {
		itemID = { 20078 },
		stats = {
			["spell power"] = 18,
		},
	},
	[2605] = {
		itemID = { 20076 },
		stats = {
			["spell power"] = 18,
		},
	},
	[2606] = {
		itemID = { 20077 },
		stats = {
			["attack power"] = 30,
		},
	},
	[2613] = {
		itemID = { 38885 },
		spellID = { 25072 },
		stats = {
			["threat (percent)"] = 2,
		},
	},
	[2614] = {
		itemID = { 38886 },
		spellID = { 25073 },
		stats = {
			["shadow spell damage"] = 20,
		},
	},
	[2615] = {
		itemID = { 38887 },
		spellID = { 25074 },
		stats = {
			["frost spell damage"] = 20,
		},
	},
	[2616] = {
		itemID = { 38888 },
		spellID = { 25078 },
		stats = {
			["fire spell damage"] = 20,
		},
	},
	[2617] = {
		itemID = { 38889 },
		spellID = { 25079 },
		stats = {
			["spell power"] = 16,
		},
	},
	[2619] = {
		itemID = { 38891 },
		spellID = { 25081 },
		stats = {
			["fire resistance"] = 15,
		},
	},
	[2620] = {
		itemID = { 38892 },
		spellID = { 25082 },
		stats = {
			["nature resistance"] = 15,
		},
	},
	[2621] = {
		itemID = { 38894 },
		spellID = { 25084 },
		stats = {
			["threat reduction (percent)"] = 2,
		},
	},
	[2622] = {
		itemID = { 38895 },
		spellID = { 25086 },
		stats = {
			["dodge rating"] = 12,
		},
	},
	[2646] = {
		itemID = { 38896 },
		spellID = { 27837 },
		stats = {
			agility = 25,
		},
	},
	[2647] = {
		itemID = { 38897 },
		spellID = { 27899 },
		stats = {
			strength = 12,
		},
	},
	[2648] = {
		itemID = { 38899, 39000 },
		spellID = { 27906, 47051 },
		stats = {
			["dodge rating"] = 12,
		},
	},
	[2649] = {
		itemID = { 38902, 38909 },
		spellID = { 27914, 27950 },
		stats = {
			stamina = 12,
		},
	},
	[2650] = {
		itemID = { 38882, 38900, 38903 },
		spellID = { 23802, 27911, 27917 },
		stats = {
			["spell power"] = 15,
		},
	},
	[2653] = {
		itemID = { 38904 },
		spellID = { 27944 },
		stats = {
			["dodge rating"] = 12,
		},
	},
	[2654] = {
		itemID = { 38905 },
		spellID = { 27945 },
		stats = {
			intellect = 12,
		},
	},
	[2655] = {
		itemID = { 38906 },
		spellID = { 27946 },
		stats = {
			["parry rating"] = 15,
		},
	},
	[2656] = {
		itemID = { 38908 },
		spellID = { 27948 },
		stats = {
			spirit = 10,
			stamina = 10,
		},
	},
	[2657] = {
		itemID = { 37603 },
		spellID = { 27951 },
		stats = {
			agility = 12,
		},
	},
	[2658] = {
		itemID = { 38910 },
		spellID = { 27954 },
		stats = {
			["critical strike rating"] = 10,
			["hit rating"] = 10,
		},
	},
	[2659] = {
		itemID = { 38911 },
		spellID = { 27957 },
		stats = {
			health = 150,
		},
	},
	[2661] = {
		itemID = { 38987 },
		spellID = { 27960, 44616 },
		stats = {
			["all stats"] = 6,
		},
	},
	[2662] = {
		itemID = { 38914 },
		spellID = { 27961 },
		stats = {
			armor = 120,
		},
	},
	[2664] = {
		itemID = { 38915 },
		spellID = { 27962 },
		stats = {
			["all resistances"] = 7,
		},
	},
	[2666] = {
		itemID = { 38918 },
		spellID = { 27968 },
		stats = {
			intellect = 30,
		},
	},
	[2667] = {
		itemID = { 38919 },
		spellID = { 27971 },
		stats = {
			["attack power"] = 70,
		},
	},
	[2668] = {
		itemID = { 38920 },
		spellID = { 27972 },
		stats = {
			strength = 20,
		},
	},
	[2669] = {
		itemID = { 38921 },
		spellID = { 27975 },
		stats = {
			["spell power"] = 40,
		},
	},
	[2670] = {
		itemID = { 38922 },
		spellID = { 27977 },
		stats = {
			agility = 35,
		},
	},
	[2671] = {
		itemID = { 38923 },
		spellID = { 27981 },
		stats = {
			["arcane spell damage"] = 50,
			["fire spell damage"] = 50,
		},
	},
	[2672] = {
		itemID = { 38924 },
		spellID = { 27982 },
		stats = {
			["frost spell damage"] = 54,
			["shadow spell damage"] = 54,
		},
	},
	[2673] = {
		itemID = { 38925 },
		spellID = { 27984 },
		stats = {
			mongoose = 1,
		},
	},
	[2674] = {
		itemID = { 38926 },
		spellID = { 28003 },
		stats = {
			spellsurge = 1,
		},
	},
	[2675] = {
		itemID = { 38927 },
		spellID = { 28004 },
		stats = {
			battlemaster = 1,
		},
	},
	[2679] = {
		itemID = { 38901 },
		spellID = { 27913 },
		stats = {
			spirit = 12,
		},
	},
	[2681] = {
		itemID = { 22635 },
		stats = {
			["nature resistance"] = 10,
		},
	},
	[2682] = {
		itemID = { 22636 },
		stats = {
			["frost resistance"] = 10,
		},
	},
	[2683] = {
		itemID = { 22638 },
		stats = {
			["shadow resistance"] = 10,
		},
	},
	[2714] = {
		itemID = { 23530 },
		stats = {
			["maximum damage dealt on block"] = 38,
			["minimum damage dealt on block"] = 26,
		},
	},
	[2715] = {
		itemID = { 23547 },
		stats = {
			mp5 = 6,
			["spell power"] = 16,
		},
	},
	[2716] = {
		itemID = { 23549 },
		stats = {
			armor = 100,
			stamina = 16,
		},
	},
	[2717] = {
		itemID = { 23548 },
		stats = {
			["attack power"] = 26,
			["critical strike rating"] = 14,
		},
	},
	[2721] = {
		itemID = { 23545 },
		stats = {
			["critical strike rating"] = 14,
			["spell power"] = 15,
		},
	},
	[2722] = {
		itemID = { 23764 },
		stats = {
			["average ranged weapon damage"] = 10,
			["maximum ranged weapon damage"] = 10,
		},
	},
	[2723] = {
		itemID = { 23765 },
		stats = {
			["average ranged weapon damage"] = 12,
			["maximum ranged weapon damage"] = 12,
		},
	},
	[2724] = {
		itemID = { 23766 },
		stats = {
			["critical strike rating"] = 28,
		},
	},
	[2745] = {
		itemID = { 24275 },
		stats = {
			["spell power"] = 25,
			stamina = 15,
		},
	},
	[2746] = {
		itemID = { 24276 },
		stats = {
			["spell power"] = 35,
			stamina = 20,
		},
	},
	[2747] = {
		itemID = { 24273 },
		stats = {
			["spell power"] = 25,
			stamina = 15,
		},
	},
	[2748] = {
		itemID = { 24274 },
		stats = {
			["spell power"] = 35,
			stamina = 20,
		},
	},
	[2792] = {
		itemID = { 25650 },
		stats = {
			stamina = 8,
		},
	},
	[2793] = {
		itemID = { 25651 },
		stats = {
			["dodge rating"] = 8,
		},
	},
	[2794] = {
		itemID = { 25652 },
		stats = {
			spirit = 8,
		},
	},
	[2841] = {
		itemID = { 34330 },
		stats = {
			stamina = 10,
		},
	},
	[2928] = {
		spellID = { 27924 },
		stats = {
			["spell power"] = 12,
		},
	},
	[2929] = {
		spellID = { 27920 },
		stats = {
			["average melee weapon damage"] = 2,
			["average ranged weapon damage"] = 2,
			["maximum melee weapon damage"] = 2,
			["maximum ranged weapon damage"] = 2,
		},
	},
	[2930] = {
		spellID = { 27926 },
		stats = {
			["spell power"] = 12,
		},
	},
	[2931] = {
		spellID = { 27927 },
		stats = {
			["all stats"] = 4,
		},
	},
	[2933] = {
		itemID = { 38930 },
		spellID = { 33992 },
		stats = {
			["resilience rating"] = 15,
		},
	},
	[2934] = {
		itemID = { 38931 },
		spellID = { 33993 },
		stats = {
			["critical strike rating"] = 10,
		},
	},
	[2935] = {
		itemID = { 38932 },
		spellID = { 33994 },
		stats = {
			["hit rating"] = 15,
		},
	},
	[2937] = {
		itemID = { 38935 },
		spellID = { 33997 },
		stats = {
			["spell power"] = 20,
		},
	},
	[2938] = {
		itemID = { 38939 },
		spellID = { 34003 },
		stats = {
			["spell penetration"] = 20,
		},
	},
	[2939] = {
		itemID = { 38943 },
		spellID = { 34007 },
		stats = {
			agility = 6,
			["minor run speed"] = 1,
		},
	},
	[2940] = {
		itemID = { 38944 },
		spellID = { 34008 },
		stats = {
			["minor run speed"] = 1,
			stamina = 9,
		},
	},
	[2977] = {
		itemID = { 28882 },
		stats = {
			["dodge rating"] = 13,
		},
	},
	[2978] = {
		itemID = { 28889 },
		stats = {
			["dodge rating"] = 15,
			stamina = 15,
		},
	},
	[2979] = {
		itemID = { 28878 },
		stats = {
			["spell power"] = 15,
		},
	},
	[2980] = {
		itemID = { 28887 },
		stats = {
			intellect = 15,
			spirit = 10,
		},
	},
	[2981] = {
		itemID = { 28881 },
		stats = {
			["spell power"] = 15,
		},
	},
	[2982] = {
		itemID = { 28886 },
		stats = {
			["critical strike rating"] = 10,
			["spell power"] = 18,
		},
	},
	[2983] = {
		itemID = { 28885 },
		stats = {
			["attack power"] = 26,
		},
	},
	[2984] = {
		itemID = { 29483 },
		stats = {
			["shadow resistance"] = 8,
		},
	},
	[2985] = {
		itemID = { 29485 },
		stats = {
			["fire resistance"] = 8,
		},
	},
	[2986] = {
		itemID = { 28888 },
		stats = {
			["attack power"] = 30,
			["critical strike rating"] = 10,
		},
	},
	[2987] = {
		itemID = { 29486 },
		stats = {
			["frost resistance"] = 8,
		},
	},
	[2988] = {
		itemID = { 29487 },
		stats = {
			["nature resistance"] = 8,
		},
	},
	[2989] = {
		itemID = { 29488 },
		stats = {
			["arcane resistance"] = 8,
		},
	},
	[2990] = {
		itemID = { 28908 },
		stats = {
			["dodge rating"] = 13,
		},
	},
	[2991] = {
		itemID = { 28911 },
		stats = {
			["dodge rating"] = 10,
			["parry rating"] = 15,
		},
	},
	[2992] = {
		itemID = { 28904 },
		stats = {
			spirit = 12,
		},
	},
	[2993] = {
		itemID = { 28912 },
		stats = {
			intellect = 10,
			spirit = 16,
		},
	},
	[2994] = {
		itemID = { 28903 },
		stats = {
			["critical strike rating"] = 13,
		},
	},
	[2995] = {
		itemID = { 28909 },
		stats = {
			["critical strike rating"] = 15,
			["spell power"] = 12,
		},
	},
	[2996] = {
		itemID = { 28907 },
		stats = {
			["critical strike rating"] = 13,
		},
	},
	[2997] = {
		itemID = { 28910 },
		stats = {
			["attack power"] = 20,
			["critical strike rating"] = 15,
		},
	},
	[2998] = {
		itemID = { 29187 },
		stats = {
			["all resistances"] = 7,
		},
	},
	[2999] = {
		itemID = { 29186 },
		stats = {
			["dodge rating"] = 17,
			["parry rating"] = 16,
		},
	},
	[3001] = {
		itemID = { 29189, 29190 },
		stats = {
			intellect = 16,
			spirit = 18,
		},
	},
	[3002] = {
		itemID = { 29191 },
		stats = {
			["hit rating"] = 14,
			["spell power"] = 22,
		},
	},
	[3003] = {
		itemID = { 29192 },
		stats = {
			["attack power"] = 34,
			["hit rating"] = 16,
		},
	},
	[3004] = {
		itemID = { 29193 },
		stats = {
			["resilience rating"] = 20,
			stamina = 18,
		},
	},
	[3005] = {
		itemID = { 29194 },
		stats = {
			["nature resistance"] = 20,
		},
	},
	[3006] = {
		itemID = { 29195 },
		stats = {
			["arcane resistance"] = 20,
		},
	},
	[3007] = {
		itemID = { 29196, 29197 },
		stats = {
			["fire resistance"] = 20,
		},
	},
	[3008] = {
		itemID = { 29198 },
		stats = {
			["frost resistance"] = 20,
		},
	},
	[3009] = {
		itemID = { 29199 },
		stats = {
			["shadow resistance"] = 20,
		},
	},
	[3010] = {
		itemID = { 29533 },
		stats = {
			["attack power"] = 40,
			["critical strike rating"] = 10,
		},
	},
	[3011] = {
		itemID = { 29534 },
		stats = {
			agility = 10,
			stamina = 30,
		},
	},
	[3012] = {
		itemID = { 29535 },
		stats = {
			["attack power"] = 50,
			["critical strike rating"] = 12,
		},
	},
	[3013] = {
		itemID = { 29536 },
		stats = {
			agility = 12,
			stamina = 40,
		},
	},
	[3096] = {
		itemID = { 30846 },
		stats = {
			intellect = 16,
			strength = 17,
		},
	},
	[3150] = {
		itemID = { 38929 },
		spellID = { 33991 },
		stats = {
			spirit = 14,
		},
	},
	[3222] = {
		itemID = { 38947, 38967 },
		spellID = { 42620, 44529 },
		stats = {
			agility = 20,
		},
	},
	[3223] = {
		itemID = { 33185 },
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["parry rating"] = 15,
		},
	},
	[3225] = {
		itemID = { 38948 },
		spellID = { 42974 },
		stats = {
			executioner = 1,
		},
	},
	[3229] = {
		itemID = { 38949 },
		spellID = { 44383 },
		stats = {
			["resilience rating"] = 12,
		},
	},
	[3230] = {
		itemID = { 38950 },
		spellID = { 44483 },
		stats = {
			["frost resistance"] = 20,
		},
	},
	[3231] = {
		itemID = { 38951, 38984 },
		spellID = { 44484, 44598 },
		stats = {
			["expertise rating"] = 15,
		},
	},
	[3232] = {
		itemID = { 39006 },
		spellID = { 47901 },
		stats = {
			["minor run speed"] = 1,
			stamina = 15,
		},
	},
	[3233] = {
		itemID = { 38912 },
		spellID = { 27958 },
		stats = {
			mana = 250,
		},
	},
	[3234] = {
		itemID = { 38953 },
		spellID = { 44488 },
		stats = {
			["hit rating"] = 20,
		},
	},
	[3236] = {
		itemID = { 38955 },
		spellID = { 44492 },
		stats = {
			health = 200,
		},
	},
	[3238] = {
		itemID = { 38960 },
		spellID = { 44506 },
		stats = {
			herbalism = 5,
			mining = 5,
			skinning = 5,
		},
	},
	[3239] = {
		itemID = { 38965 },
		spellID = { 44524 },
		stats = {
			icebreaker = 1,
		},
	},
	[3241] = {
		itemID = { 38972 },
		spellID = { 44576 },
		stats = {
			lifeward = 1,
		},
	},
	[3243] = {
		itemID = { 38973 },
		spellID = { 44582 },
		stats = {
			["spell penetration"] = 35,
		},
	},
	[3244] = {
		itemID = { 38974 },
		spellID = { 44584 },
		stats = {
			spirit = 14,
			stamina = 14,
		},
	},
	[3245] = {
		itemID = { 38975 },
		spellID = { 44588 },
		stats = {
			["resilience rating"] = 20,
		},
	},
	[3246] = {
		itemID = { 38979 },
		spellID = { 44592 },
		stats = {
			["spell power"] = 28,
		},
	},
	[3247] = {
		itemID = { 38981 },
		spellID = { 44595 },
		stats = {
			["attack power against undead"] = 140,
		},
	},
	[3251] = {
		itemID = { 38988 },
		spellID = { 44621 },
		stats = {
			["giant slayer"] = 1,
		},
	},
	[3252] = {
		itemID = { 38989 },
		spellID = { 44623 },
		stats = {
			["all stats"] = 8,
		},
	},
	[3253] = {
		itemID = { 38990 },
		spellID = { 44625 },
		stats = {
			["parry rating"] = 10,
			["threat (percent)"] = 2,
		},
	},
	[3256] = {
		itemID = { 38993 },
		spellID = { 44631 },
		stats = {
			agility = 10,
			armor = 40,
		},
	},
	[3260] = {
		itemID = { 34207 },
		stats = {
			armor = 240,
		},
	},
	[3269] = {
		itemID = { 34836 },
		stats = {
			fishing = 3,
		},
	},
	[3273] = {
		itemID = { 38998 },
		spellID = { 46578 },
		stats = {
			deathfrost = 1,
		},
	},
	[3294] = {
		itemID = { 39001 },
		spellID = { 47672 },
		stats = {
			armor = 225,
		},
	},
	[3296] = {
		itemID = { 39004 },
		spellID = { 47899 },
		stats = {
			spirit = 10,
			["threat reduction (percent)"] = 2,
		},
	},
	[3297] = {
		itemID = { 39005 },
		spellID = { 47900 },
		stats = {
			health = 275,
		},
	},
	[3315] = {
		itemID = { 37312 },
		stats = {
			["mount speed (percent)"] = 3,
		},
	},
	[3325] = {
		itemID = { 38371 },
		stats = {
			agility = 15,
			stamina = 45,
		},
	},
	[3326] = {
		itemID = { 38372 },
		stats = {
			["attack power"] = 55,
			["critical strike rating"] = 15,
		},
	},
	[3327] = {
		spellID = { 60583 },
		stats = {
			agility = 22,
			stamina = 55,
		},
	},
	[3328] = {
		spellID = { 60584 },
		stats = {
			["attack power"] = 75,
			["critical strike rating"] = 22,
		},
	},
	[3329] = {
		itemID = { 38375 },
		stats = {
			stamina = 12,
		},
	},
	[3330] = {
		itemID = { 38376 },
		stats = {
			stamina = 18,
		},
	},
	[3365] = {
		spellID = { 53323 },
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["parry chance (percent)"] = 4,
		},
	},
	[3366] = {
		spellID = { 53331 },
		stats = {
			["weapon damage (percent)"] = 2,
			["weapon damage vs undead (percent)"] = 2,
		},
	},
	[3367] = {
		spellID = { 53342 },
		stats = {
			["silence duration reduction (percent)"] = 50,
			["spell damage taken reduction (percent)"] = 4,
		},
	},
	[3368] = {
		spellID = { 53344 },
		stats = {
			["rune of the fallen crusader"] = 1,
		},
	},
	[3369] = {
		spellID = { 53341 },
		stats = {
			["rune of cinderglacier"] = 1,
		},
	},
	[3370] = {
		spellID = { 53343 },
		stats = {
			["rune of razorice"] = 1,
		},
	},
	[3594] = {
		spellID = { 54446 },
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["parry chance (percent)"] = 2,
		},
	},
	[3595] = {
		spellID = { 54447 },
		stats = {
			["silence duration reduction (percent)"] = 50,
			["spell damage taken reduction (percent)"] = 2,
		},
	},
-- 	[3599] = {
-- 		spellID = { 54736 },
-- 		stats = {
-- 			["personal electromagnetic pulse generator"] = 1,
-- 		},
-- 	},
-- 	[3601] = {
-- 		spellID = { 54793 },
-- 		stats = {
-- 			["frag belt"] = 1,
-- 		},
-- 	},
-- 	[3603] = {
-- 		spellID = { 54998 },
-- 		stats = {
-- 			["hand-mounted pyro rocket"] = 1,
-- 		},
-- 	},
-- 	[3604] = {
-- 		spellID = { 54999 },
-- 		stats = {
-- 			["hyperspeed accelerators"] = 1,
-- 		},
-- 	},
-- 	[3605] = {
-- 		spellID = { 55002 },
-- 		stats = {
-- 			["flexweave underlay"] = 1,
-- 		},
-- 	},
	[3607] = {
		itemID = { 41146 },
		stats = {
			["ranged haste rating"] = 40,
		},
	},
	[3608] = {
		itemID = { 41167 },
		stats = {
			["ranged critical strike rating"] = 40,
		},
	},
-- 	[3717] = {
-- 		spellID = { 55628 },
-- 		stats = {
-- 			["prismatic socket"] = 1,
-- 		},
-- 	},
	[3718] = {
		itemID = { 41601 },
		stats = {
			["spell power"] = 35,
			spirit = 12,
		},
	},
	[3719] = {
		itemID = { 41602 },
		stats = {
			["spell power"] = 50,
			spirit = 20,
		},
	},
	[3720] = {
		itemID = { 41603 },
		stats = {
			["spell power"] = 35,
			stamina = 20,
		},
	},
	[3721] = {
		itemID = { 41604 },
		stats = {
			["spell power"] = 50,
			stamina = 30,
		},
	},
	[3722] = {
		spellID = { 55642 },
		stats = {
			["lightweave embroidery"] = 1,
		},
	},
-- 	[3723] = {
-- 		spellID = { 55641 },
-- 		stats = {
-- 			["prismatic socket"] = 1,
-- 		},
-- 	},
	[3728] = {
		spellID = { 55769 },
		stats = {
			["darkglow embroidery"] = 1,
		},
	},
	[3729] = {
		itemID = { 41611, 55054 },
		stats = {
			["prismatic socket"] = 1,
		},
	},
	[3730] = {
		spellID = { 55777 },
		stats = {
			["swordguard embroidery"] = 1,
		},
	},
	[3731] = {
		itemID = { 41976 },
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["hit rating"] = 28,
		},
	},
	[3748] = {
		itemID = { 42500 },
		stats = {
			["maximum damage dealt on block"] = 67,
			["minimum damage dealt on block"] = 45,
		},
	},
	[3754] = {
		itemID = { 19785 },
		stats = {
			["attack power"] = 24,
			["hit rating"] = 10,
			stamina = 10,
		},
	},
	[3755] = {
		itemID = { 19784 },
		stats = {
			["attack power"] = 28,
			["dodge rating"] = 12,
		},
	},
	[3756] = {
		spellID = { 57683 },
		stats = {
			["attack power"] = 130,
		},
	},
	[3757] = {
		spellID = { 57690 },
		stats = {
			stamina = 102,
		},
	},
	[3758] = {
		spellID = { 57691 },
		stats = {
			["spell power"] = 76,
		},
	},
	[3759] = {
		spellID = { 57692 },
		stats = {
			["fire resistance"] = 70,
		},
	},
	[3760] = {
		spellID = { 57694 },
		stats = {
			["frost resistance"] = 70,
		},
	},
	[3761] = {
		spellID = { 57696 },
		stats = {
			["shadow resistance"] = 70,
		},
	},
	[3762] = {
		spellID = { 57699 },
		stats = {
			["nature resistance"] = 70,
		},
	},
	[3763] = {
		spellID = { 57701 },
		stats = {
			["arcane resistance"] = 70,
		},
	},
	[3788] = {
		itemID = { 44497 },
		spellID = { 59619 },
		stats = {
			["critical strike rating"] = 25,
			["hit rating"] = 25,
		},
	},
	[3789] = {
		itemID = { 44493 },
		spellID = { 59621 },
		stats = {
			berserking = 1,
		},
	},
	[3790] = {
		itemID = { 43987 },
		spellID = { 59625 },
		stats = {
			["black magic"] = 1,
		},
	},
	[3791] = {
		spellID = { 59636 },
		stats = {
			stamina = 30,
		},
	},
	[3793] = {
		itemID = { 44067 },
		stats = {
			["attack power"] = 40,
			["resilience rating"] = 15,
		},
	},
	[3794] = {
		itemID = { 44068 },
		stats = {
			["resilience rating"] = 15,
			["spell power"] = 23,
		},
	},
	[3795] = {
		itemID = { 44069 },
		stats = {
			["attack power"] = 50,
			["resilience rating"] = 20,
		},
	},
	[3797] = {
		itemID = { 44075 },
		stats = {
			["resilience rating"] = 20,
			["spell power"] = 29,
		},
	},
	[3806] = {
		itemID = { 44129 },
		stats = {
			["critical strike rating"] = 10,
			["spell power"] = 18,
		},
	},
	[3807] = {
		itemID = { 44130 },
		stats = {
			intellect = 15,
			spirit = 10,
		},
	},
	[3808] = {
		itemID = { 44133, 50335 },
		stats = {
			["attack power"] = 40,
			["critical strike rating"] = 15,
		},
	},
	[3809] = {
		itemID = { 44134, 50336 },
		stats = {
			intellect = 21,
			spirit = 16,
		},
	},
	[3810] = {
		itemID = { 44135, 50338 },
		stats = {
			["critical strike rating"] = 15,
			["spell power"] = 24,
		},
	},
	[3811] = {
		itemID = { 44136, 50337 },
		stats = {
			["dodge rating"] = 20,
			stamina = 22,
		},
	},
	[3812] = {
		itemID = { 44137 },
		stats = {
			["frost resistance"] = 25,
			stamina = 30,
		},
	},
	[3813] = {
		itemID = { 44138 },
		stats = {
			["nature resistance"] = 25,
			stamina = 30,
		},
	},
	[3814] = {
		itemID = { 44139 },
		stats = {
			["shadow resistance"] = 25,
			stamina = 30,
		},
	},
	[3815] = {
		itemID = { 44140 },
		stats = {
			["arcane resistance"] = 25,
			stamina = 30,
		},
	},
	[3816] = {
		itemID = { 44141 },
		stats = {
			["fire resistance"] = 25,
			stamina = 30,
		},
	},
	[3817] = {
		itemID = { 44149, 50367 },
		stats = {
			["attack power"] = 50,
			["critical strike rating"] = 20,
		},
	},
	[3818] = {
		itemID = { 44150, 50369 },
		stats = {
			["dodge rating"] = 20,
			stamina = 37,
		},
	},
	[3819] = {
		itemID = { 44152, 50370 },
		stats = {
			intellect = 26,
			spirit = 20,
		},
	},
	[3820] = {
		itemID = { 44159, 50368 },
		stats = {
			["critical strike rating"] = 20,
			intellect = 26,
		},
	},
	[3822] = {
		itemID = { 38373 },
		stats = {
			agility = 22,
			stamina = 55,
		},
	},
	[3823] = {
		itemID = { 38374 },
		stats = {
			["attack power"] = 75,
			["critical strike rating"] = 22,
		},
	},
	[3824] = {
		itemID = { 44449 },
		spellID = { 60606 },
		stats = {
			["attack power"] = 24,
		},
	},
	[3825] = {
		itemID = { 44456 },
		spellID = { 60609 },
		stats = {
			["haste rating"] = 15,
		},
	},
	[3826] = {
		itemID = { 38986 },
		spellID = { 60623 },
		stats = {
			["critical strike rating"] = 12,
			["hit rating"] = 12,
		},
	},
	[3827] = {
		itemID = { 44463 },
		spellID = { 60691 },
		stats = {
			["attack power"] = 110,
		},
	},
	[3828] = {
		itemID = { 38992 },
		spellID = { 44630 },
		stats = {
			["attack power"] = 85,
		},
	},
	[3829] = {
		itemID = { 38964 },
		spellID = { 44513 },
		stats = {
			["attack power"] = 35,
		},
	},
	[3830] = {
		itemID = { 38991 },
		spellID = { 44629 },
		stats = {
			["spell power"] = 50,
		},
	},
	[3831] = {
		itemID = { 39003 },
		spellID = { 47898 },
		stats = {
			["haste rating"] = 23,
		},
	},
	[3832] = {
		itemID = { 44465 },
		spellID = { 60692 },
		stats = {
			["all stats"] = 10,
		},
	},
	[3833] = {
		itemID = { 44466 },
		spellID = { 60707 },
		stats = {
			["attack power"] = 65,
		},
	},
	[3834] = {
		itemID = { 44467 },
		spellID = { 60714 },
		stats = {
			["spell power"] = 63,
		},
	},
	[3835] = {
		spellID = { 61117 },
		stats = {
			["attack power"] = 120,
			["critical strike rating"] = 15,
		},
	},
	[3836] = {
		spellID = { 61118 },
		stats = {
			intellect = 60,
			spirit = 15,
		},
	},
	[3837] = {
		spellID = { 61119 },
		stats = {
			["dodge rating"] = 60,
			["parry rating"] = 15,
		},
	},
	[3838] = {
		spellID = { 61120 },
		stats = {
			["critical strike rating"] = 15,
			["spell power"] = 70,
		},
	},
	[3839] = {
		spellID = { 44645 },
		stats = {
			["attack power"] = 40,
		},
	},
	[3840] = {
		spellID = { 44636 },
		stats = {
			["spell power"] = 23,
		},
	},
	[3842] = {
		itemID = { 44701, 44702, 50372, 50373 },
		stats = {
			["resilience rating"] = 25,
			stamina = 30,
		},
	},
	[3843] = {
		itemID = { 44739 },
		stats = {
			["average ranged weapon damage"] = 15,
			["maximum ranged weapon damage"] = 15,
		},
	},
	[3844] = {
		itemID = { 38963 },
		spellID = { 44510 },
		stats = {
			spirit = 45,
		},
	},
	[3845] = {
		itemID = { 44815 },
		spellID = { 44575 },
		stats = {
			["attack power"] = 50,
		},
	},
	[3846] = {
		itemID = { 38946 },
		spellID = { 34010 },
		stats = {
			["spell power"] = 40,
		},
	},
	[3847] = {
		spellID = { 62158 },
		stats = {
			["armor (percent)"] = 4,
			["stamina (percent)"] = 2,
		},
	},
	[3849] = {
		itemID = { 44936 },
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["parry rating"] = 26,
		},
	},
	[3850] = {
		itemID = { 44947 },
		spellID = { 62256 },
		stats = {
			stamina = 40,
		},
	},
	[3852] = {
		itemID = { 44957 },
		stats = {
			["resilience rating"] = 15,
			stamina = 30,
		},
	},
	[3853] = {
		itemID = { 44963 },
		stats = {
			["resilience rating"] = 40,
			stamina = 28,
		},
	},
	[3854] = {
		itemID = { 45056 },
		spellID = { 62948 },
		stats = {
			["spell power"] = 81,
		},
	},
	[3855] = {
		itemID = { 45060 },
		spellID = { 62959 },
		stats = {
			["spell power"] = 69,
		},
	},
	[3858] = {
		itemID = { 45628 },
		spellID = { 63746 },
		stats = {
			["hit rating"] = 5,
		},
	},
-- 	[3860] = {
-- 		spellID = { 63770 },
-- 		stats = {
-- 			armor = 885,
-- 		},
-- 	},
	[3869] = {
		itemID = { 46026 },
		spellID = { 64441 },
		stats = {
			["blade ward"] = 1,
		},
	},
	[3870] = {
		itemID = { 46098 },
		spellID = { 64579 },
		stats = {
			["blood draining"] = 1,
		},
	},
	[3872] = {
		spellID = { 56039 },
		stats = {
			["spell power"] = 50,
			spirit = 20,
		},
	},
	[3873] = {
		spellID = { 56034 },
		stats = {
			["spell power"] = 50,
			stamina = 30,
		},
	},
	[3875] = {
		itemID = { 44131 },
		stats = {
			["attack power"] = 30,
			["critical strike rating"] = 10,
		},
	},
	[3876] = {
		itemID = { 44132 },
		stats = {
			["dodge rating"] = 15,
			["parry rating"] = 10,
		},
	},
	[3883] = {
		spellID = { 70164 },
		stats = {
			["armor (percent)"] = 2,
			["stamina (percent)"] = 1,
		},
	},
	[4061] = {
		itemID = { 52687 },
		spellID = { 74132 },
		stats = {
			["mastery rating"] = 50,
		},
	},
	[4062] = {
		itemID = { 52743 },
		spellID = { 74189 },
		stats = {
			["minor run speed"] = 1,
			stamina = 30,
		},
	},
	[4063] = {
		itemID = { 52744 },
		spellID = { 74191 },
		stats = {
			["all stats"] = 15,
		},
	},
	[4064] = {
		itemID = { 52745 },
		spellID = { 74192 },
		stats = {
			["spell penetration"] = 70,
		},
	},
	[4065] = {
		itemID = { 52746 },
		spellID = { 74193 },
		stats = {
			["haste rating"] = 50,
		},
	},
	[4066] = {
		itemID = { 52747 },
		spellID = { 74195 },
		stats = {
			["sometimes heal you when you deal damage"] = 1,
		},
	},
	[4067] = {
		itemID = { 52748 },
		spellID = { 74197 },
		stats = {
			avalanche = 1,
		},
	},
	[4068] = {
		itemID = { 52749 },
		spellID = { 74198 },
		stats = {
			["haste rating"] = 50,
		},
	},
	[4069] = {
		itemID = { 52750 },
		spellID = { 74199 },
		stats = {
			["haste rating"] = 50,
		},
	},
	[4070] = {
		itemID = { 52751 },
		spellID = { 74200 },
		stats = {
			stamina = 55,
		},
	},
	[4071] = {
		itemID = { 52752 },
		spellID = { 74201 },
		stats = {
			["critical strike rating"] = 50,
		},
	},
	[4072] = {
		itemID = { 52753 },
		spellID = { 74202 },
		stats = {
			intellect = 30,
		},
	},
	[4073] = {
		itemID = { 52754 },
		spellID = { 74207 },
		stats = {
			armor = 160,
		},
	},
	[4074] = {
		itemID = { 52755 },
		spellID = { 74211 },
		stats = {
			["Elemental Slayer"] = 1,
		},
	},
	[4075] = {
		itemID = { 52756 },
		spellID = { 74212 },
		stats = {
			strength = 35,
		},
	},
	[4076] = {
		itemID = { 52757 },
		spellID = { 74213 },
		stats = {
			agility = 35,
		},
	},
	[4077] = {
		itemID = { 52758 },
		spellID = { 74214 },
		stats = {
			["resilience rating"] = 40,
		},
	},
	[4078] = {
		spellID = { 74215 },
		stats = {
			strength = 40,
		},
	},
	[4079] = {
		spellID = { 74216 },
		stats = {
			agility = 40,
		},
	},
	[4080] = {
		spellID = { 74217 },
		stats = {
			intellect = 40,
		},
	},
	[4081] = {
		spellID = { 74218 },
		stats = {
			stamina = 60,
		},
	},
	[4082] = {
		itemID = { 52759 },
		spellID = { 74220 },
		stats = {
			["expertise rating"] = 50,
		},
	},
	[4083] = {
		itemID = { 52760 },
		spellID = { 74223 },
		stats = {
			hurricane = 1,
		},
	},
	[4084] = {
		itemID = { 52761 },
		spellID = { 74225 },
		stats = {
			heartsong = 1,
		},
	},
	[4085] = {
		itemID = { 52762 },
		spellID = { 74226 },
		stats = {
			["mastery rating"] = 50,
		},
	},
	[4086] = {
		itemID = { 52763 },
		spellID = { 74229 },
		stats = {
			["dodge rating"] = 50,
		},
	},
	[4087] = {
		itemID = { 52764 },
		spellID = { 74230 },
		stats = {
			["critical strike rating"] = 50,
		},
	},
	[4088] = {
		itemID = { 52765 },
		spellID = { 74231 },
		stats = {
			spirit = 40,
		},
	},
	[4089] = {
		itemID = { 52766 },
		spellID = { 74232 },
		stats = {
			["hit rating"] = 50,
		},
	},
	[4090] = {
		itemID = { 52767 },
		spellID = { 74234 },
		stats = {
			armor = 250,
		},
	},
	[4091] = {
		itemID = { 52768 },
		spellID = { 74235 },
		stats = {
			intellect = 40,
		},
	},
	[4092] = {
		itemID = { 52769 },
		spellID = { 74236 },
		stats = {
			["hit rating"] = 50,
		},
	},
	[4093] = {
		itemID = { 52770 },
		spellID = { 74237 },
		stats = {
			spirit = 50,
		},
	},
	[4094] = {
		itemID = { 52771 },
		spellID = { 74238 },
		stats = {
			["mastery rating"] = 50,
		},
	},
	[4095] = {
		itemID = { 52772 },
		spellID = { 74239 },
		stats = {
			["expertise rating"] = 50,
		},
	},
	[4096] = {
		itemID = { 52773 },
		spellID = { 74240 },
		stats = {
			intellect = 50,
		},
	},
	[4097] = {
		itemID = { 52774 },
		spellID = { 74242 },
		stats = {
			["Power Torrent"] = 1,
		},
	},
	[4098] = {
		itemID = { 52775 },
		spellID = { 74244 },
		stats = {
			windwalk = 1,
		},
	},
	[4099] = {
		itemID = { 52776 },
		spellID = { 74246 },
		stats = {
			landslide = 1,
		},
	},
	[4100] = {
		itemID = { 52777 },
		spellID = { 74247 },
		stats = {
			["critical strike rating"] = 65,
		},
	},
	[4101] = {
		itemID = { 52778 },
		spellID = { 74248 },
		stats = {
			["critical strike rating"] = 65,
		},
	},
	[4102] = {
		itemID = { 52779 },
		spellID = { 74250 },
		stats = {
			["all stats"] = 20,
		},
	},
	[4103] = {
		itemID = { 52780 },
		spellID = { 74251 },
		stats = {
			stamina = 75,
		},
	},
	[4104] = {
		itemID = { 52782 },
		spellID = { 74253 },
		stats = {
			["mastery rating"] = 35,
			["minor run speed"] = 1,
		},
	},
	[4105] = {
		itemID = { 52781 },
		spellID = { 74252 },
		stats = {
			agility = 25,
			["minor run speed"] = 1,
		},
	},
	[4106] = {
		itemID = { 52783 },
		spellID = { 74254 },
		stats = {
			strength = 50,
		},
	},
	[4107] = {
		itemID = { 52784 },
		spellID = { 74255 },
		stats = {
			["mastery rating"] = 65,
		},
	},
	[4108] = {
		itemID = { 52785 },
		spellID = { 74256 },
		stats = {
			["haste rating"] = 65,
		},
	},
	[4109] = {
		itemID = { 54449 },
		stats = {
			intellect = 55,
			spirit = 45,
		},
	},
	[4110] = {
		itemID = { 54450 },
		stats = {
			intellect = 95,
			spirit = 55,
		},
	},
	[4111] = {
		itemID = { 54447 },
		stats = {
			intellect = 55,
			stamina = 65,
		},
	},
	[4112] = {
		itemID = { 54448 },
		stats = {
			intellect = 95,
			stamina = 80,
		},
	},
	[4113] = {
		spellID = { 75154 },
		stats = {
			intellect = 95,
			stamina = 80,
		},
	},
	[4114] = {
		spellID = { 75155 },
		stats = {
			intellect = 95,
			spirit = 55,
		},
	},
	[4115] = {
		spellID = { 75172 },
		stats = {
			["lightweave embroidery"] = 1,
		},
	},
	[4116] = {
		spellID = { 75175 },
		stats = {
			["darkglow embroidery"] = 1,
		},
	},
	[4118] = {
		spellID = { 75178 },
		stats = {
			["swordguard embroidery"] = 1,
		},
	},
	[4120] = {
		itemID = { 56477 },
		stats = {
			stamina = 36,
		},
	},
	[4121] = {
		itemID = { 56517 },
		stats = {
			stamina = 44,
		},
	},
	[4122] = {
		itemID = { 56502 },
		stats = {
			["attack power"] = 110,
			["critical strike rating"] = 45,
		},
	},
	[4124] = {
		itemID = { 56503 },
		stats = {
			agility = 45,
			stamina = 85,
		},
	},
	[4126] = {
		itemID = { 56550 },
		spellID = { 85067 },
		stats = {
			["attack power"] = 190,
			["critical strike rating"] = 55,
		},
	},
	[4127] = {
		itemID = { 56551 },
		spellID = { 85068 },
		stats = {
			agility = 55,
			stamina = 145,
		},
	},
	[4175] = {
		itemID = { 59594 },
		stats = {
			["gnomish x-ray scope"] = 1,
		},
	},
	[4176] = {
		itemID = { 59595 },
		stats = {
			["ranged hit rating"] = 88,
		},
	},
	[4177] = {
		itemID = { 59596 },
		stats = {
			["ranged haste rating"] = 88,
		},
	},
-- 	[4179] = {
-- 		spellID = { 82175 },
-- 		stats = {
-- 			["synapse springs"] = 1,
-- 		},
-- 	},
-- 	[4180] = {
-- 		spellID = { 82177 },
-- 		stats = {
-- 			["quickflip deflection plates"] = 1,
-- 		},
-- 	},
-- 	[4181] = {
-- 		spellID = { 82180 },
-- 		stats = {
-- 			["tazik shocker"] = 1,
-- 		},
-- 	},
-- 	[4182] = {
-- 		spellID = { 82200 },
-- 		stats = {
-- 			["spinal healing injector"] = 1,
-- 		},
-- 	},
-- 	[4183] = {
-- 		spellID = { 82201 },
-- 		stats = {
-- 			["z50 mana gulper"] = 1,
-- 		},
-- 	},
-- 	[4187] = {
-- 		spellID = { 84424 },
-- 		stats = {
-- 			["invisibility field"] = 1,
-- 		},
-- 	},
-- 	[4188] = {
-- 		spellID = { 84427 },
-- 		stats = {
-- 			["grounded plasma shield"] = 1,
-- 		},
-- 	},
	[4189] = {
		spellID = { 85007 },
		stats = {
			stamina = 195,
		},
	},
	[4190] = {
		spellID = { 85008 },
		stats = {
			agility = 130,
		},
	},
	[4191] = {
		spellID = { 85009 },
		stats = {
			strength = 130,
		},
	},
	[4192] = {
		spellID = { 85010 },
		stats = {
			intellect = 130,
		},
	},
	[4193] = {
		spellID = { 86375 },
		stats = {
			agility = 130,
			["mastery rating"] = 25,
		},
	},
	[4194] = {
		spellID = { 86401 },
		stats = {
			["critical strike rating"] = 25,
			strength = 130,
		},
	},
	[4195] = {
		spellID = { 86402 },
		stats = {
			["dodge rating"] = 25,
			stamina = 195,
		},
	},
	[4196] = {
		spellID = { 86403 },
		stats = {
			["haste rating"] = 25,
			intellect = 130,
		},
	},
	[4197] = {
		itemID = { 62321 },
		stats = {
			["dodge rating"] = 20,
			stamina = 45,
		},
	},
	[4198] = {
		itemID = { 62333 },
		stats = {
			["dodge rating"] = 25,
			stamina = 75,
		},
	},
	[4199] = {
		itemID = { 62342 },
		stats = {
			["haste rating"] = 20,
			intellect = 30,
		},
	},
	[4200] = {
		itemID = { 62343 },
		stats = {
			["haste rating"] = 25,
			intellect = 50,
		},
	},
	[4201] = {
		itemID = { 62344 },
		stats = {
			["critical strike rating"] = 20,
			strength = 30,
		},
	},
	[4202] = {
		itemID = { 62345 },
		stats = {
			["critical strike rating"] = 25,
			strength = 50,
		},
	},
	[4204] = {
		itemID = { 62346 },
		stats = {
			agility = 50,
			["mastery rating"] = 25,
		},
	},
	[4205] = {
		itemID = { 62347 },
		stats = {
			agility = 30,
			["mastery rating"] = 20,
		},
	},
	[4206] = {
		itemID = { 62366 },
		stats = {
			["dodge rating"] = 35,
			stamina = 90,
		},
	},
	[4207] = {
		itemID = { 62367 },
		stats = {
			["critical strike rating"] = 35,
			intellect = 60,
		},
	},
	[4208] = {
		itemID = { 62368, 62422 },
		stats = {
			["mastery rating"] = 35,
			strength = 60,
		},
	},
	[4209] = {
		itemID = { 62369 },
		stats = {
			agility = 60,
			["haste rating"] = 35,
		},
	},
-- 	[4214] = {
-- 		spellID = { 84425 },
-- 		stats = {
-- 			["cardboard assassin"] = 1,
-- 		},
-- 	},
	[4215] = {
		itemID = { 55055 },
		stats = {
			["elementium shield spike"] = 1,
		},
	},
	[4216] = {
		itemID = { 55056 },
		stats = {
			["pyrium shield spike"] = 1,
		},
	},
	[4217] = {
		itemID = { 55057 },
		stacks = false,
		stats = {
			["disarm duration reduction (percent)"] = 60,
			["hit rating"] = 40,
		},
	},
-- 	[4222] = {
-- 		spellID = { 67839 },
-- 		stats = {
-- 			["mind amplification dish"] = 1,
-- 		},
-- 	},
-- 	[4223] = {
-- 		spellID = { 55016 },
-- 		stats = {
-- 			["nitro boosts"] = 1,
-- 		},
-- 	},
	[4227] = {
		itemID = { 68134 },
		spellID = { 95471 },
		stats = {
			agility = 130,
		},
	},
	[4245] = {
		itemID = { 68770 },
		stats = {
			intellect = 60,
			["resilience rating"] = 35,
		},
	},
	[4246] = {
		itemID = { 68769 },
		stats = {
			agility = 60,
			["resilience rating"] = 35,
		},
	},
	[4247] = {
		itemID = { 68768 },
		stats = {
			["resilience rating"] = 35,
			strength = 60,
		},
	},
	[4248] = {
		itemID = { 68772 },
		stats = {
			intellect = 50,
			["resilience rating"] = 25,
		},
	},
	[4249] = {
		itemID = { 68773 },
		stats = {
			["resilience rating"] = 25,
			strength = 50,
		},
	},
	[4250] = {
		itemID = { 68774 },
		stats = {
			agility = 50,
			["resilience rating"] = 25,
		},
	},
	[4256] = {
		spellID = { 96261 },
		stats = {
			strength = 50,
		},
	},
	[4257] = {
		spellID = { 96262 },
		stats = {
			intellect = 50,
		},
	},
	[4258] = {
		spellID = { 96264 },
		stats = {
			agility = 50,
		},
	},
	[4259] = {
		itemID = { 68796 },
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
