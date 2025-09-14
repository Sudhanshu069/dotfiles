#!/bin/bash

# This script runs in the background to send notifications
# when Caps Lock or Num Lock are toggled.

# Initialize previous states
prev_caps_state=$(xset q | grep 'Caps Lock:' | awk '{print $4}')
prev_num_state=$(xset q | grep 'Num Lock:' | awk '{print $8}')

# Infinite loop to check key states
while true; do
    # Get current states
    caps_state=$(xset q | grep 'Caps Lock:' | awk '{print $4}')
    num_state=$(xset q | grep 'Num Lock:' | awk '{print $8}')

    # Check for Caps Lock state change
    if [ "$caps_state" != "$prev_caps_state" ]; then
        notify-send -h string:x-dunst-stack-tag:lock_keys "Caps Lock" "State: $caps_state"
        prev_caps_state=$caps_state
    fi

    # Check for Num Lock state change
    if [ "$num_state" != "$prev_num_state" ]; then
        notify-send -h string:x-dunst-stack-tag:lock_keys "Num Lock" "State: $num_state"
        prev_num_state=$num_state
    fi

    # Wait for a short interval before checking again
    sleep 0.5
done
