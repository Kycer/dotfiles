" 禁止使用方向键
nnoremap <Left> :echo "使用 h 左移"<CR>
nnoremap <Right> :echo "使用 l 右移"<CR>
nnoremap <Up> :echo "使用 k 上移"<CR>
nnoremap <Down> :echo "使用 j 下移"<CR>

set pastetoggle=<F2>

let mapleader=','
let	g:mapleader=','

inoremap jj <Esc>`^

inoremap <leader>w <Esc>:w<cr>
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O
noremap <leader>w :w<cr>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


" sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" json 格式化
com! FormatJSON %!python3 -m json.tool

if dein#tap('dein.vim')
	nnoremap <silent> <Leader>u  :call dein#update()<CR>
	nnoremap <silent> <Leader>r  :call dein#recache_runtimepath()<CR>
	nnoremap <silent> <Leader>l  :echo dein#get_updates_log()<CR>
endif

if dein#tap('defx.nvim')
	nnoremap <silent> <Leader>e
		\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
	nnoremap <silent> <Leader>F
		\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
endif



