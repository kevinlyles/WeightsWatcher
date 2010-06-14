if GetLocale() == "enUS" then
	local L = ww_localization

	ww_triggerDisplayNames = {
		["meleeDamage"] = "Melee damage dealt",
		["rangedDamage"] = "Ranged damage dealt",
		["harmfulSpell"] = "Harmful spell cast",
		["helpfulSpell"] = "Helpful spell cast",
	}

	ww_triggerGroups = {
		["meleeDamageDealt"] = {"meleeDamage"},
		["rangedDamageDealt"] = {"rangedDamage"},
		["spellDamageDealt"] = {"harmfulSpell"},
		["damagingSpellCast"] = {"harmfulSpell"},
		["harmfulSpellHit"] = {"harmfulSpell"},
		["spellCast"] = {"harmfulSpell", "helpfulSpell"},
		["healingSpellCast"] = {"helpfulSpell"},
		["helpfulSpellCast"] = {"helpfulSpell"},
	}

end
