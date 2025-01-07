return {}
--     {
--             'nvim-lualine/lualine.nvim',
--             dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
--         },
--         {
--                 'nvim-telescope/telescope.nvim',
--                 tag = '0.1.5',
--                 dependencies = 'nvim-lua/plenary.nvim',
--             },
--             {
--                     'nvim-treesitter/nvim-treesitter',
--                     build = ':TSUpdate',
--                 },
--                 {
--                         'nvim-neo-tree/neo-tree.nvim',
--                         branch = 'v3.x',
--                         dependencies = {
--                                 'nvim-lua/plenary.nvim',
--                                 'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
--                                 'MunifTanjim/nui.nvim',
--                                 -- "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
--                             },
--                         },
--                         {
--                                 'numToStr/Comment.nvim',
--                                 opts = {},
--                                 lazy = false,
--                             },
--                             {
--                                     'rbong/vim-flog',
--                                     lazy = true,
--                                     cmd = { 'Flog', 'Flogsplit', 'Floggit' },
--                                     dependencies = {
--                                             'tpope/vim-fugitive',
--                                         },
--                                     },
--                                     'ryanoasis/vim-devicons',
--                                     'tpope/vim-abolish',
--                                     'tpope/vim-capslock',
--                                     'tpope/vim-commentary',
--                                     'tpope/vim-eunuch',
--                                     'tpope/vim-fugitive',
--                                     'tpope/vim-rhubarb',
--                                     'tpope/vim-repeat',
--                                     'tpope/vim-surround',
--                                     'tpope/vim-unimpaired',
--                                     'tribela/vim-transparent',
--                                     'NoahTheDuke/vim-just',
--                                     { 'VonHeikemen/lsp-zero.nvim',        branch = 'v4.x' },
--                                     -- LSP Support
--                                     { 'neovim/nvim-lspconfig' },
--                                     { 'williamboman/mason.nvim' },
--                                     { 'williamboman/mason-lspconfig.nvim' },
--                                     -- formatters
--                                     {
--                                             'stevearc/conform.nvim',
--                                             opts = {},
--                                         },
--
--                                         -- Autocompletion
--                                         { 'hrsh7th/nvim-cmp' },
--                                         { 'hrsh7th/cmp-nvim-lsp' },
--                                         -- { 'L3MON4D3/LuaSnip',                 version = 'v2.*' },
--                                         { 'hrsh7th/cmp-buffer' },
--                                         { 'hrsh7th/cmp-path' },
--                                         -- { 'saadparwaiz1/cmp_luasnip' },
--
--                                         {
--                                                 'mrcjkb/rustaceanvim',
--                                                 version = '^4', -- Recommended
--                                                 lazy = false,   -- This plugin is already lazy
--                                             },
--
--                                             {
--                                                     "zbirenbaum/copilot.lua",
--                                                 },
--                                                 {
--                                                         "zbirenbaum/copilot-cmp",
--                                                         config = function()
--                                                                 require("copilot_cmp").setup()
--                                                             end
--                                                         },
