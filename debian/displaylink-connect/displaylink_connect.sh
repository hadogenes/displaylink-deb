#!/bin/bash

if ! lsusb | grep  -q "DisplayLink"; then
    echo "DisplayLink not connected, exiting" >&2
    exit 10
fi

echo "Finding modesetting providers"
xrandr --listproviders | awk '$1 == "Provider" && $NF ~ /modesetting$/ && /Sink Output/ {gsub(/:/, "", $2); print $2}' |\
while read providerId; do
    [ "$providerId" = "0" ] && continue
    xrandr --setprovideroutputsource "$providerId" 0
    sleep 0.5
done
