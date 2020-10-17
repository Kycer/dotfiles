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
	while true; do
		change
		sleep 5
	done
}



case $1 in
		i)
				init
				;;

		c)
				change
				;;
		*)
				echo "-$opt not recognized"
				;;
esac
