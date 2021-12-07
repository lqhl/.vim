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
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/YankRing.vim'
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
if has('unix')
    if has('mac')
        Plug 'wakatime/vim-wakatime'
    endif
endif
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

call plug#end()
call glaive#Install()

" plugin: morhetz/gruvbox
colorscheme gruvbox

" plugin: scrooloose/nerdtree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

" plugin: vim-scripts/YankRing.vim
let g:yankring_history_dir = '~/.vim/temp_dirs/'

" plugin: vim-codefmt
Glaive codefmt plugin[mappings]
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

nnoremap <Leader>l :Ack <cword><CR>
vnoremap <Leader>l y:Ack <C-r>=fnameescape(@")<CR><CR>
noremap <Leader>z :Ack 

" plugin junegunn/fzf.vim
map <C-f> :Files<cr>
nnoremap <Leader>f :Ag <C-r><C-w><CR>
vnoremap <Leader>f y:Ag <C-r>=fnameescape(@")<CR><CR>
map <leader>g :Ag<cr>
map <leader>t :Tags<cr>
map <leader>c :BTags<cr>
map <leader>b :BLines<cr>
