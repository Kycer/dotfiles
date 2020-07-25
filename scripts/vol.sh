#!/bin/bash

sinks=$(pactl list sinks short | grep RUNNING | awk '{print $1}')

function fun(){
    if [ ! $sinks ]; then
        sinks=(@DEFAULT_SINK@)
    fi
    for sink in $sinks
    do
        # echo "pactl set-sink-$1 $sink $2"
        pactl set-sink-$1 $sink $2
    done
}

while getopts udm opt
do
    case $opt in
        u)
            fun volume +5%
            ;;

        d)
            fun volume -5%
            ;;
        m)
            fun mute toggle
            ;;
        *)
            echo "-$opt not recognized"
            ;;
    esac
done