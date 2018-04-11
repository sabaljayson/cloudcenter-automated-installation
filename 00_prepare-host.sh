#!/bin/bash

if [ $# -ne 3 ]; then
 echo 'please provide login credentials of the cloudcenter artifact server'
 echo '1.'
 echo '2.[admin]'
 echo '3.[cloudnexus]'
 exit 1
fi

export USERNAME=admin
export USERPASSWORD=admin
export CC_BINARY_URL=cloudnexus
export INSTALL_ROOT_FOLDER=/tmp
export INSTALL_AUTOMATION_FOLDER=cc-install-automation
export GIT_REPO_PROJECT=cloudcenter-automated-installation
export GIT_REPO_URL=HybridCloudSuccessful/$GIT_REPO_PROJECT.git

#tools
sudo yum -y update
sudo yum -y install sshpass
sudo yum -y install xz-libs
sudo yum -y install git
sudo yum -y install wget

#clean tmp for testing
#sudo rm -rf $INSTALL_ROOT_FOLDER/*

#github project clone
git clone https://github.com/$GIT_REPO_URL /tmp/$GIT_REPO_PROJECT

source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/01_download-cc-binary.sh $USERNAME $USERPASSWORD $CC_BINARY_URL
source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/02_install-epel.sh
source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/03_install-python.sh
source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/04_install-pip.sh
source $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/cc-host-install/05_install-ansible.sh

cd /tmp/$GIT_REPO_PROJECT
chmod -R +x *sh

cd $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/$INSTALL_AUTOMATION_FOLDER
chmod -R +x *sh
pwd

cd $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/$INSTALL_AUTOMATION_FOLDER/ccm-terraform
chmod -R +x *sh
chmod -R +x terraform

cd $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/$INSTALL_AUTOMATION_FOLDER/cco-terraform
chmod -R +x *sh
chmod -R +x terraform

cd $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/$INSTALL_AUTOMATION_FOLDER/ccm-ansible
chmod -R +x *sh

cd $INSTALL_ROOT_FOLDER/$GIT_REPO_PROJECT/$INSTALL_AUTOMATION_FOLDER/cco-ansible
chmod -R +x *sh

cd ..
