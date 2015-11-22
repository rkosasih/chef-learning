package 'httpd'

#file '/var/www/html/index.html' do
#    content "<h1> Hello, World! </h1>
#             <h2> IP Address: #{node['ipaddress']}
#             <h2> hostname: #{node['hostname']}
#            "
#end

template '/var/www/html/index.html' do
    source 'index.html.erb'
end

service 'httpd' do
    action [ :enable, :start ]
end
