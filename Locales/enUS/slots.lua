if GetLocale() ~= "enUS" then
	return
end

ww_localizedSlotNames = {
	["axe"] = "axe",
	["mace"] = "mace",
	["sword"] = "sword",
	["head"] = "head",
	["shoulder"] = "shoulder",
	["chest"] = "chest",
	["wrist"] = "wrist",
	["hands"] = "hands",
	["waist"] = "waist",
	["legs"] = "legs",
	["feet"] = "feet",
	["main hand"] = "main hand",
	["off hand"] = "off hand",
	["one-hand"] = "one-hand",
	["two-hand"] = "two-hand",
	["relic"] = "relic",
	["ranged"] = "ranged",
	["thrown"] = "thrown",
	["projectile"] = "projectile",
	["neck"] = "neck",
	["back"] = "back",
	["shirt"] = "shirt",
	["tabard"] = "tabard",
	["finger"] = "finger",
	["trinket"] = "trinket",
	["held in off-hand"] = "held in off-hand",
	["cloth"] = "cloth",
	["leather"] = "leather",
	["mail"] = "mail",
	["plate"] = "plate",
}

ww_englishSlotNames = {}
for k, v in pairs(ww_localizedSlotNames) do
	ww_englishSlotNames[v] = k
end

ww_slotDisplayNames = {
	["axe"] = "Axe",
	["mace"] = "Mace",
	["sword"] = "Sword",
	["head"] = "Head",
	["shoulder"] = "Shoulder",
	["chest"] = "Chest",
	["wrist"] = "Wrist",
	["hands"] = "Hands",
	["waist"] = "Waist",
	["legs"] = "Legs",
	["feet"] = "Feet",
	["main hand"] = "Main Hand",
	["off hand"] = "Off Hand",
	["one-hand"] = "One-Hand",
	["two-hand"] = "Two-Hand",
	["relic"] = "Relic",
	["ranged"] = "Ranged",
	["thrown"] = "Thrown",
	["projectile"] = "Projectile",
	["neck"] = "Neck",
	["back"] = "Back",
	["shirt"] = "Shirt",
	["tabard"] = "Tabard",
	["finger"] = "Finger",
	["trinket"] = "Trinket",
	["held in off-hand"] = "Held In Off-hand",
	["cloth"] = "Cloth",
	["leather"] = "Leather",
	["mail"] = "Mail",
	["plate"] = "Plate",
}
