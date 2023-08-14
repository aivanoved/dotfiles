vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'airblade/vim-gitgutter'
    use {
        'akinsho/bufferline.nvim',
        after = "catppuccin",
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup {
                highlights = require("catppuccin.groups.integrations.bufferline").get()

            }
        end
    }
    use 'blindFS/vim-taskwarrior'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'chrisbra/unicode.vim'
    use 'chriskempson/base16-vim'
    use 'christoomey/vim-tmux-navigator'
    use 'francoiscabrol/ranger.vim'
    use 'ghifarit53/tokyonight-vim'
    use 'gosukiwi/vim-atom-dark'
    use 'jiangmiao/auto-pairs'
    use 'joshdick/onedark.vim'
    use 'junegunn/vader.vim'
    use({
        "epwalsh/obsidian.nvim",
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        config = function()
            require("obsidian").setup({
                dir = "~/obsidian/dev",

                -- see below for full list of options 👇
            })
        end,
    })
    use 'lambdalisue/glyph-palette.vim'
    use 'lambdalisue/nerdfont.vim'
    use 'lervag/vimtex'
    use 'ludovicchabant/vim-gutentags'
    use 'mbbill/undotree'
    use 'mhartington/formatter.nvim'
    use 'mhinz/vim-startify'
    use 'mswift42/vim-themes'
    use 'nathanaelkane/vim-indent-guides'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-treesitter/nvim-treesitter',

        { run = ':TSUpdate' }
    }
    use 'wbthomason/packer.nvim'
    use 'powerman/vim-plugin-AnsiEsc'
    use 'preservim/nerdtree'
    use 'preservim/nerdcommenter'
    use 'puremourning/vimspector'
    use 'rafi/awesome-vim-colorschemes'
    use { 'raghur/vim-ghost', { run = ':GhostInstall' } }
    use 'rbgrouleff/bclose.vim'
    use 'rbong/vim-flog'
    use 'ryanoasis/vim-devicons'
    use 'simeji/winresizer'
    use 'skywind3000/asynctasks.vim'
    use 'skywind3000/asyncrun.vim'
    use 'svermeulen/vim-cutlass'
    use 'svermeulen/vim-subversive'
    use 'svermeulen/vim-yoink'
    use 'tpope/vim-abolish'
    use 'tpope/vim-capslock'
    use 'tpope/vim-commentary'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'tribela/vim-transparent'
    use 'tools-life/taskwiki'
    use 'troydm/zoomwintab.vim'
    use { 'vimwiki/vimwiki', branch = 'dev' }




    use 'MattesGroeger/vim-bookmarks'
    use 'NoahTheDuke/vim-just'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
        }
    }
end)
