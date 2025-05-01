local function cmp_setup()
    local lsp_zero = require('lsp-zero')
    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
        -- snippet = {
        --     expand = function(args)
        --         luasnip.lsp_expand(args.body)
        --     end,
        -- },
        sources = {
            { name = 'path' },
            { name = 'nvim_lsp' },
            {
                name = 'lazydev',
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            },
            { name = 'nvim_lua' },
            -- { name = 'luasnip', keyword_length = 2 },
            { name = 'copilot' },
            { name = 'buffer', keyword_length = 3 },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
            ['<c-d>'] = cmp.mapping.scroll_docs(5),
            ['<c-f>'] = cmp.mapping.scroll_docs(-5),
            ['<c-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<c-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<c-y>'] = cmp.mapping.confirm({ select = true }),
            ['<c-space>'] = cmp.mapping.complete(),
        }),
        experimental = {
            ghost_text = true,
        },
    })
end

local M = {}

M.cmp_setup = cmp_setup
return M
