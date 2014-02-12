# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65-x86_64-20131205"
  
  config.vm.synced_folder "salt/roots/", "/srv/salt/"
  config.vm.synced_folder "projects/", "/var/www/"
  
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :salt do |salt|
  
    salt.minion_config = "salt/minions/dave"    
    salt.run_highstate = true

  end
end
