#!/usr/bin/env bash

wm_name="$($HOME/.dotfiles/scripts/wm_name.sh)"
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
    message=
    $rofi_scripts_dir/confirm.sh "Are You Sure? : " "$1" "$2"
}

function logout(){
    if [ $wm_name == 'i3' ]; then
        confirm "i3-msg exit" exit
    elif [ $wm_name == 'bspwm' ]; then
        confirm "bspc quit" exit
    elif [ $wm_name == 'dwm' ]; then
        confirm "killall bar.sh && killall dwm" exit
    else
        exit
    fi
}

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        confirm "systemctl poweroff" exit
        ;;
    $reboot)
        confirm "systemctl reboot" exit
        ;;
    $lock)
        betterlockscreen -l dim
        ;;
    $logout)
        logout
        ;;
esac