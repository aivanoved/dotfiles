local function config()
    vim.g.tmux_navigator_no_mappings = 1

    vim.keymap.set(
        { 'n', 'v', 'o' },
        '<c-h>',
        ':<C-U>TmuxNavigateLeft<cr>',
        { silent = true }
    )
    vim.keymap.set(
        { 'n', 'v', 'o' },
        '<c-j>',
        ':<C-U>TmuxNavigateDown<cr>',
        { silent = true }
    )
    vim.keymap.set(
        { 'n', 'v', 'o' },
        '<c-k>',
        ':<C-U>TmuxNavigateUp<cr>',
        { silent = true }
    )
    vim.keymap.set(
        { 'n', 'v', 'o' },
        '<c-l>',
        ':<C-U>TmuxNavigateRight<cr>',
        { silent = true }
    )
    vim.keymap.set(
        { 'n', 'v', 'o' },
        '<c-p>',
        ':<C-U>TmuxNavigatePrevious<cr>',
        { silent = true }
    )
end

return {
    'christoomey/vim-tmux-navigator',
    config = config,
}
