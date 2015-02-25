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
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

set smartindent
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

syntax on
set number

set cursorline
set nowrap

"colorscheme noctu
colorscheme Tomorrow-Night-Eighties
"colorscheme monokai

let g:airline_theme='monochrome'
let g:airline#extensions#tabline#enabled=1

set wildignore=*.o,,*.obj,*.hi,*.class,*.jar

