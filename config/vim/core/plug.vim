" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" UI
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'

" Code Style
Plug 'sgur/vim-editorconfig'

Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'


" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Initialize plugin system
call plug#end()