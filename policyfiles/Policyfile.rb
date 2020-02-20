name 'chef_docker_wrapper'

default_source :supermarket

cookbook 'chef_docker_wrapper', path: '../'

run_list 'chef_docker_wrapper::default'
