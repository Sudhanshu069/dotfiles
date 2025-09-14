#!/bin/sh

battery_info=$(acpi -b)
status=$(echo "$battery_info" | grep -o "Charging\|Discharging\|Full")
percentage=$(echo "$battery_info" | grep -o "[0-9]*%" | tr -d '%')

if [ "$status" = "Charging" ]; then
    icon=""
elif [ "$status" = "Full" ]; then
    icon=""
elif [ "$percentage" -gt 90 ]; then
    icon=""
elif [ "$percentage" -gt 60 ]; then
    icon=""
elif [ "$percentage" -gt 40 ]; then
    icon=""
elif [ "$percentage" -gt 10 ]; then
    icon=""
else
    icon=""
fi

echo "$icon $percentage%"
