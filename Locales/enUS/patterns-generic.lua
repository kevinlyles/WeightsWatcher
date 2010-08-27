if GetLocale() ~= "enUS" then
	return
end

ww_generic = {{"^[^:]+$"}, {}, {}, {}, {}, WeightsWatcher.parseStats, "generic"}
