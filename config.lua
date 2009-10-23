if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

function commandHandler(msg)
	open_config()
end

--display or hide the frame
function open_config()
	if wwConfig:IsVisible() then
		wwConfig:Hide()
	else
		wwConfig:Show()
	end
end

function configClassSelect(classType)
	for name, _ in pairs(ww_vars.weightsList[classType]) do
		addWeightScale(name)
	end
end

function addWeightScale(name)
	print(name)
end

defaultVars = {
	dataMajorVersion = 0,
	dataMinorVersion = 1,
	weightsList = {
		["ROGUE"] = {
			["Default"] = {
				["Attack Power"] = 100,
			},
		},
		["PRIEST"] = {
			["Default"] = {
				["Spell Power"] = 100,
				["Intellect"] = 65,
			},
			["Default2"] = {
				["Spell Power"] = 100,
				["Intellect"] = 50,
			},
		},
		["MAGE"] = {
			["Default"] = {
				["Critical Strike Rating"] = 90,
			},
		},
		["WARLOCK"] = {
			["Default"] = {
				["Haste"] = 80,
			},
		},
		["HUNTER"] = {
			["Default"] = {
				["Agility"] = 100,
			},
		},
		["WARRIOR"] = {
			["Default"] = {
				["Hit Rating"] = 75,
			},
		},
		["DRUID"] = {
			["Default"] = {
				["Agility"] = 100,
			},
		},
		["SHAMAN"] = {
			["Default"] = {
				["Agility"] = 80,
			},
		},
		["DEATHKNIGHT"] = {
			["Default"] = {
				["Strength"] = 75,
			},
		},
		["PALADIN"] = {
			["Default"] = {
				["Strength"] = 80,
			},
		},
	},
}

defaultCharVars = {
	dataMajorVersion = 0,
	dataMinorVersion = 1,
	activeWeights = {},
}
