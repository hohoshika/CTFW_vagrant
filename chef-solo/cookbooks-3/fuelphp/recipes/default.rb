#
# Cookbook Name:: fuelphp
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
service "iptables" do
  action [:stop, :disable]
end

service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

template "/etc/httpd/conf.d/fuelphp.conf" do
  source "web_app.conf.erb"
  mode "0644"
  notifies :restart, "service[httpd]"
end

template "/etc/php.ini" do
  source "php.ini.erb"
  mode "0644"
  notifies :restart, "service[httpd]"
end

# create the databases
node[:db].each do |name|
    execute "create database #{name}" do
        command "mysql -uroot -p#{node[:mysql][:server_root_password]} -e 'create database if not exists #{name}'"
        user "vagrant"
    end
end

# add a quick symlink
link "/home/vagrant/fuelphp" do
    to "/mnt/fuelphp"
end

# download FUEL
execute "download_fuel_fw" do
    command "curl get.fuelphp.com/oil | sh"
    action :run
end

# create FUEL project
execute "create_fuel_project" do
    command "cd /mnt/fuelphp/CTFW && oil create app"
    action :run
end

