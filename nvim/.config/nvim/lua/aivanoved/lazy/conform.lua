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

---@type Formatter
local rustfmt = {
    name = 'rustfmt',
    filetypes = { 'rust' },
    default_executable = 'rustfmt',
}

---@type Formatter
local prettierd = {
    name = 'prettierd',
    filetypes = { 'javascript' },
    default_executable = 'prettierd',
}

---@type Formatter
local prettier = {
    name = 'prettier',
    filetypes = { 'javascript' },
    default_executable = 'prettier',
}

local function config()
    local conform = require('conform')

    conform.setup({
        formatters_by_ft = {
            lua = { stylua.name, lsp_format = 'fallback' },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    })
end

return {
    'stevearc/conform.nvim',
    config = config,
}
