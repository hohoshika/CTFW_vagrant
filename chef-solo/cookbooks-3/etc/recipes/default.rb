#
# Cookbook Name:: etc
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "vim" do
    action :install
end

service "httpd" do
    action [:enable, :reload]
end
