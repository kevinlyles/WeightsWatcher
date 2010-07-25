-- TODO: move this to a util(s).lua?
function ww_deepTableCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, _copy(getmetatable(object)))
    end
    return _copy(object)
end

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
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			if vars.weightsList[class][weight]["stun resist chance (percent)"] == nil then
				vars.weightsList[class][weight]["stun resist chance (percent)"] = vars.weightsList[class][weight]["stun resistance (percent)"]
				vars.weightsList[class][weight]["stun resistance (percent)"] = nil
			end
		end
	end

	vars.dataMinorVersion = 14
	return vars
end

local function FixStunResistChance(vars)
	vars = upgradeAccountToFixStunResistChance(vars)

	vars.dataMinorVersion = 15
	return vars
end

local downgradeAccountFromFixStunResistChance = [[
	return function(vars)
		for _, class in ipairs(vars.weightsList) do
			for _, weight in ipairs(vars.weightsList[class]) do
				if vars.weightsList[class][weight]["stun resistance (percent)"] == nil then
					vars.weightsList[class][weight]["stun resistance (percent)"] = vars.weightsList[class][weight]["stun resist chance (percent)"]
					vars.weightsList[class][weight]["stun resist chance (percent)"] = nil
				end
			end
		end

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
	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			vars.weightsList[class][weight]["melee damage"] = vars.weightsList[class][weight]["weapon damage"]
			vars.weightsList[class][weight]["weapon damage"] = nil
		end
	end

	vars.dataMinorVersion = 10
	return vars
end

local function upgradeAccountToWorkingResistances(vars)
	local resistances = {
		"arcane",
		"fire",
		"frost",
		"holy",
		"nature",
		"shadow",
	}

	for _, class in ipairs(vars.weightsList) do
		for _, weight in ipairs(vars.weightsList[class]) do
			for _, resistance in ipairs(resistances) do
				vars.weightsList[class][weight][resistance .. " resistance"] = vars.weightsList[class][weight][resistance]
				vars.weightsList[class][weight][resistance] = nil
			end
		end
	end

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
	qualityConversion = {
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
		qualityConversion = {
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
	return function (vars)
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
				if type(value) ~= "string" then
					value = "type: " .. type(value)
				end
				print("WeightsWatcher: error: invalid value in tooltip options: " .. value)
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
					if type(value) ~= "string" then
						value = "type: " .. type(value)
					end
					print("WeightsWatcher: error: invalid value in tooltip options: " .. value)
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
			print("WeightsWatcher: Error: class name has type " .. type(class) .. ", expecting string.")
			return nil
		end
		weightsListCopy[i] = class
		weightsListCopy[class] = {}
		j = 1
		for weight, stats in pairs(weights) do
			if type(weight) ~= "string" then
				print("WeightsWatcher: Error: weight name for class " .. class .. " has type " .. type(weight) .. ", expecting string.")
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
			print("WeightsWatcher: Error: class name has type " .. type(class) .. ", expecting string.")
			return nil
		end
		activeWeightsCopy[i] = class
		activeWeightsCopy[class] = {}
		for j, weight in pairs(weights) do
			if type(weight) ~= "string" then
				print("WeightsWatcher: Error: weight name has type " .. type(weight) .. ", expecting string.")
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

function copyDefaultAccountVars()
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

local function copyDefaultCharVars()
	local charVars

	charVars = ww_deepTableCopy(ww_defaultCharVars)
	charVars.activeWeights = createActiveWeights(WeightsWatcher.playerClass)
	return charVars
end

local upgradeAccountFunctions = {
	[0] = {
		[0] = copyDefaultAccountVars,
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
	},
}

local upgradeCharFunctions = {
	[0] = {
		[0] = copyDefaultCharVars,
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
		print("WeightsWatcher: error: invalid data type \"" .. dataType .. "\" passed to Upgrade().")
		return nil
	end

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
		direction = "up"
	else
		direction = "down"
		funcTable = stringsToFuncs(vars.downgradeFunctions)
	end

	if funcTable == nil then
		print("WeightsWatcher: error: no " .. direction .. "grade function table found.")
		return nil
	end

	if oldMajorVersion == 0 and oldMinorVersion == 0 then
		print("WeightsWatcher: no " .. dataType .. " data found, loading defaults.")
	else
		print("WeightsWatcher: attempting to " .. direction .. "grade " .. dataType .. " data from version " .. oldMajorVersion .. "." .. oldMinorVersion .. " to " .. newMajorVersion .. "." .. newMinorVersion .. ".")
	end

	local newVars = ww_deepTableCopy(vars)

	while oldMajorVersion ~= newMajorVersion or oldMinorVersion ~= newMinorVersion do
		if not funcTable[oldMajorVersion] or not funcTable[oldMajorVersion][oldMinorVersion] then
			print("WeightsWatcher: error: No " .. dataType .. " data " .. direction .. "grade path found.")
			return nil
		end
		newVars = funcTable[oldMajorVersion][oldMinorVersion](newVars)
		if not newVars or not newVars.dataMinorVersion then
			print("WeightsWatcher: " .. dataType .. " data " .. direction .. "grade error.")
			return nil
		elseif oldMinorVersion == newVars.dataMinorVersion and oldMajorVersion == newVars.dataMajorVersion then
			print("WeightsWatcher: error: infinite loop in " .. dataType .. " data " .. direction .. "grade.")
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

	print("WeightsWatcher: successfully " .. direction .. "graded " .. dataType .. " data.")

	return newVars
end
