#!/bin/bash
rofi -e "$(cal -m --color=always | sed "s/\x1b\[[7;]*m/\<b\>\<u\>/g" | sed "s/\x1b\[[27;]*m/\<\/u\>\<\/b\>/g")" -markup -theme "$HOME/.dotfiles/config/rofi/themes/calendar.rasi"
