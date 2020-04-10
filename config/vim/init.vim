for f in split(glob("~/.dotfiles/config/vim/core/*.vim"), '\n')
    exe 'source' f
endfor
