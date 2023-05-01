call plug#begin("~/.vim/plugged")

Plug 'airblade/vim-gitgutter'
Plug 'blindFS/vim-taskwarrior'
Plug 'chrisbra/unicode.vim'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'francoiscabrol/ranger.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vader.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'mswift42/vim-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'puremourning/vimspector'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'rbgrouleff/bclose.vim'
Plug 'rbong/vim-flog'
Plug 'roxma/nvim-yarp', v:version >= 800 && !has('nvim') ? {} : { 'on': [], 'for': [] }
Plug 'roxma/vim-hug-neovim-rpc', v:version >= 800 && !has('nvim') ? {} : { 'on': [], 'for': [] }
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'simeji/winresizer'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-yoink'
Plug 'tribela/vim-transparent'
Plug 'tools-life/taskwiki'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'troydm/zoomwintab.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'voldikss/fzf-floaterm'
Plug 'voldikss/vim-floaterm'

Plug 'MattesGroeger/vim-bookmarks'
Plug 'NoahTheDuke/vim-just'

call plug#end()

syntax enable
filetype plugin indent on

let mapleader="\<space>"

let g:rustfmt_autosave = 1
