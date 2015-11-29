# Install glassfish

Chef::Log.info('** Install glassfish - unzip, configure and start-up')

glassfish_download_filename = node['glassfish']['download_filename']
glassfish_instance_directory = node['glassfish']['instance_directory']

directory "/apps/server/glassfish/#{glassfish_instance_directory}" do
  recursive true
  action :delete
end

execute "Unzip the glassfish installation file" do
  command "unzip /apps/software/#{glassfish_download_filename}"
  cwd '/apps/server/glassfish'
  user 'glassfish-user'
  group 'glassfish-user'
end


