local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local function socketBonuses(text, section)
	local stat = WeightsWatcher.singleStat(text, section)
	if stat and stat.stats then
		return {socketBonusStat = stat.stats}
	end
end

ww_socketBonuses = {{"^socket bonus: "}, {}, {}, {}, {"^socket bonus: "}, socketBonuses, "socketBonus"}
