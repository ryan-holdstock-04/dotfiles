#!/bin/sh
# Randomly sets a wallpaper from ~/Downloads/wallpapers

WALLPAPER_DIR="$HOME/wallpapers"

# swww settings
RESIZE_TYPE="crop"
export SWWW_TRANSITION_FPS="${SWWW_TRANSITION_FPS:-60}"
export SWWW_TRANSITION_STEP="${SWWW_TRANSITION_STEP:-200}"

# Pick a random image
random_img=$(find "$WALLPAPER_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)

if [ -n "$random_img" ]; then
    swww img --resize="$RESIZE_TYPE" "$random_img" --transition-type any
    wal -i "$random_img"
    ln -sf "$HOME/.cache/wal/colors-kitty.conf" "$HOME/.config/kitty/current-theme.conf"
    
    # Create a symbolic link for Hyprlock using the random_img variable
    ln -sf "$random_img" "$HOME/.config/hypr/current_wallpaper.jpg"
fi
