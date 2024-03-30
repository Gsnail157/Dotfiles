#!/bin/sh
intern=DP-2
extern=HDMI-0

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --auto
    xrandr --output "$extern" --scale 1.25x1.25
    ./~/.fehbg
fi
