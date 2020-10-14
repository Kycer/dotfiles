#!/bin/sh
wm_name="$($HOME/.dotfiles/scripts/wm_name.sh)"
echo $wm_name
if [ $wm_name == 'bspwm' ]; then
  $HOME/.dotfiles/scripts/polybar.sh 'bspwm.ini' &
# elif [ $wm_name == 'i3' ]; then
  # $HOME/.dotfiles/scripts/polybar.sh 'i3wm.ini' &
fi

picom -b --experimental-backends &
fcitx5 &
$HOME/.dotfiles/scripts/wallpapers.sh &
