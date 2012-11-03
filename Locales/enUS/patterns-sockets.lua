if GetLocale() ~= "enUS" then
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
