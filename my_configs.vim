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

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" Mappings to access buffers (don't use ",p" because a
" delay before pressing "p" would accidentally paste).
" ,l       : list buffers
" ,b ,f ,g : go back/forward/last-used
" ,1 ,2 ,3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" toggle colorcolumn
function! g:ToggleColorColumn()
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=+1
    endif
endfunction
nnoremap <silent> <leader>h :call g:ToggleColorColumn()<CR>
highlight ColorColumn ctermbg=blue guibg=blue

" set C/C++ indent options
set cino=g0,t0

" highlight current line
set cursorline

" set the filetype of .tex file as latex
let g:tex_flavor='latex'

" break Chinese words
set formatoptions+=mM

" add clang-format support
if has('unix')
  if has('mac')       " osx
    map <leader>k :pyf /usr/local/Cellar/clang-format/2016-06-27/share/clang/clang-format.py<cr>
    imap <C-K> <c-o>:pyf /usr/local/Cellar/clang-format/2016-06-27/share/clang/clang-format.py<cr>
  else                " linux, bsd, etc
    map <leader>k :pyf /usr/share/vim/addons/syntax/clang-format-3.8.py<cr>
    imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.8.py<cr>
  endif
endif

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/moqi/', 'path_html': '~/Dropbox/vimwiki/moqi_html/'},
            \ {'path': '~/Dropbox/vimwiki/research/', 'path_html': '~/Dropbox/vimwiki/research/'}]
