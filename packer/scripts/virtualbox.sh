#!/bin/bash
# Without libdbus virtualbox would not start automatically after compile
sudo apt-get -y install --no-install-recommends libdbus-1-3

# The netboot installs the VirtualBox support (old) so we have to remove it
sudo /etc/init.d/virtualbox-ose-guest-utils stop
sudo rmmod vboxguest
sudo aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils
sudo aptitude -y install dkms

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
sudo mount -o loop $VBOX_ISO /mnt
sudo yes|sudo sh /mnt/VBoxLinuxAdditions.run
sudo umount /mnt

#Cleanup VirtualBox
sudo rm $VBOX_ISO
