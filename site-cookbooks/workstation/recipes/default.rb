#
# Cookbook Name:: workstation
# Recipe:: default
#
# Author:: Allan Espinosa <allan.espinosa@outlook.com>
#
# Copyright 2012-2013, Allan Espinosa
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if ENV["USER"] == "root" then
  include_recipe "git"
  include_recipe "vim"
end

current_user = node["workstation"]["user"]
home_dir = node["workstation"]["home_directory"]

git ".vim" do
  user current_user
  group current_user
  repository "http://github.com/aespinosa/dotvim.git"
  destination File.join(home_dir, ".vim")
  enable_submodules true
  action :sync
end

file File.join(home_dir, ".vimrc") do
  user current_user
  group current_user
  content <<-eos
set bg:dark
set t_Co=256
source ~/.vim/vimrc
  eos
end

remote_file File.join(home_dir, ".dircolors") do
  user current_user
  group current_user
  source "https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark"
  action :create
end

remote_file File.join(home_dir, ".screenrc") do
  user current_user
  group current_user
  source "https://gist.github.com/raw/4110273/b8ee5e62b04136177bb50725455b3f3c9bd1af7c/.screenrc"
end

execute "vim as default editor" do
  command "update-alternatives --set editor /usr/bin/vim.basic"
end
