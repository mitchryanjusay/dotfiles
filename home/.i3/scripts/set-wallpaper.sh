#!/bin/bash 

# Will randomize through wallpapers found in
# the resource folder

WALLPAPERS=$HOME/.i3/res/*

feh --bg-fill --randomize $WALLPAPERS
notify-send "Wallpaper set successfully"
