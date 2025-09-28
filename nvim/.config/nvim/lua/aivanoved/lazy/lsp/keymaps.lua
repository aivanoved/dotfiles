local typedef = require('aivanoved.typedef')

--- @param bufnum boolean | integer
--- @param desc string | nil
--- @return vim.keymap.set.Opts
local function opts(bufnum, desc)
    --- @type vim.keymap.set.Opts
    local set_opts = { buffer = bufnum, remap = false }

    if desc ~= nil then
        set_opts = vim.tbl_deep_extend('force', set_opts, { desc = desc })
    end
    return set_opts
end

--- @param client vim.lsp.Client
--- @param bufnr integer
--- @diagnostic disable-next-line: unused-local
local function lsp_keymaps(client, bufnr)
    local set_maps = typedef.SetKeyMaps:new()
    set_maps:append({
        mode = 'n',
        lhs = 'gd',
        rhs = function()
            vim.lsp.buf.definition()
        end,
        opts = opts(bufnr, 'Lsp definition'),
    })
    set_maps:append({
        mode = 'n',
        lhs = 'K',
        rhs = function()
            vim.lsp.buf.hover()
        end,
        opts = opts(bufnr, 'Lsp hover'),
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>vws',
        rhs = function()
            vim.lsp.buf.workspace_symbol()
        end,
        opts = opts(bufnr, 'Lsp workspace symbol'),
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>vd',
        rhs = function()
            vim.diagnostic.open_float()
        end,
        opts = opts(bufnr, 'Lsp open float'),
    })
    set_maps:append({
        mode = 'n',
        lhs = '[d',
        rhs = function()
            vim.diagnostic.jump({
                count = 1,
            })
        end,
        opts = opts(bufnr, 'Lsp next diagnostic'),
    })
    set_maps:append({
        mode = 'n',
        lhs = ']d',
        rhs = function()
            vim.diagnostic.jump({
                count = -1,
            })
        end,
        opts = opts(bufnr, 'Lsp previous diagnostic'),
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>vca',
        rhs = function()
            vim.lsp.buf.code_action()
        end,
        opts = opts(bufnr, 'Lsp code action'),
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>vrr',
        rhs = function()
            vim.lsp.buf.references()
        end,
        opts = opts(bufnr, 'Lsp references'),
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>vrn',
        rhs = function()
            vim.lsp.buf.rename()
        end,
        opts = opts(bufnr, 'Lsp rename'),
    })
    set_maps:append({
        mode = 'i',
        lhs = '<C-h>',
        rhs = function()
            vim.lsp.buf.signature_help()
        end,
        opts = opts(bufnr, 'Lsp signature help'),
    })

    set_maps:set_keymaps()
end

local M = {}

M.lsp_keymaps = lsp_keymaps

return M
