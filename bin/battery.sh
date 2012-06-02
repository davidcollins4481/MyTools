#!/bin/bash

percentage=`acpi | awk -F", " '{print $2 }' | sed 's|%||g'`

if [ $percentage -ge 80 ]; then
    color="\005{G}"
elif [ $percentage -lt 80 ] && [ $percentage -ge 20 ]; then
    color="\005{Y}"
else
    color="\005{R}"
fi

echo -e $color "${percentage}%"
