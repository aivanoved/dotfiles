--- @type table<vim.diagnostic.Severity, string>
local DIAGNOSTIC_SIGNS = {
    [vim.diagnostic.severity.ERROR] = ' ',
    [vim.diagnostic.severity.WARN] = ' ',
    [vim.diagnostic.severity.INFO] = '󰋽 ',
    [vim.diagnostic.severity.HINT] = '󰌶 ',
}

local NUMBER_LINE_HIGHLIGHT = {
    [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
    [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
    [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
    [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
}

local function lsp_diagnostics()
    --- @type vim.diagnostic.Opts
    local diagnostic_opt = {
        underline = true,
        update_in_insert = true,
        virtual_text = {
            source = true,
            current_line = true,
            virt_text_pos = 'eol_right_align',
        },
        signs = {
            text = DIAGNOSTIC_SIGNS,
            numhl = NUMBER_LINE_HIGHLIGHT,
        }
    }

    vim.diagnostic.config(diagnostic_opt)
end

local M = {}

M.lsp_diagnostics = lsp_diagnostics

return M
