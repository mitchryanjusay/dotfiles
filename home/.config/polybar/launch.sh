#!/bin/bash

# Terminate already running bar instances
killall -q polybar

#Wait until the processess have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

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
    echo "HDMI and VGA connected, setting bars accordingly..."
    env MONITOR=HDMI-2 polybar bar &
    env MONITOR=DP-1 polybar subbar &
    env MONITOR=eDP-1 polybar subbar &
elif [ "$HDMI2" == "true" ] ; then
    echo "HDMI connected, setting bars accordingly..."
    env MONITOR=HDMI-2 polybar bar &
    env MONITOR=eDP-1 polybar subbar &
elif [ "$DP1" == "true" ] ; then
    echo "VGA connected, setting bars accordingly..."
    env MONITOR=DP-1 polybar bar &
    env MONITOR=eDP-1 polybar subbar &
else
    echo "No external monitors connected, setting bars accordingly..."
    env MONITOR=eDP-1 polybar bar &
fi

echo "Polybar launched..."
