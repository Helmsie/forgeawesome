# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.name = "forgeawesome"
    v.cpus = 2
    v.memory = 2048
  end

  config.vm.network "private_network", ip: "192.168.10.30", auto_correct: false

  config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: false
  config.vm.network :forwarded_port, guest: 5432, host: 5555, auto_correct: false

  config.vm.synced_folder ".", "/var/www/forgeawesome", type: "nfs"

  config.vm.provision :shell, path: "provision/dependancies.sh"
  config.vm.provision :shell, path: "provision/postgresql.sh"
  config.vm.provision :shell, path: "provision/ruby.sh", privileged: false
end
