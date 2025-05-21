#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
CURRENT_WALL=$(swww query | grep 'image:' | awk -F'image: ' '{print $2}' | tr -d '"')

# List wallpapers and let user choose via wofi
SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f -printf "%f\n" | wofi --dmenu -i -p "Select Wallpaper:")

# If no selection, exit
if [[ -z "$SELECTED_WALLPAPER" ]]; then
  exit 0
fi

SELECTED_PATH="$WALLPAPER_DIR$SELECTED_WALLPAPER"

# If selected wallpaper is same as current, exit
if [[ "$SELECTED_PATH" == "$CURRENT_WALL" ]]; then
  exit 0
fi

# Start swww daemon if not running
if ! pgrep -x swww-daemon >/dev/null; then
  swww-daemon &
  sleep 0.5
fi

# Set wallpaper with transition
swww img "$SELECTED_PATH" --transition-type any --transition-duration 0.9
