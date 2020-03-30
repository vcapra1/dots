#!/usr/bin/env bash

# Kill any currently-running instances of Polybar, and wait for them to die
killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

# Get the paths to hardware component files
source ~/.polybar/scripts/locate-components.sh

# Start one instance of Polybar on each monitor
for m in $(polybar --list-monitors | cut -d":" -f1); do
    export MONITOR=$m
    polybar --reload bottom &
done
