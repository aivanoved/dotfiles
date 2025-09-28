local typedef = require('aivanoved.typedef')

local function config()
    local builtin = require('telescope.builtin')

    local set_maps = typedef.SetKeyMaps:new()

    -- files
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'f',
        rhs = builtin.find_files,
        opts = { desc = 'Telescope find files' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'lg',
        rhs = builtin.live_grep,
        opts = { desc = 'Telescope live grep' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'b',
        rhs = builtin.buffers,
        opts = { desc = 'Telescope find buffers' },
    })

    --git
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'gf',
        rhs = builtin.git_files,
        opts = { desc = 'Telescope git files' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'gc',
        rhs = builtin.git_commits,
        opts = { desc = 'Telescope git commits' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'gcb',
        rhs = builtin.git_bcommits,
        opts = { desc = 'Telescope buffer commits' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'gs',
        rhs = builtin.git_status,
        opts = { desc = 'Telescope git status' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'gn',
        rhs = builtin.git_branches,
        opts = { desc = 'Telescope git branches' },
    })

    -- lsp
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'lr',
        rhs = builtin.lsp_references,
        opts = { desc = 'Telescope lsp references' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'lgt',
        rhs = builtin.lsp_type_definitions,
        opts = { desc = 'Telescope lsp definitions' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'ld',
        rhs = builtin.diagnostics,
        opts = { desc = 'Telescope lsp diagnostics' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'lci',
        rhs = builtin.lsp_incoming_calls,
        opts = { desc = 'Telescope lsp incoming' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'lco',
        rhs = builtin.lsp_outgoing_calls,
        opts = { desc = 'Telescope lsp outgoing' },
    })

    -- vim
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'ht',
        rhs = builtin.help_tags,
        opts = { desc = 'Telescope help tags' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>f' .. 'm',
        rhs = builtin.keymaps,
        opts = { desc = 'Telescope vim keymaps' },
    })

    set_maps:set_keymaps()
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = 'nvim-lua/plenary.nvim',
    config = config,
}
