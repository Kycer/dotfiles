#!/bin/sh
result=$(ps -ax | grep trayer | grep -v "grep" | wc -l)
echo $result
if [ $result -eq 0 ]; then
  ls &
  trayer --edge top --align right --width 8 --transparent true --alpha 200 --tint 0x333333 --expand false --SetDockType false &
else
  killall trayer
fi