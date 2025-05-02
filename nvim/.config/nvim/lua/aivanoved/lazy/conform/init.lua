local Formatter = require('aivanoved.lazy.conform.formatter').Formatter

local stylua = Formatter:new('stylua', 'lua', nil, nil, nil)
local rustfmt = Formatter:new('rustfmt', 'rust', nil, nil, nil)
local prettier = Formatter:new('prettier', 'javascript', nil, nil, nil)
local ruff_format = Formatter:new('ruff_format', 'python', nil, nil, nil)
local isort = Formatter:new('isort', 'python', 'isort', nil, { '.pixi' })
local black = Formatter:new('black', 'python', nil, nil, nil)

local all_formatters = {
    stylua,
    rustfmt,
    prettier,
    -- ruff_format,
    isort,
    black,
}

--- @type table<string, conform.FiletypeFormatterInternal>
FILETYPE_INTERNALS = {}

FILETYPE_INTERNALS['lua'] = {
    lsp_format = 'fallback',
}

FILETYPE_INTERNALS['python'] = {
    lsp_format = 'fallback',
}

local function config()
    local conform = require('conform')

    --- @type table<string, conform.FiletypeFormatterInternal>
    local formatters_by_ft = {}

    for ft, internal in pairs(FILETYPE_INTERNALS) do
        formatters_by_ft[ft] = internal
    end

    for _, formatter in ipairs(all_formatters) do
        for _, ft in ipairs(formatter.filetypes) do
            if formatters_by_ft[ft] then
                local internal = formatters_by_ft[ft]
                table.insert(internal, formatter.name)
            end
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
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return {
                timeout_ms = 500,
                lsp_format = 'fallback',
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
