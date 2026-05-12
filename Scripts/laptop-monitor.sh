#!/bin/bash
hyprctl keyword monitor "eDP-1,1920x1080@60,-1920x0,1"
hyprctl keyword monitor "HDMI-A-1,1920x1080@144,0x0,1"
sleep 0.5 && hyprctl dispatch moveworkspacetomonitor 10 eDP-1
