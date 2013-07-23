#!/bin/bash
# Remove items used for building, since they aren't needed anymore

sudo apt-get -y remove linux-headers-$(uname -r) build-essential
sudo apt-get -y autoremove

#Clean up tmp
sudo rm -rf /tmp/*

# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
sudo rm /var/lib/dhcp/*

# Make sure Udev doesn't block our network
# http://6.ptmc.org/?p=164
echo "cleaning up udev rules"
sudo rm /etc/udev/rules.d/70-persistent-net.rules
sudo mkdir /etc/udev/rules.d/70-persistent-net.rules
sudo rm -rf /dev/.udev/
sudo rm /lib/udev/rules.d/75-persistent-net-generator.rules

set +e
echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
sudo echo "pre-up sleep 2" >> /etc/network/interfaces
exit 0