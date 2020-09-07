#!/bin/sh
wm_name="$($HOME/.dotfiles/scripts/wm_name.sh)"
echo $wm_name
if [ $wm_name == 'dwm' ]; then
  $HOME/.dotfiles/scripts/dwm_bar/bar.sh &
elif [ $wm_name == 'bspwm' ]; then
  $HOME/.dotfiles/scripts/polybar.sh &
fi

fcitx5 &
picom -b &
$HOME/.dotfiles/scripts/wallpapers.sh &

