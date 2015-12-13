#
# Cookbook Name:: my_wordpress
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

node.default['apache']['mpm'] = 'prefork'
node.default['wordpress']['db']['database'] = "my_wordpress"
node.default['wordpress']['db']['user'] = "me"
node.default['wordpress']['db']['password'] = "p@SsWP111983"

include_recipe "wordpress"
