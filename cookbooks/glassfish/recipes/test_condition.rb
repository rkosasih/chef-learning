# Test using condition

some_condition = File.exists?("/home/ec2-user/installs/chefdk-0.10.0-1.el7.x86_64.rpm") # Your specific check here

if some_condition
  puts "File exists!"
end
