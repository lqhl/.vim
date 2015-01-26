if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
        let g:make = 'make'
endif

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}
NeoBundle 'tpope/vim-commentary'
NeoBundle 'vim-scripts/bufexplorer.zip'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/YankRing.vim'
" remember to add `export TERM="xterm-256color"` in .zshrc or .bashrc
NeoBundle 'bling/vim-airline'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'godlygeek/tabular'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
