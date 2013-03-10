#!/bin/bash

# this is ugly!
echo `/sbin/ifconfig  | grep -C 2 RUNNING | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | grep -v 127`
