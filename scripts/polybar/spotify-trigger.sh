#!/bin/sh

sleep 0.1
kill -USR1 $(ps -C spotify.sh | awk '{print $1}' | tail +2 | tr '\n' ' ')
