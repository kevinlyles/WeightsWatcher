local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

ww_dropdownOptions = {
	["Always"] = "Always",
	["Other Classes"] = "Other Classes",
	["Never"] = "Never",
	["Shift"] = "Shift",
	["Control"] = "Control",
	["Alt"] = "Alt",
	["Left Shift"] = "Left Shift",
	["Right Shift"] = "Right Shift",
	["Left Control"] = "Left Control",
	["Right Control"] = "Right Control",
	["Left Alt"] = "Left Alt",
	["Right Alt"] = "Right Alt",
}
