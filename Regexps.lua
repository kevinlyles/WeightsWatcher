local patternCategories = {
	"elixir",
	"enchant",
	"enchantItem",
	"equipEffect",
	"fishing",
	"food",
	"generic",
	"socketBonus",
	"useEffect",
	"cooldownUseEffect",
	"stackingEquipEffect",
}

ww_regexes = {}

local function makePatternTables()
	for _, category in pairs(patternCategories) do
		ww_regexes[category] = {}
		ww_regexes[category].MultipleStat = {}
		ww_regexes[category].SingleStat = {}
	end
	local pattern, func, categories
	for _, regex in ipairs(ww_MultipleStatLines) do
		pattern, func, categories = unpack(regex)
		local tbl = {pattern, func}
		for _, category in ipairs(categories) do
			table.insert(ww_regexes[category].MultipleStat, tbl)
		end
	end
	for _, regex in ipairs(ww_SingleStatLines) do
		pattern, func, categories = unpack(regex)
		local tbl = {pattern, func}
		for _, category in ipairs(categories) do
			table.insert(ww_regexes[category].SingleStat, tbl)
		end
	end
end

function ww_initializeParser()
	makePatternTables()
end

function WeightsWatcher.handleEffects(text, matchLines, ignoreLines, unweightedLines, preprocessLines, affixLines, handler, section)
	local match = false
	for _, pattern in ipairs(matchLines) do
		if string.find(text, pattern) then
			match = true
			break
		end
	end
	if not match then
		return false
	end

	local origText = text

	for _, pattern in ipairs(ignoreLines) do
		if string.find(text, pattern) then
			ww_ignored_lines[text][pattern] = true
			return true
		end
	end
	for _, pattern in ipairs(unweightedLines) do
		if string.find(text, pattern) then
			ww_unweighted_lines[text][pattern] = true
			return true
		end
	end
	for _, regex in ipairs(preprocessLines) do
		local pattern, replacement = unpack(regex)
		if string.find(text, pattern) then
			text = string.gsub(text, pattern, replacement)
		end
	end
	for _, pattern in ipairs(affixLines) do
		if string.find(text, pattern) then
			text = string.gsub(text, pattern, "")
		end
		if text == "" then
			break
		end
	end
	if text == "" then
		ww_ignored_lines[origText] = true
		return true
	end
	local stat = handler(text, section)
	if stat then
		return stat
	end
end

function WeightsWatcher.parseStats(text, section)
	for _, regex in ipairs(ww_regexes[section].MultipleStat) do
		local pattern, func = unpack(regex)
		if string.find(text, pattern) then
			local stats = func(text, pattern, section)
			if stats then
				return {stats = stats}
			end
		end
	end
	return WeightsWatcher.singleStat(text, section)
end

function WeightsWatcher.twoStats(text, pattern, section)
	local start, _, stat1, stat2 = string.find(text, pattern)
	if start then
		stat1 = WeightsWatcher.singleStat(stat1, section)
		stat2 = WeightsWatcher.singleStat(stat2, section)
		if stat1 and stat2 then
			return stat1.stats + stat2.stats
		end
	end
end

function WeightsWatcher.multipleStatsOneNumber(text, pattern, section)
	local start, _, value, stat1, stat2 = string.find(text, pattern)
	if start then
		stat1 = WeightsWatcher.singleStat(value .. stat1, section)
		stat2 = WeightsWatcher.singleStat(value .. stat2, section)
		if stat1 and stat2 then
			return stat1.stats + stat2.stats
		end
	end
end

function WeightsWatcher.singleStat(text, section)
	for _, regex in ipairs(ww_regexes[section].SingleStat) do
		local pattern, func = unpack(regex)
		if string.find(text, pattern) then
			local stat = func(text, pattern, section)
			if stat then
				return {stats = stat}
			end
		end
	end
end

function WeightsWatcher.singleStatValueOnly(text, pattern, name)
	local start, _, value = string.find(text, pattern)
	if start then
		return WeightsWatcher.newStatTable({[name] = tonumber(value)})
	end
end

function WeightsWatcher.statNumFirst(text, pattern)
	local start, _, value, name = string.find(text, pattern)
	if start then
		return WeightsWatcher.newStatTable({[name] = tonumber(value)})
	end
end

function WeightsWatcher.statNameFirst(text, pattern)
	local start, _, name, value = string.find(text, pattern)
	if start then
		return WeightsWatcher.newStatTable({[name] = tonumber(value)})
	end
end

local normalStatsMetatable = {
	-- Allows us to skip the nil check
	__index = function()
		return 0
	end
}

function WeightsWatcher.newStatTable(tbl)
	return setmetatable(tbl or {}, normalStatsMetatable)
end

normalStatsMetatable.__add = function(tbl1, tbl2)
	local tbl = WeightsWatcher.newStatTable()

	if tbl1 ~= nil then
		for k, v in pairs(tbl1) do
			tbl[k] = v
		end
	end
	if tbl2 ~= nil then
		for k, v in pairs(tbl2) do
			tbl[k] = tbl[k] + v
		end
	end

	return tbl
end
