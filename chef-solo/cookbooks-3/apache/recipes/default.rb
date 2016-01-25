#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
    action :install
end

service "httpd" do
    action [:enable, :start]
    supports :reload => true
end

directory "/var/www/html" do
    owner  'vagrant'
    group  'vagrant'
    mode 0777
    action :create
end
