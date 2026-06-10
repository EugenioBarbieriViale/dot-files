#!/usr/sbin/bash

img="/tmp/screen.png"
icon="$HOME/Pictures/i3_empty_logo.png"

/usr/sbin/maim --quiet --hidecursor "$img"
/usr/sbin/convert "$img" -blur 0x8 "$img"

convert "$img" "$icon" -gravity center -composite "$img"

/usr/sbin/i3lock -i "$img"
