local metatable = {
	__index = function(tbl, key)
-- 		error("Localized string not found: " .. tostring(key))
		print("WeightsWatcher: Warning: localized string not found: \"" .. tostring(key) .. "\"")
		tbl[key] = key
		return key
	end
}

ww_localization = setmetatable({}, metatable)
