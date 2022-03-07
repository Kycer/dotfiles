#!/bin/bash

# pkill -f wallpapers.sh &

wallpaper_dir="$HOME/Pictures/wallpaper"
path="$HOME/.dotfiles/scripts/wallpaper"

if [ ! -d "$wallpaper_dir" ]; then
    mkdir $wallpaper_dir
fi

function change () {
	# feh --bg-max --randomize --bg-fill "$wallpaper_dir"
	python "$path/wallpaper.py" -r
}

function init () {
	[ -f /tmp/wallpaper.lock ] && exit
	echo $$ > /tmp/wallpaper.lock
	while true; do
		change
		sleep 1m
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
