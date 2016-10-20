#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### HOST SYSTEM CORE ###################
#common update
sudo yum -y update

#tools
sudo yum -y install unzip
sudo yum -y install zip
sudo yum -y install tar
sudo yum -y install sshpass

#install EPEL (extra package enterprise linux)
## RHEL/CentOS 7 64-Bit ##
## http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
wget -P /tmp http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
rpm -ivh /tmp/epel-release-7-8.noarch.rpm
sudo yum -y install xz-libs



