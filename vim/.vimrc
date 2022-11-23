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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'

Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

Plug 'NoahTheDuke/vim-just'

Plug 'blindFS/vim-taskwarrior'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'tools-life/taskwiki'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

syntax enable
filetype plugin indent on

let g:rustfmt_autosave = 1
