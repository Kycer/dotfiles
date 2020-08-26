#!/usr/bin/env bash
rofi_scripts_dir="$HOME/.dotfiles/scripts/rofi"

ans="$(rofi -dmenu -i -no-fixed-num-lines -p "$1" -theme ~/.dotfiles/config/rofi/themes/confirm.rasi)"
if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
$2
elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
$3
else
$rofi_scripts_dir/message.sh "Available Options  -  yes / y / no / n"
fi