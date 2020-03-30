#!/bin/sh

icon=""
bluetoothctl show | grep "Powered" | grep "yes" > /dev/null 2> /dev/null

if [ $? == 0 ]
then
    devices=$(for b in $(bluetoothctl devices | cut -d' ' -f2); do
        bluetoothctl info $b | grep Connected; done | grep "yes" | wc -l)

    echo %{F#0061FF}%{T6}$icon%{T1}%{F#00000000}__%{F#0061FF}$devices%{F-}%{T-}
else
    echo %{F#660061FF}$icon%{F-}
fi
