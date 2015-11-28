name 'mixed'
description 'Mixed roles for ChefDK client server'
run_list 'recipe[myhaproxy]', 'recipe[apache]', 'recipe[hello-world]'

