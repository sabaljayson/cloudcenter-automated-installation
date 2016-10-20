#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### ANSIBLE ###################
ansible-playbook playbooks/vmware-ccmon.yml

