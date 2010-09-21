local function includeFile(filename)
	if string.find(filename, "%.toc$") then
		local startDir = filename:gsub("[^/]+$", "")
		for line in io.lines(filename) do
			line = line:gsub("#.*", ""):gsub("\\", "/")
			if string.find(line, ".+%..+") then
				if not string.find(line, "^Libs/") then
					includeFile(startDir .. line)
				end
			end
		end
	elseif string.find(filename, "%.xml$") then
		local startDir = filename:gsub("[^/]+$", "")
		for line in io.lines(filename) do
			local start, _, luaFile = string.find(line, "<Script file=\"(.*)\"/>")
			if start then
				luaFile = luaFile:gsub("\\", "/")
				includeFile(startDir .. luaFile)
			end
			local start, _, xmlFile = string.find(line, "<Include file=\"(.*)\"/>")
			if start then
				xmlFile = xmlFile:gsub("\\", "/")
				includeFile(startDir .. xmlFile)
			end
		end
	else
		local status, err = loadfile(filename)
		if status then
			status, err = pcall(status)
			if not status then
				print(debug.traceback(err))
				error()
			end
		else
			print(debug.traceback(err))
			error()
		end
	end
end

local function removeEmptyTables(data)
	for index, value in pairs(data) do
		if type(value) == "table" then
			data[index] = removeEmptyTables(value)
		end
	end
	for index, value in pairs(data) do
		return data
	end
	return nil
end

local gem_data = {}

local function runTests(totalItems)
	local numItems = 0
	WeightsWatcher.ResetTables()
	for gemId in pairs(gem_ids_to_item_info) do
		numItems = numItems + 1
		io.stdout:write(string.format("\rParsing gem id %d (%d of %d)", gemId, numItems, totalItems))
		io.stdout:flush()
		local itemLink = string.format("item:25:0:%d:0:0:0:0:0:85", gemId)
		gem_data[gemId] = ww_bareItemCache[itemLink]
		for name, value in pairs(gem_data[gemId]) do
			if type(value) == "table" then
				local empty = true
				for _ in pairs(value) do
					empty = false
					break
				end
				if empty then
					gem_data[gemId][name] = nil
				end
			end
		end
	end
	io.stdout:write("\n")
	io.stdout:flush()
end

local currentItem

WeightsWatcherHiddenTooltip = {}

function WeightsWatcherHiddenTooltip:ClearLines()
	currentItem = nil
end

function WeightsWatcherHiddenTooltip:SetHyperlink(link)
	currentItem = gem_ids_to_item_info[tonumber(link:sub(11,-14))]
	if not currentItem then
		print(link, link:sub(11,-14))
		return
	end

	local lastLine
	for i = 1, #(currentItem) do
		_G["WeightsWatcherHiddenTooltipTextLeft" .. i] = {GetText = function() return currentItem[i].left end}
		_G["WeightsWatcherHiddenTooltipTextRight" .. i] = {GetText = function() return currentItem[i].right end}
		lastLine = i
	end
	lastLine = lastLine + 1
	while _G["WeightsWatcherHiddenTooltipTextLeft" .. lastLine] do
		_G["WeightsWatcherHiddenTooltipTextLeft" .. lastLine] = nil
		_G["WeightsWatcherHiddenTooltipTextRight" .. lastLine] = nil
		lastLine = lastLine + 1
	end
end

function WeightsWatcherHiddenTooltip:NumLines()
	if currentItem then
		return #(currentItem)
	else
		return 0
	end
end

includeFile("wrapper-functions.lua")
includeFile("WeightsWatcher.toc")
ww_vars = ww_copyDefaultAccountVars()

includeFile("gem-ids-to-item-info.lua")
local numItems = 0
for _ in pairs(gem_ids_to_item_info) do
	numItems = numItems + 1
end

WeightsWatcher.ResetTables()
ww_initializeParser()

runTests(numItems)

local gemIdInfo = {}

for gemId, gemInfo in pairs(gem_ids_to_item_info) do
	local start, color
	for _, line in ipairs(gemInfo) do
		start, _, color = line.left:find("Matches a ([%a, ]+) [sS]ocket%.")
		if start then
			color = color:lower()
			if color == "red or yellow" or color == "yellow or red" then
				color = "orange"
			elseif color == "red or blue" or color == "blue or red" then
				color = "purple"
			elseif color == "blue or yellow" or color == "yellow or blue" then
				color = "green"
			elseif color == "red, yellow or blue" or color == "red, blue, or yellow" then
				color = "prismatic"
			end
			if color ~= "red" and color ~= "orange" and color ~= "yellow" and color ~= "green" and color ~= "blue" and color ~= "purple" and color ~= "prismatic" then
				print(string.format("Error: invalid color (%s)", color))
				color = nil
			end
			break
		else
			start, _, color = line.left:find("Only fits in a (meta) gem slot%.")
			if start then
				break
			end
		end
	end
	if not color then
		color = "UNKNOWN"
	end
	gemIdInfo[gemId] = {
		color,
		gemInfo[1].left,
		gem_data[gemId].normalStats,
	}
end

includeFile("sort.lua")

local realPrint = print

local function filePrint(...)
	for _, str in ipairs({...}) do
		io.write(str)
		io.write("\n")
	end
end

print = filePrint

io.output("gem-ids.lua")
sort(gemIdInfo, "gemIdInfo")
io.close()

print = realPrint
