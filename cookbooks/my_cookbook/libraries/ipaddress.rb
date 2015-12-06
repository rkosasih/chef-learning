#class Chef::Recipe
#  def netmask(ipaddress)
#    IPAddress(ipaddress).netmask
#  end
#end

# A better way of creating class for not polluting Chef::Recipe namespace
class Chef::Recipe::IPAddress
  def self.netmask(ipaddress)
    IPAddress(ipaddress).netmask
  end
end
