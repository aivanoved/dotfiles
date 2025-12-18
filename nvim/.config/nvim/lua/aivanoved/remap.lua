local typedef = require('aivanoved.typedef')

local set_maps = typedef.SetKeyMaps:new()

set_maps:append({
    mode = 'i',
    lhs = 'jj',
    rhs = '<Esc>',
    opts = {
        desc = 'Insert mode Esc',
    },
})
set_maps:append({
    mode = 'n',
    lhs = 'J',
    rhs = 'mzJ`z`',
    opts = { desc = 'Append line below' },
})
set_maps:append({
    mode = 'v',
    lhs = 'J',
    rhs = ":m '>+1<CR>gv=gv",
    opts = { desc = 'Move line below' },
})

set_maps:append({
    mode = 'v',
    lhs = 'K',
    rhs = ":m '<-2<CR>gv=gv",
    opts = { desc = 'Move line above' },
})

set_maps:append({
    mode = 'n',
    lhs = '<leader>k',
    rhs = '<cmd>lnext<CR>zz',
    opts = { desc = 'Next location list' },
})
set_maps:append({
    mode = 'n',
    lhs = '<leader>j',
    rhs = '<cmd>lprev<CR>zz',
    opts = { desc = 'Previous location list' },
})

set_maps:append({
    mode = 'n',
    lhs = '<c-k>',
    rhs = '<cmd>cnext<CR>zz',
    opts = { desc = 'Next quickfix list' },
})
set_maps:append({
    mode = 'n',
    lhs = '<c-j>',
    rhs = '<cmd>cprev<CR>zz',
    opts = { desc = 'Previous quickfix list' },
})

-- scroll maps
set_maps:append({
    mode = 'n',
    lhs = '<c-d>',
    rhs = '<c-d>zz',
    opts = { desc = 'Full page down' },
})
set_maps:append({
    mode = 'n',
    lhs = '<c-u>',
    rhs = '<c-u>zz',
    opts = { desc = 'Full page up' },
})

-- search maps
set_maps:append({
    mode = 'n',
    lhs = 'n',
    rhs = 'nzzzv',
    opts = { desc = 'Find next' },
})
set_maps:append({
    mode = 'n',
    lhs = 'N',
    rhs = 'Nzzzv',
    opts = { desc = 'Find previous' },
})

-- yank maps
set_maps:append({
    mode = 'n',
    lhs = 'Y',
    rhs = 'yg$',
    opts = { desc = 'Yank to EoL' },
})

set_maps:append({
    mode = { 'n', 'v' },
    lhs = '<leader>y',
    rhs = '"+y',
    opts = { desc = 'Yank to clipboard' },
})
set_maps:append({
    mode = 'n',
    lhs = '<leader>Y',
    rhs = '"+Y',
    opts = { desc = 'Yank to EoL to clipboard' },
})

-- delete maps
set_maps:append({
    mode = { 'n', 'x' },
    lhs = 'd',
    rhs = '"_d',
    opts = { desc = 'Delete to void' },
})
set_maps:append({
    mode = { 'n', 'x' },
    lhs = 'dd',
    rhs = '"_dd',
    opts = { desc = 'Delete to void lione' },
})
set_maps:append({
    mode = { 'n', 'x' },
    lhs = 'D',
    rhs = '"_D',
    opts = { desc = 'Delete to void lione' },
})

-- change maps
set_maps:append({
    mode = { 'n', 'x' },
    lhs = 'c',
    rhs = '"_c',
    opts = { desc = 'Change to void' },
})
set_maps:append({
    mode = { 'n', 'x' },
    lhs = 'cc',
    rhs = '"_cc',
    opts = { desc = 'Change to void line' },
})
set_maps:append({
    mode = { 'n', 'x' },
    lhs = 'C',
    rhs = '"_C',
    opts = { desc = 'Change to void line' },
})

-- substitute maps
set_maps:append({
    mode = { 'n', 'x' },
    lhs = 's',
    rhs = '"_s',
    opts = { desc = 'Substitute to void' },
})
set_maps:append({
    mode = { 'n', 'x' },
    lhs = 'ss',
    rhs = '"_ss',
    opts = { desc = 'Substitute to void line' },
})
set_maps:append({
    mode = { 'n', 'x' },
    lhs = 'S',
    rhs = '"_S',
    opts = { desc = 'Substitute to void line' },
})

-- substitution maps
set_maps:append({
    mode = 'n',
    lhs = '<leader>s',
    rhs = ':%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<Left><Left><Left>',
    opts = { desc = 'Substitute word under cursor' },
})

-- paste maps
set_maps:append({
    mode = 'n',
    lhs = '<leader>p',
    rhs = '"+p',
    opts = { desc = 'Paste from clipboard after' },
})
set_maps:append({
    mode = 'n',
    lhs = '<leader>P',
    rhs = '"+P',
    opts = { desc = 'Paste from clipboard before' },
})
set_maps:append({
    mode = 'x',
    lhs = '<leader>p',
    rhs = '"_d"+P',
    opts = { desc = 'Void delete and paste from clipboard before' },
})
set_maps:append({
    mode = 'x',
    lhs = '<leader>P',
    rhs = '"_d"+p',
    opts = { desc = 'Void delete and paste from clipboard after' },
})

-- ex mode maps
set_maps:append({
    mode = 'n',
    lhs = 'Q',
    rhs = '<nop>',
    opts = { desc = 'Unmap "Q"' },
})

set_maps:append({
    mode = 'n',
    lhs = '<leader>x',
    rhs = '<cmd>!chmod +x %<CR>',
    opts = { desc = 'Make executable', silent = true },
})

set_maps:append({
    mode = 'n',
    lhs = '<leader>bf',
    rhs = function()
        vim.lsp.buf.format()
    end,
    opts = { desc = 'Buffer lsp format' },
})

set_maps:append({
    mode = 'n',
    lhs = '<leader>ve',
    rhs = function()
        vim.cmd.edit(os.getenv('HOME') .. '/.config/nvim/init.lua')
    end,
    opts = { desc = 'Edit base config' },
})
set_maps:append({
    mode = 'n',
    lhs = '<leader>vr',
    rhs = function()
        vim.cmd.source(os.getenv('HOME') .. '/.config/nvim/init.lua')
    end,
    opts = { desc = 'Reload base config' },
})

set_maps:set_keymaps()
