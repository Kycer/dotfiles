#!/bin/bash

# pkill -f wallpapers.sh &
wm_name="$($HOME/.dotfiles/scripts/wm_name.sh)"

wallpaper_dir="$HOME/Pictures/wallpaper"
path="$HOME/.dotfiles/scripts/wallpaper"

if [ ! -d "$wallpaper_dir" ]; then
    mkdir $wallpaper_dir
fi

function change () {
	# feh --bg-max --randomize --bg-fill "$wallpaper_dir"

  if [ $wm_name == 'wlroots' ]; then
   killall swaybg
   swaybg -i $(find $HOME/Pictures/wallpaper -type f | shuf -n 1) -m fill &
  else
  	python "$path/wallpaper.py" -r
  fi
}

function init () {
	[ -f /tmp/wallpaper.lock ] && exit
	echo $$ > /tmp/wallpaper.lock
	while true; do
		change
		sleep 5m
	done
}

case $1 in
		i)
				init
				;;
		c)
				change
				;;
		r)
				rm /tmp/wallpaper.lock
				;;
		*)
				echo "-$opt not recognized"
				;;
esac
