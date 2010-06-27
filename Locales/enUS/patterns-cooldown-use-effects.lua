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

local function cooldownUseEffect(text)
	local stat = WeightsWatcher.useEffect(text)

	if stat then
		return {useEffect = stat}
	end
end

ww_cooldownUseEffects = {CooldownUseMatchLines, {}, {}, CooldownUsePreprocessLines, CooldownUseAffixes, cooldownUseEffect, "cooldownUseEffect"}
