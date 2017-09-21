#SOA ESB Deps installation
#Damith Rushika Kothalawala - 8/4/2017

execute "install GUI" do
  command "/usr/bin/yum groupinstall 'Server with GUI' -y"
end

node["deps"]["packages"].each do | package |
	yum_package package do
		action :upgrade
	end
end

#Install Java 8
include_recipe 'java_se'
include_recipe 'openssh'
