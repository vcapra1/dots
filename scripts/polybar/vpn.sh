#!/usr/bin/sh

IP4_REGEX="([0-9]+\.){3}[0-9]+"
IP6_REGEX="(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))"
IP_REGEX="(${IP4_REGEX})|(${IP6_REGEX})"

while true
do

    sleep 2

    # Get the current wifi state ({up, down})
    wifi=$(cat /sys/class/net/wlp2s0/operstate)
    #vpn=$(nmcli -f STATE,TYPE con show | grep "vpn" | grep "activated" > /dev/null 2>&1 && echo "up" || echo "down")
    vpnname=$(nmcli -t -f STATE,TYPE,NAME con show | grep "vpn" | grep "activated" | cut -f3 -d':' || echo "None")
    # Possible wired connection?
    ethernet=$(nmcli -f STATE,TYPE con show | grep "ethernet" | grep "activated" > /dev/null 2>&1 && echo "up" || echo "down")

    # If anything but "up", print nothing
    if [[ $wifi == "up" ]]
    then
        if (nmcli -f STATE,TYPE con show | grep "vpn" | grep "activated" > /dev/null 2>&1)
        then
            # Print IP
            #echo $(timeout 5 dig +short myip.opendns.com ANY @resolver1.opendns.com 2> /dev/null | rg "${IP_REGEX}" || echo "")
            timeout 5 curl ifconfig.me 2>/dev/null | rg "${IP_REGEX}" | sed 's/^/  /'
        else
            echo ""
        fi
    elif [[ $ethernet == "up" ]]
    then
        if (nmcli -f STATE,TYPE con show | grep "vpn" | grep "activated" > /dev/null 2>&1)
        then
            timeout 5 curl ifconfig.me 2>/dev/null | rg "${IP_REGEX}" | sed 's/^/  /'
        else
            echo ""
        fi
    fi

done
