#!/bin/bash

# replace ${DEVICE_MOUNT_NAME} with device mount found by running "systemctl list-units -t mount"
# ${DEVICE_MOUNT_LOCATION} is likely found in /run/media/username. Include the full path

# unmount steam compatdata
echo "$(date +"%F %R") Unmounting ${DEVICE_MOUNT_LOCATION}/SteamLibrary/steamapps/compatdata" | sudo tee -a /var/log/steam-compatdata.log >/dev/null

umountResult="$(sudo umount ${DEVICE_MOUNT_LOCATION}/SteamLibrary/steamapps/compatdata 2>&1)"
if [ -n "$umountResult" ]; then
    echo "                 $umountResult" | sudo tee -a /var/log/steam-compatdata.log >/dev/null
fi

# remove all empty directories of T7 mounting point so that compatdata's orphans don't mess with mounting the real drive
echo "                 Checking for orphans" | sudo tee -a /var/log/steam-compatdata.log >/dev/null
if [ -z "$(systemctl list-units -t mount | grep -e "${DEVICE_MOUNT_NAME}")" ]
then
    echo "                 Removing empty directories in ${DEVICE_MOUNT_LOCATION}" | sudo tee -a /var/log/steam-compatdata.log >/dev/null
    sudo find ${DEVICE_MOUNT_LOCATION} -type d -empty -delete
fi