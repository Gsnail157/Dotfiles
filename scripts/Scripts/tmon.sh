#!/bin/sh
intern=DP-2
extern=HDMI-0

# Lenovo Legion 
if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --auto
    xrandr --output "$extern" --scale 1.25x1.25
fi

# Thinkpad T480s HDMI Port
if xrandr | grep "HDMI2 disconnected"; then
    xrandr --ouput "HDMI2" --off --output "eDP1" --auto
else
    xrandr --output "eDP1" --primary --auto --output "HDMI2" --right-of "eDP1" --auto
    xrandr --output "HDMI2" --scale 1.25x1.25

# Thinkpad T480s Thunderbolt 3 Port
if xrandr | grep "DP1 disconnected"; then
    xrandr --output "DP1" --off --output "eDP1" --auto
else
    xrandr --output "eDP1" --primary --auto --output "DP1" --auto

