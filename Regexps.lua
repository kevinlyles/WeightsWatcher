local patternCategories = {
	"elixir",
	"enchant",
	"equipEffect",
	"fishing",
	"food",
	"generic",
	"socketBonus",
	"useEffect",
	"stackingEquipEffect",
}

ww_regexes = {}

local function makePatternTables()
	for _, category in pairs(patternCategories) do
		ww_regexes[category] = {}
		ww_regexes[category].MultipleStat = {}
		ww_regexes[category].SingleStat = {}
	end
	local pattern, func, categories
	for _, regex in ipairs(ww_MultipleStatLines) do
		pattern, func, categories = unpack(regex)
		for _, category in ipairs(categories) do
			table.insert(ww_regexes[category].MultipleStat, {pattern, func})
		end
	end
	for _, regex in ipairs(ww_SingleStatLines) do
		pattern, func, categories = unpack(regex)
		for _, category in ipairs(categories) do
			table.insert(ww_regexes[category].SingleStat, {pattern, func})
		end
	end
	-- TODO: remove this in production?
	for _, category in pairs(patternCategories) do
		local empty = true
		for _ in pairs(ww_regexes[category].MultipleStat) do
			empty = false
			break
		end
		for _ in pairs(ww_regexes[category].SingleStat) do
			empty = false
			break
		end
		if empty then
			for _, regex in ipairs(ww_MultipleStatLines) do
				pattern, func = unpack(regex)
				table.insert(ww_regexes[category].MultipleStat, {pattern, func})
			end
			for _, regex in ipairs(ww_SingleStatLines) do
				pattern, func = unpack(regex)
				table.insert(ww_regexes[category].SingleStat, {pattern, func})
			end
		end
	end
end

function ww_initializeParser()
	makePatternTables()
end

function WeightsWatcher.handleEffects(text, matchLines, ignoreLines, unweightedLines, preprocessLines, affixLines, handler, section)
	local match = false
	for _, pattern in ipairs(matchLines) do
		if string.find(text, pattern) then
			match = true
			break
		end
	end
	if not match then
		return false
	end

	local origText = text

	for _, pattern in ipairs(ignoreLines) do
		if string.find(text, pattern) then
			ww_ignored_lines[text][pattern] = true
			return true
		end
	end
	for _, pattern in ipairs(unweightedLines) do
		if string.find(text, pattern) then
			ww_unweighted_lines[text][pattern] = true
			return true
		end
	end
	for _, regex in ipairs(preprocessLines) do
		local pattern, replacement = unpack(regex)
		if string.find(text, pattern) then
			text = string.gsub(text, pattern, replacement)
		end
	end
	for _, pattern in ipairs(affixLines) do
		if string.find(text, pattern) then
			text = string.gsub(text, pattern, "")
		end
		if text == "" then
			break
		end
	end
	if text == "" then
		ww_ignored_lines[origText] = true
		return true
	end
	local stat = handler(text, section)
	if stat then
		return stat
	end
end

local FoodMatchLines = {
	"^use: restores .* over ",
	"^use: restores .* per seco?n?d? for ",
	"^use: restores .* every seco?n?d? for ",
	"^use: set out a %a+ feast ",
	" drunk",
	" drinker's desire ",
	" smooo+th",
}

local FoodIgnoreLines = {
	" must remain seated while %a+ing%.$",
	" usable only inside %a[%a ]+%.$",
	" %(%d+ min cooldown%)$",
	" nearby party members ",
	"can only be consumed underwater%.",
}

local FoodUnweightedLines = {
	" you will become well fed and can track ",
	" you are likely to grow in size%.",
	" discover the fortune hidden in your meal!$",
}

local FoodPreprocessLines = {
	{" of your (%a+) ", " %1 "},
	{" every seco?n?d? for ", " over "},
	{" per seco?n?d? for ", " over "},
	{", but decreases ", " and decreases "},
}

local FoodAffixes = {
	"^use: +",
	"^set out a great feast that will feed your party! +",
	"^set out a bountiful feast to feed a very hungry party%. +",
	"^restores %d+%%? %a+ over %d+ sec%. *",
	"^restores %d+%%? health and %d*%%? ?mana over %d+ sec%. *",
	"^restores %d+ %a+ over %d+ sec, but at a cost%. +",
	"^must remain seated while %a+ing%. +",
	"^if you spend at least %d+ seco?n?d?s? %a+ing you will become \"?well fed\"? and +",
	"^if you spend at least %d+ seco?n?d?s? %a+ing you will become enlightened and +",
	"^if you eat for %d+ seconds will +",
	"^gain +",
	"^also +",
	"^increases? +",
	"^your +",
	"^restores +",
	" +green means it's good!$",
	" +and gets you pretty drunk%.$",
	" +and gets you drunk to boot[%.!]$",
	" +standard alcohol%.$",
	" +strong alcohol%.$",
	" +also packs quite a kick%.%.%.$",
	" +smooo+th%.$",
	" +and increases the drinker's desire to converse%.$",
	" +for %d+ min%.?$",
	" +for %d+ hours?%.$",
}

local EquipStatsMatchLines = {
	"^equip: increases [^t].* by ",
	"^equip: increases your effective stealth level",
	"^equip: increases effective stealth level",
	"^equip: improves [^t].* by ",
	"^equip: restores ",
	"^equip: increases the block value of your shield by ",
	"^equip: [+-]?%d+ all resistances%.$",
	"^equip: [+-]?%d+ armor%.$",
}

local EquipStatsUnweightedLines = {
	" when fighting ",
	" spell power of ",
	" pet[' ]",
	" you kill a target ",
	" against ",
	" while ",
	" periodic damage done by ",
	" you use ",
}

local EquipStatsPreprocessLines = {
	{" effective stealth level%.$", " effective stealth level by 1."},
}

local EquipStatsAffixes = {
	"^equip: +",
	"^increases +",
	"^improves +",
	"^restores +",
	"^your +",
	" +does not work for players above level %d+%.$",
	"%.$",
}

local EnchantMatchLines = {
	"^use: permanently ",
	"^use: teaches you how to permanently enchant ",
	"^use: attaches ",
	"^use: enchants? ",
}

local EnchantUnweightedLines = {
	" sometimes ",
	" chance ",
	" often ",
	" damage to ",
	" occasionally ",
}

local EnchantPreprocessLines = {
	{" socket ", " prismatic socket "},
	{" and increase?i?n?g? ", " and "},
	{" and your ", " and "},
	{" melee weapon to do (%d+) additional points? of damage", " %1 melee damage"},
	{" armor value ", " armor "},
	{" a slight movement speed increase", " a minor movement speed increase"},
	{"^use: attaches a permanent scope to a bow or gun that increases its damage by ", "increases ranged weapon damage by "},
	{" resistance to (%a+) by ", " %1 resistance by "},
	{" resistance to all schools of magic by ", " all resistances by "},
	{" to all ", " all "},
}

local EnchantAffixes = {
	"^use: +",
	"^teaches you how to +",
	"^permanently +",
	"^enchants? +",
	"^attache?s? +",
	"^an? +",
	"^chain to your weapon, +",
	"^counterweight to a two%-handed sword, mace, axe or polearm increasing the wielder's +",
	"^permanent scope to a bow or gun +",
	"weapon to increase its +",
	"^spurs to your +",

	"^boots +",
	"^bracers? +",
	"^cloak +",
	"^gloves +",
	"^shield +",
	"^piece of +",
	"^chest armor +",
	"^two%-handed +",
	"^melee weapon +",
	"^weapon +",
	"^staff +",
	"^ring +",

	"^%a+ l?e?g? ?armor onto pants +",
	"^embroiders spellthread into pants, +",
	"lightweight titanium plating to a shield, +",

	"^increasing +",

	"^[st]o +",
	"^that +",
	"^they +",
	"^it +",

	"^increases? +",
	"^provides? +",
	"^adds? +",
	"^gives? +",
	"^grants? +",
	"^regenerates? +",
	"^restores? +",

	"^your +",
	"^the +",
	"^[bw]earer's +",
	" of the [bw]earer",
	"^both +",
	"^its +",

	" +%(1 sec cooldown%)$",
	" +only use?able on items level %d+ and above%.$",
	" +requires a level %d+ or higher l?e?v?e?l? ?item%.$",
	" +must be level %d+ or lower to gain this benefit%.$",
	" +wearer must be level %d+ or higher%.$",
	"[\r\n]+%a+ing [%a ]+ causes [%a ]+ to become soulbound%.$",
	"[\r\n]+can only be attached to [%a ]+ in your inventory%.$",
	" +only the enchanter's rings can be enchanted,? and enchanting a ring will cause it to become soulbound%.$",
	-- TODO: flag this somehow and handle it in scoring
	" +does not stack with other similar effects%.",

	"^eternal belt buckle onto a belt, adding a +",
	" +to the belt%.$",
	" +t?of? an item worn on the %a[%a ,]+ or %a+",
	" +on a pair of gloves",
	"additional points? of +",
	"^mana regeneration by +",

	"%.$",
}

local FishingMatchLines = {
	" fishing ",
}

local FishingPreProcessLines = {
	{" skill increased ", " "},
	{" for 10 min%. %(10 min cooldown%)$", ""},
}

local FishingAffixes = {
	"^use: +",
	"^equip: +",
	"^replaces the fishing line on your fishing pole with a %a[%a ]+%a line, increasing +",
	"^when applied to your fishing pole, increases +",
	"^makes you slightly tipsy and increases your skill in +",
	"^attach a lure to your equipped fishing pole, increasing +",
	"%.$",
	"utes$",
	" +3 min",
	" +10 min$",
	" +1 hour$",
	" +for$",
}

local UseEffectMatchLines = {
	"^use: ",
}

local UseEffectIgnoreLines = {
	"^use: heal",
	"^use: a strong alcoholic beverage",
	"^use: transform",
	"^use: a sample of ",
	"^use: a typical alcoholic beverage",
	" if they have free room ",
	"^use: a weak alcohol",
	"^use: throw into ",
	"^use: a strangely glowing alcoholic beverage",
	"^use: instantly restores ",
}

local UseEffectUnweightedLines = {
	"^[^%d]+ %(%d[%a%d ]+ cooldown%)$",
	"^use: absorbs ",
	"^use: coats a weapon with poison ",
}

local UseEffectPreprocessLines = {
	{" decreases your ", " decreases "},
	{" all magical resistances ", " all resistances "},
	{" additional ", " "},
	{" maximum health ", " health "},
	{" all attributes ", " all stats "},
}

local UseEffectAffixes = {
	"^use: +",
	"^a powerful ale that +",
	"^increases +",
	"^the target's +",
	"^the player's +",
	"^your +",
	"^restores +",
	"^gives the gift of the wild to all party and raid members, increasing +",
	" +%([14] sec cooldown%)$",
	" +only one scroll effect can be active at a time%.$",
	" +for 5 min%.$",
	" +30 mins?%.$",
	" +1 hour%.$",
	" +for$",
	" +lasts$",
	" +for all party and raid members$",
	"%.$",
}

local ElixirMatchLines = {
	" battle elixir%.",
	" guardian elixir%.",
}

local ElixirUnweightedLines = {
	" walk across water ",
	" of your spell targets ",
}

local ElixirPreprocessLines = {
	{" and your ", " and "},
	{" and restores ", " and "},
	{" and grants ", " and "},
	{" critical rating ", " critical strike rating "},
	{" maximum health ", " health "},
	{" the chance that the player will reflect hostile spells cast on them by (%d+)%% for %d+ hrs%. +will automatically reflect the first offensive spell cast against the user", " %1%% spell reflect"},
	{" goes up by ", " by "},
}

local ElixirAffixes = {
	"^use: +",
	"^increases +",
	"^your size is increased and +",
	"^your +",
	"^the player's +",
	"^mana regeneration by +",
	"^regenerate +",
	" +%(1 sec cooldown%)$",
	" +%([12] min cooldown%)$",
	" +this effect persists through death, but only works [io]n [%a ',:]+%.$",
	" +this effect only works [io]n [%a ',:]+%.$",
	"[\r\n]+only active [io]n [%a ',:]+%.$",
	" +effect persists through death%.$",
	" +this$",
	" +you can only have the effect of one flask at a time%.$",
	" +counts as both a battle and guardian elixir%.$",
	" +battle elixir%.$",
	" +guardian elixir%.$",
	" +%d+ ho?u?rs?%.$",
	" +%d+ minu?t?e?s?%.$",
	" +for$",
	" +lasts$",
	" +effect$",
	" +when consumed%.$",
	" +and size$",
	" +to match your new size%.$",
	"%.$",
}

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

local StackingEquipMatchLines = {
	"^equip: each .* stack",
}

local stackingEquipPreprocessLines = {
	{"%. +each time you ", " SPLIT "},
	{"%. +stacks ", ", stacking "},
}

local StackingEquipAffixes = {
	"^equip: each time you +",
	" t?on? an opponent,",
	" the next",
	"[%.,]",
}

local function parseStackingEquipEffectTriggers(trigger)
	local triggerPatterns = {
		{"^cast a ?(.*) spell$", "SpellCast"},
		{"^deal ?(.*) damage$", "DamageDealt"},
		{"^land a (.*) spell$", "SpellHit"},
	}

	for _, regex in ipairs(triggerPatterns) do
		local pattern, triggerType = unpack(regex)
		local start, _, triggerSubTypes = string.find(trigger, pattern)
		if start then
			local subTypes = {}
			if not triggerSubTypes then
				triggerSubTypes = ""
			end
			triggerSubTypes = triggerSubTypes:gsub(" or ", " OR ")
			local start, finish, left = string.find(triggerSubTypes, "^([^A-Z]*) OR ")
			while start do
				table.insert(subTypes, left)
				triggerSubTypes = triggerSubTypes:sub(finish + 1)
				start, finish, left = string.find(triggerSubTypes, "^([^A-Z]*) OR ")
			end
			table.insert(subTypes, triggerSubTypes)
			local triggers = {}
			for _, subType in ipairs(subTypes) do
				local trigger = triggerType
				if subType == "" then
					trigger = trigger:sub(1, 1):lower() .. trigger:sub(2)
				end
				for _, group in ipairs(ww_triggerGroups[subType .. trigger]) do
					triggers[group] = true
				end
			end

			return triggers
		end
	end
end

local function parseStackingEquipEffect(text, section)
	local start, _, trigger, stat, duration, numStacks = string.find(text, "^(.*) you gain (.*) for (.*) stacking up to (%d+) times$")
	if not start then
		return
	end

	triggers = parseStackingEquipEffectTriggers(trigger)
	if not triggers then
		return
	end

	stat = WeightsWatcher.singleStat(stat, section)
	if not stat or not stat.stats then
		return
	end
	local amount
	for name, value in pairs(stat.stats) do
		stat = name
		amount = value
	end

	duration = WeightsWatcher.convertToSeconds(duration)
	if not duration then
		return
	end

	return {
		triggers = triggers,
		stat = stat,
		value = amount,
		duration = duration,
		numStacks = tonumber(numStacks),
	}
end

local function parseStackingEquipEffects(text, section)
	local lines = {}
	local start, finish, left = string.find(text, "^([^A-Z]*) SPLIT ")
	while start do
		table.insert(lines, left)
		text = text:sub(finish + 1)
		start, finish, left = string.find(text, "^([^A-Z]*) SPLIT ")
	end
	table.insert(lines, text)

	local stats = {}

	for _, line in pairs(lines) do
		local stat = parseStackingEquipEffect(line, section)
		if not stat then
			return
		end
		table.insert(stats, stat)
	end

	return {stackingEquipEffects = stats}
end

local function parseStats(text, section)
	for _, regex in ipairs(ww_regexes[section].MultipleStat) do
		local pattern, func = unpack(regex)
		if string.find(text, pattern) then
			local stats = func(text, pattern, section)
			if stats then
				return {stats = stats}
			end
		end
	end
	return WeightsWatcher.singleStat(text, section)
end

local function parseSocketBonusStat(text, section)
	local stats = WeightsWatcher.singleStat(text, section)
	return {socketBonusStat = stats.stats}
end

ww_EffectHandlers = {
	{EquipStatsMatchLines, {}, EquipStatsUnweightedLines, EquipStatsPreprocessLines, EquipStatsAffixes, parseStats, "equipEffect"},
	{{" socket$"}, {}, {}, {}, {" socket$"}, function(text) return {socket = text} end, "socket"},
	{{"^[^:]+$"}, {}, {}, {}, {}, parseStats, "generic"},
	{{"^socket bonus: "}, {}, {}, {}, {"^socket bonus: "}, parseSocketBonusStat, "socketBonus"},
	{FoodMatchLines, FoodIgnoreLines, FoodUnweightedLines, FoodPreprocessLines, FoodAffixes, parseStats, "food"},
	{EnchantMatchLines, {}, EnchantUnweightedLines, EnchantPreprocessLines, EnchantAffixes, parseStats, "enchant"},
	{ElixirMatchLines, {}, ElixirUnweightedLines, ElixirPreprocessLines, ElixirAffixes, parseStats, "elixir"},
	{FishingMatchLines, {}, {}, FishingPreProcessLines, FishingAffixes, parseStats, "fishing"},
	{UseEffectMatchLines, UseEffectIgnoreLines, UseEffectUnweightedLines, UseEffectPreprocessLines, UseEffectAffixes, parseStats, "useEffect"},
	{CooldownUseMatchLines, {}, {}, CooldownUsePreprocessLines, CooldownUseAffixes, function(text) local stat = WeightsWatcher.useEffect(text) if stat then return {useEffect = stat} end end, "cooldownUseEffect"},
	{StackingEquipMatchLines, {}, {}, stackingEquipPreprocessLines, StackingEquipAffixes, parseStackingEquipEffects, "stackingEquipEffect"},
}

function WeightsWatcher.twoStats(text, pattern, section)
	local start, _, stat1, stat2 = string.find(text, pattern)
	if start then
		stat1 = WeightsWatcher.singleStat(stat1, section)
		stat2 = WeightsWatcher.singleStat(stat2, section)
		if stat1 and stat2 then
			return stat1.stats + stat2.stats
		end
	end
end

function WeightsWatcher.multipleStatsOneNumber(text, pattern, section)
	local start, _, value, stat1, stat2 = string.find(text, pattern)
	if start then
		stat1 = WeightsWatcher.singleStat(value .. stat1, section)
		stat2 = WeightsWatcher.singleStat(value .. stat2, section)
		if stat1 and stat2 then
			return stat1.stats + stat2.stats
		end
	end
end

function WeightsWatcher.damageRange(textL, textR)
	local stats
	local start, _, minimum, maximum = string.find(textL, "^%+?(%d+) %- (%d+) %a* ?damage$")
	if start then
		stats = WeightsWatcher.newStatTable()
		maximum = tonumber(maximum)
		stats["average melee weapon damage"] = (minimum + maximum) / 2
		stats["maximum melee weapon damage"] = maximum
	else
		local start, _, damage = string.find(textL, "^(%d+) damage$")
		if start then
			stats = WeightsWatcher.newStatTable()
			damage = tonumber(damage)
			stats["average melee weapon damage"] = damage
			stats["maximum melee weapon damage"] = damage
		end
	end
	if stats and textR then
		local start, _, speed = string.find(textR, "^speed (%d+%.?%d*)$")
		if start then
			stats["melee weapon speed"] = tonumber(speed)
		end
	end
	return stats
end

function WeightsWatcher.singleStat(text, section)
	for _, regex in ipairs(ww_regexes[section].SingleStat) do
		local pattern, func = unpack(regex)
		if string.find(text, pattern) then
			local stat = func(text, pattern, section)
			if stat then
				return {stats = stat}
			end
		end
	end
end

function WeightsWatcher.singleStatValueOnly(text, pattern, name)
	local start, _, value = string.find(text, pattern)
	if start then
		return WeightsWatcher.newStatTable({[name] = tonumber(value)})
	end
end

function WeightsWatcher.statNumFirst(text, pattern)
	local start, _, value, name = string.find(text, pattern)
	if start then
		return WeightsWatcher.newStatTable({[name] = tonumber(value)})
	end
end

function WeightsWatcher.statNameFirst(text, pattern)
	local start, _, name, value = string.find(text, pattern)
	if start then
		return WeightsWatcher.newStatTable({[name] = tonumber(value)})
	end
end

function WeightsWatcher.newStatTable(tbl)
	return setmetatable(tbl or {}, ww_normalStatsMetatable)
end

function WeightsWatcher.convertToSeconds(duration)
	local start, _, hours = string.find(duration, "^(%d+) ho?u?rs?$")
	if start then
		return hours * 3600
	end
	local start, _, minutes, seconds = string.find(duration, "^(%d+) minu?t?e?s? (%d+) seco?n?d?s?$")
	if start then
		return minutes * 60 + seconds
	end
	local start, _, minutes = string.find(duration, "^(%d+) minu?t?e?s?$")
	if start then
		return minutes * 60
	end
	local start, _, seconds = string.find(duration, "^(%d+) seco?n?d?s?$")
	if start then
		return tonumber(seconds)
	end
end

function WeightsWatcher.useEffect(text)
	local start, _, stat, value, duration, cooldown = string.find(text, "^(%a+ ?%a+ ?%a+ ?%a+) by ([+-]?%d+) for (%d+ %a+ ?%d* ?%a*)%. +%((%d+ %a+ ?%d* ?%a*) cooldown%)$")
	if not start then
		start, _, value, stat, duration, cooldown = string.find(text, "^([+-]?%d+) (%a+ ?%a+ ?%a+ ?%a+) for (%d+ %a+ ?%d* ?%a*)%. +%((%d+ %a+ ?%d* ?%a*) cooldown%)$")
	end
	if start then
		cooldown = WeightsWatcher.convertToSeconds(cooldown)
		duration = WeightsWatcher.convertToSeconds(duration)
		return {
			stat = stat,
			value = value,
			duration = duration,
			cooldown = cooldown,
		}
	end
end

ww_Preprocess = {
	{"|c[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]([^|]+)|r", "%1"},
	{" +$", ""},
}

ww_ignoredInvalidStats = {
	"item level",
	"requires level",
	"all stats",
	"all resistances",
}

ww_IgnoredLines = {
	"^$",
	-- Reputation and materials requirements
	"^requires ",
	"^  [^ ]",
	"^%a[%a' -]+ %(%d/%d%)$",
	"^classes: ",
	"^\n",
	"^\".+\"$",
	"^races: ",
	"^duration: ",
	"^conjured item$",
	"^use: right click to ",
	"^this item begins a quest$",
	"^already known$",
	-- Zone names
	"^alterac valley$",
	"^black temple$",
	"^blackrock depths$",
	"^blade's edge mountains$",
	"^isle of conquest$",
	"^karazhan$",
	"^shadowmoon valley",
	"^strand of the ancients$",
	"^tempest keep$",
	"^the battle for mount hyjal$",
	"^the black morass$",
	"^the oculus$",
	"^wintergrasp$",
	"^zul'aman$",
}

ww_TempIgnoredLines = {
	"^item level %d+$",
	"^use: restores %d+ to %d+ %a+",
	"^use: teaches .* %(rank %d+%)%.$",
	"^%d+ slot ",
	"^use: heals %d+ damage over %d+ sec%.$",
	-- Profession patterns
	"^use: teaches you how to make ",
	"^use: teaches you how to cut ",
	"^use: teaches you how to craft ",
	"^use: teaches you how to sew ",
	"^use: teaches you how to cook ",
	"^use: teaches you how to forge ",
	"^use: teaches you how to transmute ",
	"^use: teaches you how to create ",
	"^use: teaches you how to bake ",
	"^use: teaches you how to be ",
	"^use: teaches you how to summon ",
	"^use: teaches you how to brew ",
	"^use: teaches you how to inscribe ",
	"^use: teaches you how to ride ",
	"^use: teaches you how to burn ",
	"^use: teaches you how to deep fry ",
	"^use: teaches you how to purify ",
	"^use: teaches you how to shatter ",
	"^use: teaches you how to smelt ",
	"^use: teaches you how to turn ",
}

ww_UnweightedLines = {
	"^%(%d%) set: ",
	"^set: ", -- In-game only?
	-- Some relics that boost stats for certain abilities only
	"^equip: increases the %a[%a ]+ of your %a[%a ]+ by ",
	-- Use effects that have a cooldown
	"cooldown",
	"chance t?on? ",
	"^use: .*enchants? ",
	"^equip: you",
	"^equip: causes your ",
}

ww_MultipleStatLines = {
	{"^([^,]+) and ([^,]+)$", WeightsWatcher.twoStats, {"elixir", "enchant", "food", "generic", "useEffect"}},
	{"^([+-]?%d+ )(%a[%a ]+%a) and (%a[%a ]+%a)$", WeightsWatcher.multipleStatsOneNumber, {"elixir", "food"}},
	{"^([%a%d][%a%d ]+[%a%d]), ([%a%d][%a%d ]+[%a%d]),? and ([%a%d][%a%d ]+[%a%d])$",
		function(text, pattern, section)
			local start, _, stat1, stat2, stat3 = string.find(text, pattern)
			if start then
				stat1 = WeightsWatcher.singleStat(stat1, section)
				stat2 = WeightsWatcher.singleStat(stat2, section)
				stat3 = WeightsWatcher.singleStat(stat3, section)
				if stat1 and stat2 and stat3 then
					return stat1.stats + stat2.stats + stat3.stats
				end
			end
		end,
		{"elixir", "food", "useEffect"},
	},
	-- used by some enchants
	{"^(%a[%a ]+ rating )and (%a[%a ]+ rating )by( %d+)$",
		function(text, pattern, section)
			local start, _, stat1, stat2, value = string.find(text, pattern)
			if start then
				stat1 = WeightsWatcher.singleStat(stat1 .. "by" .. value, section)
				stat2 = WeightsWatcher.singleStat(stat2 .. "by" .. value, section)
				if stat1 and stat2 then
					return stat1.stats + stat2.stats
				else
					ww_unparsed_lines[text][pattern].parsedTo = {stat1, stat2}
				end
			end
		end,
		{"enchant"},
	},
	{"^(%a[%a ]+ )and (%a[%a ]+ )rating by( %d+)$",
		function(text, pattern, section)
			local start, _, stat1, stat2, value = string.find(text, pattern)
			if start then
				stat1 = WeightsWatcher.singleStat(stat1 .. "rating by" .. value, section)
				stat2 = WeightsWatcher.singleStat(stat2 .. "rating by" .. value, section)
				if stat1 and stat2 then
					return stat1.stats + stat2.stats
				else
					ww_unparsed_lines[text][pattern].parsedTo = {stat1, stat2}
				end
			end
		end,
		{"enchant"},
	},
	{"^(%a+), (%a+),? and (%a+) spell power by (%d+)$",
		function(text, pattern)
			local start, _, stat1, stat2, stat3, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[stat1 .. " spell damage"] = value
				stats[stat2 .. " spell damage"] = value
				stats[stat3 .. " spell damage"] = value
				return stats
			end
		end,
		{"elixir"},
	},
	{"^spell damage caused by (%a+), (%a+),? and (%a+) spells by up to (%d+)$",
		function(text, pattern)
			local start, _, stat1, stat2, stat3, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[stat1 .. " spell damage"] = value
				stats[stat2 .. " spell damage"] = value
				stats[stat3 .. " spell damage"] = value
				return stats
			end
		end,
		{"elixir"},
	},
	{"^(%a+) and (%a+) spell power by (%d+)$",
		function(text, pattern)
			local start, _, stat1, stat2, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[stat1 .. " spell damage"] = value
				stats[stat2 .. " spell damage"] = value
				return stats
			end
		end,
		{"enchant"},
	},
	{"^([+-]?%d+) mana and health every 5 seco?n?d?s?$",
		function(text, pattern)
			local start, _, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats["mp5"] = value
				stats["hp5"] = value
				return stats
			end
		end,
		{"enchant"},
	},
	{"^([+-]?%d+) health and mana every 5 seco?n?d?s?$",
		function(text, pattern)
			local start, _, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats["mp5"] = value
				stats["hp5"] = value
				return stats
			end
		end,
		{"enchant"},
	},
	-- Convert this and following to re-use the parser?
	-- item 10779
	{"(%a[%a ]+) by (%d+), (%a[%a ]+) by (%d+),? and your normal health regeneration by (%d+)",
		function(text, pattern)
			local start, _, stat1, val1, stat2, val2, val3 = string.find(text, pattern)
			if start then
				local stats = WeightsWatcher.newStatTable()
				stats[stat1] = tonumber(val1)
				stats[stat2] = tonumber(val2)
				stats["hp5"] = tonumber(val3)
				return stats
			end
		end,
		{"equipEffect"},
	},
	{"^(%a+), (%a+), and (%a+) by (%d+)$",
		function(text, pattern)
			local start, _, stat1, stat2, stat3, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[stat1] = value
				stats[stat2] = value
				stats[stat3] = value
				return stats
			end
		end,
		{"enchant"},
	},
	-- currently used only by items 31864 and 31872
	{"^([^,]+) & ([^,]+)$", WeightsWatcher.twoStats, {"generic"}},
	-- currently only used by item 28363
	{"^([^,]+), ([^,]+)$", WeightsWatcher.twoStats, {"generic"}},
	{"^chance to resist (%a+) and (%a+) effects by (%d+)%%$",
		function(text, pattern)
			local start, _, effect1, effect2, value = string.find(text, pattern)
			if start then
				value = tonumber(value)
				local stats = WeightsWatcher.newStatTable()
				stats[effect1 .. " resist chance (percent)"] = value
				stats[effect2 .. " resist chance (percent)"] = value
				return stats
			end
		end,
		{"equipEffect"},
	},
}

ww_SingleStatLines = {
	{"^([+-]?%d+) (armor)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "equipEffect", "generic", "useEffect"}},
	{"^([+-]?%d+) (agility)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "food", "generic", "socketBonus", "useEffect"}},
	{"^([+-]?%d+) (intellect)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "food", "generic", "socketBonus", "useEffect"}},
	{"^([+-]?%d+) (spirit)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (stamina)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "food", "generic", "socketBonus", "useEffect"}},
	{"^([+-]?%d+) (strength)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "food", "generic", "socketBonus", "useEffect"}},


	{"^the (block value) of your shield by (%d+)$", WeightsWatcher.statNameFirst, {"equipEffect"}},
	{"^shield (block rating) by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"equipEffect"}},
	{"^(all stats) are reduced by (%d+)$",
		function(text, pattern)
			local start, _, name, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[name] = -tonumber(value)})
			end
		end,
		{"food"},
	},
	{"^reduces (%a[%a ]+) by (%d+)$",
		function(text, pattern)
			local start, _, name, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[name] = -tonumber(value)})
			end
		end,
		{"food"},
	},
	{"^resistance to all schools of magic by ([+-]?%d+)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "all resistances")
		end,
		{"elixir"},
	},
	{"^(%a+ spell )power by ([+-]?%d+)$",
		function(text, pattern)
			local start, _, name, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[name .. "damage"] = tonumber(value)})
			end
		end,
		{"elixir", "enchant"},
	},
	{"^resilience by ([+-]?%d+)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "resilience rating")
		end,
		{"enchant"},
	},
	{"^mounted movement speed by ([+-]?%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mount speed (percent)")
		end,
		{"enchant"},
	},
	{"^mount speed by ([+-]?%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mount speed (percent)")
		end,
		{"enchant", "equipEffect"},
	},
	{"^([+-]?%d+) additional (armor)$", WeightsWatcher.statNumFirst, {"enchant"}},
	{"^stealth$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["increased stealth"] = 1})
		end,
		{"enchant"},
	},
	{"^stealth slightly$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["increased stealth"] = 1})
		end,
		{"enchant"},
	},
	{"^effective stealth level by (%d+)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "increased stealth")
		end,
		{"equipEffect"},
	},
	{"^threat from all attacks and spells by (%d+)%%$",
		function(text, pattern)
			local start, _, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({["threat (percent)"] = value})
			end
		end,
		{"enchant"},
	},
	{"^threat caused by (%d+)%%$",
		function(text, pattern)
			local start, _, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({["threat (percent)"] = value})
			end
		end,
		{"enchant"},
	},
	{"^decrease threat from all attacks and spells by (%d+)%%$",
		function(text, pattern)
			local start, _, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({["threat reduction (percent)"] = value})
			end
		end,
		{"enchant"},
	},
	{"^([+-]?%d+) additional (block value)$", WeightsWatcher.statNumFirst, {"enchant"}},
	{"^reducing the duration of disarm effects by ([+-]?%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "disarm duration reduction (percent)")
		end,
		{"enchant"},
	},
	{"^prismatic socket$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"enchant"},
	},

	-- profession skills
	{"^(fishing) skill by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant", "fishing"}},
	{"^(fishing) by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"elixir", "enchant", "equipEffect", "fishing", "food", "generic", "socketBonus", "useEffect"}},
	{"^(herbalism) skill by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant"}},
	{"^(mining) skill by ([+-]?%d+)$", WeightsWatcher.statNameFirst, {"enchant"}},
	{"^(skinning) skill by (%d+)$", WeightsWatcher.statNameFirst, {"enchant"}},

	{"^reduces? (%a[%a ]+) by (%d+)$",
		function(text, pattern, section)
			local start, _, name, value = string.find(text, pattern)
			if start then
				local stats = parseStats("-" .. value .. " " .. name, section)
				if stats then
					return stats.stats
				end
			end
		end,
		{"food", "useEffect"},
	},
	{"^decreases? (%a[%a ]+) by (%d+)$",
		function(text, pattern, section)
			local start, _, name, value = string.find(text, pattern)
			if start then
				local stats = parseStats("-" .. value .. " " .. name, section)
				if stats then
					return stats.stats
				end
			end
		end,
		{"elixir", "food", "useEffect"},
	},
	-- Tends to eat other stats if not last
	-- TODO: split this into a separate function instead of recursing?
	{"^(%a+ ?%a+ ?%a+ ?%a+) by (%d+)$",
		function(text, pattern, section)
			local start, _, name, value = string.find(text, pattern)
			if start then
				local stats = parseStats(value .. " " .. name, section)
				if stats then
					return stats.stats
				end
			end
		end,
		{"elixir", "enchant", "equipEffect", "food", "useEffect"},
	},

	{"^a minor movement speed increase$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["minor run speed"] = 1})
		end,
		{"enchant"},
	},
	{"^reduce threat slightly$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["threat reduction (percent)"] = 2})
		end,
		{"generic"},
	},

	{"^%((%d+%.?%d*) damage per second%)$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "melee dps")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) mana %a+ 5 seco?n?d?s?%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mp5")
		end,
		{"elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect"},
	},
	{"^([+-]?%d+) (%a[%a ]+ rating)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "useEffect"}},
	{"^([+-]?%d+) (attack power)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (spell power)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "equipEffect", "food", "generic", "socketBonus", "stackingEquipEffect", "useEffect"}},
	{"^([+-]?%d+) (%a+ resistance)$", WeightsWatcher.statNumFirst, {"enchant", "generic", "useEffect"}},
	{"^([+-]?%d+) (all resistances)$", WeightsWatcher.statNumFirst, {"enchant", "equipEffect", "useEffect"}},
	{"^([+-]?%d+) resist all$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "all resistances")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) resistance to all schools of magic$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "all resistances")
		end,
		{"food"},
	},
	{"^(%d+) block$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "block value")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) (block value)$", WeightsWatcher.statNumFirst, {"enchant", "socketBonus"}},
	{"^([+-]?%d+) health %a+ 5 seco?n?d?s?%.?$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "hp5")
		end,
		{"elixir", "equipEffect", "food", "generic", "useEffect"},
	},
	{"^([+-]?%d+) (spell penetration)$", WeightsWatcher.statNumFirst, {"enchant", "equipEffect", "generic"}},
	{"^adds (%d[%d%.]*) damage per second$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "melee dps")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) (ranged attack power)$", WeightsWatcher.statNumFirst, {"equipEffect", "generic"}},
	{"^([+-]?%d+) (all stats)$", WeightsWatcher.statNumFirst, {"elixir", "enchant", "generic", "useEffect"}},
	{"^([+-]?%d+) to (all stats)$", WeightsWatcher.statNumFirst, {"generic"}},
	{"^([+-]?%d+) ranged weapon damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "average ranged weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "maximum ranged weapon damage")
		end,
		{"enchant"},
	},

	{"^chance to resist (%a+) effects by (%d+)%%$",
		function(text, pattern)
			local start, _, effect, value = string.find(text, pattern)
			if start then
				return WeightsWatcher.newStatTable({[effect .. " resist chance (percent)"] = tonumber(value)})
			end
		end,
		{"equipEffect"},
	},

	-- random suffix enchants
	{"^([+-]?%d+) (%a+ spell damage)$", WeightsWatcher.statNumFirst, {"generic"}},
	-- Used only for random enchant id 1470
	{"^([+-]?%d+) resist shadow$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "shadow resistance")
		end,
		{"generic"},
	},
	-- currently only used by random enchant id -55 (of the Nightmare)
	{"^([+-]?%d+) shadow damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "shadow spell damage")
		end,
		{"generic"},
	},

	-- druid only
	{"^increases attack power by (%d+) in cat, bear, dire bear, and moonkin forms only%.$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "feral attack power")
		end,
		{"generic"},
	},

	-- meta effects
	{"^(%d+)%% increased armor value from items$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "armor from items (percent)")
		end,
		{"generic"},
	},
	{"^([+-]?%d+)%% shield block value$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "block value (percent)")
		end,
		{"generic"},
	},
	{"^chance to increase melee/ranged attack speed$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["chance to increase physical haste"] = 1})
		end,
		{"generic"},
	},
	{"^chance to increase spell cast speed$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["chance to increase spell haste"] = 1})
		end,
		{"generic"},
	},
	{"^chance to restore health on hit$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^chance to restore mana on spellcast$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^chance to stun target$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^(%d+)%% increased critical damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "critical damage (percent)")
		end,
		{"generic"},
	},
	{"^(%d+)%% increased critical healing effect$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "critical healing (percent)")
		end,
		{"generic"},
	},
	{"^fear duration reduced by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "fear duration reduction (percent)")
		end,
		{"generic"},
	},
	{"^([+-]?%d+)%% intellect$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "intellect (percent)")
		end,
		{"generic"},
	},
	{"^([+-]?%d+)%% mana$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "mana (percent)")
		end,
		{"generic"},
	},
	{"^([+-]?%d+) melee damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "average melee weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "maximum melee weapon damage")
		end,
		{"enchant", "generic"},
	},
	{"^([+-]?%d+) physical damage$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "average melee weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "maximum melee weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "average ranged weapon damage") + WeightsWatcher.singleStatValueOnly(text, pattern, "maximum ranged weapon damage")
		end,
		{"enchant"},
	},
	{"^minor run speed increase$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({["minor run speed"] = 1})
		end,
		{"generic"},
	},
	{"^silence duration reduced by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "silence duration reduction (percent)")
		end,
		{"generic"},
	},
	{"^reduces snare/root duration by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "snare/root duration reduction (percent)")
		end,
		{"generic"},
	},
	{"^sometimes heal on your crits$",
		function(text, pattern)
			return WeightsWatcher.newStatTable({[text] = 1})
		end,
		{"generic"},
	},
	{"^reduce spell damage taken by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "spell damage taken reduction (percent)")
		end,
		{"generic"},
	},
	{"^(%d+)%% spell reflect$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "spell reflect (percent)")
		end,
		{"elixir", "generic"},
	},
	{"^stun duration reduced by (%d+)%%$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "stun duration reduction (percent)")
		end,
		{"generic"},
	},
	{"^(%d+)%% stun resistance$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "stun resist chance (percent)")
		end,
		{"generic"},
	},
	{"^(%d+)%% reduced threat$",
		function(text, pattern)
			return WeightsWatcher.singleStatValueOnly(text, pattern, "threat reduction (percent)")
		end,
		{"generic"},
	},
}

ww_ItemInfoLines = {
	"^binds ",
	"^unique",
	"^soulbound$",
	"^heroic$",
	"^quest item$",
}

ww_DoubleSlotLines = {
	"^head$",
	"^shoulder$",
	"^chest$",
	"^wrist$",
	"^hands$",
	"^waist$",
	"^legs$",
	"^feet$",
	"^two%-hand$",
	"^one%-hand$",
	"^main hand$",
	"^off hand$",
	"^ranged$",
	"^relic$",
	"^thrown$",
	"^projectile$",
}

ww_SingleSlotLines = {
	"^finger$",
	"^back$",
	"^neck$",
	"^trinket$",
	"^held in off%-hand$",
	"^shirt$",
	"^tabard$",
}
