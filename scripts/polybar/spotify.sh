#!/usr/bin/sh

dump(){
    status=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' 2>/dev/null | tail -n1 | cut -d'"' -f2)

    if [[ $status == "Playing" ]]
    then
        echo -n "%{F#1ED761}   "

        dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify \
            /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
            string:'org.mpris.MediaPlayer2.Player' string:'Metadata' \
        | awk -f /home/vinnie/.polybar/scripts/spotify.awk \
        | tac | tr -d '\n'

    elif [[ $status == "Paused" ]]
    then
        echo -n "%{F#441ED761}   "

        dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify \
            /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
            string:'org.mpris.MediaPlayer2.Player' string:'Metadata' \
        | awk -f /home/vinnie/.polybar/scripts/spotify.awk \
        | tac | tr -d '\n'
    else
        echo "%{F#441ED761} %{F-}"
    fi

    echo ""
}

trap dump USR1

ctr=0
while sleep 0.25
do
    ((ctr=ctr+1))
    if [ $ctr -gt 8 ]
    then
        dump
        ((ctr=0))
    fi
done
