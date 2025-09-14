#!/bin/bash

# This script sends a dunst notification with a volume progress bar.

# Get the current volume and mute status from pamixer
volume=$(pamixer --get-volume)
is_muted=$(pamixer --get-mute)

# Check if muted
if [ "$is_muted" = "true" ]; then
    # Show a "Muted" notification
    dunstify -h string:x-dunst-stack-tag:volume_notif "Volume: Muted" -i notification-audio-volume-muted
else
    # Show a volume bar notification
    dunstify -h int:value:"$volume" -h string:x-dunst-stack-tag:volume_notif "Volume: ${volume}%" -i notification-audio-volume-high
fi
