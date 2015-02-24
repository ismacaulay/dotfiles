set smartindent
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

syntax on
set number

set cursorline
set nowrap

execute pathogen#infect()

set runtimepath^=~/.vim/bundle/ctrlp.vim

"colorscheme noctu
colorscheme Tomorrow-Night-Eighties
"colorscheme monokai

let g:airline_theme='monochrome'
let g:airline#extensions#tabline#enabled=1

set wildignore=*.o,,*.obj,*.hi

