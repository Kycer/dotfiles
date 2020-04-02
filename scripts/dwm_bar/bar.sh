#!/bin/sh


# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Change the appearance of the module identifier. if this is set to "unicode", then symbols will be used as identifiers instead of text. E.g. [📪 0] instead of [MAIL 0].
# Requires a font with adequate unicode character support
export IDENTIFIER="unicode"

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
export SEP1="["
export SEP2="]"

# Import the modules
. "$DIR/dwm_date.sh"
. "$DIR/dwm_alsa.sh"
. "$DIR/dwm_resources.sh"

# Update dwm status bar every second
while true
do
    xsetroot -name "$(dwm_date)$(dwm_alsa)"
    sleep 1
done