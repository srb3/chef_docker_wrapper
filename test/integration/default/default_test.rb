# InSpec test for recipe chef_docker_wrapper::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe package('docker-ce') do
  it { should be_installed }
end

describe port(2375) do
  it { should be_listening }
end
