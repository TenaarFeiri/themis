-- Req management
local error = _G.GLOBALS.error

local module_paths = {
    db = {
        main = "database.main",
        crud = "database.crud",
        find = "database.search",
    },
    http = {
        client = "http.client",
        server = "http.server",
    }
}
local funcs = {}

function funcs.load(category, module)
    if not module_paths[category] or not module_paths[category][module] then
        return nil
    end
    return require(module_paths[category][module])
end

return funcs