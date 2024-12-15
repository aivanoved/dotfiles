-- local luasnip = require('luasnip')
-- local extras = require('luasnip.extras')
-- local fmt = require('luasnip.extras.fmt').fmt
--
-- luasnip.config.set_config({
--     history = true,
--     update_events = 'TextChanged,TextChangedI',
--     enable_autosnippets = true,
-- })
--
-- local s = luasnip.s
--
-- local i = luasnip.insert_node
-- local t = luasnip.text_node
--
-- local f = luasnip.function_node
--
-- local c = luasnip.choice_node
--
-- local rep = extras.rep
--
-- luasnip.add_snippets('lua', {
--     s(
--         'req',
--         fmt([[local {} = require('{}')]], {
--             f(function(arg_name)
--                 local name = vim.split(arg_name[1][1], '.', true)
--                 return name[#name] or ''
--             end, { 1 }),
--             i(1),
--         })
--     ),
-- })
