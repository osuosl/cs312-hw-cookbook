#
# Cookbook Name:: cs312-hw-cookbook
# Recipe:: default
#
# Copyright 2015, Oregon State University
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

include_recipe 'apache2'

%w(vim-common emacs ksh zsh).each do |p|
  package p
end

cookbook_file '/home/centos/.bashrc' do
  owner 'centos'
  group 'centos'
  mode 0644
  source 'bashrc'
end

iptables_ng_rule 'ssh' do
  rule '-p tcp -m tcp --dport 22 -j ACCEPT'
  chain 'INPUT'
end
