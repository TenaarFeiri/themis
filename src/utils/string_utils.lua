-- string utilities
local string_utils = {}

function string_utils.trim(s)
    local from = s:match("^%s*()")
    local to = s:match("()%s*$", from)
    return s:sub(from, to - 1)
end

return string_utils
