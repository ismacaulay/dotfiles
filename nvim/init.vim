
" ----- General ------
set encoding=utf-8
set noswapfile
set nobackup
set incsearch
set clipboard+=unnamed
set clipboard+=unnamedplus
syntax on
set number
set cursorline
set nowrap
set relativenumber

" ----- Tabs -----
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" ----- Whitespace -----
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    keepp %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
set list
set list listchars=tab:→\ ,trail:·

" ----- Keybindings -----
let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'christoomey/vim-tmux-navigator'

Plug 'airblade/vim-gitgutter'

Plug 'sbdchd/neoformat'

Plug 'tpope/vim-commentary'

call plug#end()

" ----- Theme ------
colorscheme gruvbox
set background=dark

" ----- LSP Completion config ------
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

vmap <leader>f :Neoformat<CR>
nmap <leader>f :Neoformat<CR>

