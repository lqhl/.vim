if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  if has('nvim')
      set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  else
      set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif
endif

" Required:
if has('nvim')
    call neobundle#begin(expand('~/.config/nvim/bundle/'))
else
    call neobundle#begin(expand('~/.vim/bundle/'))
endif

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
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
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
NeoBundle 'salsifis/vim-transpose'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'rust-lang/rust.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
