ngx.header.content_type = "text/plain"

-- Hold globals, like important strings
-- Stuff we're fine with exposing.
_G.GLOBALS = {
    error = require("utils.error"), -- Error handling is global
}
local error = _G.GLOBALS.error

local req = require("utils.requires") -- Manage loading of modules.
local http = req.load("http", "server")

error.test()