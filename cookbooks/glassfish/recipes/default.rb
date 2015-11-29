#
# Cookbook Name:: glassfish
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "glassfish::prepare_glassfish_env"
include_recipe "glassfish::get_glassfish"
include_recipe "glassfish::glassfish_install"
include_recipe "glassfish::glassfish_get_java"
