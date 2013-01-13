#
# Cookbook Name:: workstation
# Recipe:: default
#
# Author:: Allan Espinosa <allan.espinosa@outlook.com>
#
# Copyright 2013, Allan Espinosa
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

author       = node["workstation"]["name"]
email        = node["workstation"]["email"]
current_user = node["workstation"]["user"]
home_dir     = node["workstation"]["home_directory"]

file ".gitignore_global" do
  path File.join(home_dir, name)
  owner current_user
  group current_user
  content <<-eos
*.sw[a-z]
  eos
  action :nothing
end

bash "git config" do
  user current_user
  group current_user
  cwd home_dir
  code <<-eos
git config --global user.name \"#{author}\"
git config --global user.email \"#{email}\"
git config --global core.excludesfile #{File.join home_dir, ".gitignore_global"}
  eos
  creates File.join(home_dir, ".gitconfig")
  notifies :create, "file[.gitignore_global]"
end
