#!/bin/sh
wm_name="$($HOME/.dotfiles/scripts/wm_name.sh)"
echo $wm_name
if [ $wm_name == 'bspwm' ]; then
  $HOME/.dotfiles/scripts/polybar.sh 'bspwm.ini' &
elif [ $wm_name == 'dwm' ]; then
  # $HOME/.dotfiles/scripts/polybar.sh 'dwm.ini' &
  $HOME/.dotfiles/scripts/dwm_bar/bar.sh
fi

picom -b --experimental-backends &
fcitx5 &
$HOME/.dotfiles/scripts/wallpaper/wallpapers.sh i &
