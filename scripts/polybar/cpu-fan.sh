#!/bin/sh

speed=$(sensors | grep "Processor Fan" | cut -d ":" -f 2 | cut -b2-5)

echo $speed
