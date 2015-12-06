#
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

message = node['my_cookbook']['message']

# Create info logging
Chef::Log.info("** Going to run my_cookbook now ...") 
Chef::Log.info("** Saying what I was told to say : #{message}")

file "/tmp/local_mode.txt" do
    content "Created by chef client local mode #{node['my_cookbook']['message']}" 
end

template '/tmp/message' do
  source 'message.erb'
  variables(
    hi: 'Hallo',
    world: 'Welt',
    from: node['fqdn']
  )
end

# Using chef_gem

chef_gem "ipaddress" do
  compile_time true  
end

#chef_gem 'ipaddress' # depcrecated. replaced with the above.
require 'ipaddress'
ip = IPAddress("192.168.0.1/24")
Chef::Log.info("Netmask of #{ip}: #{ip.netmask}")

# Using libraries
ip = '10.10.0.0/24'
#mask = netmask (ip) # here we use the library method
mask = IPAddress.netmask(ip)
Chef::Log.info("Netmask of #{ip} : #{mask}")

# End of using chef_gem

# Environment variables

ENV['MESSAGE'] = 'Hello from Chef'

execute 'Print value of environment variable $MESSAGE' do
  command 'echo $MESSAGE > /tmp/message'
  environment 'MESSAGE' => 'Hello from the execute resource'
end

# Passing shell arguments

max_mem = node['memory']['total'].to_i * 0.8

execute 'echo max memory value into tmp file' do
  command "echo #{max_mem} > /tmp/max_mem"
end

execute 'echo max memory value into tmp file 2' do
  command <<-CODE
    echo #{message} + #{max_mem} > /tmp/max_mem2
  CODE
end

# overriding attributes
# this attributes override will be preferred by Chef compared to those from attributes and roles
# commenting this so that the one from roles shows up
#node.override['my_cookbook']['version'] = '1.5'
execute 'echo the cookbook version' do
  command "echo #{node['my_cookbook']['version']}"
end

Chef::Log.info("** Cookbook version is now #{node['my_cookbook']['version']}")

# Search servers with role upgraded_hosts
servers = search(:node, "role:upgraded_hosts")

servers.each do |srv|
  log srv.name
  Chef::Log.info ("** This is the server found via role : #{srv.name}")
end

# retrieving data bags
hook = data_bag_item('hooks','request_bin')
http_request 'callback' do
  url hook['url']
end

search(:hooks, '*:*').each do |hook|
http_request 'callback' do
  url hook['url']
  end
end

# Test only_if
http_request 'callback' do
  url node['my_cookbook']['callback']['url']
  only_if { node['my_cookbook']['callback']['enabled'] } 
end

http_request 'callback' do
  url node['my_cookbook']['callback']['url']
  only_if "test -f /etc/passwd"
end

Chef::Log.info("** my_cookbook runs successfully!")









