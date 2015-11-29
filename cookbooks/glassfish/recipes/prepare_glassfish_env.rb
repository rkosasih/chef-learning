# Prepare glassfish Linux user and directory structure

Chef::Log.info('** Create glassfish user')

user 'glassfish-user' do
  comment 'Runtime user for glassfish'
  # leave everything as system default
end

Chef::Log.info('** Create a software directory to store software binaries')

directory '/apps/software' do
  owner 'glassfish-user'
  group 'glassfish-user'
  mode '0755'
  action :create
end

Chef::Log.info('** Create glassfish installation directory structure')

directory '/apps/server/glassfish' do
  owner 'glassfish-user'
  group 'glassfish-user'
  mode '0755'
  action :create
  recursive true
end
