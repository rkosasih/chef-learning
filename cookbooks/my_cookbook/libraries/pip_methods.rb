module Pip 
  module Methods 
    def convert_json_to_cli (_user, _group)
      #puts "Converting Json to CLI"
      execute "Test Chef Resource Within Library" do
        command "echo Hello World. I am chef resource within a library"
      end
  
      remote_directory "/tmp/test_additional_libs_2" do
        source "additional_libs"
        files_owner _user 
        files_group _group 
      end

      Chef::Log.info("** Converting Json To CLI")
    end
  end
end
