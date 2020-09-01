#!/bin/bash
wallpaper_dir="$HOME/Pictures/wallpaper"

if [ ! -d "$wallpaper_dir" ]; then
    mkdir $wallpaper_dir
fi
cd $wallpaper_dir

while true; do
	files=()
	for i in *.jpg *.png; do
		[[ -f $i ]] && files+=("$i")
	done
	range=${#files[@]}

	((range)) && feh --bg-fill "${files[RANDOM % range]}"

	sleep 30m
done
