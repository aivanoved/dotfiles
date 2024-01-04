return require('lazy').setup({
    'airblade/vim-gitgutter',
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons', "catppuccin" },
        config = function()
            require("bufferline").setup {
                highlights = require("catppuccin.groups.integrations.bufferline").get()

            }
        end
    },
    -- 'blindFS/vim-taskwarrior',
    { "catppuccin/nvim",  name = "catppuccin" },
    'christoomey/vim-tmux-navigator',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    'lambdalisue/glyph-palette.vim',
    'lambdalisue/nerdfont.vim',
    'mbbill/undotree',
    'mhartington/formatter.nvim',
    'mhinz/vim-startify',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'powerman/vim-plugin-AnsiEsc',
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    'puremourning/vimspector',
    { 'raghur/vim-ghost', build = ':GhostInstall' },
    {
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive",
        },
    },
    'ryanoasis/vim-devicons',
    'skywind3000/asynctasks.vim',
    'skywind3000/asyncrun.vim',
    'svermeulen/vim-cutlass',
    'tpope/vim-abolish',
    'tpope/vim-capslock',
    'tpope/vim-commentary',
    'tpope/vim-eunuch',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'tribela/vim-transparent',
    -- 'tools-life/taskwiki',
    { 'vimwiki/vimwiki',                  branch = 'dev' },
    'NoahTheDuke/vim-just',
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' }
})
