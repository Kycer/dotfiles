#!/usr/bin/env bash

rofi_dir="$HOME/.dotfiles/config/rofi"
rofi_scripts_dir="$HOME/.dotfiles/scripts/rofi"
rofi_command="rofi -theme $rofi_dir/themes/powermenu.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot=""
lock=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$logout"

function confirm(){
    ans=$($rofi_scripts_dir/confirm.sh)
    if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
    $1
    elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
    $2
    else
    rofi -theme "$rofi_dir/themes/message.rasi" -e "Available Options  -  yes / y / no / n"
    fi
}

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 3)"
case $chosen in
    $shutdown)
        confirm "systemctl poweroff" exit
        ;;
    $reboot)
        confirm "systemctl reboot" exit
        ;;
    $lock)
        confirm "betterlockscreen -l dim" exit
        ;;
    $logout)
        confirm "i3-msg exit" exit
        ;;
esac