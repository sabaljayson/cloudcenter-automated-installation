#!/bin/bash

if [ $# -ne 3 ]; then
 echo 'please provide login credentials of the cloudcenter artifact server'
 echo '1.[user name]'
 echo '2.[user password]'
 echo '3.[cc binary path]'
 exit 1
fi

USERNAME=$1
USERPASSWORD=$2
CC_BINARY_PATH=$3
GIT_REPO_PROJECT=cloudcenter-automated-installation
GIT_REPO_URL=HybridCloudSuccessful/$GIT_REPO_PROJECT.git
INSTALL_EXECUTE_FILE=cc-install-automation/99_execute.sh
INSTALL_ROOT_FOLDER=/tmp

#clean tmp
sudo rm -rf /tmp/*

#tools
sudo yum -y install unzip
sudo yum -y install zip
sudo yum -y install tar
sudo yum -y install git

git clone https://github.com/$GIT_REPO_URL /tmp/$GIT_REPO_PROJECT

source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/00_prepare-host-core.sh
source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/01_prepare-host-download-cc-package.sh $USERNAME $USERPASSWORD $CC_BINARY_PATH
source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/02_prepare-host-tools-python.sh
source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/03_prepare-host-tools-pip.sh
source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/04_prepare-host-tools-ansible.sh
source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/05_prepare-host-install-terraform.sh

cd $INSTALL_ROOT_FOLDER
chmod -R +x *.sh
#source /tmp/$GIT_REPO_PROJECT/$INSTALL_EXECUTE
