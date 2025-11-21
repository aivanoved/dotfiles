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
function Formatter:python_config()
    if not self.default_executable then
        return nil
    end
    -- check if python formatter
    local is_python = false
    for _, ft in ipairs(self.filetypes) do
        if ft == 'python' then
            is_python = true
            break
        end
    end

    if not is_python then
        return nil
    end

    -- check if in pixi environment
    if vim.fn.executable('pixi') == 0 then
        return nil
    end
    -- check if pixi directory exists anywhare upwards
    local pixi_dir = vim.fn.finddir('.pixi', vim.fn.getcwd() .. ';')

    if pixi_dir == '' then
        return nil
    end

    local command = require('conform.util').find_executable(
        self.paths,
        self.default_executable
    )

    --- @type conform.FormatterConfigOverride
    local config = {
        -- check if the executable is in the pixi environment
        command = require('conform.util').find_executable(
            self.paths,
            self.default_executable
        ),
    }

    return config
end

--- @return conform.FormatterConfigOverride|nil
function Formatter:into_conform_config()
    return self:python_config()
end

return {
    Formatter = Formatter,
}
