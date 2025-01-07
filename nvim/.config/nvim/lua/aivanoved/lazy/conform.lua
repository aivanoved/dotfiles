local function config()
    local conform = require('conform')

    conform.setup({
        formatters_by_ft = {
            lua = { 'stylua' },
            -- Conform will run multiple formatters sequentially
            python = { 'ruff_format', 'isort', 'black' },
            -- You can customize some of the format options for the filetype (:help conform.format)
            rust = { 'rustfmt', lsp_format = 'fallback' },
            -- Conform will run the first available formatter
            javascript = { 'prettierd', 'prettier', stop_after_first = true },
        },
        -- format_on_save = {
        --     -- These options will be passed to conform.format()
        --     timeout_ms = 500,
        --     lsp_format = "fallback",
        -- },
    })
end

return {
    'stevearc/conform.nvim',
    config = config,
}
