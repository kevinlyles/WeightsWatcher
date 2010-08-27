if GetLocale() ~= "enUS" then
	return
end

local function sockets(text)
	return {socket = text}
end

ww_sockets = {{" socket$"}, {}, {}, {}, {" socket$"}, sockets, "socket"}
