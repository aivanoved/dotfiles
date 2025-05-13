local function config()
    local builtin = require('telescope.builtin')

    -- files
    vim.keymap.set(
        'n',
        '<leader>f' .. 'f',
        builtin.find_files,
        { desc = 'Telescope find files' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'lg',
        builtin.live_grep,
        { desc = 'Telescope live grep' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'b',
        builtin.buffers,
        { desc = 'Telescope find buffers' }
    )

    --git
    vim.keymap.set(
        'n',
        '<leader>f' .. 'gf',
        builtin.git_files,
        { desc = 'Telescope git files' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'gc',
        builtin.git_commits,
        { desc = 'Telescope git commits' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'gcb',
        builtin.git_bcommits,
        { desc = 'Telescope buffer commits' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'gs',
        builtin.git_status,
        { desc = 'Telescope git status' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'gn',
        builtin.git_branches,
        { desc = 'Telescope git branches' }
    )

    -- lsp
    vim.keymap.set(
        'n',
        '<leader>f' .. 'lr',
        builtin.lsp_references,
        { desc = 'Telescope lsp references' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'lgt',
        builtin.lsp_type_definitions,
        { desc = 'Telescope lsp definitions' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'ld',
        builtin.diagnostics,
        { desc = 'Telescope lsp diagnostics' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'lci',
        builtin.lsp_incoming_calls,
        { desc = 'Telescope lsp incoming' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'lco',
        builtin.lsp_outgoing_calls,
        { desc = 'Telescope lsp outgoing' }
    )

    -- vim
    vim.keymap.set(
        'n',
        '<leader>f' .. 'ht',
        builtin.help_tags,
        { desc = 'Telescope help tags' }
    )
    vim.keymap.set(
        'n',
        '<leader>f' .. 'm',
        builtin.keymaps,
        { desc = 'Telescope vim keymaps' }
    )
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = 'nvim-lua/plenary.nvim',
    config = config,
}
