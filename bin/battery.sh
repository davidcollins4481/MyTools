#!/bin/bash

percentage=`acpi | awk -F", " '{print $2 }' | sed 's|%||g'`

if [ $percentage -ge 80 ]; then
    color="\005{g}"
elif [ $percentage -lt 80 ] && [ $percentage -ge 20 ]; then
    color="\005{y}"
else
    color="\005{r}"
fi

echo -e $color "${percentage}%"
