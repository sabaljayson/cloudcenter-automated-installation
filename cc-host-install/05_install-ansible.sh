#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### INSTALL ANSIBLE ###################
#http://docs.ansible.com/ansible/intro_installation.html
sudo pip install ansible
sudo pip install ansible --upgrade

mkdir /etc/ansible
touch /etc/ansible/hosts
touch /etc/ansible/ansible.cfg
echo '[defaults]' > /etc/ansible/ansible.cfg
echo 'host_key_checking = False' >> /etc/ansible/ansible.cfg
