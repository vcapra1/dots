# Only start the X server if on tty1, else allow normal login
if [[ -z "$DISPLAY" ]]; then
    if [[ $XDG_VTNR -eq 1 ]]; then
        xbindkeys

        rm /home/vinnie/.Xauthority
        exec startx
    else
        prompt adam2
    fi
else
    # Select a random color for archey3's Arch logo
    #array=('red' 'green' 'yellow' 'blue' 'magenta' 'cyan' 'white' 'black')
    #index=$(($RANDOM % 8 + 1))
    #archey3 -c${array[$index]} --config=/home/vinnie/.config/archey3.cfg
fi
