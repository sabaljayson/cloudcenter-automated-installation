#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### TERRAFORM CCM STAGING ###################
cd cco-terraform
source 99_execute.sh
cd ..