#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### INSTALL PIP ###################
#http://stackoverflow.com/questions/22073516/failed-to-install-python-cryptography-package-with-pip-and-setup-py
sudo yum -y install gcc libffi-devel python-devel openssl-devel python-pip
sudo easy_install pip
sudo pip install --upgrade pip
sudo pip install cryptography
