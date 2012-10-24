ww_slotsToSubslots = {
	back = {
	},
	chest = {
		cloth = 1011,
		leather = 848,
		mail = 797,
		plate = 715,
	},
	feet = {
		cloth = 636,
		leather = 688,
		mail = 630,
		plate = 535,
	},
	finger = {
	},
	hands = {
		cloth = 717,
		leather = 786,
		mail = 706,
		plate = 661,
	},
	head = {
		cloth = 696,
		leather = 632,
		mail = 636,
		plate = 688,
	},
	["held in off-hand"] = {
	},
	legs = {
		cloth = 786,
		leather = 800,
		mail = 732,
		plate = 706,
	},
	["main hand"] = {
		axe = 41,
		dagger = 187,
		["fist weapon"] = 94,
		mace = 271,
		sword = 133,
	},
	neck = {
	},
	["off hand"] = {
		axe = 30,
		dagger = 38,
		["fist weapon"] = 84,
		mace = 13,
		shield = 675,
		sword = 20,
	},
	["one-hand"] = {
		axe = 317,
-- 		bow = 1,
		dagger = 568,
		["fist weapon"] = 54,
		mace = 377,
		staff = 1,
		sword = 461,
	},
	ranged = {
		bow = 277,
		crossbow = 162,
		gun = 289,
		wand = 375,
	},
	shirt = {
	},
	shoulder = {
		cloth = 614,
		leather = 655,
		mail = 630,
		plate = 646,
	},
	tabard = {
	},
	trinket = {
	},
	["two-hand"] = {
		axe = 320,
		["fishing pole"] = 15,
		mace = 317,
		polearm = 205,
		staff = 689,
		sword = 337,
	},
	waist = {
		cloth = 574,
		leather = 663,
		mail = 607,
		plate = 504,
	},
	wrist = {
		cloth = 536,
		leather = 597,
		mail = 566,
		plate = 460,
	},
}

local weaponSubslots = {}
for _, slot in ipairs({"main hand", "off hand", "one-hand", "two-hand"}) do
	for subslot, count in pairs(ww_slotsToSubslots[slot]) do
		if subslot ~= "fishing pole" and subslot ~= "shield" then
			weaponSubslots[subslot] = (weaponSubslots[subslot] or 0) + count
		end
	end
end
ww_slotsToSubslots.weapon = weaponSubslots
