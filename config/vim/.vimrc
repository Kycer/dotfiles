" 插件
if filereadable(expand("~/.vim/config/vimrc.plugin"))
  source ~/.vim/config/vimrc.plugin
endif

" 基本设置
if filereadable(expand("~/.vim/config/vimrc.setting"))
  source ~/.vim/config/vimrc.setting
endif
