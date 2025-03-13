---@param servers string[]
local function lspconfigure(servers)
    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lspconfig = require('lspconfig')

    local server_setup = {
        lua_ls = {
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file('', true),
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        },
    }

    for _, lsp in ipairs(servers) do
        server_setup[lsp] = server_setup[lsp] or {}
        server_setup[lsp].capabilities = cmp_capabilities
    end

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup(server_setup[lsp])
    end
end

---@param servers string[]
local function mason_config(servers)
    local lsp_zero = require('lsp-zero')

    local lspconfig = require('lspconfig')
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')

    mason.setup({})
    mason_lspconfig.setup({
        ensure_installed = servers,
        handlers = {
            lsp_zero.default_setup,
            lua_ls = function()
                local lua_opts = lsp_zero.nvim_lua_ls()
                lspconfig.lua_ls.setup(lua_opts)
            end,
            rust_analyzer = lsp_zero.noop,
        },
    })
end

local function cmp_setup()
    local lsp_zero = require('lsp-zero')
    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
        -- snipet = {
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

local function lsp_diagnostics()
    local lsp_zero = require('lsp-zero')
    lsp_zero.set_sign_icons({
        error = ' ',
        warning = ' ',
        info = '󰋽 ',
        hint = '󰌶 ',
    })

    vim.diagnostic.config({
        virtual_text = true,
    })
end

local function lsp_keymaps()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', 'gd', function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set('n', 'K', function()
            vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set('n', '<leader>vws', function()
            vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set('n', '<leader>vd', function()
            vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set('n', '[d', function()
            vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set('n', ']d', function()
            vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set('n', '<leader>vca', function()
            vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set('n', '<leader>vrr', function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set('n', '<leader>vrn', function()
            vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set('i', '<C-h>', function()
            vim.lsp.buf.signature_help()
        end, opts)

        -- if client.server_capabilities.inlayHintProvider then
        --     vim.lsp.inlay_hint.enable(bufnr, true)
        -- end
    end)
end

local function lsp_config()
    local servers = { 'lua_ls', 'pyright', 'clangd' }

    lspconfigure(servers)

    mason_config(servers)

    cmp_setup()

    lsp_diagnostics()

    lsp_keymaps()

    -- local luasnip = require('luasnip')

    -- lsp_zero.format_on_save({
    --     format_opts = {
    --         async = false,
    --         timeout_ms = 1000,
    --     },
    --     servers = {
    --         ['lua_ls'] = { 'lua' },
    --         ['rust_analyzer'] = { 'rust' },
    --         ['eslint'] = {
    --             'javascript',
    --             'javascriptreact',
    --             'typescript',
    --             'typescriptreact',
    --         },
    --     },
    -- })
end

return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            -- formatters

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',

            'windwp/nvim-autopairs',
            'folke/lazydev.nvim',

            -- snippet
            { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        },
        config = lsp_config,
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
    },
}
