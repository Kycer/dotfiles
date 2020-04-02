#!/bin/bash

while getopts udm opt
do
    case $opt in
        u)
            pactl set-sink-volume @DEFAULT_SINK@ +5%
            # amixer -qM set Master 5%+ umute
            ;;

        d)
            pactl set-sink-volume @DEFAULT_SINK@ -5%
            ;;
        m)
            pactl set-sink-mute @DEFAULT_SINK@ toggle
            ;;
        *)
            echo "-$opt not recognized"
            ;;
    esac
done