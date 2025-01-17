#!/bin/bash
# since proton requires symbolic links and exfat doesn't allow symlinks, create a mount point here as a sort of alias for symlinks

# ${DEVICE_MOUNT_LOCATION} is likely found in /run/media/username. Include the full path

echo "$(date +"%F %R") Mounting ~/.steam/steam/compatdata to ${DEVICE_MOUNT_LOCATION}/SteamLibrary/steamapps/compatdata" | sudo tee -a /var/log/steam-compatdata.log >/dev/null


sudo mount --bind \
$HOME/.steam/steam/steamapps/compatdata \
${DEVICE_MOUNT_LOCATION}/SteamLibrary/steamapps/compatdata
