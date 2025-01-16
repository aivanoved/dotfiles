local function config()
    local builtin = require('telescope.builtin')

    local function set_keymap(key, fun)
        vim.keymap.set('n', '<leader>f' .. key, fun, {})
    end
    set_keymap('f', builtin.find_files)
    set_keymap('gf', builtin.git_files)
    set_keymap('gc', builtin.git_commits)
    set_keymap('gcb', builtin.git_bcommits)
    set_keymap('lg', builtin.live_grep)
    set_keymap('b', builtin.buffers)
    set_keymap('ht', builtin.help_tags)
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = 'nvim-lua/plenary.nvim',
    config = config,
}
