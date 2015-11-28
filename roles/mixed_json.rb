# Does not seem to work

{
  "name": "mixed_json",
  "description": "Mixed roles for ChefDK client server in json format",
  "json_class": "Chef::Role",
  "default_attributes": {

  },
  "override_attributes": {

  },
  "chef_type": "role",
  "run_list": [
    "recipe[myhaproxy]",
    "recipe[apache]",
    "recipe[hello-world]"
  ],
  "env_run_lists": {

  }
}
