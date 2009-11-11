if not WeightsWatcher then
	WeightsWatcher = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.1")
end

function commandHandler(msg)
	if msg == "config" then
		if ww_config:IsVisible() then
			ww_config:Hide()
		else
			ww_config:Show()
		end
	elseif msg == "weights" then
		if ww_weights:IsVisible() then
			ww_weights:Hide()
		else
			ww_weights:Show()
		end
	elseif msg == "version" then
		print("WeightsWatcher version: 1.0a1")
		print("  Account data version: " .. ww_vars.dataMajorVersion .. "." .. ww_vars.dataMinorVersion)
		print("  Character data version: " .. ww_charVars.dataMajorVersion .. "." .. ww_charVars.dataMinorVersion)
	else
		printHelp()
	end
end

function printHelp()
	print("WeightsWatcher help:")
	print("Type /weightswatcher <arg> (or /ww <arg>)")
	print("  config      opens the main configuration window")
	print("  weights   opens the weights configuration window")
	print("  version    displays version information")
	print("  help         displays this message")
end
