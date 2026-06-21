ngx.header.content_type = "text/plain"
package.path = package.path .. ";src/?.lua"
local pg = require("resty.postgres")

-- Hold globals, like important strings
-- Stuff we're fine with exposing.
_G.GLOBALS = {}

local allowedCalls = {
    ["test"] = true,
    ["login"] = true,
    ["loadCharacter"] = true,
    ["saveCharacter"] = true,
}

local function main()
    local method = ngx.req.get_method()
    if method ~= "POST" and method ~= "GET" then
        ngx.status = 405
        ngx.say("Method not allowed")
        return
    end
    ngx.say("Main")
end

main()
