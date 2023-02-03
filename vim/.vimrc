call plug#begin("~/.vim/plugged")

Plug 'chriskempson/base16-vim'
Plug 'mswift42/vim-themes'
Plug 'ghifarit53/tokyonight-vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'junegunn/vader.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ludovicchabant/vim-gutentags'

Plug 'mbbill/undotree'

Plug 'rust-lang/rust.vim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'

Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

syntax enable
filetype plugin indent on

let g:rustfmt_autosave = 1
