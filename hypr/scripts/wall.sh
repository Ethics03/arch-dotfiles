#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
CURRENT_WALL=$(swww query | grep 'image:' | awk -F'image: ' '{print $2}')

# Get a random wallpaper that is NOT the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Ensure we don’t reload the same wallpaper
while [[ "$WALLPAPER" == "$CURRENT_WALL" ]]; do
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
done

# If swww is not running, start it
pgrep -x swww-daemon >/dev/null || swww-daemon &

# Set wallpaper with transition
swww img "$WALLPAPER" --transition-type any --transition-duration 0.9
