local function config()
    local builtin = require('telescope.builtin')

    local function set_keymap(key, fun)
        vim.keymap.set('n', '<leader>f' .. key, fun, {})
    end

    -- files
    set_keymap('f', builtin.find_files)
    set_keymap('lg', builtin.live_grep)
    set_keymap('b', builtin.buffers)

    --git
    set_keymap('gf', builtin.git_files)
    set_keymap('gc', builtin.git_commits)
    set_keymap('gcb', builtin.git_bcommits)
    set_keymap('gs', builtin.git_status)
    set_keymap('gn', builtin.git_branches)

    -- lsp
    set_keymap('lr', builtin.lsp_references)
    set_keymap('lgt', builtin.lsp_type_definitions)
    set_keymap('ld', builtin.diagnostics)
    set_keymap('lci', builtin.lsp_incoming_calls)
    set_keymap('lco', builtin.lsp_outgoing_calls)

    -- vim
    set_keymap('ht', builtin.help_tags)
    set_keymap('m', builtin.keymaps)
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = 'nvim-lua/plenary.nvim',
    config = config,
}
