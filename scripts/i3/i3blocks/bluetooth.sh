#!/usr/bin/bash

bluetoothctl show | grep "Powered" | grep "yes" > /dev/null 2> /dev/null

if [ $? == 0 ]
then
    devices=$(/home/vinnie/.i3/scripts/i3blocks/bt_devs)
    echo "${devices}"
    echo ""
    echo "#7777ff"
else
    echo ""
    echo ""
    echo "#ffffff55"
fi
