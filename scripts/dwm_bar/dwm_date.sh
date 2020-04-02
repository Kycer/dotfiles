#!/bin/sh

dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "📆 %s" "$(date "+%Y-%m-%d %A %H:%M")"
    else
        printf "DAT %s" "$(date "+%Y-%m-%d %A %H:%M")"
    fi
    printf "%s\n" "$SEP2"
}

dwm_date