remote_file "/tmp/#{node['epel']['file_name']}" do                                                                                         
    source "#{node['epel']['remote_uri']}"                                                                                                 
    not_if { ::File.exists?("/tmp/#{node['epel']['file_name']}") }                                                                         
end

package node['epel']['file_name'] do                                                                     
    action :install
    provider Chef::Provider::Package::Rpm
    source "/tmp/#{node['epel']['file_name']}"                                                                                            
end

remote_file "/tmp/#{node['remi']['file_name']}" do
    source "#{node['remi']['remote_uri']}"
    not_if { ::File.exists?("/tmp/#{node['remi']['file_name']}") }
end

package node['remi']['file_name'] do
     action :install
     provider Chef::Provider::Package::Rpm
     source "/tmp/#{node['remi']['file_name']}"
end

%w{php php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit}.each do |p|
	package p do
		action :install
		options "--enablerepo=remi --enablerepo=remi-php56"
	end
end

Template "/etc/php.ini" do
    source "php.ini"
    owner "vagrant"
    group "vagrant"
    mode 0644
end
