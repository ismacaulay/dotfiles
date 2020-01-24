set encoding=utf-8

" ----- Plugins ------
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'

" fzf
if has('unix')
    let s:uname = substitute(system('uname -s'), '\n', '', '')
    if s:uname == 'Darwin'
        Plug '/usr/local/opt/fzf'
    else
        Plug '/usr/bin/fzf'
    endif
endif
Plug 'junegunn/fzf.vim'

" javascript
Plug 'HerringtonDarkholme/yats.vim'

" glsl
Plug 'tikhomirov/vim-glsl'

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-grepper'
Plug 'tomtom/tcomment_vim'

" status lines
Plug 'itchyny/lightline.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" ctags
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'majutsushi/tagbar'

" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'rhysd/vim-clang-format'

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
set tabstop=4
set shiftwidth=4
set expandtab

" ----- Theme ------
colorscheme gruvbox
set background=dark

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

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap ; :

map <C-p> :FZF<CR>

nnoremap <esc><esc> :noh<return>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

nnoremap <leader>g :Grepper -tool rg<CR>
nnoremap <leader>G :Grepper -tool rg -cword -noprompt<cr>

nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

autocmd FileType c,cpp,objc,glsl,frag,vert nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,glsl,frag,vert vnoremap <buffer><leader>cf :ClangFormat<CR>

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

command! -nargs=0 CE :CocCommand eslint.executeAutofix
nmap <leader>ef  :CE<cr>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> <leader>p :<C-u>CocList -I symbols<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <leader>te :tabe<cr>
nnoremap <leader>tc :tabc<cr>

nnoremap <leader>o :call CurtineIncSw()<cr>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" I always it W so just make it write instead of the fzf command
command! W  write

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ----- NERDTree ------
let g:NERDTreeNodeDelimiter = "\u00a0"  " Hack to fix NERDTree delim

" ----- fzf ------
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let $FZF_DEFAULT_COMMAND = "rg --hidden --files -g !.git"


" ----- quick fix -----
au FileType qf wincmd J

" ----- save on focus lost -----
":au FocusLost * silent! wa

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

" ----- status line -----
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status'
    \ },
    \ }

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" ----- clipboard -----
set clipboard+=unnamed
