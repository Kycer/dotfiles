set pastetoggle=<F2>

let mapleader=','
let	g:mapleader=','

inoremap jj <Esc>`^

inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l




" sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" json 格式化
com! FormatJSON %!python3 -m json.tool

