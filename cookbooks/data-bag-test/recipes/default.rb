#
# Cookbook Name:: data-bag-test
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

_variables = data_bag('vars')
#admin = data_bag_item('vars','var')

#execute "data bag items" do
#    command "echo #{admins}"
#end

_variables.each do |_variable|
  item = data_bag_item("vars", _variable)
  execute "content of #{_variable}" do
      command "echo Hello : #{item['id']}"
      #command "echo Hello : #{item['nexus_url']}"
  end

  execute "content of #{_variable}" do
      command "echo Hello - #{item['first_name']}"
  end

end

