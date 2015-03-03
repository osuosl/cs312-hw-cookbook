#
# Cookbook Name:: cs312-hw-cookbook
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

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
