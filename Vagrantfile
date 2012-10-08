# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise32"

  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "git"
    chef.add_recipe "vim"
    chef.add_recipe "dircolors"
    chef.add_recipe "vimrc"
  end
end
