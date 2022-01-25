#!/bin/bash
TMPBG=/tmp/screen.png
LOCK=/home/kycer/.dotfiles/scripts/lock/lock.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')

# ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
# i3lock -i $TMPBG

blank='#00000000'  # blank
#background='#1A6785FF'
background='#1A5E81AC'
foreground='#D8DEE9FF'  # text

primary='#BF616AFF'  # default
alert='#EBCB8BFF'  # wrong
verifying='#A3BE8CFF'  # verifying

i3lock \
--image=$TMPBG \
\
# --screen 1 \
--indicator \
--keylayout 2 \
--force-clock \
\
--insidever-color=$background   \
--insidewrong-color=$background \
--inside-color=$background      \
\
--ringver-color=$primary        \
--ringwrong-color=$alert        \
--ring-color=$primary           \
\
--line-color=$primary           \
--line-uses-inside              \
\
--keyhl-color=$alert            \
--bshl-color=$alert             \
\
--separator-color=$primary      \
\
--verif-color=$foreground       \
--wrong-color=$foreground       \
--time-color=$foreground        \
--date-color=$foreground        \
--layout-color=$foreground      \
\
--time-align=0 \
--date-align=0 \
--layout-align=0 \
--verif-align=0 \
--wrong-align=0 \
--modif-align=0 \
\
--blur 5              \
--indicator           \
--keylayout 2         \
\
--verif-text=""          \
--wrong-text=""          \
--clock               \
--timestr="%H:%M:%S"  \
--line-uses-inside       \
--datestr="%A, %m %Y" \
--textsize=20
--modsize=10
--time-font=noto-sans    \
--datefont=noto-sans    \
# etc

rm $TMPBG