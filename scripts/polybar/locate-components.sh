#!/bin/env/bash

# CPU and GPU Fans
for label in $(env ls /sys/class/hwmon/hwmon*/fan*_label)
do
    # Check the contents of the file
    if [[ $(< $label) == "Processor Fan" ]]
    then
        export CPU_FAN=$(echo $label | sed 's/label/input/')
    elif [[ $(< $label) == "Video Fan" ]]
    then
        export GPU_FAN=$(echo $label | sed 's/label/input/')
    fi
done

# CPU and GPU Temps
for label in $(env ls /sys/class/hwmon/hwmon*/temp*_label)
do
    # Check the contents of the file
    if [[ $(< $label) == "CPU" ]]
    then
        export CPU_TEMP=$(echo $label | sed 's/label/input/')
    elif [[ $(< $label) == "GPU" ]]
    then
        export GPU_TEMP=$(echo $label | sed 's/label/input/')
    fi
done
