#
# Cookbook Name:: vimrc
# Recipe:: default
#
# Copyright 2012, Allan Espinosa
#
# All rights reserved - Do Not Redistribute
#
require_recipe "git"
require_recipe "vim"

gem_package "vim-update-bundles" do 
  action :install
end

git "vimrc" do
  user "vagrant"
  group "vagrant"
  repository "git@github.com:aespinosa/dotvim.git"
  destination "/home/vagrant/.vim"
  action :sync
end

execute "vim-update-bundles" do
  user "vagrant"
  group "vagrant"
  creates "/home/vagrant/.vim/doc/bundle-log.txt"
  command "vim-update-bundles --vimrc-path=/home/vagrant/.vim/vimrc --vimdir-path=/home/vagrant/.vim"
end

file "/home/vagrant/.vimrc" do
  user "vagrant"
  group "vagrant"
  content <<-eos
set bg:dark
set t_Co=256
source ~/.vim/vimrc
  eos
end
