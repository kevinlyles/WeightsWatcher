local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then
	return
end

local function sockets(text)
	return {socket = text}
end

local matchLines = {
	" socket$",
	"^sha%-touched$",
}

ww_sockets = {matchLines, {}, {}, {}, {" socket$"}, sockets, "socket"}
