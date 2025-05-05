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
            'folke/lazydev.nvim',
            -- formatters
            'windwp/nvim-autopairs',

            -- Autocompletion
            'saghen/blink.cmp',

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

    -- Autocompletion
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = {
            'fang2hou/blink-copilot',
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
