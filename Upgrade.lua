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

	for major, tbl in pairs(strTable) do
		funcTable[major] = {}
		for minor, funcStr in pairs(tbl) do
			funcTable[major][minor] = loadstring(funcStr)()
		end
	end

	return funcTable
end

noop_down = [[
	return function(vars)
		vars.dataMinorVersion = vars.dataMinorVersion - 1
		return vars
	end
]]


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
	local activeWeights = {}

	activeWeights[class] = {}
	for name, _ in pairs(ww_vars.weightsList[class]) do
		table.insert(activeWeights[class], name)
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
	},
}

downgradeAccountFunctions = {
	[0] = {
		[2] = noop_down,
	},
}

upgradeCharFunctions = {
	[0] = {
		[0] = function(vars) return copyDefaultCharVars() end,
	},
}

downgradeCharFunctions = {
}
