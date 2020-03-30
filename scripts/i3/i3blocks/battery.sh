#!/usr/bin/env zsh

level=$((100 * $(cat /sys/class/power_supply/BAT0/charge_now) / $(cat /sys/class/power_supply/BAT0/charge_full)))
state=$(cat /sys/class/power_supply/BAT0/status)
icon=""
color="#ff4444"

if [ $level -gt 90 ]
then
    icon=""
    color="#44ff44"
elif [ $level -gt 80 ]
then
    icon=""
    color="#44ff44"
elif [ $level -gt 70 ]
then
    icon=""
    color="#44ff44"
elif [ $level -gt 60 ]
then
    icon=""
    color="#44ff44"
elif [ $level -gt 50 ]
then
    icon=""
    color="#44ff44"
elif [ $level -gt 40 ]
then
    icon=""
    color="#44ff44"
elif [ $level -gt 30 ]
then
    icon=""
    color="#44ff44"
elif [ $level -gt 20 ]
then
    icon=""
    color="#44ff44"
elif [ $level -gt 10 ]
then
    icon=""
    color="#ff4444"
elif [ $ level -gt 0 ]
then
    icon=""
    color="#ff4444"
else
    icon=""
    color="#ff4444"
fi

if [[ $state == "Charging" || $state == "Full" ]]
then
    icon+=" "
fi

echo "$icon $level%"
echo "$icon $level%"
echo $color
