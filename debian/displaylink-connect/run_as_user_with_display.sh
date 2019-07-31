#!/bin/bash

# Find users with X session - print as <username> <display>
who -s | awk '$NF ~ /^\(:/ {gsub(/[\(\)]/, "", $NF); print $1" "$NF}' | sort -u |\
while read login display; do
    sudo -H -u "$login" env DISPLAY="$display" XDG_RUNTIME_DIR=/run/user/$(id -u "$login") $@
done
