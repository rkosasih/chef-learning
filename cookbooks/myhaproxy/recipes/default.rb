#
# Cookbook Name:: myhaproxy
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

node.default['haproxy']['members'] = [
  {
    'hostname' => 'ec2-52-64-23-24.ap-southeast-2.compute.amazonaws.com',
    'ipaddress' => '52.64.23.24',
    'port' => 80,
    'ssl_port' => 80
  }]

all_lb_nodes = search('node','role:load_balancer')    

#execute "print nodes" do
#    command "echo Nodes with role = web : #{all_web_nodes}"
#end

all_lb_nodes.each do |lb_node|
    execute "print nodes" do
        command "echo Nodes with role load_balancer : #{lb_node}"
    end
end

include_recipe 'haproxy::default'
