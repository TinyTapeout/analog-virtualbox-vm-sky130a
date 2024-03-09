#! /bin/sh

set -e

ISO_PATH="/home/ttuser/VBoxGuestAdditions.iso"
MOUNT_PATH="/tmp/vbox_tools_iso"

sudo apt-get install -y build-essential gcc make perl dkms

mkdir -p "$MOUNT_PATH"

sudo mount -t iso9660 -o loop "$ISO_PATH" "$MOUNT_PATH"
# Exit code 2 is ok, it means the installer was successful
sudo "$MOUNT_PATH/VBoxLinuxAdditions.run" --nox11 || [ $? -eq 2 ]
sudo umount $MOUNT_PATH

# Verify that the installation was successful
sudo /usr/sbin/VBoxService --version

rm -rf $MOUNT_PATH $ISO_PATH
