if GetLocale() ~= "enUS" then
	return
end

ww_classDisplayNames = {
	["DEATHKNIGHT"] = "Death Knight",
	["DRUID"] = "Druid",
	["HUNTER"] = "Hunter",
	["MAGE"] = "Mage",
	["PALADIN"] = "Paladin",
	["PRIEST"] = "Priest",
	["ROGUE"] = "Rogue",
	["SHAMAN"] = "Shaman",
	["WARLOCK"] = "Warlock",
	["WARRIOR"] = "Warrior",
}

ww_specNames = {
	["Affliction"] = "Affliction",
	["Arcane"] = "Arcane",
	["Assassination"] = "Assassination",
	["Balance"] = "Balance",
	["Beast Mastery"] = "Beast Mastery",
	["Blood DPS"] = "Blood DPS",
	["Combat"] = "Combat",
	["Demonology"] = "Demonology",
	["Destruction"] = "Destruction",
	["Discipline"] = "Discipline",
	["DPS"] = "DPS",
	["Elemental"] = "Elemental",
	["Enhancement"] = "Enhancement",
	["Feral DPS"] = "Feral DPS",
	["Feral Tank"] = "Feral Tank",
	["Fire"] = "Fire",
	["Frost"] = "Frost",
	["Frost DPS"] = "Frost DPS",
	["Holy"] = "Holy",
	["Marksmanship"] = "Marksmanship",
	["Protection"] = "Protection",
	["Restoration"] = "Restoration",
	["Retribution"] = "Retribution",
	["Shadow"] = "Shadow",
	["Subtlety"] = "Subtlety",
	["Survival"] = "Survival",
	["Tank"] = "Tank",
	["Unholy DPS"] = "Unholy DPS",
}
