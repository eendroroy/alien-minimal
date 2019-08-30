# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.box_check_update = false
  config.vbguest.auto_update = false

  # config.vm.network "private_network", ip: "192.168.33
  config.vm.synced_folder ".", "/home/vagrant/alien-minimal"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = 512
  end

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y git zsh
    __line_num=$(grep -nr 'vagrant:' /etc/passwd | awk -F':' '{print $1}')
    sudo sed -i "${__line_num}s|/bin/bash|$(which zsh)|g" /etc/passwd
    git clone https://github.com/eendroroy/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    bash install
  SHELL
end
