local function lsp_config()
    require('mason').setup()
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
            { 'mason-org/mason.nvim', version = 'v2.*' },
            { 'mason-org/mason-lspconfig.nvim', version = 'v2.*' },
            'folke/lazydev.nvim',

            -- formatters
            'windwp/nvim-autopairs',

            -- Autocompletion
            {
                'saghen/blink.cmp',
                version = '1.*',
            },

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
