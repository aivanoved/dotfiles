local function config()
    local luasnip = require('luasnip')
    local extras = require('luasnip.extras')
    local fmt = require('luasnip.extras.fmt').fmt

    luasnip.config.set_config({
        history = true,
        update_events = 'TextChanged,TextChangedI',
        enable_autosnippets = true,
    })

    local s = luasnip.s

    local i = luasnip.insert_node
    local t = luasnip.text_node

    local f = luasnip.function_node

    local c = luasnip.choice_node

    local rep = extras.rep

    luasnip.add_snippets('lua', {
        s(
            'req',
            fmt([[local {} = require('{}')]], {
                f(function(arg_name)
                    local name = vim.split(arg_name[1][1], '.', true)
                    return name[#name] or ''
                end, { 1 }),
                i(1),
            })
        ),
    })

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
        '<cmd>source ~/.config/nvim/lua/aivanoved/lazy/luasnip.lua<cr>'
    )
end

return {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    config = config,
}
