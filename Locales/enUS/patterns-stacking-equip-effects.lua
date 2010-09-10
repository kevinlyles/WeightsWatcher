if GetLocale() ~= "enUS" then
	return
end

ww_triggerDisplayNames = {
	["meleeDamage"] = "Melee damage dealt",
	["rangedDamage"] = "Ranged damage dealt",
	["harmfulSpell"] = "Harmful spell cast",
	["helpfulSpell"] = "Helpful spell cast",
}

local triggerGroups = {
	["meleeDamageDealt"] = {"meleeDamage"},
	["rangedDamageDealt"] = {"rangedDamage"},
	["spellDamageDealt"] = {"harmfulSpell"},
	["damagingSpellCast"] = {"harmfulSpell"},
	["harmfulSpellHit"] = {"harmfulSpell"},
	["spellCast"] = {"harmfulSpell", "helpfulSpell"},
	["healingSpellCast"] = {"helpfulSpell"},
	["helpfulSpellCast"] = {"helpfulSpell"},
}

local StackingEquipMatchLines = {
	"^equip: each .* stack",
	"^equip: your spells grant .* stack",
}

local stackingEquipPreprocessLines = {
	{"%. +each time you ", " SPLIT "},
	{"%. +stacks ", ", stacking "},
	{" your spells grant ", " each time you cast a spell you gain "},
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
				for _, group in ipairs(triggerGroups[subType .. trigger]) do
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

	local triggers = parseStackingEquipEffectTriggers(trigger)
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

ww_stackingEquipEffects = {StackingEquipMatchLines, {}, {}, stackingEquipPreprocessLines, StackingEquipAffixes, parseStackingEquipEffects, "stackingEquipEffect"}
