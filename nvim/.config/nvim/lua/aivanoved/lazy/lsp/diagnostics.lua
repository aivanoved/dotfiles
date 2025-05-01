local function lsp_diagnostics()
    local lsp_zero = require('lsp-zero')
    lsp_zero.set_sign_icons({
        error = ' ',
        warning = ' ',
        info = '󰋽 ',
        hint = '󰌶 ',
    })

    vim.diagnostic.config({
        virtual_text = true,
    })
end

local M = {}

M.lsp_diagnostics = lsp_diagnostics

return M
