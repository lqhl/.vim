lqhl's VIM Configuration
========================

Installation
------------

Run in the terminal

```bash
git clone https://github.com/lqhl/.vim $HOME/.vim
# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$HOME/.vim/install.sh
```

Install plugins in vim with **vim-plug**:
```
:PlugInstall
```

If you upgrade this config from v2, you need to clean and reinstall some plugins:
```
:PlugClean
:PlugInstall
```


Requirements
------------

My config works with Vim7. But to enable [deoplete.nvim](https://github.com/Shougo/deoplete.nvim),
you need [Neovim or Vim8 with python3 support](https://github.com/Shougo/deoplete.nvim/#requirements).


Credits
-------

[basic.vim](./vimrcs/basic.vim) is taken from [The Ultimate vimrc](https://github.com/amix/vimrc).
And I found many useful snippets and plugins from it.

To manage Vim plugins, I use [vim-plug](https://github.com/junegunn/vim-plug), a minimalist Vim plugin manager.


History
-------

This is **v3** of my vim configuration:

- [v1](https://github.com/lqhl/vimrc) was a fork of [The Ultimate vimrc](https://github.com/amix/vimrc)
- [v2](https://github.com/lqhl/.vim/tree/v2) manages plugins with [neobundle](https://github.com/Shougo/neobundle.vim)
