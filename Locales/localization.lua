local metatable = {
	__index = function(tbl, key)
-- 		error("Localized string not found: " .. tostring(key))
		return key
	end
}

ww_localization = setmetatable({}, metatable)
