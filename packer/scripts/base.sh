#!/bin/bash

# Set up passwordless sudo.
( cat <<'EOP'
%vagrant ALL=NOPASSWD:ALL
EOP
) > /tmp/vagrant
chmod 0440 /tmp/vagrant
echo 'vagrant'|sudo -S chown root:root /tmp/vagrant
echo 'vagrant'|sudo -S mv /tmp/vagrant /etc/sudoers.d/

# Apt-install various things necessary for guest additions,
# etc., and remove optional things to trim down the machine.
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install gcc build-essential linux-headers-$(uname -r)
sudo apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
sudo apt-get -y install vim curl
sudo apt-get clean

# Install NFS client
sudo apt-get -y install nfs-common
