if GetLocale() ~= "enUS" then
	return
end

ww_localization["IDEAL_USE_UPTIME"] = "Percent of ideal use effect uptime:"

local CooldownUseMatchLines = {
	"^use: grants? .* cooldown%)$",
	"^use: increases? .* cooldown%)$",
}

local CooldownUsePreprocessLines = {
	{" (arcane spell) power ", " %1 damage "},
	{" (fire spell) power ", " %1 damage "},
	{" (frost spell) power ", " %1 damage "},
	{" (holy spell) power ", " %1 damage "},
	{" (nature spell) power ", " %1 damage "},
	{" (shadow spell) power ", " %1 damage "},
	{" your stats ", " all stats "},
	{" dodge by ", " dodge rating by "},
}

local CooldownUseAffixes = {
	"^use: +",
	"^grants? +",
	"^increases? +",
	"^your +",
	"^the target's +",
	"^maximum +",
}

local function useEffect(text, section)
	local start, _, stat, duration, cooldown = string.find(text, "^(%a+ ?%a+ ?%a+ ?%a+ ?%a* ?%a* by [+-]?%d+) for (%d+ %a+ ?%d* ?%a*)%. +%((%d+ %a+ ?%d* ?%a*) cooldown%)$")
	if not start then
		start, _, stat, duration, cooldown = string.find(text, "^([+-]?%d+ %a+ ?%a+ ?%a+ ?%a+ ?%a* ?%a*) for (%d+ %a+ ?%d* ?%a*)%. +%((%d+ %a+ ?%d* ?%a*) cooldown%)$")
	end
	if start then
		cooldown = WeightsWatcher.convertToSeconds(cooldown)
		duration = WeightsWatcher.convertToSeconds(duration)
		stats = WeightsWatcher.parseStats(stat, section)
		if stats and stats.stats then
			return {
				stats = stats.stats,
				duration = duration,
				cooldown = cooldown,
			}
		end
	end
end

local function cooldownUseEffect(text, section)
	local stat = useEffect(text, section)

	if stat then
		return {useEffect = stat}
	end
end

ww_cooldownUseEffects = {CooldownUseMatchLines, {}, {}, CooldownUsePreprocessLines, CooldownUseAffixes, cooldownUseEffect, "cooldownUseEffect"}
