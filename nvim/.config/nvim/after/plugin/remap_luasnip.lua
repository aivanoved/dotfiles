local luasnip = require('luasnip')

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })

vim.keymap.set('i', '<c-l>', function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, { silent = true })

vim.keymap.set('i', '<c-h>', function()
    if luasnip.choice_active() then
        luasnip.change_choice(-1)
    end
end, { silent = true })

vim.keymap.set(
    'n',
    '<leader><leader>s',
    '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<cr>' ..
    '<cmd>source ~/.config/nvim/after/plugin/remap_luasnip.lua<cr>'
)
