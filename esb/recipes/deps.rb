#SOA ESB Deps installation
#Damith Rushika Kothalawala - 8/4/2017

node["deps"]["packages"].each do | package |
	yum_package package do
		action :upgrade
	end
end
