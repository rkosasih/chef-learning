#
# Cookbook Name:: hello-world
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute 'Hello world statement' do
    command 'echo Hello World. This is my first Chef cookbook!'
end

