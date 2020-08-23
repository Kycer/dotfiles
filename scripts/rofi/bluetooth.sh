#!/bin/bash

rofi_dir="$HOME/.dotfiles/config/rofi"
devices="$(bluetoothctl devices)"

chosen="$(echo -e "$devices" | rofi -p bluetooth -dmenu | awk '{print $2}')"

result="$(bluetoothctl connect $chosen | grep 'successful' | wc -l)"

if [[ $result == "1" ]] ; then
    dunstify "Bluetooth connected!"
else
    dunstify "Bluetooth connection failed!"
fi