function WeightsWatcher:Upgrade(dataType)
	local oldMinorVersion, oldMajorVersion, newMinorVersion, newMajorVersion, vars, funcTable, direction, downgradeFunctions

	if dataType == "account" then
		vars = ww_vars
		newMinorVersion = defaultVars.dataMinorVersion
		newMajorVersion = defaultVars.dataMajorVersion
		funcTable = upgradeAccountFunctions
		downgradeFunctions = downgradeAccountFunctions
	elseif dataType == "character" then
		vars = ww_charVars
		newMinorVersion = defaultCharVars.dataMinorVersion
		newMajorVersion = defaultCharVars.dataMajorVersion
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

	local newVars = deepTableCopy(vars)

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

function deepTableCopy(object)
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

function stringsToFuncs(strTable)
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

function noop_up(vars)
	vars.dataMinorVersion = vars.dataMinorVersion + 1
	return vars
end

noop_down = [[
	return function(vars)
		vars.dataMinorVersion = vars.dataMinorVersion - 1
		return vars
	end
]]

function noop_major_up(vars)
	vars.dataMajorVersion = vars.dataMajorVersion + 1
	vars.dataMinorVersion = 0

	return vars
end

function upgradeAccountToBetterMetaEffectNames(vars)
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

downgradeAccountFromBetterMetaEffectNames = [[
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

downgradeAccountToDevelopment = [[
	return function(vars)
		vars.dataMajorVersion = 0
		vars.dataMinorVersion = 10

		return vars
	end
]]

downgradeCharToDevelopment = [[
	return function(vars)
		vars.dataMajorVersion = 0
		vars.dataMinorVersion = 2

		return vars
	end
]]

function upgradeAccountToConfig(vars)
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

downgradeAccountFromConfig = [[
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

function upgradeAccountForceGemColors(vars)
	if vars.options.breakSocketColors == nil then
		vars.options.breakSocketColors = true
	end
	if vars.options.neverBreakSocketColors == nil then
		vars.options.neverBreakSocketColors = false
	end

	vars.dataMinorVersion = 9
	return vars
end

function upgradeAccountHideModKeyHints(vars)
	if vars.options.tooltip.hideHints == nil then
		vars.options.tooltip.hideHints = false
	end

	vars.dataMinorVersion = 8
	return vars
end

function upgradeAccountShowClassNames(vars)
	if not vars.options.tooltip.showClassNames then
		vars.options.tooltip.showClassNames = "Others"
	end

	vars.dataMinorVersion = 7
	return vars
end

function upgradeAccountToHandleModifierKeys(vars)
	if not vars.options.tooltip then
		vars.options.tooltip = deepTableCopy(defaultVars.options.tooltip)
	end

	vars.dataMinorVersion = 5
	return vars
end

function upgradeAccountToOrderedLists(vars)
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

downgradeAccountFromOrderedLists = [[
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

function upgradeCharToOrderedLists(vars)
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

downgradeCharFromOrderedLists = [[
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

function upgradeAccountToGemQuality(vars)
	if not vars.options.gemQualityLimit then
		vars.options.gemQualityLimit = 9
	end

	vars.dataMinorVersion = 3
	return vars
end

function upgradeAccountToNormalization(vars)
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
	return deepTableCopy(defaultVars)
end

function createActiveWeights(class)
	local activeWeights = {class}

	activeWeights[class] = {}
	for i, name in ipairs(ww_vars.weightsList[class]) do
		activeWeights[class][i] = name
	end

	return activeWeights
end

function copyDefaultCharVars()
	local charVars
	local _, class = UnitClass("player")

	charVars = deepTableCopy(defaultCharVars)
	charVars.activeWeights = createActiveWeights(class)
	return charVars
end

upgradeAccountFunctions = {
	[0] = {
		[0] = function(vars) return copyDefaultAccountVars() end,
		[1] = function(vars) return upgradeAccountToNormalization(vars) end,
		[2] = function(vars) return upgradeAccountToGemQuality(vars) end,
		[3] = function(vars) return upgradeAccountToOrderedLists(vars) end,
		[4] = function(vars) return upgradeAccountToHandleModifierKeys(vars) end,
		[5] = function(vars) return noop_up(vars) end,
		[6] = function(vars) return upgradeAccountShowClassNames(vars) end,
		[7] = function(vars) return upgradeAccountHideModKeyHints(vars) end,
		[8] = function(vars) return upgradeAccountForceGemColors(vars) end,
		[9] = function(vars) return upgradeAccountToConfig(vars) end,
		[10] = function(vars) return noop_major_up(vars) end,
	},
	[1] = {
		[0] = function(vars) return upgradeAccountToBetterMetaEffectNames(vars) end,
	},
}

downgradeAccountFunctions = {
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
	},
}

upgradeCharFunctions = {
	[0] = {
		[0] = function(vars) return copyDefaultCharVars() end,
		[1] = function(vars) return upgradeCharToOrderedLists(vars) end,
		[2] = function(vars) return noop_major_up(vars) end,
	},
}

downgradeCharFunctions = {
	[0] = {
		[2] = downgradeCharFromOrderedLists,
	},
	[1] = {
		[0] = downgradeCharToDevelopment,
	},
}
