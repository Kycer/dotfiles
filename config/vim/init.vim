" 插件
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

" 基本设置
if filereadable(expand("~/.vim/basic.vim"))
  source ~/.vim/basic.vim
endif

" 快捷键配置
if filereadable(expand("~/.vim/mappings.vim"))
  source ~/.vim/mappings.vim
endif

