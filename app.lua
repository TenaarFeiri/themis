ngx.header.content_type = "text/plain"
_G.GLOBALS = {
    error = require("utils.error"), -- Global error handler.
}
local error = _G.GLOBALS.error -- localise
local req = require("utils.requires") -- Manage loading of modules.
local http = req.load("http", "server")

error.test()