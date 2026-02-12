#!/bin/bash

active-window=$(hyprctl activewindow -j)

if [["active-window" == "{}"]] then
	pkill -SIGUSR1 waybar
else
	pkill -SIGUSR1 waybar
fi
