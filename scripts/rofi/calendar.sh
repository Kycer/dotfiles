#!/bin/bash
rofi -e "$(cal -m --color=always | sed "s+\\[7m+\<span\ color=\'magenta\'\>\<b\>+ ; s+\\[27m+\</b\>\</span\>+")" -markup -width 14 -location 3 -yoffset 30 &
