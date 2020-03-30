#!/bin/sh

kill -USR1 $(ps -C spotify.sh | awk '{print $1}' | tail +2 | tr '\n' ' ')
