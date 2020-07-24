#!/bin/sh

fcitx5 &
picom -b --experimental-backends &
~/.dotfiles/scripts/wallpapers.sh &
~/.dotfiles/scripts/dwm_bar/bar.sh &
