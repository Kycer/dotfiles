#!/bin/bash

LOCK_NAME="/tmp/wallpapers.lock"
if [[ -e $LOCK_NAME ]] ; then
echo "re-entry, exiting"
exit 1
fi

echo $$ > $LOCK_NAME
shopt -s nullglob

cd ~/Pictures/wallpaper

while true; do
	files=()
	for i in *.jpg *.png; do
		[[ -f $i ]] && files+=("$i")
	done
	range=${#files[@]}

	((range)) && feh --bg-fill "${files[RANDOM % range]}"

	sleep 1m
done
