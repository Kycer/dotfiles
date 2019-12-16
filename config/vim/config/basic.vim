" 去掉vi的一致性
set nocompatible

" 设置编码
set helplang=cn
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 设置以unix的格式保存文件
set fileformat=unix

" 设置行号
set number

" 设置折叠方式
" set foldmethod=indent

" 显示相对行号
set relativenumber

" 突出显示当前列
"set cul
"set cuc

" 显示括号匹配
set showmatch

" 隐藏顶部标签栏
set showtabline=0

" 距离顶部和底部1行
set scrolloff=1

" 设置C样式的缩进格式
set cindent

" 设置Tab长度为4空格
set tabstop=4
" 设置自动缩进长度为4空格
set shiftwidth=4
" 继承前一行的缩进方式，适用于多行注释
set autoindent
set backspace=2
" 显示空格和tab键
set listchars=tab:>-,trail:-

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler

" 启用鼠标
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key

" 粘贴模式
" set paste

" 不要备份文件
set nobackup

" 查询匹配
set incsearch

"语法高亮"
syntax enable
syntax on
set t_Co=256

"设置字体"
set guifont=Monaco:h14

" 主题
colorscheme gruvbox
set background=dark
