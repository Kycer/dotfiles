" 插件
if filereadable(expand("~/.vim/vimrc.plugin"))
  source ~/.vim/vimrc.plugin
endif

" 基本设置
if filereadable(expand("~/.vim/vimrc.setting"))
  source ~/.vim/vimrc.setting
endif

