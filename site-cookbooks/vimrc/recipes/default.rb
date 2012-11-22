#
# Cookbook Name:: vimrc
# Recipe:: default
#
# Copyright 2012, Allan Espinosa <allan.espinosa@outlook.com>
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
