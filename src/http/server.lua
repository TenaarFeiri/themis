-- Handle server params like GET, POST, etc.
local error = _G.GLOBALS.error
local server = {}

----------------------------
-- Helper functions
----------------------------
local function merge_tables(get, post)
    local result = {
        GET = get,
        POST = post
    }
    return result
end
----------------------------
-- Public functions
----------------------------

function server.is_allowed_method()
    local method = ngx.req.get_method()
    if method ~= "POST" and method ~= "GET" then
        return false
    end
    return true
end

function server.get_method()
    return ngx.req.get_method()
end

function server.get_data()
    if not server.is_allowed_method() then
        return nil
    end
    local method = server.get_method()
    local getData = ngx.req.get_uri_args() -- Get any GET data if available.
    local postData = {}

    if method == "POST" then
        ngx.req.read_body()
        postData = ngx.req.get_post_args()
    end

    return merge_tables(getData, postData)
end

return server