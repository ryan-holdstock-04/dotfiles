#!/bin/bash

WALL_DIR="$HOME/wallpapers"
THUMB_DIR="$HOME/.cache/wallpaper-thumbs"

# Create thumbnail directory if it doesn't exist
mkdir -p "$THUMB_DIR"

# 1. Generate thumbnails for any images that don't have one
# This only runs for new images, so it's very fast after the first time
find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read -r img; do
  thumb="$THUMB_DIR/$(basename "$img")"
  if [ ! -f "$thumb" ]; then
    # Create a 200px thumbnail
    magick "$img" -thumbnail 800x800^ -gravity center -extent 800x800 "$thumb"
  fi
done

# 2. Launch Rofi using the THUMBNAILS as icons, but returning the ORIGINAL filename
selected=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort |
  while read -r line; do
    echo -en "$line\0icon\x1f$THUMB_DIR/$line\n"
  done | rofi -dmenu -i -p "Select Wallpaper" -theme "$HOME/.config/rofi/wallpaper-grid.rasi")

# 3. Apply the selection
if [ -n "$selected" ]; then
  FULL_PATH="$WALL_DIR/$selected"
  swww img "$FULL_PATH" --transition-type any
  wal -i "$FULL_PATH"
  ln -sf "$HOME/.cache/wal/colors-kitty.conf" "$HOME/.config/kitty/current-theme.conf"
  ln -sf "$FULL_PATH" "$HOME/.config/hypr/current_wallpaper.jpg"
fi
