local formatter = require('aivanoved.lazy.conform.formatter')

--- @class aivanoved.conform.PythonFormatter: aivanoved.conform.Formatter
PythonFormatter = {}

--- @param name string
--- @param filetypes string|string[]
--- @param default_executable string|nil
--- @param params table<aivanoved.conform.Filetype, aivanoved.conform.FormatterParams[]>|nil
--- @param paths string[]|nil
--- @return aivanoved.conform.Formatter
function PythonFormatter:new(
    name,
    filetypes,
    default_executable,
    params,
    paths
)
    return formatter.Formatter:new(
        name,
        filetypes,
        default_executable,
        params,
        paths
    )
end

--- @return conform.FormatterConfigOverride|nil
function PythonFormatter:into_conform_config()
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
    PythonFormatter = PythonFormatter,
}
