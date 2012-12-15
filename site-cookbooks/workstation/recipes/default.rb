#
# Cookbook Name:: workstation
# Recipe:: default
#
# Author:: Allan Espinosa <allan.espinosa@outlook.com>
#
# Copyright 2012, Allan Espinosa
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

include_recipe "git"
include_recipe "vim"

git "vimrc" do
  user "vagrant"
  group "vagrant"
  repository "http://github.com/aespinosa/dotvim.git"
  destination "/home/vagrant/.vim"
  enable_submodules true
  action :sync
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

remote_file "/home/vagrant/.dircolors" do
  user "vagrant"
  group "vagrant"
  source "https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark"
  action :create
end
