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
    'blindFS/vim-taskwarrior',
    { "catppuccin/nvim", name = "catppuccin" },
    'chrisbra/unicode.vim',
    'chriskempson/base16-vim',
    'christoomey/vim-tmux-navigator',
    'francoiscabrol/ranger.vim',
    'ghifarit53/tokyonight-vim',
    'gosukiwi/vim-atom-dark',
    'jiangmiao/auto-pairs',
    'joshdick/onedark.vim',
    'junegunn/vader.vim',
    'lambdalisue/glyph-palette.vim',
    'lambdalisue/nerdfont.vim',
    'lervag/vimtex',
    'ludovicchabant/vim-gutentags',
    'mbbill/undotree',
    'mhartington/formatter.nvim',
    'mhinz/vim-startify',
    'mswift42/vim-themes',
    'nathanaelkane/vim-indent-guides',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },
    {
        'nvim-telescope/telescope.nvim', version = '0.1.1',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'wbthomason/packer.nvim',
    'powerman/vim-plugin-AnsiEsc',
    'preservim/nerdtree',
    'preservim/nerdcommenter',
    'puremourning/vimspector',
    'rafi/awesome-vim-colorschemes',
    { 'raghur/vim-ghost', build = ':GhostInstall' },
    'rbgrouleff/bclose.vim',
    'rbong/vim-flog',
    'ryanoasis/vim-devicons',
    'simeji/winresizer',
    'skywind3000/asynctasks.vim',
    'skywind3000/asyncrun.vim',
    'svermeulen/vim-cutlass',
    'svermeulen/vim-subversive',
    'svermeulen/vim-yoink',
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
    'tools-life/taskwiki',
    'troydm/zoomwintab.vim',
    { 'vimwiki/vimwiki', branch = 'dev' },
    'MattesGroeger/vim-bookmarks',
    'NoahTheDuke/vim-just',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig', -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            'williamboman/mason-lspconfig.nvim', -- Optional

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp', -- Required
            'L3MON4D3/LuaSnip',     -- Required
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        }
    }
})
