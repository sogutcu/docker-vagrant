# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

VAGRANT_BOX         = "generic/ubuntu2204"
VAGRANT_BOX_VERSION = "4.1.6"
CPUS    = 2
MEMORY  = 2024


Vagrant.configure(2) do |config|

  # Docker Server
  config.vm.define "docker" do |node|
  
    node.vm.box               = VAGRANT_BOX
    node.vm.box_check_update  = false
    node.vm.box_version       = VAGRANT_BOX_VERSION
    node.vm.hostname          = "docker.example.com"

    node.vm.network "private_network", ip: "192.168.56.200"
  
    node.vm.provider :virtualbox do |v|
      v.name    = "docker"
      v.memory  = MEMORY
      v.cpus    = CPUS
    end
  
    node.vm.provider :libvirt do |v|
      v.memory  = MEMORY
      v.nested  = true
      v.cpus    = CPUS
    end
  
    node.vm.provision "shell", path: "bootstrap.sh"
  
  end

end
