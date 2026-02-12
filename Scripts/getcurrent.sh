#!/bin/bash

# Path to your Hyprlock configuration file
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"

# Extract the current wallpaper path from swww query output
WALLPAPER_PATH=$(swww query | grep "currently displaying:" | awk -F ': ' '{print $NF}')

# Check if a wallpaper path was found
if [ -n "$WALLPAPER_PATH" ]; then
    # Replace the 'path' line in the hyprlock.conf with the current wallpaper path
    sed -i "s|^\\s*path =.*|        path = $WALLPAPER_PATH|" "$HYPRLOCK_CONF"
else
    echo "Could not find a wallpaper path from swww query."
fi

# Execute Hyprlock
hyprlock
