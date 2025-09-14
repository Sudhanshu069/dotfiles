#!/bin/bash

# This script shows the current song with album art.
# It requires playerctl, libnotify (for notify-send), and curl.

# Check for a running player
if ! playerctl status &> /dev/null; then
    dunstify -u low -h string:x-dunst-stack-tag:music_notif "Music" "No music playing."
    exit 0
fi

ARTIST=$(playerctl metadata artist)
TITLE=$(playerctl metadata title)
ALBUM=$(playerctl metadata album)
ART_URL=$(playerctl metadata mpris:artUrl)

# Download album art
if [[ -n "$ART_URL" ]]; then
    # Create a temporary file for the album art
    TMP_ART=$(mktemp --suffix=.jpg)
    # Download the art, with a 5-second timeout
    curl -s --max-time 5 "$ART_URL" -o "$TMP_ART"

    # Show notification with album art
    dunstify -i "$TMP_ART" -h string:x-dunst-stack-tag:music_notif "Now Playing" "<b>$TITLE</b>\nby $ARTIST\n<i>$ALBUM</i>"

    # Clean up the temp file after a delay
    (sleep 6 && rm "$TMP_ART") &
else
    # Fallback notification if no album art is found
    dunstify -h string:x-dunst-stack-tag:music_notif "Now Playing" "<b>$TITLE</b>\nby $ARTIST\n<i>$ALBUM</i>"
fi
