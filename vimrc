set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
"Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

" Set tabs to 3
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoread

" Preferences
syntax on
set number

set cursorline
set nowrap

set hidden

" Coloschemes
"colorscheme noctu
colorscheme Tomorrow-Night-Eighties
"colorscheme monokai
"colorscheme wombat

"let g:airline_theme='monochrome'
"let g:airline#extensions#tabline#enabled=1

"set wildignore=*.o,,*.obj,*.hi,*.class,*.jar

" Save on focus lost
:au FocusLost * silent! wa

" Key mapping
"close current buffer
nnoremap <C-c> :bp\|bd #<CR>

