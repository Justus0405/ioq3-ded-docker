#!/bin/sh

# Check for making sure the user has provided the pak0.pk3 file
if [ ! -f "/home/ioq3srv/.config/Quake3/baseq3/pak0.pk3" ]; then
    echo "[ERROR] *** pak0.pk3 NOT FOUND *** "
    exit 1
fi

# Run helper script for changing the configs
/home/ioq3srv/scripts/helper.sh

# Run the server binary
/home/ioq3srv/ioq3/ioq3ded "$@"
