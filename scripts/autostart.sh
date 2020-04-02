#!/bin/sh

fcitx &
picom -b --xrender-sync --xrender-sync-fence --experimental-backends &
~/.dotfiles/scripts/wallpapers.sh &
~/.dotfiles/scripts/dwm_bar/bar.sh &