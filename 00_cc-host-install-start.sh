#!/bin/bash
#start here >> wget -P /tmp http://straube.ch/cisco/cc-host-install-start.sh


if [ $# -ne 2 ]; then
 echo 'please provide login credentials of the cloudcenter artifact server'
 echo '1.[user name]'
 echo '2.[password]'
 exit 1
fi

USERNAME=$1
USERPASSWORD=$2

#clean tmp
sudo rm -rf /tmp/*

#tools
sudo yum -y install unzip
sudo yum -y install zip
sudo yum -y install tar

wget -P /tmp http://straube.ch/cisco/cc-host-install/cc-host-install.zip
sudo unzip -o /tmp/cc-host-install.zip -d /tmp

source /tmp/cc-host-install/00_prepare-host-core.sh
source /tmp/cc-host-install/01_prepare-host-download-cc-package.sh $USERNAME $USERPASSWORD
source /tmp/cc-host-install/02_prepare-host-tools-python.sh
source /tmp/cc-host-install/03_prepare-host-tools-pip.sh
source /tmp/cc-host-install/04_prepare-host-tools-ansible.sh
source /tmp/cc-host-install/05_prepare-host-install-terraform.sh

wget -P /tmp http://straube.ch/cisco/01_execute-installation.sh
chmod +x /tmp/01_execute-installation.sh
cd /tmp