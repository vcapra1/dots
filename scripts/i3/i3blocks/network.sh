#!/usr/bin/bash

stat=$(cat /sys/class/net/wlp2s0/operstate)

if [[ $stat == "down" ]]
then
    echo ""
    echo ""
    echo "#ffffff55"
    exit 0
fi

ssid=$(nmcli -t -f active,ssid dev wifi | grep "^yes" | cut -b5- | sed 's/&/\&amp;/g' | sed 's/</\&lt;/g' | sed 's/>/\&gt;/g')
ip=$(dig +short myip.opendns.com @resolver1.opendns.com || echo -n "")
speed=$(/home/vinnie/.i3/scripts/i3blocks/speed)

echo "  ${strength} ${ssid}  ${speed}"
echo "  ${ssid}"
echo "#00aa00"

sleep 1
