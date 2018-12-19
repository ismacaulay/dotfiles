" ----- Plugins ------
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'

if has('unix')
    let s:uname = substitute(system('uname -s'), '\n', '', '')
    if s:uname == 'Darwin'
        Plug '/usr/local/opt/fzf'
    else
        Plug '/usr/bin/fzf'
    endif
endif
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'scrooloose/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-grepper'
Plug 'tomtom/tcomment_vim'

" Initialize plugin system
call plug#end()

" ----- General ------
syntax on
set number
set cursorline
set nowrap
set relativenumber

" ----- Tabs -----
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
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

" ----- Theme ------
colorscheme zenburn

" ----- Keybindings -----
let mapleader = "\<Space>"

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Leader>w <C-w>

map <C-p> :FZF<CR>
map <C-n> :NERDTreeToggle<CR>

" ----- NERDTree ------
let g:NERDTreeNodeDelimiter = "\u00a0"  " Hack to fix NERDTree delim

" ----- fzf ------
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

