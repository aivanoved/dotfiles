local function config()
    local function set_keymap(mode, key, cmd)
        vim.keymap.set(mode, '<leader>g' .. key, cmd)
    end

    set_keymap('n', ']h', '<Plug>(GitGutterNextHunk)')
    set_keymap('n', '[h', '<Plug>(GitGutterPrevHunk)')

    set_keymap('n', 'hp', '<Plug>(GitGutterPreviewHunk)')

    set_keymap({ 'n', 'x' }, 'hs', '<Plug>(GitGutterStageHunk)')
    set_keymap('n', 'hu', '<Plug>(GitGutterUndoHunk)')
end

return {
    'airblade/vim-gitgutter',
    config = config,
}
