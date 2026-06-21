-- Centralised error handler.
local funcs = {}

local ERROR_STRINGS = {
    INVALID_REQUEST = "Invalid request",
    NOT_FOUND = "Not found",
    SERVER_ERROR = "Server error"
}

function funcs.test()
    ngx.say("test")
end

return funcs