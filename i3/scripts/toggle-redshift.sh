#!/bin/bash
#
# A corrected, robust toggle script for the Redshift daemon.
#

# First, check if a redshift process is already running.
if pgrep -x "redshift" > /dev/null
then
    # If it is, kill the process and reset the screen color.
    echo " Redshift is running, turning it off..."
    killall redshift
    redshift -x  # Explicitly reset the gamma ramps.
    notify-send "Redshift" "Toggled Off"
else
    # If it is not running, start the redshift daemon in the background.
    # It will use the settings from your redshift.conf file.
    echo " Redshift is not running, turning it on..."
    redshift &
    notify-send "Redshift" "Toggled On"
fi
