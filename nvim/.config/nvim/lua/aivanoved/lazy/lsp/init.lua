local typedef = require('aivanoved.lazy.lsp.typedef')

LUA_LS = typedef.validate_lsp_config({
    lsp_name = 'lua_ls',
    ensure_installed = true,
})

BASEDPYRIGHT = typedef.validate_lsp_config({
    lsp_name = 'basedpyright',
    ensure_installed = true,
})

TYPOS_LSP = require('aivanoved.lazy.lsp.typos_lsp')

CLANGD = typedef.validate_lsp_config({
    lsp_name = 'clangd',
    ensure_installed = true,
})

RUST_ANALYZER = typedef.validate_lsp_config({
    lsp_name = 'rust_analyzer',
    ensure_installed = true,
    client_config = {
        settings = {
            ['rust-analyzer'] = {
                check = {
                    command = 'clippy',
                },
                checkOnSave = {
                    enable = true,
                },
            },
        },
    },
})

---@type table<string, aivanoved.lsp.LspConfig>
SERVER_CONFIGS = {
    lua_ls = LUA_LS,
    basedpyright = BASEDPYRIGHT,
    typos_lsp = TYPOS_LSP,
    clangd = CLANGD,
    rust_analyzer = RUST_ANALYZER,
}

--- @return string[]
local function ensure_servers()
    local ensured_servers = {}
    for _, config in pairs(SERVER_CONFIGS) do
        if config.ensure_installed then
            table.insert(ensured_servers, config.lsp_name)
        end
    end
    return ensured_servers
end

---@param client vim.lsp.Client
---@param bufnr integer
local function on_attact_inlay(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr })
    vim.api.nvim_set_hl(0, 'LspInlayHint', { link = 'Comment' })
end

---@return aivanoved.lsp.ClientConfig
local function default_config()
    return {
        on_attach = on_attact_inlay,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
    }
end

---@param server string
---@param server_configs table<string, aivanoved.lsp.LspConfig>
---@return function()
local function get_server_handler(server, server_configs)
    local lspconfig = require('lspconfig')
    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    local client_config = server_configs[server].client_config or default_config()

    client_config.capabilities =
        vim.tbl_deep_extend('force', cmp_capabilities, client_config.capabilities or {})

    local old_on_attach = client_config.on_attach

    client_config.on_attach = function(client, bufnr)
        on_attact_inlay(client, bufnr)
        if old_on_attach then
            old_on_attach(client, bufnr)
        end
    end

    return function()
        lspconfig[server].setup(client_config)
    end
end

--- @param server_name string
local function default_handler(server_name)
    local lspconfig = require('lspconfig')

    lspconfig[server_name].setup(default_config())
end

local function lspconfigure()
    local lspconfig = require('lspconfig')
    local mason_lspconfig = require('mason-lspconfig')
    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- the documentation of `lsp-zero` suggests
    -- before any of the language servers are set up
    -- you need to add `cmp_nvim_lsp` to `lspconfig` capabilities
    local lspconfig_default = lspconfig.util.default_config
    lspconfig_default.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_default.capabilities or {},
        cmp_capabilities
    )

    local handlers = {
        default_handler,
    }

    for server, _ in pairs(SERVER_CONFIGS) do
        handlers[server] = get_server_handler(server, SERVER_CONFIGS)
    end

    mason_lspconfig.setup({
        ensure_installed = ensure_servers(),
        handlers = handlers,
        automatic_installation = true,
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
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },

    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup({})
        end,
    },
}
