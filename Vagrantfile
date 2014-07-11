# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65-x86_64-20140116"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  # Sync frameworks using NFS
  config.vm.synced_folder "salt/roots/", "/srv/salt/"
  # config.vm.synced_folder "projects/sintec/", "/var/www/sintec/"
  # config.vm.synced_folder "projects/apml/", "/var/www/apml/"
  config.vm.synced_folder "projects/bienal/", "/var/www/bienal/"
  
  # Sync code folders using rsync
  # config.vm.synced_folder "projects/tyasa/", "/var/www/tyasa/", type: "rsync", rsync__exclude: ".git/ .gitignore"
  # config.vm.synced_folder "projects/sintec/wp-content/themes/sintec/", "/var/www/sintec/wp-content/themes/sintec/", type: "rsync", rsync__exclude: ".git/ .gitignore"
  config.vm.synced_folder "projects/bienal/wp-content/", "/var/www/sintec/wp-content/", type: "rsync", rsync__exclude: ".git/ .gitignore"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "10.0.0.23"

  config.dns.tld = "proof.code"
  config.vm.hostname = "minion"
  config.dns.patterns = [/^.*.proof.code$/]

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.provision :salt do |salt|

    salt.minion_config = "salt/minions/dave"
    salt.run_highstate = true

  end
end

VagrantDNS::Config.auto_run
