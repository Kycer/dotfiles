#!/bin/bash

file=$(date +%Y%m%d%H%M%S)
if [ -n "$1" ]
then
scrot -s -b  /tmp/scrot_$file.png &&
xclip -selection clipoard -t 'image/png' /tmp/scrot_$file.png
else
scrot -b /tmp/$file.png &&
xclip -selection clipoard -t 'image/png' /tmp/$file.png
fi