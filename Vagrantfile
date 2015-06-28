# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.15"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end
  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "file", source: "config/config.json", destination: "config.json"
  config.vm.provision "file", source: "config/99-default.json", destination: "99-default.json"
  config.vm.provision "file", source: "config/01-static.json", destination: "01-static.json"
  # [!] Assumes that files are present locally - Developmet simplifier 
  # config.vm.provision "file", source: "file/openig.jar", destination: "/tmp/openig.jar"
  # config.vm.provision "file", source: "file/OpenIG-3.1.0.war", destination: "/tmp/OpenIG-3.1.0.war"
  config.vm.provision "shell", path: "bootstrap.sh"
end
