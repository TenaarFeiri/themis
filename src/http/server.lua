-- Handle server params like GET, POST, etc.
local error = _G.GLOBALS.error
local funcs = {}

----------------------------
-- Helper functions
----------------------------
local function mergeTables(get, post)
    local result = {
        GET = get,
        POST = post
    }
    return result
end
----------------------------
-- Public functions
----------------------------

function funcs.isAllowedMethod()
    local method = ngx.req.get_method()
    if method ~= "POST" and method ~= "GET" then
        return false
    end
    return true
end

function funcs.getMethod()
    return ngx.req.get_method()
end

function funcs.getData()
    if not funcs.isAllowedMethod() then
        return nil
    end
    local method = funcs.getMethod()
    local getData = ngx.req.get_uri_args() -- Get any GET data if available.
    local postData = {}

    if method == "POST" then
        ngx.req.read_body()
        postData = ngx.req.get_post_args()
    end

    return mergeTables(getData, postData)
end

return funcs