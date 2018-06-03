set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'

"set rtp+=/usr/local/opt/fzf
"Plugin 'junegunn/fzf.vim'
"Plugin 'pbogut/fzf-mru.vim'

"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'

"Plugin 'majutsushi/tagbar'

"Plugin 'mileszs/ack.vim'

"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/vimproc.vim'

"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call plug#end()            " required

" ----- General ------
syntax on
set number
set cursorline
set nowrap
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

set backspace=indent,eol,start

" ----- Theme ------
colorscheme zenburn
"colorscheme Tomorrow-Night-Eighties

" ----- NERDTree ------
" Close Vim if the only window left open is NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ----- YouCompleteMe ------
"let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
"let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
"let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
"let g:ycm_complete_in_comments = 1 " Completion in comments
"let g:ycm_complete_in_strings = 1 " Completion in string

"let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Goto definition with F3
"map <F3> :YcmCompleter GoTo<CR>


" ----- Keybindings -----

map <F1> :NERDTreeFocus<CR>
"map <C-p> :FZF<CR>
"map <F2> :TagbarToggle<CR>

"function! Search(string)
"  set shellpipe=>
"  execute "Ack! \"" . a:string . "\""
"  set shellpipe=2>&1\|tee
"endfunction
"nnoremap <C-f> :call Search("")<left><left>

"nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
"map <C-f> :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
"if executable('pt')
"  let g:unite_source_grep_command = 'pt'
"  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
"  let g:unite_source_grep_recursive_opt = ''
"  let g:unite_source_grep_encoding = 'utf-8'
"endif




