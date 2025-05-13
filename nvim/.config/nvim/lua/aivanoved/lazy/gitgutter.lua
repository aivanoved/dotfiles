local function config()
    vim.keymap.set(
        'n',
        '<leader>g' .. ']h',
        '<Plug>(GitGutterNextHunk)',
        { desc = 'Gitgutter next hunk' }
    )
    vim.keymap.set(
        'n',
        '<leader>g' .. '[h',
        '<Plug>(GitGutterPrevHunk)',
        { desc = 'Gitgutter previous hunk' }
    )

    vim.keymap.set(
        'n',
        '<leader>g' .. 'hp',
        '<Plug>(GitGutterPreviewHunk)',
        { desc = 'Gitgutter preview hunk' }
    )

    vim.keymap.set(
        { 'n', 'x' },
        '<leader>g' .. 'hs',
        '<Plug>(GitGutterStageHunk)',
        { desc = 'Gitgutter stage hunk' }
    )
    vim.keymap.set(
        'n',
        '<leader>g' .. 'hu',
        '<Plug>(GitGutterUndoHunk)',
        { desc = 'Gitgutter undo hunk' }
    )
end

return {
    'airblade/vim-gitgutter',
    config = config,
}
