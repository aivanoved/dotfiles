local typedef = require('aivanoved.typedef')

local function config()
    local set_maps = typedef.SetKeyMaps:new()

    set_maps:append({
        mode = 'n',
        lhs = '<leader>g' .. ']h',
        rhs = '<Plug>(GitGutterNextHunk)',
        opts = { desc = 'Gitgutter next hunk' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>g' .. '[h',
        rhs = '<Plug>(GitGutterPrevHunk)',
        opts = { desc = 'Gitgutter previous hunk' },
    })

    set_maps:append({
        mode = 'n',
        lhs = '<leader>g' .. 'hp',
        rhs = '<Plug>(GitGutterPreviewHunk)',
        opts = { desc = 'Gitgutter preview hunk' },
    })

    set_maps:append({
        mode = { 'n', 'x' },
        lhs = '<leader>g' .. 'hs',
        rhs = '<Plug>(GitGutterStageHunk)',
        opts = { desc = 'Gitgutter stage hunk' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>g' .. 'hu',
        rhs = '<Plug>(GitGutterUndoHunk)',
        opts = { desc = 'Gitgutter undo hunk' },
    })

    set_maps:set_keymaps()
end

return {
    'airblade/vim-gitgutter',
    config = config,
}
