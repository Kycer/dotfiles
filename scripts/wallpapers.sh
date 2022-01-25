#!/bin/bash

# pkill -f wallpapers.sh &

wallpaper_dir="$HOME/Pictures/wallpaper"

if [ ! -d "$wallpaper_dir" ]; then
    mkdir $wallpaper_dir
fi

function change () {
	feh --bg-max --randomize --bg-fill "$wallpaper_dir"
}

function init () {
	[ -f /tmp/wallpaper.lock ] && exit
	echo $$ > /tmp/wallpaper.lock
	while true; do
		change
		sleep 30m
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
