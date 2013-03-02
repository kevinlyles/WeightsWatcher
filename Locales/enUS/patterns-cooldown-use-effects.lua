local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

ww_localization["IDEAL_USE_UPTIME"] = "Percent of ideal use effect uptime:"

local CooldownUseMatchLines = {
	"^use: grants? .* cooldown%)$",
	"^use: increases? .* cooldown%)$",
	"^use: restores .* every .* cooldown%)$",
	-- item 70142
	"^use: a small moonwell .* cooldown%)$",
	-- item 70143
	"^use: a veil of splashing water .* cooldown%)$",
}

local CooldownUseUnweightedLines = {
	" party members ",
	" damage taken ",
}

local CooldownUsePreprocessLines = {
	{" (arcane spell) power ", " %1 damage "},
	{" your stats ", " all stats "},
	{" resistances to all schools of magic ", " all resistances "},
	{" by up t?o? ?", " by "},
	{"%. +effect lasts ", " "},
	{"%. +lasts ", " for "},
	{" and increases ", " and "},
	{" and your ", " and "},
	-- item 20512
	{" critical strike and spell critical strike ", " critical strike "},
	{" melee and ranged attack power ", " attack power "},
	-- item 12450
	{" spell, ranged,? and melee haste ", " haste "},
}

local CooldownUseAffixes = {
	"^use: +",
	-- item 70142
	"^a small moonwell appears. +blessing you with +",
	-- item 70143
	"^a veil of splashing water +",
	-- item 70143
	", as long as you stay in the pool",
	"^grants? +",
	"^increases? +",
	"^restores +",
	"^your +",
	"^the +",
	"^target's +",
	"^maximum +",
	" +shares cooldown with o?t?h?e?r? ?battlemaster's trinkets%.",
	-- item 12459
	" +guardian elixir%.",
	-- item 12450
	" +battle elixir%.",
	-- item 19341
	" +after the effects wear off, you will lose the extra maximum health%.",
}

local function useEffect(text, section)
	local start, _, stat, duration, cooldown = string.find(text, "^([%a%d, +-]+) for (%d+ %a+ ?%d* ?%a*)%. +%((%d+ %a+ ?%d* ?%a*) cooldown%)$")
	if start then
		cooldown = WeightsWatcher.convertToSeconds(cooldown)
		duration = WeightsWatcher.convertToSeconds(duration)
		local stats = WeightsWatcher.parseStats(stat, section)
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

ww_cooldownUseEffects = {CooldownUseMatchLines, {}, CooldownUseUnweightedLines, CooldownUsePreprocessLines, CooldownUseAffixes, cooldownUseEffect, "cooldownUseEffect"}
