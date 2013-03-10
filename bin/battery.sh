#!/bin/bash

OS=`uname -s`
percentage=""

case "$OS" in
    "Darwin"|"FreeBSD")
        percentage=`ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf "%.0f", $10/$5 * 100}'`
        ;;
    "Linux")
        acpi=`which acpi`
        if [ "$acpi" == "" ]; then
            exit 0
        fi

        percentage=`acpi | awk -F", " '{print $2 }' | sed 's|%||g'`
        ;;
    * ) 
        echo "Unknown OS [$OS]"
        ;;
esac

if [ $percentage -ge 80 ]; then
    color="\005{G}"
elif [ $percentage -lt 80 ] && [ $percentage -ge 20 ]; then
    color="\005{Y}"
else
    color="\005{R}"
fi

echo -e "[Battery:$color ${percentage}%\005{W}]" 

