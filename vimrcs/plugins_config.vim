""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim/temp_dirs/'
endif
" disable for neovim
" ref: https://github.com/neovim/neovim/issues/3097#issuecomment-168317907
let g:yankring_clipboard_monitor = (has("nvim") ? 0 : 1)


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't confirm before execute `.ycm_extra_conf.py`
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>

let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config for MATLAB
autocmd FileType matlab set commentstring=\%\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :Tabularize /\s\+\zs<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Solarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
if !has('gui_running')
    " Compatibility for Terminal
    let g:solarized_termtrans=1

    if (&t_Co >= 256 || $TERM == 'xterm-256color')
        " Do nothing, it handles itself.
    else
        " Make Solarized use 16 colors for Terminal support
        let g:solarized_termcolors=16
    endif
endif

colorscheme solarized

