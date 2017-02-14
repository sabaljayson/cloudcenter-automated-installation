#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### TERRAFORM CCM STAGING ###################
cd cco-ansible
source 99_execute.sh
cd ..