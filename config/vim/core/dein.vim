"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Add or remove your plugins here like this:
  call dein#load_toml('~/.dotfiles/config/vim/config/plugins.toml', {'lazy': 0})
  call dein#load_toml('~/.dotfiles/config/vim/config/plugins-lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------