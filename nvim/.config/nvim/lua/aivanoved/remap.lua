vim.keymap.set('i', 'jj', '<Esc>')

vim.keymap.set({ 'n', 'x' }, 'm', 'd')
vim.keymap.set('n', 'mm', 'dd')

vim.keymap.set('n', 'M', 'D')

vim.keymap.set({ 'n', 'x' }, 'd', '"_d')
vim.keymap.set({ 'n', 'x' }, 'dd', '"_dd')
vim.keymap.set({ 'n', 'x' }, 'D', '"_D')

vim.keymap.set({ 'n', 'x' }, 'c', '"_c')
vim.keymap.set({ 'n', 'x' }, 'cc', '"_cc')
vim.keymap.set({ 'n', 'x' }, 'C', '"_C')

vim.keymap.set({ 'n', 'x' }, 's', '"_s')
vim.keymap.set({ 'n', 'x' }, 'ss', '"_ss')
vim.keymap.set({ 'n', 'x' }, 'S', '"_S')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'Y', 'yg$')
vim.keymap.set('n', 'J', 'mzJ`z`')
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('x', '<leader>P', '"_d"+p')

vim.keymap.set('n', 'Q', '<nop>')

-- vim.keymap.set('n', '<c-k>', '<cmd>cnext<CR>zz')
-- vim.keymap.set('n', '<c-j>', '<cmd>cprev<CR>zz')

vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')

vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>s', ':%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<Left><Left><Left>')
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<leader>bf', function()
    vim.lsp.buf.format()
end)

vim.keymap.set('n', '<leader>ve', function()
    vim.cmd.edit(os.getenv('HOME') .. '/.config/nvim/init.lua')
end)
vim.keymap.set('n', '<leader>vr', function()
    vim.cmd.source(os.getenv('HOME') .. '/.config/nvim/init.lua')
end)
