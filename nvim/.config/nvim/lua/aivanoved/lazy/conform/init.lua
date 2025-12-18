local Formatter =
    require('aivanoved.lazy.conform.formatter').Formatter
local PythonFormatter =
    require('aivanoved.lazy.conform.python_formatter').PythonFormatter

local stylua = Formatter:new('stylua', 'lua', nil, nil, nil)
local rustfmt = Formatter:new('rustfmt', 'rust', nil, nil, nil)
local prettier =
    Formatter:new('prettier', 'javascript', nil, nil, nil)
local ruff_format =
    PythonFormatter:new('ruff_format', 'python', nil, nil, nil)
local ruff_fix =
    PythonFormatter:new('ruff_fix', 'python', nil, nil, nil)
local ruff_organize_imports = PythonFormatter:new(
    'ruff_organize_imports',
    'python',
    nil,
    nil,
    nil
)

local all_formatters = {
    stylua,
    rustfmt,
    prettier,
    ruff_fix,
    ruff_format,
    ruff_organize_imports,
}

--- @type conform.FiletypeFormatterInternal
DEFAULT_INTERNALS = {
    lsp_format = 'fallback',
}

--- @type table<string, conform.FiletypeFormatterInternal>
FILETYPE_INTERNALS = {}

local function config()
    local conform = require('conform')

    --- @type table<string, conform.FiletypeFormatterInternal>
    local formatters_by_ft = {}

    for ft, internal in pairs(FILETYPE_INTERNALS) do
        formatters_by_ft[ft] = internal
    end

    for _, formatter in ipairs(all_formatters) do
        for _, ft in ipairs(formatter.filetypes) do
            if not formatters_by_ft[ft] then
                formatters_by_ft[ft] = vim.deepcopy(DEFAULT_INTERNALS)
            end
            local internal = formatters_by_ft[ft]
            table.insert(internal, formatter.name)
        end
    end

    --- @type table<string, conform.FormatterConfigOverride>
    local formatters = {}

    for _, formatter in ipairs(all_formatters) do
        local to_insert = false

        for _, ft in ipairs(formatter.filetypes) do
            if formatters_by_ft[ft] then
                to_insert = true
                break
            end
        end

        local formatter_config = formatter:into_conform_config()

        if to_insert and formatter_config then
            formatters[formatter.name] = formatter_config
        end
    end

    conform.setup({
        formatters_by_ft = formatters_by_ft,
        format_on_save = function(bufnr)
            if
                vim.g.disable_autoformat
                or vim.b[bufnr].disable_autoformat
            then
                return
            end
            return {
                timeout_ms = 500,
            }
        end,
        formatters = formatters,
    })

    vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
        else
            vim.g.disable_autoformat = true
        end
    end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
    })

    vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
    end, {
        desc = 'Re-enable autoformat-on-save',
    })
end

return {
    'stevearc/conform.nvim',
    config = config,
}
