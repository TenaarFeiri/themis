-- Centralised error handler.
local error = {}

-- Error strings for different error types.
-- Where %s present, can accept multiple args.
local ERROR_STRINGS = {
    DB = {
        CONNECTION_FAILED = "Database connection failed on db %s",
        QUERY_FAILED = "Database query failed on db %s"
    },
    HTTP = {
        CLIENT_ERROR = "HTTP client error"
    },
    SERVER = {
        ERROR = "Server error",
        INVALID_REQUEST = "Invalid request",
    },
    GENERIC = {
        ERROR = "Error",
        NOT_FOUND = "Not found",
    },
}

function error.get_error_string(error_type, error_code, ...)
    local error_string = ERROR_STRINGS[error_type][error_code]
    if error_string then
        return string.format(error_string, ...)
    end
    return "Unknown error"
end

function error.test()
    ngx.say("test")
end

return error