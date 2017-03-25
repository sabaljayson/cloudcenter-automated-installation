#!/bin/bash
# init
function pause(){
   read -p "$*"
}

export EPEL_RELEASE=epel-release-7-9.noarch.rpm

############### HOST SYSTEM CORE ###################
#install EPEL (extra package enterprise linux)
## RHEL/CentOS 7 64-Bit ##
## http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
wget -P /tmp http://dl.fedoraproject.org/pub/epel/7/x86_64/e/$EPEL_RELEASE
rpm -ivh /tmp/$EPEL_RELEASE

sudo yum -y install xz-libs