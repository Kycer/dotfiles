#!/bin/sh

~/.dotfiles/scripts/polybar.sh &
fcitx5 &
picom -b --experimental-backends &
~/.dotfiles/scripts/wallpapers.sh &
wm="$(wmname)"
if [ "$wm" == 'dwm' ]; then
  ~/.dotfiles/scripts/dwm_bar/bar.sh &
fi
