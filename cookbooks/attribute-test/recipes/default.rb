#
# Cookbook Name:: attribute-test
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

log "Hello #{node['chef-learning']['name']}" do
    level :info     
end
