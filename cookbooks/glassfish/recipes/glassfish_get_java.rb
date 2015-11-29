# Install Redhat Java rpm 

Chef::Log.info ('**  Install Java package')

java_package = node['glassfish']['java']

package "#{java_package}"
