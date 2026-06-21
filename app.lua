ngx.header.content_type = "text/plain"

local function custom_loader(module_name)
    local path = module_name:gsub("%.", "/") .. ".lua"
    local file = io.open("src/" .. path, "r")
    
    if file then
        local content = file:read("*a")
        file:close()
        return loadstring(content, "@" .. path)
    end
    
    return nil, "module '" .. module_name .. "' not found"
end
 
table.insert(package.loaders or package.searchers, 2, custom_loader)
 
package.path = package.path .. ";src/?.lua"

-- Hold globals, like important strings
-- Stuff we're fine with exposing.
_G.GLOBALS = {
    error = require("utils.error"), -- Error handling is global
}
local error = _G.GLOBALS.error

local req = require("utils.requires") -- Manage loading of modules.
local http = req.load("http", "server")
