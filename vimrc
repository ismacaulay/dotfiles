" ----- Plugins ------
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'qpkorr/vim-bufkill'

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
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" glsl
Plug 'tikhomirov/vim-glsl'

" go
Plug 'fatih/vim-go'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-grepper'
Plug 'tomtom/tcomment_vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" linting
" Plug 'w0rp/ale'

" completion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" let g:deoplete#enable_at_startup = 1
" Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" ctags
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'majutsushi/tagbar'

" lsp
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'ryanolsonx/vim-lsp-typescript'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

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
" inoremap jj <esc>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Leader>w <C-w>

map <C-p> :FZF<CR>
map <C-n> :NERDTreeToggle<CR>

nnoremap <esc><esc> :noh<return>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

nnoremap <leader>g :Grepper -tool ag<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" ----- deoplete -----
" let g:deoplete#sources#go#gocode_binary = $HOME.'/go/bin/gocode'
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" set completeopt-=preview

" ----- gutentags -----
" let g:gutentags_project_root = ['Makefile']
" set statusline+=%{gutentags#statusline()}

" ----- tagbar -----
" let g:tagbar_type_typescript = {
"   \ 'ctagstype': 'typescript',
"   \ 'kinds': [
"     \ 'c:classes',
"     \ 'n:modules',
"     \ 'f:functions',
"     \ 'v:variables',
"     \ 'v:varlambdas',
"     \ 'm:members',
"     \ 'i:interfaces',
"     \ 'e:enums',
"   \ ]
"   \ }

" ----- ALE -----
" let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'typescript': ['prettier'],
" \   'css': ['prettier'],
" \}
" let g:ale_linters_explicit = 1
" let g:ale_fix_on_save = 1

" ----- coc -----

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
