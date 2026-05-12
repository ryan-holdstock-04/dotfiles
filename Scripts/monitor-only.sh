#!/bin/bash
hyprctl keyword monitor "eDP-1,disable"
hyprctl keyword monitor "HDMI-A-1,1920x1080@144,0x0,1"
sleep 0.3
hyprctl dispatch focuswindow class:spotify && hyprctl dispatch centerwindow
hyprctl dispatch focuswindow class:discord && hyprctl dispatch centerwindow
hyprctl dispatch workspace 1
