#!/bin/bash

# Get brightness percentage
BRIGHTNESS=$(brightnessctl -m | awk -F, '{print substr($4, 0, length($4)-1)}')

# Send notification
dunstify -h int:value:"$BRIGHTNESS" -h string:x-dunst-stack-tag:brightness_notif "Brightness: ${BRIGHTNESS}%" -i notification-display-brightness
