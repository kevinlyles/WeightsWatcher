if GetLocale() ~= "enUS" then
	return
end

local L = ww_localization

-- Strings in config.lua
L["WW_VERSION"] = "WeightsWatcher version: %s"
L["ACCT_VERSION"] = "  Account data version: %d%s%d"
L["CHAR_VERSION"] = "  Character data version: %d%s%d"
L["HELP_TEXT_HEADER"] = "WeightsWatcher help:"
L["HELP_TEXT_GENERAL"] = "Type /weightswatcher <arg> (or /ww <arg>)"
L["HELP_TEXT_CONFIG"] = "  config      opens the main configuration window"
L["HELP_TEXT_WEIGHTS"] = "  weights   opens the weights configuration window"
L["HELP_TEXT_VERSION"] = "  version    displays version information"
L["HELP_TEXT_HELP"] = "  help         displays this message"
L["config"] = "config"
L["version"] = "version"
L["weights"] = "weights"
L["DECIMAL_SEPARATOR"] = "."
