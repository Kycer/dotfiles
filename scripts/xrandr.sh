#!/bin/bash
# xrandr --output eDP --scale 1x1 --mode 1920x1200 --output DisplayPort-1 --off --output DisplayPort-0 --right-of eDP --auto &
# xrandr --output eDP --scale 0.7x0.7 --mode 2560x1600 --pos 1920x0  --output DisplayPort-1 --off --output DisplayPort-0  --scale 1x1 --mode 1920x1080 --pos 0x40  --fb 3712x1120

pkill -f wallpapers.sh &
$HOME/.dotfiles/scripts/wallpapers.sh &

wm_name="$($HOME/.dotfiles/scripts/wm_name.sh)"
monitors=($(xrandr --query | grep " connected" | cut -d" " -f1))

if [ $wm_name == 'dwm' ]; then
  $HOME/.dotfiles/scripts/dwm_bar/bar.sh &
elif [ $wm_name == 'bspwm' ]; then
  bspc wm -r &
  $HOME/.dotfiles/scripts/polybar.sh &
fi

exit