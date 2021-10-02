if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/bundle')

" Make sure you use single quotes

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/YankRing.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
if has("python3")
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        let g:deoplete#enable_at_startup = 1
    else
        if v:version >= 800
            Plug 'Shougo/deoplete.nvim'
            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
            let g:deoplete#enable_at_startup = 1
        endif
    endif
endif
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'ciaranm/detectindent'
Plug 'jlanzarotta/bufexplorer'
Plug 'mileszs/ack.vim'

call plug#end()
call glaive#Install()

" plugin: morhetz/gruvbox
colorscheme gruvbox

" plugin: ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>j :CtrlPBuffer<cr>
map <leader>r :CtrlPMRUFiles<cr>
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

" plugin: scrooloose/nerdtree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

" plugin: vim-scripts/YankRing.vim
let g:yankring_history_dir = '~/.vim/temp_dirs/'

" plugin: vim-codefmt
Glaive codefmt plugin[mappings]
augroup autoformat_settings
    autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
    autocmd FileType dart AutoFormatBuffer dartfmt
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType gn AutoFormatBuffer gn
    autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
    autocmd FileType java AutoFormatBuffer google-java-format
    autocmd FileType python AutoFormatBuffer yapf
    " Alternative: autocmd FileType python AutoFormatBuffer autopep8
    autocmd FileType rust AutoFormatBuffer rustfmt
    autocmd FileType vue AutoFormatBuffer prettier
augroup END
function s:AddCodefmtEqualMapping() abort
    " Replace all the various ={motion} keys to codefmt
    nnoremap <buffer> = :set opfunc=codefmt#FormatMap<CR>g@
    nnoremap <buffer> == :FormatCode<CR>
    vnoremap <buffer> = :FormatLines<CR>
endfunction
augroup codefmt_equal
    autocmd FileType cpp,proto call s:AddCodefmtEqualMapping()
augroup END

" plugin: ciaranm/detectindent
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

" plugin: jlanzarotta/bufexplorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
map <leader>o :BufExplorer<cr>

" plugin: ack.vim
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
