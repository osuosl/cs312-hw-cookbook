require 'serverspec'

set :background, :exec

%w(vim-common emacs zsh ksh).each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

describe file('/home/centos/.bashrc') do
  it { should be_file }
  its(:content) { should match %r{PATH=\$PATH:/opt/chef/bin} }
  its(:content) { should match %r{CDPATH=/home/centos} }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe iptables do
  it { should have_rule('-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT') }
end
