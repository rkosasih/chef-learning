{
  "name"=> "book",
  "description"=> "",
  "cookbook_versions"=> {

  },
  "json_class"=> "Chef=>=>Environment",
  "chef_type"=> "environment",
  "default_attributes"=> {

  },
  "override_attributes"=> {
    "ntp"=> {
      "servers" => [
        "0.europe.pool.ntp.org",
        "1.europe.pool.ntp.org",
        "2.europe.pool.ntp.org",
        "3.europe.pool.ntp.org"
      ]
    }
  }
}

