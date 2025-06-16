#!/bin/bash

# Options with Nerd Font Icons
lock=" Lock"
logout="󰍃 Logout"
suspend="󰒲 Suspend"
reboot="󰜉 Reboot"
shutdown="󰐥 Shutdown"

# Get user choice
selected_option=$(echo "$lock
$logout
$suspend
$reboot
$shutdown" | rofi -dmenu \
    -p "Power" \
    -theme ~/.config/rofi/theme.rasi)

# Execute the chosen action
case $selected_option in
    "$lock")
        i3lock -c 1e1e2e
        ;;
    "$logout")
        i3-msg exit
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$shutdown")
        systemctl poweroff
        ;;
esac
