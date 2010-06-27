if GetLocale() ~= "enUS" then
	return
end

local function sockets(text)
	return {socket = text}
end

local function socketBonuses(text, section)
	local stat = WeightsWatcher.singleStat(text, section)
	if stat and stat.stats then
		return {socketBonusStat = stat.stats}
	end
end

ww_sockets = {{" socket$"}, {}, {}, {}, {" socket$"}, sockets, "socket"}
ww_generic = {{"^[^:]+$"}, {}, {}, {}, {}, WeightsWatcher.parseStats, "generic"}
ww_socketBonuses = {{"^socket bonus: "}, {}, {}, {}, {"^socket bonus: "}, socketBonuses, "socketBonus"}
