local function lsp_config()
    require('aivanoved.lazy.lsp.mason').mason_config()
    require('aivanoved.lazy.lsp.lspconfigure').lspconfigure()
    require('aivanoved.lazy.lsp.cmp').cmp_setup()
    require('aivanoved.lazy.lsp.diagnostics').lsp_diagnostics()
    require('aivanoved.lazy.lsp.keymaps').lsp_keymaps()
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
        ft = 'lua',
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
