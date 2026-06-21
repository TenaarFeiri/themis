-- Req management
local error = _G.GLOBALS.error

local requires = {
    db = {
        main = require("database.main"),
        crud = require("database.crud"),
        find = require("database.search"),
    },
    http = {
        client = require("http.client"),
        server = require("http.server"),
    }
}
local funcs = {}

function funcs.load(category, module)
    if not requires[category] then
        return nil
    end
    if not requires[category][module] then
        return nil
    end
    return requires[category][module]
end

return funcs