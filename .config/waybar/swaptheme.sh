#!/bin/bash
STATE_FILE="$HOME/.config/waybar/.light-dark-state"
WAYBAR_DIR="$HOME/.config/waybar"

a=$(cat "$STATE_FILE" 2>/dev/null || echo 0)

if (( a == 0 )); then
    echo "@define-color firstcolor #ffffff;" > "$WAYBAR_DIR/light-dark-control.css"
    echo "@define-color secondcolor #000000;" >> "$WAYBAR_DIR/light-dark-control.css"
else
    echo "@define-color firstcolor #000000;" > "$WAYBAR_DIR/light-dark-control.css"
    echo "@define-color secondcolor #ffffff;" >> "$WAYBAR_DIR/light-dark-control.css"
fi

echo $(( 1 - a )) > "$STATE_FILE"
pkill waybar
waybar &