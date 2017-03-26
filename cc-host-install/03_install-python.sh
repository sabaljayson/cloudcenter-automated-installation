#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### INSTALL PYTHON ###################
#install python & setuptools
#https://pypi.python.org/pypi/setuptools
sudo wget -P /tmp https://bootstrap.pypa.io/ez_setup.py -O - | sudo python
#needed for ansible python execution
sudo yum -y install libselinux-python