let g:python_host_skip_check=1
let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.vim/plugged')

" themes
Plug 'morhetz/gruvbox'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/defx-icons'

"文件管理器
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" 多点编辑插件
Plug 'terryma/vim-multiple-cursors'

" 代码检查
Plug 'dense-analysis/ale'
" 代码格式化
Plug 'sbdchd/neoformat'
" 补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

call plug#end()



let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
let g:airline_theme='gruvbox'

let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no
	" 使用回车打开文件
	nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
endfunction

call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'listed': 1,
	\ 'show_ignored_files': 0,
	\ 'root_marker': '≡ ',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	\ })

autocmd FileType defx call s:defx_mappings()
