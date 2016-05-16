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

include_recipe      'build-essential'
include_recipe      'curl'

include_recipe      'softethervpn::default'


install_directory ="/usr/local/vpnserver"
download_url = "http://www.softether-download.com/files/softether/v4.20-9608-rtm-2016.04.17-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.20-9608-rtm-2016.04.17-linux-x64-64bit.tar.gz"

remote_file "#{Chef::Config[:file_cache_path]}/softether-vpnserver-v4.20-9608-rtm-2016.04.17-linux-x64-64bit.tar.gz" do
    source download_url
    mode "0755"
    action :create
end

directory install_directory do
    action :create
end

execute "unpack_ethersoft_vpn" do
    command "tar -xzf #{Chef::Config[:file_cache_path]}/softether-vpnserver-v4.20-9608-rtm-2016.04.17-linux-x64-64bit.tar.gz #{install_directory}"
    #only_if {File.exists?("/")}
end

service "vpnserver" do
    init_command    ""
    supports :restart => true, :start => true, :stop => true
    action [:enable,:start]
end

