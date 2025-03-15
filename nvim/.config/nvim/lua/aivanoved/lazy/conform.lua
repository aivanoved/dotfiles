---@alias Filetype string

---@alias Path string

---@class FormatterParams
---@field filetype Filetype
---@field args string[]

---@class Formatter
---@field name string
---@field filetypes Filetype[]
---@field params? FormatterParams[]
---@field default_executable? string
---@field default_path? Path

---@type Formatter
local stylua = {
    name = 'stylua',
    filetypes = { 'lua' },
    default_executable = 'stylua',
}

---@type Formatter
local rustfmt = {
    name = 'rustfmt',
    filetypes = { 'rust' },
    default_executable = 'rustfmt',
}

---@type Formatter
local prettier = {
    name = 'prettier',
    filetypes = { 'javascript' },
    default_executable = 'prettier',
}

---@type Formatter
local ruff = {
    name = 'ruff_format',
    filetypes = { 'python' },
    default_executable = 'ruff',
}

---@type Formatter
local isort = {
    name = 'isort',
    filetypes = { 'python' },
    default_executable = 'isort',
}

---@type Formatter
local black = {
    name = 'black',
    filetypes = { 'python' },
    default_executable = 'black',
}

local all_formaters = {
    stylua,
    rustfmt,
    prettier,
    ruff,
    isort,
    black,
}

local function config()
    local conform = require('conform')

    conform.setup({
        formatters_by_ft = {
            lua = { stylua.name, lsp_format = 'fallback' },
        },
        format_on_save = function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return {
                timeout_ms = 500,
                lsp_format = 'fallback',
            }
        end,
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
