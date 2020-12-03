for f in split(glob("~/.dotfiles/config/vim/core/*.vim"), '\n')
    exe 'source' f
endfor


for f in split(glob("~/.dotfiles/config/vim/plugins/*.vim"), '\n')
    exe 'source' f
endfor
