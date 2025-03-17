---@return string[]
local function ensure_servers()
    return { 'lua_ls', 'basedpyright', 'clangd' }
end

local function lspconfigure()
    local default_servers = ensure_servers()
    local lsp_zero = require('lsp-zero')

    local lspconfig = require('lspconfig')
    local mason_lspconfig = require('mason-lspconfig')

    -- the documentation of `lsp-zero` suggests
    -- before any of the language servers are set up
    -- you need to add `cmp_nvim_lsp` to `lspconfig` capabilities
    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lspconfig_default = lspconfig.util.default_config
    lspconfig_default.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_default.capabilities or {},
        cmp_capabilities
    )

    ---@param server string
    ---@param default_server_setup table<string, table>
    ---@return function
    local function get_default_handler(server, default_server_setup)
        local server_setup = default_server_setup[server] or {}
        server_setup.capabilities = vim.tbl_deep_extend(
            'force',
            server_setup.capabilities or {},
            cmp_capabilities
        )
        local function default_handler()
            lspconfig[server].setup(server_setup)
        end

        return default_handler
    end

    ---@type table<string, table>
    local default_server_setup = {
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

    local handlers = {
        lsp_zero.default_setup,
    }

    for _, server in ipairs(default_servers) do
        handlers[server] = get_default_handler(server, default_server_setup)
    end

    mason_lspconfig.setup({
        ensure_installed = default_servers,
        handlers = handlers,
    })
end

local function mason_config()
    local mason = require('mason')

    mason.setup({})
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
    mason_config()

    lspconfigure()

    cmp_setup()

    lsp_diagnostics()

    lsp_keymaps()

    -- local luasnip = require('luasnip')
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
