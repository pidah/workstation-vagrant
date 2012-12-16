# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w(cookbooks)
    chef.add_recipe "workstation"
    chef.add_recipe "screen::source"
  end
end
