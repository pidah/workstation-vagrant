#
# Cookbook Name:: dircolors
# Recipe:: default
#
# Copyright 2012, Allan Espinosa
#
# All rights reserved - Do Not Redistribute
#
remote_file "/home/vagrant/.dircolors" do
  user "vagrant"
  group "vagrant"
  source "https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark"
  action :create
end
