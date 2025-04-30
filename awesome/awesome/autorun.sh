#!/bin/bash

# Set keyboard layout
setxkbmap us

# Screenshot utility
flameshot &

kdeconnect-cli &

xrandr --output Virtual1 --mode 1920x1080 &
picom --config ~/.config/picom/picom.conf &

#nm-applet &
feh --bg-scale ~/Wallpapers/wallpaper.jpg &
cbatticon --icon-type symbolic &

amixer sset Master 100%

# sleep 1
# volumeicon &
