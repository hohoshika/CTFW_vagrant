node_name "ctfw"

base = File.expand_path('..', __FILE__)

nodes_path                File.join(base, 'nodes')
role_path                 File.join(base, 'roles')
data_bag_path             File.join(base, 'data_bags')
encrypted_data_bag_secret File.join(base, 'data_bag_key')
environment_path          File.join(base, 'environments')
environment               "_default"
ssl_verify_mode           :verify_peer

cookbook_path []
cookbook_path << File.join(base, 'cookbooks-1') # /Users/hotaru/.chefdk/gem/ruby/2.1.0/gems/knife-solo-0.4.2/lib/knife-solo/resources/patch_cookbooks
cookbook_path << File.join(base, 'cookbooks-2') # /Users/hotaru/develop/CTFW/cookbooks
cookbook_path << File.join(base, 'cookbooks-3') # /Users/hotaru/develop/CTFW/site-cookbooks
