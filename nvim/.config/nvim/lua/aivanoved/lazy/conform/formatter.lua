--- @alias aivanoved.conform.Filetype string

--- @alias aivanoved.conform.Path string

--- @class aivanoved.conform.FormatterParams
--- @field filetype aivanoved.conform.Filetype
--- @field args string[]

--- @class aivanoved.conform.Formatter
--- @field name string
--- @field filetypes aivanoved.conform.Filetype[]
--- @field default_executable string|nil
--- @field params aivanoved.conform.FormatterParams[]
--- @field paths aivanoved.conform.Path[]
Formatter = {}

--- @param name string
--- @param filetypes string|string[]
--- @param default_executable string|nil
--- @param params table<aivanoved.conform.Filetype, aivanoved.conform.FormatterParams[]>|nil
--- @param paths string[]|nil
--- @return aivanoved.conform.Formatter
function Formatter:new(
    name,
    filetypes,
    default_executable,
    params,
    paths
)
    if type(filetypes) == 'string' then
        filetypes = { filetypes }
    end

    local obj = {
        name = name,
        filetypes = filetypes,
        default_executable = default_executable,
        params = params or {},
        paths = paths or {},
    }

    setmetatable(obj, self)
    self.__index = self

    return obj
end

--- @return conform.FormatterConfigOverride|nil
function Formatter:into_conform_config()
    if not self.default_executable then
        return nil
    end

    --- @type conform.FormatterConfigOverride
    local config = {
        command = require('conform.util').find_executable(
            self.paths,
            self.default_executable
        ),
    }

    return config
end

return {
    Formatter = Formatter,
}
