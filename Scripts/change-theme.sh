#!/bin/bash
#read image_path
swww img "Downloads/wallpapers/canal_painting.jpg" --transition-step 255 --transition-fps 60 --transition-type wipe
wal -i "Downloads/wallpapers/canal_painting.jpg" --cols16
ln -sf "$HOME/.cache/wal/colors-kitty.conf" "$HOME/.config/kitty/current-theme.conf"
ln -sf "$WALLPAPER_PATH" "$HOME/.config/hypr/current_wallpaper.jpg"
