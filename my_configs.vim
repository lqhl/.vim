" tags
set tags=./tags;/

" case-insensitive filename completion
set wildignorecase

" Chinese support
set fileencodings=utf-8,gb2312,gbk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Make Y behave like other capitals
map Y y$

" highlight current line
set cursorline

" set the filetype of .tex file as latex
let g:tex_flavor='latex'

" break Chinese words
set formatoptions+=mM

set mouse=a

if has("nvim")
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

nnoremap <Leader>l :Ack <cword><CR>
noremap <Leader>z :Ack 
