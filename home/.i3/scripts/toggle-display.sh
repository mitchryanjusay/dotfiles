#!/bin/bash

LAPTOP="eDP-1"

if [ ! -f "/tmp/toggle.dat" ] ; then
		toggle_mode="OFF"
else
		toggle_mode=`cat /tmp/toggle.dat`
fi

if [ $toggle_mode = "OFF" ]; then
    toggle_mode="ON"
    xrandr --output $LAPTOP --auto
    
    if xrandr -q | grep -q 'HDMI-2 connected' ; then
        HDMI2="true"
    else
        HDMI2="false"
    fi

    if xrandr -q | grep -q 'DP-1 disconnected' ; then
        DP1="false"
    else
        DP1="true"
    fi
        
    if [ "$HDMI2" == "true" ] && [ "$DP1" == "true" ] ; then

        i3 workspace "5:Media" output $LAPTOP 
        i3 workspace "7:Office" output $LAPTOP
        i3 workspace "8:Files" output $LAPTOP
        i3 workspace "10:Misc" output $LAPTOP

    elif [ "$HDMI2" == "true" ]; then

        i3 workspace "1:Internet" output $LAPTOP
        i3 workspace "4:Phone" output $LAPTOP 
        i3 workspace "5:Media" output $LAPTOP 
        i3 workspace "6:Chat" output $LAPTOP 
        i3 workspace "7:Office" output $LAPTOP
        i3 workspace "10:Misc" output $LAPTOP

    elif [ "$DP1" == "true" ]; then

        i3 workspace "1:Internet" output $LAPTOP
        i3 workspace "4:Phone" output $LAPTOP 
        i3 workspace "5:Media" output $LAPTOP 
        i3 workspace "6:Chat" output $LAPTOP 
        i3 workspace "7:Office" output $LAPTOP
        i3 workspace "10:Misc" output $LAPTOP

    else

        i3 workspace "1:Internet" output $LAPTOP
        i3 workspace "2:Android" output $LAPTOP
        i3 workspace "3:Terminal" output $LAPTOP
        i3 workspace "4:Phone" output $LAPTOP
        i3 workspace "5:Medi" output $LAPTOP
        i3 workspace "6:Chat" output $LAPTOP
        i3 workspace "7:Office" output $LAPTOP
        i3 workspace "8:Files" output $LAPTOP
        i3 workspace "9:System" output $LAPTOP
        i3 workspace "10:Misc" output $LAPTOP
            
    fi

    feh --bg-fill --randomize ~/.i3/res/*
    sh ~/.config/polybar/launch.sh
else
    toggle_mode="OFF"
    xrandr --output $LAPTOP --off
    light -S 0

    if xrandr -q | grep -q 'HDMI-2 connected' ; then
        HDMI2="true"
    else
        HDMI2="false"
    fi

    if xrandr -q | grep -q 'DP-1 disconnected' ; then
        DP1="false"
    else
        DP1="true"
    fi

    if [ "$HDMI2" == "true" ] && [ "$DP1" == "true" ] ; then

        i3 workspace "5:Media" output DP-1
        i3 workspace "7:Office" output DP-1
        i3 workspace "8:Files" output DP-1
        i3 workspace "10:Misc" output DP-1

    elif [ "$HDMI2" == "true" ] ; then

        i3 workspace "1:Internet" output HDMI-2
        i3 workspace "4:Phone" output HDMI-2
        i3 workspace "5:Media" output HDMI-2
        i3 workspace "6:Chat" output HDMI-2
        i3 workspace "7:Office" output HDMI-2
        i3 workspace "10:Misc" output HDMI-2

    elif [ "$DP1" == "true" ]; then

        i3 workspace "1:Internet" output DP-1
        i3 workspace "4:Phone" output DP-1
        i3 workspace "5:Media" output DP-1
        i3 workspace "6:Chat" output DP-1
        i3 workspace "7:Office" output DP-1
        i3 workspace "10:Misc" output DP-1

    fi
        
    feh --bg-fill --randomize ~/.i3/res/*
    sh ~/.config/polybar/launch.sh
fi
echo "${toggle_mode}" > /tmp/toggle.dat

