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

" set wildignore+=**/.git/*
" set wildignore+=**/vendor/*

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
command! W  write
nnoremap <esc> :noh<return><esc>

" ----- refresh on focus -----
set autoread
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" for polyglot
set nocompatible
call plug#begin('~/.vim/plugged')

" syntax highlighting/colour scheme
Plug 'gruvbox-community/gruvbox'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'sheerun/vim-polyglot'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" lsp and formatting
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Plug 'sbdchd/neoformat'

" :CocInstall coc-clangd coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-pyright coc-svelte
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/telescope-coc.nvim'

" tools
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'rhysd/vim-clang-format'

call plug#end()

" ----- Theme ------
colorscheme gruvbox
set background=dark

" ----- LSP Completion config ------
" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" vmap <leader>f :Neoformat<CR>
" nmap <leader>f :Neoformat<CR>

" ----- NERDTree ------
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

" ----- CoC ------
command! -nargs=0 CE :CocCommand eslint.executeAutofix
nmap <leader>ef  :CE<cr>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent> <leader>p :<C-u>CocList -I symbols<cr>
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)
nmap <leader>rn <Plug>(coc-rename)

autocmd FileType c,cpp,objc,glsl,frag,vert nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,glsl,frag,vert vnoremap <buffer><leader>cf :ClangFormat<CR>
autocmd FileType c,cpp,objc,glsl,frag,vert nnoremap <buffer><leader>o :CocCommand clangd.switchSourceHeader<CR>

" nmap <silent>gd <Plug>(coc-definition)
" nmap <silent>gy <Plug>(coc-type-definition)
" nmap <silent>gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
nmap <silent> gd :Telescope coc definitions<cr>
nmap <silent> gi :Telescope coc implementations<cr>
nmap <silent> gr :Telescope coc references<cr>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ----- status line -----
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'absolutepath', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status'
    \ },
    \ }
" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" for some reason .frag files are being detected as javascript
autocmd! BufNewFile,BufRead *.frag set filetype=glsl
autocmd FileType glsl setlocal commentstring=//\ %s
