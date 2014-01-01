# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
cd /tmp
wget https://gist.github.com/parente/6049886/raw/provision.sh
sh ./provision.sh
SCRIPT

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "tottbox_2013_12_31"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  if FileTest.exists?("#{config.vm.box}.box")
    # local, copied from thumbdrive
    config.vm.box_url = "./#{config.vm.box}.box"
  else
    # remote on web host
    config.vm.box_url = "https://static.mindtrove.info/tott/#{config.vm.box}.box"
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 9000, host: 9000
  # config.vm.network :forwarded_port, guest: 35729, host: 35729

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.33.10"

  # Basic provisioning using inline bash script
  config.vm.provision :shell, :inline => $script

  # Use up to 4 GB of RAM and use DNS resolver from host.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
