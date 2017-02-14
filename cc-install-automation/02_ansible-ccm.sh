#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### TERRAFORM CCM STAGING ###################
cd ccm-ansible
source 99_execute.sh
cd ..