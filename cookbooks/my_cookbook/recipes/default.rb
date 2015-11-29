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

Chef::Log.info("** my_cookbook runs successfully!") 
