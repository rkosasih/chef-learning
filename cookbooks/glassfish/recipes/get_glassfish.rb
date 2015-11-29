# Download glassfish from GlassFish website

Chef::Log.info('** Downnload GlassFish 4')

glassfish_download_url = node['glassfish']['download_url']
glassfish_download_filename = node['glassfish']['download_filename']

remote_file "/apps/software/#{glassfish_download_filename}" do
  source "#{glassfish_download_url}/#{glassfish_download_filename}"
  owner 'glassfish-user'
  group 'glassfish-user'
  mode '0644'
  action :create_if_missing
end

execute "Print full download url on screen" do
    command "echo This is the download URL : #{glassfish_download_url}/#{glassfish_download_filename}"
end
