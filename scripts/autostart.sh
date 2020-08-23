#!/bin/sh

fcitx5 &
picom -b --experimental-backends --config ~/.dotfiles/config/picom/picom.conf &
~/.dotfiles/scripts/wallpapers.sh &
~/.dotfiles/scripts/dwm_bar/bar.sh &
