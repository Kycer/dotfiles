#!/bin/bash
# xrandr --output eDP --scale 1x1 --mode 1920x1200 --output DisplayPort-1 --off --output DisplayPort-0 --right-of eDP --auto &
# xrandr --output eDP --scale 0.7x0.7 --mode 2560x1600 --pos 1920x0  --output DisplayPort-1 --off --output DisplayPort-0  --scale 1x1 --mode 1920x1080 --pos 0x40  --fb 3712x1120

primary="eDP"
wm_name="$($HOME/.dotfiles/scripts/wm_name.sh)"
monitors=($(xrandr --query | grep " connected" | cut -d" " -f1))

if [ ${#monitors[@]} -eq 1 ] ; then
  all_monitors=($(xrandr --query | grep "connected" | cut -d" " -f1))
  for monitor in ${all_monitors[@]}
  do
    if [ $monitor == $primary ] ; then
      xrandr --output eDP --mode 2560x1600
    else
      xrandr --output $monitor --off
    fi
  done
fi


if [ ${#monitors[@]} -eq 2 ] ; then
  for monitor in ${monitors[@]}
  do
    if [ $monitor == $primary ] ; then
      xrandr --output eDP --mode 2560x1600
    else
      xrandr --output $monitor --mode 1920x1080 --scale 1.6x1.6 --right-of $primary
    fi
  done
fi

if [ $wm_name == 'dwm' ]; then
  $HOME/.dotfiles/scripts/dwm_bar/bar.sh &
elif [ $wm_name == 'bspwm' ]; then
  bspc wm -r &
fi

$HOME/.dotfiles/scripts/wallpaper/wallpapers.sh c

exit