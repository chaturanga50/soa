#!/bin/bash

yum install git -y

`rpm -q chef 2>&1 > /dev/null`
if [ $? -ne 0 ]
then
	yum install https://packages.chef.io/files/stable/chef/13.2.20/el/7/chef-13.2.20-1.el7.$(uname -p).rpm -y
fi

git clone https://github.com/damithkothalawala/soa.git /tmp/soa
chef-client -c //tmp/soa/client.rb -zj /tmp/soa/esb.json -r "recipe[esb::deps]"

rm -rf /tmp/soa
