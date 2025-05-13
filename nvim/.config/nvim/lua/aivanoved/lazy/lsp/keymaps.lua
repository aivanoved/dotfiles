local function lsp_keymaps()
    local lsp_zero = require('lsp-zero')

    --- @param bufnr boolean | integer
    --- @param desc string | nil
    --- @return vim.keymap.set.Opts
    local function opts(bufnr, desc)
        --- @type vim.keymap.set.Opts
        local set_opts = { buffer = bufnr, remap = false }

        if desc ~= nil then
            set_opts = vim.tbl_deep_extend('force', set_opts, { desc = desc })
        end
        return set_opts
    end

    lsp_zero.on_attach(function(client, bufnr)
        vim.keymap.set('n', 'gd', function()
            vim.lsp.buf.definition()
        end, opts(bufnr, 'Lsp definition'))
        vim.keymap.set('n', 'K', function()
            vim.lsp.buf.hover()
        end, opts(bufnr, 'Lsp hover'))
        vim.keymap.set('n', '<leader>vws', function()
            vim.lsp.buf.workspace_symbol()
        end, opts(bufnr, 'Lsp workspace symbol'))
        vim.keymap.set('n', '<leader>vd', function()
            vim.diagnostic.open_float()
        end, opts(bufnr, 'Lsp open float'))
        vim.keymap.set('n', '[d', function()
            vim.diagnostic.goto_next()
        end, opts(bufnr, 'Lsp next diagnostic'))
        vim.keymap.set('n', ']d', function()
            vim.diagnostic.goto_prev()
        end, opts(bufnr, 'Lsp previous diagnostic'))
        vim.keymap.set('n', '<leader>vca', function()
            vim.lsp.buf.code_action()
        end, opts(bufnr, 'Lsp code acton'))
        vim.keymap.set('n', '<leader>vrr', function()
            vim.lsp.buf.references()
        end, opts(bufnr, 'Lsp references'))
        vim.keymap.set('n', '<leader>vrn', function()
            vim.lsp.buf.rename()
        end, opts(bufnr, 'Lsp rename'))
        vim.keymap.set('i', '<C-h>', function()
            vim.lsp.buf.signature_help()
        end, opts(bufnr, 'Lsp signature help'))
    end)
end

local M = {}

M.lsp_keymaps = lsp_keymaps

return M
