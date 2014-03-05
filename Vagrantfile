# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65-x86_64-20140116"

  config.vm.synced_folder "salt/roots/", "/srv/salt/"
  config.vm.synced_folder "projects/", "/var/www/", :nfs => true

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "10.0.0.23"

  config.dns.tld = "proof.code"
  config.vm.hostname = "minion"
  config.dns.patterns = [/^.*.proof.code$/]

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :salt do |salt|

    salt.minion_config = "salt/minions/dave"
    salt.run_highstate = true

  end
end

VagrantDNS::Config.auto_run
