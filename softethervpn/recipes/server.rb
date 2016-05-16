#
# Cookbook Name:: softethervpn
# Recipe:: server
#
# Following instructions at http://www.softether.org/4-docs/1-manual/7._Installing_SoftEther_VPN_Server/7.3_Install_on_Linux_and_Initial_Configurations
#
# Copyright 2014, Charles Gardner
#
# All rights reserved - Do Not Redistribute
#
include_recipe      'apt'
include_recipe      'build-essential'
include_recipe      'curl'

include_recipe      'softethervpn::default'


install_directory ="/usr/local/vpnserver"
download_url = "https://github.com/ahmedshabrawy/chef-softethervpn/blob/master/softether-vpnserver-v4.20-9608-rtm-2016.04.17-linux-x64-64bit.tar"

remote_file "#{Chef::Config[:file_cache_path]}/softether-vpnserver-v4.20-9608-rtm-2016.04.17-linux-x64-64bit.tar" do
    source download_url
    mode "0755"
    action :create
end

directory install_directory do
    action :create
end

execute "unpack_ethersoft_vpn" do
    command "tar -xgz #{Chef::Config[:file_cache_path]}/softether-vpnserver-v4.20-9608-rtm-2016.04.17-linux-x64-64bit.tar #{install_directory}"
    #only_if {File.exists?("/")}
end

service "vpnserver" do
    init_command    ""
    supports :restart => true, :start => true, :stop => true
    action [:enable,:start]
end

