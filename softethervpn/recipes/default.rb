#
# Cookbook Name:: ethersoft
# Recipe:: default
#
# Copyright 2014, Charles Gardner
#
# All rights reserved - Do Not Redistribute
#


include_recipe      'build-essential'

# install all the dependencies
#%w{curl,gcc,binutils,tar,gzip,glibc,zlib,openssl,readline,ncurses,pthread}.each do |pkg|
#    yum_package pkg do
#        action  :update
#    end
#end



execute "unpack_ethersoft_vpn" do
%w{curl,gcc,binutils,tar,gzip,glibc,zlib,openssl,readline,ncurses,pthread}.each do |pkg|
    command "yum -y update  #{pkg}"
    #only_if {File.exists?("/")}
end
end