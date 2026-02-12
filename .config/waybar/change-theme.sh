#!/bin/bash
WAYBAR_DIR="$HOME/.config/waybar"
CURRENT=$(readlink "$WAYBAR_DIR/style.css")

if [[ "$CURRENT" == *"style-dark.css" ]]; then
    ln -sf "$WAYBAR_DIR/style-light.css" "$WAYBAR_DIR/style.css"
else
    ln -sf "$WAYBAR_DIR/style-dark.css" "$WAYBAR_DIR/style.css"
fi

pkill waybar
waybar
