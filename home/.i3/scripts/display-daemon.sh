#!/bin/bash
#
# Credit to gurkensalat
# https://faq.i3wm.org/question/6421/conditional-monitor-cofiguration.1.html
#

onConnection() {
    echo onConnection

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
        xrandr --output HDMI-2 --auto --primary --right-of DP-1
        xrandr --outout DP-1 --auto --left-of HDMI-2
        xrandr --output eDP-1 --off

        i3 workspace "1:Internet" output DP-1
        i3 workspace "2:Android" output HDMI-2
        i3 workspace "3:Terminal" output HDMI-2
        i3 workspace "4:Phone" output DP-1
        i3 workspace "5:Media" output DP-1
        i3 workspace "6:Chat" output DP-1
        i3 workspace "7:Office" output DP-1
        i3 workspace "8:Files" output HDMI-2
        i3 workspace "9:System" output HDMI-2
        i3 workspace "10:Misc" output DP-1
        
        light -S 0

    elif [ "$HDMI2" == "true" ] ; then

        xrandr --output HDMI-2 --auto --primary
        xrandr --output eDP-1 --off
        
        i3 workspace "1:Internet" output HDMI-2
        i3 workspace "2:Android" output HDMI-2
        i3 workspace "3:Terminal" output HDMI-2
        i3 workspace "4:Phone" output HDMI-2
        i3 workspace "5:Media" output HDMI-2
        i3 workspace "6:Chat" output HDMI-2
        i3 workspace "7:Office" output HDMI-2
        i3 workspace "8:Files" output HDMI-2
        i3 workspace "9:System" output HDMI-2
        i3 workspace "10:Misc" output HDMI-2
    
        light -S 0

    elif [ "$DP1" == "true" ] ; then

        xrandr --output DP-1 --auto --primary
        xrandr --output eDP-1 --off

        i3 workspace "1:Internet" output DP-1
        i3 workspace "2:Android" output DP-1
        i3 workspace "3:Terminal" output DP-1
        i3 workspace "4:Phone" output DP-1
        i3 workspace "5:Medi" output DP-1
        i3 workspace "6:Chat" output DP-1
        i3 workspace "7:Office" output DP-1
        i3 workspace "8:Files" output DP-1
        i3 workspace "9:System" output DP-1
        i3 workspace "10:Misc" output DP-1
        
        light -S 0
    
    else
        xrandr --output eDP-1 --auto --primary

        i3 workspace "1:Internet" output eDP-1
        i3 workspace "2:Android" output eDP-1
        i3 workspace "3:Terminal" output eDP-1
        i3 workspace "4:Phone" output eDP-1
        i3 workspace "5:Medi" output eDP-1
        i3 workspace "6:Chat" output eDP-1
        i3 workspace "7:Office" output eDP-1
        i3 workspace "8:Files" output eDP-1
        i3 workspace "9:System" output eDP-1
        i3 workspace "10:Misc" output eDP-1
    fi


    if [ "$HDMI2" == "true" ] ; then
        pacmd set-card-profile 0 "output:hdmi-stereo+input:analog-stereo"
    else 
        pacmd set-card-profile 0 "output:analog-stereo+input:analog-stereo"
    fi
  
    feh --bg-fill --randomize ~/.i3/res/*
    sh ~/.config/polybar/launch.sh
}

onDisconnection() {
    echo onDisconnection

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
    
    if [ "$HDMI2" == "false" ] ; then
        xrandr --output HDMI-2 --off
    elif [ "$DP1" == "false" ] ; then
        xrandr --output DP-1 --off
    fi

    if [ "$HDMI2" == "true" ] ; then

        xrandr --output HDMI-2 --auto --primary
        xrandr --output eDP-1 --off
        
        i3 workspace "1:Internet" output HDMI-2
        i3 workspace "2:Android" output HDMI-2
        i3 workspace "3:Terminal" output HDMI-2
        i3 workspace "4:Phone" output HDMI-2
        i3 workspace "5:Media" output HDMI-2
        i3 workspace "6:Chat" output HDMI-2
        i3 workspace "7:Office" output HDMI-2
        i3 workspace "8:Files" output HDMI-2
        i3 workspace "9:System" output HDMI-2
        i3 workspace "10:Misc" output HDMI-2

        light -S 0
    
    elif [ "$DP1" == "true" ] ; then
        
        xrandr --output DP-1 --auto --primary
        xrandr --output eDP-1 --off

        i3 workspace "1:Internet" output DP-1
        i3 workspace "2:Android" output DP-1
        i3 workspace "3:Terminal" output DP-1
        i3 workspace "4:Phone" output DP-1
        i3 workspace "5:Medi" output DP-1
        i3 workspace "6:Chat" output DP-1
        i3 workspace "7:Office" output DP-1
        i3 workspace "8:Files" output DP-1
        i3 workspace "9:System" output DP-1
        i3 workspace "10:Misc" output DP-1

        light -S 0
        
    else
        xrandr --output eDP-1 --auto --primary

        i3 workspace "1:Internet" output eDP-1
        i3 workspace "2:Android" output eDP-1
        i3 workspace "3:Terminal" output eDP-1
        i3 workspace "4:Phone" output eDP-1
        i3 workspace "5:Medi" output eDP-1
        i3 workspace "6:Chat" output eDP-1
        i3 workspace "7:Office" output eDP-1
        i3 workspace "8:Files" output eDP-1
        i3 workspace "9:System" output eDP-1
        i3 workspace "10:Misc" output eDP-1

    fi
    
    if [ "$HDMI2" == "true" ] ; then
        pacmd set-card-profile 0 "output:hdmi-stereo+input:analog-stereo"
    else 
        pacmd set-card-profile 0 "output:analog-stereo+input:analog-stereo"
    fi

    feh --bg-fill --randomize ~/.i3/res/*
    sh ~/.config/polybar/launch.sh
}

#########################

statefile="`mktemp`"

quit() {
    rm "$statefile"
    exit 1
}
trap quit SIGINT SIGTERM

getstate() {
    state="`xrandr -q | wc -l`"
}
savestate() {
    echo "$state" > "$statefile"
}
getstate
savestate

xev -root -event randr | grep --line-buffered XRROutputChangeNotifyEvent | \
while IFS= read -r line; do
    getstate
    old="`cat "$statefile"`"
    if [ "$state" -gt "$old" ]; then
        onConnection
    elif [ "$state" -lt "$old" ]; then
        onDisconnection
    fi
    savestate
done
