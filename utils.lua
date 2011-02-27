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

function ww_combineStrings(strings)
	local startSame, endSame = "", ""
	local stringPieces = {}
	for i, string in ipairs(strings) do
		local pieces = { strsplit(" ", string) }
		for j, piece in ipairs(pieces) do
			if not stringPieces[j] then
				stringPieces[j] = {}
			end
			stringPieces[j][piece] = (stringPieces[j][piece] or 0) + 1
		end
	end
	local done = false
	for i = 1, #(stringPieces) do
		for piece, count in pairs(stringPieces[i]) do
			if count == #(strings) then
				startSame = (startSame == "" and "" or startSame .. " ") .. piece
			else
				done = true
				break
			end
		end
		if done then
			break
		end
	end
	done = false
	for i = #(stringPieces), 1, -1 do
		for piece, count in pairs(stringPieces[i]) do
			if count == #(strings) then
				endSame = piece .. (endSame == "" and "" or " " .. endSame)
			else
				done = true
				break
			end
		end
		if done then
			break
		end
	end

	if startSame ~= "" then
		startSame = startSame .. " "
	end

	if endSame ~= "" then
		endSame = " " .. endSame
	end

	for i = 1, #(strings) do
		strings[i] = strings[i]:sub(startSame:len() + 1, -endSame:len() - 1)
	end
	return startSame .. table.concat(strings, "/") .. endSame
end
