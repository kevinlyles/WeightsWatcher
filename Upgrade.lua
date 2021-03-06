local L = ww_localization

local function stringsToFuncs(strTable)
	local funcTable = {}

	if not strTable then
		return funcTable
	end

	for major, tbl in pairs(strTable) do
		funcTable[major] = {}
		for minor, funcStr in pairs(tbl) do
			funcTable[major][minor] = loadstring(funcStr)()
		end
	end

	return funcTable
end

local function noop_up(vars)
	vars.dataMinorVersion = vars.dataMinorVersion + 1
	return vars
end

local noop_down = [[
return function(vars)
	vars.dataMinorVersion = vars.dataMinorVersion - 1
	return vars
end
]]

local function noop_major_up(vars)
	vars.dataMajorVersion = vars.dataMajorVersion + 1
	vars.dataMinorVersion = 0

	return vars
end

local function replaceStats(vars, conversions)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight] then
				for oldStat, newStat in pairs(conversions) do
					if vars.weightsList[class][weight][newStat] == nil then
						vars.weightsList[class][weight][newStat] = vars.weightsList[class][weight][oldStat]
					end
					vars.weightsList[class][weight][oldStat] = nil
				end
			end
		end
	end
end

local replaceStatsStr = [[
local function replaceStats(vars, conversions)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight] then
				for oldStat, newStat in pairs(conversions) do
					if vars.weightsList[class][weight][newStat] == nil then
						vars.weightsList[class][weight][newStat] = vars.weightsList[class][weight][oldStat]
					end
					vars.weightsList[class][weight][oldStat] = nil
				end
			end
		end
	end
end
]]

local function removedDeletedWeights(vars)
	for _, class in ipairs(vars.weightsList) do
		local indexesToRemove = {}

		for index, weight in ipairs(vars.weightsList[class]) do
			if not vars.weightsList[class][weight] then
				table.insert(indexesToRemove, index)
			end
		end

		table.sort(indexesToRemove)
		for i = #(indexesToRemove), 1, -1 do
			table.remove(vars.weightsList[class], indexesToRemove[i])
		end
	end

	vars.dataMinorVersion = vars.dataMinorVersion + 1

	return vars
end

local function upgradeAccountToNewMetaEffects(vars)
	local conversions = {
		["chance on being hit to gain 20% reduction to physical damage taken"] = "chance on being hit to gain 20% reduction to damage taken",
	}

	replaceStats(vars, conversions)

	vars.dataMinorVersion = 7
	return vars
end

local downgradeAccountFromNewMetaEffects = replaceStatsStr .. [[
return function(vars)
	local conversions = {
		["chance on being hit to gain 20% reduction to damage taken"] = "chance on being hit to gain 20% reduction to physical damage taken",
	}

	replaceStats(vars, conversions)

	vars.dataMinorVersion = 6
	return vars
end
]]

local function upgradeAccountToReplaceEmptyOptions(vars)
	if not vars.options then
		vars.options = ww_deepTableCopy(ww_defaultVars.options)
	end

	vars.dataMinorVersion = 6
	return vars
end

local function upgradeAccountToMonks(vars)
	if vars.weightsList["MONK"] == nil then
		vars.weightsList["MONK"] = ww_deepTableCopy(ww_defaultVars.weightsList["MONK"])
		table.insert(vars.weightsList, 5, "MONK")
	end

	vars.dataMinorVersion = 5
	return vars
end

local function upgradeAccountToMoPEnhancements(vars)
	local limit = vars.options.gems.qualityLimit
	if limit <= 10 and limit >= 8 then
		vars.options.gems.qualityLimit = limit + 3
	end

	vars.dataMinorVersion = 4
	return vars
end

local downgradeAccountFromMoPEnhancements = [[
return function(vars)
	local limit = vars.options.gems.qualityLimit
	if limit <= 13 and limit >= 11 then
		vars.options.gems.qualityLimit = limit - 3
	elseif limit == 14 then
		vars.options.gems.qualityLimit = 10
	end

	vars.dataMinorVersion = 3
	return vars
end
]]

local function upgradeAccountToPVPResilience(vars)
	local conversions = { ["resilience"] = "pvp resilience" }
	replaceStats(vars, conversions)

	vars.dataMinorVersion = 3
	return vars
end

local downgradeAccountFromPVPResilience = replaceStatsStr .. [[
return function(vars)
	local conversions = { ["pvp resilience"] = "resilience" }
	replaceStats(vars, conversions)

	vars.dataMinorVersion = 2
	return vars
end
]]

local function upgradeAccountToMoPStats(vars)
	local conversions = {
		["critical strike rating"] = "critical strike",
		["dodge rating"] = "dodge",
		["expertise rating"] = "expertise",
		["haste rating"] = "haste",
		["hit rating"] = "hit",
		["mastery rating"] = "mastery",
		["parry rating"] = "parry",
		["ranged critical strike rating"] = "ranged critical strike",
		["ranged haste rating"] = "ranged haste",
		["ranged hit rating"] = "ranged hit",
		["resilience rating"] = "resilience",
		["spell critical strike rating"] = "spell critical strike",
		["spell hit rating"] = "spell hit",
	}

	replaceStats(conversions)

	vars.dataMinorVersion = 2
	return vars
end

local downgradeAccountFromMoPStats = replaceStatsStr .. [[
return function(vars)
	local conversions = {
		["critical strike"] = "critical strike rating",
		["dodge"] = "dodge rating",
		["expertise"] = "expertise rating",
		["haste"] = "haste rating",
		["hit"] = "hit rating",
		["mastery"] = "mastery rating",
		["parry"] = "parry rating",
		["ranged critical strike"] = "ranged critical strike rating",
		["ranged haste"] = "ranged haste rating",
		["ranged hit"] = "ranged hit rating",
		["resilience"] = "resilience rating",
		["spell critical strike"] = "spell critical strike rating",
		["spell hit"] = "spell hit rating",
	}

	replaceStats(conversions)

	vars.dataMinorVersion = 1
	return vars
end
]]

local function upgradeAccountToCriticalEffect(vars)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["critical effect (percent)"] == nil then
				local value = (vars.weightsList[class][weight]["critical damage (percent)"] or 0) + (vars.weightsList[class][weight]["critical healing (percent)"] or 0)
				if value ~= 0 then
					vars.weightsList[class][weight]["critical effect (percent)"] = value
				end
			end
		end
	end

	vars.dataMinorVersion = 1
	return vars
end

local function upgradeAccountToEnchants(vars)
	if not vars.options.calculation then
		vars.options.calculation = {}
	end
	if not vars.options.calculation.useEffectUptimeRatio then
		vars.options.calculation.useEffectUptimeRatio = vars.options.useEffects.uptimeRatio or ww_defaultVars.options.calculation.useEffectUptimeRatio
	end
	vars.options.useEffects = nil

	if vars.options.tooltip.showAlternateEnhancements == nil then
		vars.options.tooltip.showAlternateEnhancements = vars.options.tooltip.showAlternateGems or ww_defaultVars.options.tooltip.showAlternateEnhancements
	end
	vars.options.tooltip.showAlternateGems = nil
	if vars.options.tooltip.showEnhancements == nil then
		vars.options.tooltip.showEnhancements = vars.options.tooltip.showIdealGems or ww_defaultVars.options.tooltip.showEnhancements
	end
	vars.options.tooltip.showIdealGems = nil
	if vars.options.tooltip.showEnhancementStats == nil then
		vars.options.tooltip.showEnhancementStats = vars.options.tooltip.showIdealGemStats or ww_defaultVars.options.tooltip.showEnhancementStats
	end
	vars.options.tooltip.showIdealGemStats = nil
	if vars.options.tooltip.showEnhancementsWhen == nil then
		vars.options.tooltip.showEnhancementsWhen = ww_defaultVars.options.tooltip.showEnhancementsWhen
	end

	if not vars.options.enchants then
		vars.options.enchants = ww_deepTableCopy(ww_defaultVars.options.enchants)
	end

	vars.dataMajorVersion = 2
	vars.dataMinorVersion = 0

	return vars
end

local downgradeAccountFromEnchants = [[
return function(vars)
	if not vars.options.useEffects then
		vars.options.useEffects = {}
	end
	if not vars.options.useEffects.uptimeRatio then
		vars.options.useEffects.uptimeRatio = vars.options.calculation.useEffectUptimeRatio or ww_defaultVars.options.useEffects.uptimeRatio
	end

	if vars.options.tooltip.showAlternateGems == nil then
		vars.options.tooltip.showAlternateGems = vars.options.tooltip.showAlternateEnhancements or ww_defaultVars.options.tooltip.showAlternateGems
	end
	vars.options.tooltip.showAlternateEnhancements = nil
	if vars.options.tooltip.showIdealGems == nil then
		vars.options.tooltip.showIdealGems = vars.options.tooltip.showEnhancements or ww_defaultVars.options.tooltip.showIdealGems
	end
	vars.options.tooltip.showEnhancements = nil
	if vars.options.tooltip.showIdealGemStats == nil then
		vars.options.tooltip.showIdealGemStats = vars.options.tooltip.showEnhancementStats or ww_defaultVars.options.tooltip.showIdealGemStats
	end
	vars.options.tooltip.showEnhancementStats = nil

	vars.dataMajorVersion = 1
	vars.dataMinorVersion = 25

	return vars
end
]]

local function UpgradeAccountToShowZeroScores(vars)
	if vars.options.tooltip.showZeroScores == nil then
		vars.options.tooltip.showZeroScores = false
	end

	vars.dataMinorVersion = 25
	return vars
end

local function upgradeAccountToCataclysmGems(vars)
	if vars.options.gems.qualityLimit == 7 then
		vars.options.gems.qualityLimit = 10
	end

	vars.dataMinorVersion = 24
	return vars
end

local function upgradeAccountToMeleeCrit(vars)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["melee dps"] or vars.weightsList[class][weight]["feral attack power"] or vars.weightsList[class][weight]["expertise rating"] then
				if vars.weightsList[class][weight]["melee critical strike rating"] == nil then
					vars.weightsList[class][weight]["melee critical strike rating"] = vars.weightsList[class][weight]["critical strike rating"]
				end
			end
		end
	end

	vars.dataMinorVersion = 23
	return vars
end

local function upgradeAccountToMastery(vars)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["mastery rating"] == nil then
				if ww_defaultVars.weightsList[class][weight] then
					vars.weightsList[class][weight]["mastery rating"] = ww_defaultVars.weightsList[class][weight]["mastery rating"] or 100
				else
					vars.weightsList[class][weight]["mastery rating"] = 100
				end
			end
		end
	end

	vars.dataMinorVersion = 22
	return vars
end

local function upgradeAccountToNewClassNameDisplayOptions(vars)
	if vars.options.tooltip.showClassNames == "Others" then
		vars.options.tooltip.showClassNames = "Other Classes"
	end

	vars.dataMinorVersion = 21
	return vars
end

local downgradeAccountFromNewClassNameDisplayOptions = [[
return function(vars)
	if vars.options.tooltip.showClassNames == "Other Classes" then
		vars.options.tooltip.showClassNames = "Others"
	end

	vars.dataMinorVersion = 20
	return vars
end
]]

local function upgradeAccountToRangedCritHasteAndHit(vars)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["ranged attack power"] ~= nil or vars.weightsList[class][weight]["ranged dps"] ~= nil then
				if vars.weightsList[class][weight]["ranged critical strike rating"] == nil then
					vars.weightsList[class][weight]["ranged critical strike rating"] = vars.weightsList[class][weight]["critical strike rating"]
				end
				if vars.weightsList[class][weight]["ranged haste rating"] == nil then
					vars.weightsList[class][weight]["ranged haste rating"] = vars.weightsList[class][weight]["haste rating"]
				end
				if vars.weightsList[class][weight]["ranged hit rating"] == nil then
					vars.weightsList[class][weight]["ranged hit rating"] = vars.weightsList[class][weight]["hit rating"]
				end
			end
		end
	end

	vars.dataMinorVersion = 20
	return vars
end

local function upgradeAccountToSpellHitAndCrit(vars)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["spell power"] ~= nil and vars.weightsList[class][weight]["attack power"] == nil then
				if vars.weightsList[class][weight]["spell critical strike rating"] == nil then
					vars.weightsList[class][weight]["spell critical strike rating"] = vars.weightsList[class][weight]["critical strike rating"]
				end
				if vars.weightsList[class][weight]["spell hit rating"] == nil then
					vars.weightsList[class][weight]["spell hit rating"] = vars.weightsList[class][weight]["hit rating"]
				end
			end
		end
	end

	vars.dataMinorVersion = 19
	return vars
end

local function upgradeAccountToNoMeleeDamage(vars)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["average melee weapon damage"] == nil then
				vars.weightsList[class][weight]["average melee weapon damage"] = vars.weightsList[class][weight]["melee damage"]
			end
			if vars.weightsList[class][weight]["maximum melee weapon damage"] == nil then
				vars.weightsList[class][weight]["maximum melee weapon damage"] = vars.weightsList[class][weight]["melee damage"]
			end
			vars.weightsList[class][weight]["melee damage"] = nil
		end
	end

	vars.dataMinorVersion = 18
	return vars
end

local function upgradeAccountToAverageWeaponDamage(vars)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["average melee weapon damage"] == nil then
				vars.weightsList[class][weight]["average melee weapon damage"] = vars.weightsList[class][weight]["minimum melee weapon damage"]
			end
			vars.weightsList[class][weight]["minimum melee weapon damage"] = nil
			if vars.weightsList[class][weight]["average ranged weapon damage"] == nil then
				vars.weightsList[class][weight]["average ranged weapon damage"] = vars.weightsList[class][weight]["minimum ranged weapon damage"]
			end
			vars.weightsList[class][weight]["minimum ranged weapon damage"] = nil
		end
	end

	vars.dataMinorVersion = 17
	return vars
end

local downgradeAccountFromAverageWeaponDamage = [[
return function(vars)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["minimum melee weapon damage"] == nil then
				vars.weightsList[class][weight]["minimum melee weapon damage"] = vars.weightsList[class][weight]["average melee weapon damage"]
			end
			if vars.weightsList[class][weight]["minimum ranged weapon damage"] == nil then
				vars.weightsList[class][weight]["minimum ranged weapon damage"] = vars.weightsList[class][weight]["average ranged weapon damage"]
			end
		end
	end

	vars.dataMinorVersion = 16
	return vars
end
]]

local function upgradeAccountToMeleeStatsAndRangedWeaponDamage(vars)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["ranged attack power"] ~= nil or vars.weightsList[class][weight]["ranged dps"] ~= nil then
				if vars.weightsList[class][weight]["maximum ranged weapon damage"] == nil then
					vars.weightsList[class][weight]["maximum ranged weapon damage"] = vars.weightsList[class][weight]["maximum weapon damage"]
				end
				vars.weightsList[class][weight]["maximum weapon damage"] = nil
				if vars.weightsList[class][weight]["minimum ranged weapon damage"] == nil then
					vars.weightsList[class][weight]["minimum ranged weapon damage"] = vars.weightsList[class][weight]["minimum weapon damage"]
				end
				vars.weightsList[class][weight]["minimum weapon damage"] = nil
			end
			if vars.weightsList[class][weight]["melee dps"] == nil then
				vars.weightsList[class][weight]["melee dps"] = vars.weightsList[class][weight]["dps"]
			end
			vars.weightsList[class][weight]["dps"] = nil
			if vars.weightsList[class][weight]["minimum melee weapon damage"] == nil then
				vars.weightsList[class][weight]["minimum melee weapon damage"] = vars.weightsList[class][weight]["minimum weapon damage"]
			end
			vars.weightsList[class][weight]["minimum weapon damage"] = nil
			if vars.weightsList[class][weight]["maximum melee weapon damage"] == nil then
				vars.weightsList[class][weight]["maximum melee weapon damage"] = vars.weightsList[class][weight]["maximum weapon damage"]
			end
			vars.weightsList[class][weight]["maximum weapon damage"] = nil
		end
	end

	vars.dataMinorVersion = 16
	return vars
end

local downgradeAccountFromMeleeStatsAndRangedWeaponDamage = [[
return function(vars)
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["maximum weapon damage"] == nil then
				vars.weightsList[class][weight]["maximum weapon damage"] = vars.weightsList[class][weight]["maximum ranged weapon damage"]
			end
			if vars.weightsList[class][weight]["minimum weapon damage"] == nil then
				vars.weightsList[class][weight]["minimum weapon damage"] = vars.weightsList[class][weight]["minimum ranged weapon damage"]
			end
			if vars.weightsList[class][weight]["dps"] == nil then
				vars.weightsList[class][weight]["dps"] = vars.weightsList[class][weight]["melee dps"]
			end
			if vars.weightsList[class][weight]["minimum weapon damage"] == nil then
				vars.weightsList[class][weight]["minimum weapon damage"] = vars.weightsList[class][weight]["minimum melee weapon damage"]
			end
			if vars.weightsList[class][weight]["maximum weapon damage"] == nil then
				vars.weightsList[class][weight]["maximum weapon damage"] = vars.weightsList[class][weight]["maximum melee weapon damage"]
			end
		end
	end

	vars.dataMinorVersion = 15
	return vars
end
]]

local function upgradeAccountToFixStunResistChance(vars)
	local conversions = { ["stun resistance (percent)"] = "stun resist chance (percent)" }

	replaceStats(vars, conversions)

	vars.dataMinorVersion = 14
	return vars
end

local function FixStunResistChance(vars)
	vars = upgradeAccountToFixStunResistChance(vars)

	vars.dataMinorVersion = 15
	return vars
end

local downgradeAccountFromFixStunResistChance = replaceStatsStr .. [[
return function(vars)
	local conversions = { ["stun resist chance (percent)"] = "stun resistance (percent)" }

	replaceStats(vars, conversions)

	vars.dataMinorVersion = 13
	return vars
end
]]

local function upgradeAccountToDebugKey(vars)
	if vars.options.tooltip.showDebugInfo == nil then
		vars.options.tooltip.showDebugInfo = "Never"
	end

	vars.dataMinorVersion = 13
	return vars
end

local function upgradeAccountToTriggers(vars)
	if vars.savedTriggers then
		for _, class in ipairs(vars.savedTriggers) do
			for _, weight in ipairs(vars.savedTriggers[class]) do
				if vars.weightsList[class] and vars.weightsList[class][weight] then
					vars.weightsList[class][weight].triggers = vars.savedTriggers[class][weight]
				end
			end
		end
	end
	vars.savedTriggers = nil
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if not vars.weightsList[class][weight].triggers then
				vars.weightsList[class][weight].triggers = {}
				if vars.weightsList[class][weight]["dps"] or (vars.weightsList[class][weight]["attack power"] and not vars.weightsList[class][weight]["ranged attack power"]) then
					vars.weightsList[class][weight].triggers.meleeDamage = true
				end
				if vars.weightsList[class][weight]["ranged dps"] or vars.weightsList[class][weight]["ranged attack power"] then
					vars.weightsList[class][weight].triggers.rangedDamage = true
				end
				if vars.weightsList[class][weight]["spell power"] and vars.weightsList[class][weight]["hit rating"] then
					vars.weightsList[class][weight].triggers.harmfulSpell = true
				end
				if vars.weightsList[class][weight]["spell power"] and not vars.weightsList[class][weight]["hit rating"] then
					vars.weightsList[class][weight].triggers.helpfulSpell = true
				end
			end
		end
	end

	vars.dataMinorVersion = 12
	return vars
end

local downgradeAccountFromTriggers = [[
return function(vars)
	vars.savedTriggers = {}
	for i, class in ipairs(vars.weightsList) do
		vars.savedTriggers[i] = class
		vars.savedTriggers[class] = {}
		for j, weight in ipairs(vars.weightsList[class]) do
			vars.savedTriggers[class][j] = weight
			vars.savedTriggers[class][weight] = vars.weightsList[class][weight].triggers
			vars.weightsList[class][weight].triggers = nil
		end
	end

	vars.dataMinorVersion = 11
	return vars
end
]]

local function upgradeAccountToUseEffectRatio(vars)
	if not vars.options.useEffects then
		vars.options.useEffects = {}
	end
	if not vars.options.useEffects.uptimeRatio then
		vars.options.useEffects.uptimeRatio = 0.8
	end

	vars.dataMinorVersion = 11
	return vars
end

local function upgradeAccountToWorkingMeleeDamage(vars)
	local conversions = { ["weapon damage"] = "melee damage" }

	replaceStats(vars, conversions)

	vars.dataMinorVersion = 10
	return vars
end

local function upgradeAccountToWorkingResistances(vars)
	local conversions = {
		["arcane"] = "arcane resistance",
		["fire"] = "fire resistance",
		["frost"] = "frost resistance",
		["holy"] = "holy resistance",
		["nature"] = "nature resistance",
		["shadow"] = "shadow resistance",
	}

	replaceStats(vars, conversions)

	vars.dataMinorVersion = 9
	return vars
end

local function upgradeAccountToShowAlternateGemsTypoFix(vars)
	if vars.options.tooltip.showAlternateGems == nil then
		vars.options.tooltip.showAlternateGems = "Alt"
	end
	vars.options.tooltip.showAlternativeGems = nil

	vars.dataMinorVersion = 8
	return vars
end

local function upgradeAccountToShowAlternateGems(vars)
	if vars.options.tooltip.showAlternateGems == nil then
		vars.options.tooltip.showAlternateGems = "Alt"
	end

	vars.dataMinorVersion = 7
	return vars
end

local function upgradeAccountToGemSources(vars)
	if not vars.options.gems.types then
		vars.options.gems.types = {}
	end
	if not vars.options.gems.sources then
		vars.options.gems.sources = {}
	end

	if vars.options.gems.usedTypes then
		if vars.options.gems.types["Normal"] == nil then
			vars.options.gems.types["Normal"] = vars.options.gems.usedTypes["Normal"]
		end
		if vars.options.gems.types["Unique-Equipped"] == nil then
			vars.options.gems.types["Unique-Equipped"] = vars.options.gems.usedTypes["Unique-Equipped"]
		end
		if vars.options.gems.types["Jewelcrafter-Only"] == nil then
			vars.options.gems.types["Jewelcrafter-Only"] = vars.options.gems.usedTypes["Jewelcrafter-Only"]
		end
		if vars.options.gems.sources["Procced"] == nil then
			vars.options.gems.sources["Procced"] = vars.options.gems.usedTypes["Procced"]
		end
	end

	if vars.options.gems.types["Normal"] == nil then
		vars.options.gems.types["Normal"] = true
	end
	if vars.options.gems.types["Unique-Equipped"] == nil then
		vars.options.gems.types["Unique-Equipped"] = false
	end
	if vars.options.gems.types["Jewelcrafter-Only"] == nil then
		vars.options.gems.types["Jewelcrafter-Only"] = false
	end

	if vars.options.gems.sources["Vendor"] == nil then
		vars.options.gems.sources["Vendor"] = true
	end
	if vars.options.gems.sources["PVP-Vendor"] == nil then
		vars.options.gems.sources["PVP-Vendor"] = false
	end
	if vars.options.gems.sources["Crafted"] == nil then
		vars.options.gems.sources["Crafted"] = true
	end
	if vars.options.gems.sources["Procced"] == nil then
		vars.options.gems.sources["Procced"] = true
	end
	if vars.options.gems.sources["Drop"] == nil then
		vars.options.gems.sources["Drop"] = false
	end
	if vars.options.gems.sources["Quest"] == nil then
		vars.options.gems.sources["Quest"] = false
	end

	vars.options.gems.usedTypes = nil

	vars.dataMinorVersion = 6
	return vars
end

local downgradeAccountFromGemSources = [[
return function(vars)
	if not vars.options.gems.usedTypes then
		vars.options.gems.usedTypes = {}
	end

	if vars.options.gems.types then
		if vars.options.gems.usedTypes["Normal"] == nil then
			vars.options.gems.usedTypes["Normal"] = vars.options.gems.types["Normal"]
		end
		if vars.options.gems.usedTypes["Unique-Equipped"] == nil then
			vars.options.gems.usedTypes["Unique-Equipped"] = vars.options.gems.types["Unique-Equipped"]
		end
		if vars.options.gems.usedTypes["Jewelcrafter-Only"] == nil then
			vars.options.gems.usedTypes["Jewelcrafter-Only"] = vars.options.gems.types["Jewelcrafter-Only"]
		end
	end
	if vars.options.gems.sources then
		if vars.options.gems.usedTypes["Procced"] == nil then
			vars.options.gems.usedTypes["Procced"] = vars.options.gems.sources["Procced"]
		end
	end

	if vars.options.gems.usedTypes["Normal"] == nil then
		vars.options.gems.usedTypes["Normal"] = true
	end
	if vars.options.gems.usedTypes["Unique-Equipped"] == nil then
		vars.options.gems.usedTypes["Unique-Equipped"] = false
	end
	if vars.options.gems.usedTypes["Jewelcrafter-Only"] == nil then
		vars.options.gems.usedTypes["Jewelcrafter-Only"] = false
	end
	if vars.options.gems.usedTypes["Procced"] == nil then
		vars.options.gems.usedTypes["Procced"] = true
	end

	vars.dataMinorVersion = 5
	return vars
end
]]

local function upgradeAccountToFixedConfigOptions(vars)
	if vars.options.breakSocketColors ~= nil then
		vars.options.gems.breakSocketColors = vars.options.breakSocketColors
		vars.options.breakSocketColors = nil
	else
		vars.options.gems.breakSocketColors = true
	end
	if vars.options.neverBreakSocketColors ~= nil then
		vars.options.gems.neverBreakSocketColors = vars.options.neverBreakSocketColors
		vars.options.neverBreakSocketColors = nil
	else
		vars.options.gems.neverBreakSocketColors = false
	end
	if vars.options.normalizeWeights ~= nil then
		vars.options.tooltip.normalizeWeights = vars.options.normalizeWeights
		vars.options.normalizeWeights = nil
	else
		vars.options.tooltip.normalizeWeights = true
	end

	vars.dataMinorVersion = 5
	return vars
end

local downgradeAccountFromFixedConfigOptions = [[
return function(vars)
	if vars.options.tooltip.normalizeWeights ~= nil then
		vars.options.normalizeWeights = vars.options.tooltip.normalizeWeights
		vars.options.tooltip.normalizeWeights = nil
	else
		vars.options.normalizeWeights = true
	end

	vars.dataMinorVersion = 4
	return vars
end
]]

local function upgradeAccountToPartitionedGems(vars)
	local qualityConversion = {
		[1] = 1,
		[2] = 2,
		[3] = 3,
		[4] = 4,
		[5] = 4,
		[6] = 5,
		[7] = 5,
		[8] = 6,
		[9] = 7,
		[10] = 7,
		[11] = 7,
	}

	if not vars.options.gems then
		vars.options.gems = {}
	end
	if not vars.options.gems.usedTypes then
		vars.options.gems.usedTypes = {}
	end

	vars.options.gems.usedTypes["Normal"] = true
	vars.options.gems.usedTypes["Unique-Equipped"] = vars.options.gemQualityLimit == 5 or vars.options.gemQualityLimit == 10
	vars.options.gems.usedTypes["Jewelcrafter-Only"] = vars.options.gemQualityLimit == 11
	vars.options.gems.usedTypes["Procced"] = vars.options.gemQualityLimit == 7
	vars.options.gems.qualityLimit = qualityConversion[vars.options.gemQualityLimit]
	vars.options.gems.breakSocketColors = vars.options.breakSocketColors
	vars.options.gems.neverBreakSocketColors = vars.options.neverBreakSocketColors

	vars.options.gemQualityLimit = nil
	vars.options.breakSocketColors = nil
	vars.options.neverBreakSocketColors = nil

	vars.dataMinorVersion = 4
	return vars
end

local downgradeAccountFromPartitionedGems = [[
return function(vars)
	local qualityConversion = {
		[1] = 1,
		[2] = 2,
		[3] = 3,
		[4] = 4,
		[5] = 6,
		[6] = 8,
		[7] = 9,
	}

	vars.options.gemQualityLimit = qualityConversion[vars.options.gems.qualityLimit]
	if vars.options.gems.usedTypes["Unique-Equipped"] and (vars.options.gems.qualityLimit == 4 or vars.options.gems.qualityLimit == 7) then
		vars.options.gemQualityLimit = vars.options.gemQualityLimit + 1
	end
	if vars.options.gems.usedTypes["Procced"] and vars.options.gems.qualityLimit == 5 then
		vars.options.gemQualityLimit = 7
	end
	if vars.options.gems.usedTypes["Jewelcrafter-Only"] and vars.options.gems.qualityLimit == 7 then
		vars.options.gemQualityLimit = 11
	end
	vars.options.breakSocketColors = vars.options.gems.breakSocketColors
	vars.options.neverBreakSocketColors = vars.options.gems.neverBreakSocketColors

	vars.options.gems = nil

	vars.dataMinorVersion = 3
	return vars
end
]]

local function upgradeAccountToShowDifferences(vars)
	if vars.options.tooltip.showDifferences == nil then
		vars.options.tooltip.showDifferences = true
	end

	vars.dataMinorVersion = 3
	return vars
end

local function upgradeAccountToCorrectShowClassNames(vars)
	if vars.options.tooltip.showClassNames == nil then
		if vars.options.showClassNames == nil then
			vars.options.tooltip.showClassNames = "Others"
		else
			vars.options.tooltip.showClassNames = vars.options.showClassNames
		end
	end
	vars.options.showClassNames = nil

	vars.dataMinorVersion = 2
	return vars
end

local function upgradeAccountToBetterMetaEffectNames(vars)
	local newName
	local conversion = {
		["armor from items percent"] = "armor from items (percent)",
		["block value percent"] = "block value (percent)",
		["chance to increase melee/ranged attack speed"] = "chance to increase physical haste",
		["chance to increase spell cast speed"] = "chance to increase spell haste",
		["critical damage percent"] = "critical damage (percent)",
		["critical healing percent"] = "critical healing (percent)",
		["fear duration reduction percent"] = "fear duration reduction (percent)",
		["silence duration reduction percent"] = "silence duration reduction (percent)",
		["snare/root duration reduction percent"] = "snare/root duration reduction (percent)",
		["spell damage taken reduction percent"] = "spell damage taken reduction (percent)",
		["spell reflect percent"] = "spell reflect (percent)",
		["stun duration reduction percent"] = "stun duration reduction (percent)",
		["stun resistance percent"] = "stun resistance (percent)",
		["threat percent"] = false,
		["threat reduction percent"] = "threat reduction (percent)",
	}

	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			for stat, value in pairs(vars.weightsList[class][weight]) do
				newName = conversion[stat]
				-- Don't touch unchanged stat names, clear deleted stat names
				if newName ~= nil then
					vars.weightsList[class][weight][stat] = nil
				end
				-- move the value to the new stat name
				if newName then
					vars.weightsList[class][weight][newName] = value
				end
			end
		end
	end

	vars.dataMinorVersion = 1
	return vars
end

local downgradeAccountFromBetterMetaEffectNames = [[
return function(vars)
	local newName
	local conversion = {
		["armor from items (percent)"] = "armor from items percent",
		["block value (percent)"] = "block value percent",
		["chance to increase physical haste"] = "chance to increase melee/ranged attack speed",
		["chance to increase spell haste"] = "chance to increase spell cast speed",
		["critical damage (percent)"] = "critical damage percent",
		["critical healing (percent)"] = "critical healing percent",
		["fear duration reduction (percent)"] = "fear duration reduction percent",
		["silence duration reduction (percent)"] = "silence duration reduction percent",
		["snare/root duration reduction (percent)"] = "snare/root duration reduction percent",
		["spell damage taken reduction (percent)"] = "spell damage taken reduction percent",
		["spell reflect (percent)"] = "spell reflect percent",
		["stun duration reduction (percent)"] = "stun duration reduction percent",
		["stun resistance (percent)"] = "stun resistance percent",
		["threat reduction (percent)"] = "threat reduction percent",
	}

	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			for stat, value in pairs(vars.weightsList[class][weight]) do
				newName = conversion[stat]
				-- move the value to the new stat name
				if newName then
					vars.weightsList[class][weight][stat] = nil
					vars.weightsList[class][weight][newName] = value
				end
			end
		end
	end

	vars.dataMinorVersion = 0
	return vars
end
]]

local downgradeAccountToDevelopment = [[
return function(vars)
	vars.dataMajorVersion = 0
	vars.dataMinorVersion = 10

	return vars
end
]]

local downgradeCharToDevelopment = [[
return function(vars)
	vars.dataMajorVersion = 0
	vars.dataMinorVersion = 2

	return vars
end
]]

local function upgradeAccountToConfig(vars)
	local table = vars.options.tooltip
	local conversion = {
		[true] = "Always",
		[false] = "Never",
		["LSHIFT"] = "Left Shift",
		["RSHIFT"] = "Right Shift",
		["SHIFT"] = "Shift",
		["LALT"] = "Left Alt",
		["RALT"] = "Right Alt",
		["ALT"] = "Alt",
		["LCTRL"] = "Left Control",
		["RCTRL"] = "Right Control",
		["CTRL"] = "Control",
	}
	local keys = {
		["showIdealGemStats"] = true,
		["showIdealWeights"] = true,
		["showWeights"] = true,
		["showIdealGems"] = true,
	}

	for key, value in pairs(table) do
		if keys[key] then
			if conversion[value] == nil then
				return nil
			end
			table[key] = conversion[value]
		end
	end

	vars.dataMinorVersion = 10
	return vars
end

local downgradeAccountFromConfig = [[
return function(vars)
	local table = vars.options.tooltip
	local conversion = {
		["Always"] = true,
		["Never"] = false,
		["Left Shift"] = "LSHIFT",
		["Right Shift"] = "RSHIFT",
		["Shift"] = "SHIFT",
		["Left Alt"] = "LALT",
		["Right Alt"] = "RALT",
		["Alt"] = "ALT",
		["Left Control"] = "LCTRL",
		["Right Control"] = "RCTRL",
		["Control"] = "CTRL",
	}
	local keys = {
		["showIdealGemStats"] = true,
		["showIdealWeights"] = true,
		["showWeights"] = true,
		["showIdealGems"] = true,
	}

	for key, value in pairs(table) do
		if keys[key] then
			if conversion[value] == nil then
				return nil
			end
			table[key] = conversion[value]
		end
	end

	vars.dataMinorVersion = 9
	return vars
end
]]

local function upgradeAccountForceGemColors(vars)
	if vars.options.breakSocketColors == nil then
		vars.options.breakSocketColors = true
	end
	if vars.options.neverBreakSocketColors == nil then
		vars.options.neverBreakSocketColors = false
	end

	vars.dataMinorVersion = 9
	return vars
end

local function upgradeAccountHideModKeyHints(vars)
	if vars.options.tooltip.hideHints == nil then
		vars.options.tooltip.hideHints = false
	end

	vars.dataMinorVersion = 8
	return vars
end

local function upgradeAccountShowClassNames(vars)
	if not vars.options.tooltip.showClassNames then
		vars.options.tooltip.showClassNames = "Others"
	end

	vars.dataMinorVersion = 7
	return vars
end

local function upgradeAccountToHandleModifierKeys(vars)
	if not vars.options.tooltip then
		vars.options.tooltip = ww_deepTableCopy(ww_defaultVars.options.tooltip)
	end

	vars.dataMinorVersion = 5
	return vars
end

local function upgradeAccountToOrderedLists(vars)
	local i, j = 1
	local weightsListCopy = {}

	for class, weights in pairs(vars.weightsList) do
		if type(class) ~= "string" then
			return nil
		end
		weightsListCopy[i] = class
		weightsListCopy[class] = {}
		j = 1
		for weight, stats in pairs(weights) do
			if type(weight) ~= "string" then
				return nil
			end
			weightsListCopy[class][j] = weight
			weightsListCopy[class][weight] = stats
			j = j + 1
		end
		i = i + 1
	end

	vars.weightsList = weightsListCopy
	vars.dataMinorVersion = 4
	return vars
end

local downgradeAccountFromOrderedLists = [[
return function(vars)
	local weightsListCopy = {}

	for i, class in ipairs(vars.weightsList) do
		weightsListCopy[class] = {}
		for j, weight in ipairs(vars.weightsList[class]) do
			weightsListCopy[class][weight] = class[weight]
		end
	end
	vars.weightsList = weightsListCopy

	vars.dataMinorVersion = 3
	return vars
end
]]

local function upgradeCharToOrderedLists(vars)
	local i = 1
	local activeWeightsCopy = {}

	for class, weights in pairs(vars.activeWeights) do
		if type(class) ~= "string" then
			return nil
		end
		activeWeightsCopy[i] = class
		activeWeightsCopy[class] = {}
		for j, weight in pairs(weights) do
			if type(weight) ~= "string" then
				return nil
			end
			activeWeightsCopy[class][j] = weight
		end
		i = i + 1
	end

	vars.activeWeights = activeWeightsCopy
	vars.dataMinorVersion = 2
	return vars
end

local downgradeCharFromOrderedLists = [[
return function(vars)
	local activeWeightsCopy = {}

	for i, class in ipairs(vars.activeWeights) do
		activeWeightsCopy[class] = {}
		for j, weight in ipairs(vars.activeWeights[class]) do
			activeWeightsCopy[class][j] = weight
		end
	end
	vars.activeWeights = activeWeightsCopy

	vars.dataMinorVersion = 1
	return vars
end
]]

local function upgradeAccountToGemQuality(vars)
	if not vars.options.gemQualityLimit then
		vars.options.gemQualityLimit = 9
	end

	vars.dataMinorVersion = 3
	return vars
end

local function upgradeAccountToNormalization(vars)
	if not vars.options then
		vars.options = {}
	end
	if vars.options.normalizeWeights == nil then
		vars.options.normalizeWeights = true
	end

	vars.dataMinorVersion = 2
	return vars
end

function ww_copyDefaultAccountVars()
	return ww_deepTableCopy(ww_defaultVars)
end

local function createActiveWeights(class)
	local activeWeights = {class}

	activeWeights[class] = {}
	for i, name in ipairs(ww_vars.weightsList[class]) do
		activeWeights[class][i] = name
	end

	return activeWeights
end

local function ww_copyDefaultCharVars()
	local charVars

	charVars = ww_deepTableCopy(ww_defaultCharVars)
	charVars.activeWeights = createActiveWeights(WeightsWatcher.player.class)
	return charVars
end

local upgradeAccountFunctions = {
	[0] = {
		[0] = ww_copyDefaultAccountVars,
		[1] = upgradeAccountToNormalization,
		[2] = upgradeAccountToGemQuality,
		[3] = upgradeAccountToOrderedLists,
		[4] = upgradeAccountToHandleModifierKeys,
		[5] = noop_up,
		[6] = upgradeAccountShowClassNames,
		[7] = upgradeAccountHideModKeyHints,
		[8] = upgradeAccountForceGemColors,
		[9] = upgradeAccountToConfig,
		[10] = noop_major_up,
	},
	[1] = {
		[0] = upgradeAccountToBetterMetaEffectNames,
		[1] = upgradeAccountToCorrectShowClassNames,
		[2] = upgradeAccountToShowDifferences,
		[3] = upgradeAccountToPartitionedGems,
		[4] = upgradeAccountToFixedConfigOptions,
		[5] = upgradeAccountToGemSources,
		[6] = upgradeAccountToShowAlternateGems,
		[7] = upgradeAccountToShowAlternateGemsTypoFix,
		[8] = upgradeAccountToWorkingResistances,
		[9] = upgradeAccountToWorkingMeleeDamage,
		[10] = upgradeAccountToUseEffectRatio,
		[11] = upgradeAccountToTriggers,
		[12] = upgradeAccountToDebugKey,
		[13] = upgradeAccountToFixStunResistChance,
		[14] = FixStunResistChance,
		[15] = upgradeAccountToMeleeStatsAndRangedWeaponDamage,
		[16] = upgradeAccountToAverageWeaponDamage,
		[17] = upgradeAccountToNoMeleeDamage,
		[18] = upgradeAccountToSpellHitAndCrit,
		[19] = upgradeAccountToRangedCritHasteAndHit,
		[20] = upgradeAccountToNewClassNameDisplayOptions,
		[21] = upgradeAccountToMastery,
		[22] = upgradeAccountToMeleeCrit,
		[23] = upgradeAccountToCataclysmGems,
		[24] = UpgradeAccountToShowZeroScores,
		[25] = upgradeAccountToEnchants,
	},
	[2] = {
		[0] = upgradeAccountToCriticalEffect,
		[1] = upgradeAccountToMoPStats,
		[2] = upgradeAccountToPVPResilience,
		[3] = upgradeAccountToMoPEnhancements,
		[4] = upgradeAccountToMonks,
		[5] = upgradeAccountToReplaceEmptyOptions,
		[6] = upgradeAccountToNewMetaEffects,
		[7] = removedDeletedWeights,
	},
}

local downgradeAccountFunctions = {
	[0] = {
		[2] = noop_down,
		[3] = noop_down,
		[4] = downgradeAccountFromOrderedLists,
		[5] = noop_down,
		[6] = noop_down,
		[7] = noop_down,
		[8] = noop_down,
		[9] = noop_down,
		[10] = downgradeAccountFromConfig,
	},
	[1] = {
		[0] = downgradeAccountToDevelopment,
		[1] = downgradeAccountFromBetterMetaEffectNames,
		[2] = noop_down,
		[3] = noop_down,
		[4] = downgradeAccountFromPartitionedGems,
		[5] = downgradeAccountFromFixedConfigOptions,
		[6] = downgradeAccountFromGemSources,
		[7] = noop_down,
		[8] = noop_down,
		[9] = noop_down,
		[10] = noop_down,
		[11] = noop_down,
		[12] = downgradeAccountFromTriggers,
		[13] = noop_down,
		[14] = downgradeAccountFromFixStunResistChance,
		[15] = noop_down,
		[16] = downgradeAccountFromMeleeStatsAndRangedWeaponDamage,
		[17] = downgradeAccountFromAverageWeaponDamage,
		[18] = noop_down,
		[19] = noop_down,
		[20] = noop_down,
		[21] = downgradeAccountFromNewClassNameDisplayOptions,
		[22] = noop_down,
		[23] = noop_down,
		[24] = noop_down,
		[25] = noop_down,
	},
	[2] = {
		[0] = downgradeAccountFromEnchants,
		[1] = noop_down,
		[2] = downgradeAccountFromMoPStats,
		[3] = downgradeAccountFromPVPResilience,
		[4] = downgradeAccountFromMoPEnhancements,
		[5] = noop_down,
		[6] = noop_down,
		[7] = downgradeAccountFromNewMetaEffects,
		[8] = noop_down,
	},
}

local upgradeCharFunctions = {
	[0] = {
		[0] = ww_copyDefaultCharVars,
		[1] = upgradeCharToOrderedLists,
		[2] = noop_major_up,
	},
}

local downgradeCharFunctions = {
	[0] = {
		[2] = downgradeCharFromOrderedLists,
	},
	[1] = {
		[0] = downgradeCharToDevelopment,
	},
}

function WeightsWatcher.Upgrade(dataType)
	local oldMinorVersion, oldMajorVersion, newMinorVersion, newMajorVersion, vars, funcTable, direction, downgradeFunctions

	if dataType == "account" then
		vars = ww_vars
		newMinorVersion = ww_defaultVars.dataMinorVersion
		newMajorVersion = ww_defaultVars.dataMajorVersion
		funcTable = upgradeAccountFunctions
		downgradeFunctions = downgradeAccountFunctions
	elseif dataType == "character" then
		vars = ww_charVars
		newMinorVersion = ww_defaultCharVars.dataMinorVersion
		newMajorVersion = ww_defaultCharVars.dataMajorVersion
		funcTable = upgradeCharFunctions
		downgradeFunctions = downgradeCharFunctions
	else
		print(string.format(L["UPGRADE_ERR_INV_DATA_TYPE"], dataType))
		return nil
	end

	dataType = L[dataType]

	if vars then
		oldMinorVersion = vars.dataMinorVersion
		oldMajorVersion = vars.dataMajorVersion
	end
	if not oldMinorVersion then
		oldMinorVersion = 0
	end
	if not oldMajorVersion then
		oldMajorVersion = 0
	end

	if newMajorVersion == oldMajorVersion and newMinorVersion == oldMinorVersion then
		return vars
	end

	if newMajorVersion > oldMajorVersion or (newMajorVersion == oldMajorVersion and newMinorVersion > oldMinorVersion) then
		direction = L["upgrade"]
	else
		direction = L["downgrade"]
		funcTable = stringsToFuncs(vars.downgradeFunctions)
	end

	if funcTable == nil then
		print(string.format(L["UPGRADE_ERR_NO_FUNC_TBL"], direction))
		return nil
	end

	if oldMajorVersion == 0 and oldMinorVersion == 0 then
		print(string.format(L["LOADING_DEFAULTS"], dataType))
	else
		print(string.format(L["UPGRADE_ATTEMPT"], direction, dataType, oldMajorVersion, oldMinorVersion, newMajorVersion, newMinorVersion))
	end

	local newVars = ww_deepTableCopy(vars)

	while oldMajorVersion ~= newMajorVersion or oldMinorVersion ~= newMinorVersion do
		if not funcTable[oldMajorVersion] or not funcTable[oldMajorVersion][oldMinorVersion] then
			print(string.format(L["UPGRADE_ERR_NO_PATH"], dataType, direction))
			return nil
		end
		newVars = funcTable[oldMajorVersion][oldMinorVersion](newVars)
		if not newVars or not newVars.dataMinorVersion then
			print(string.format(L["UPGRADE_ERR_GENERIC"], dataType, direction))
			return nil
		elseif oldMinorVersion == newVars.dataMinorVersion and oldMajorVersion == newVars.dataMajorVersion then
			print(string.format(L["UPGRADE_ERR_INF_LOOP"], dataType, direction))
			return nil
		end
		oldMinorVersion = newVars.dataMinorVersion
		if newVars.dataMajorVersion then
			oldMajorVersion = newVars.dataMajorVersion
		else
			oldMajorVersion = 0
		end
	end

	newVars.downgradeFunctions = downgradeFunctions

	print(string.format(L["UPGRADE_SUCCESS"], dataType, direction))

	return newVars
end
