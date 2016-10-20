#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### TERRAFORM CCM STAGING ###################
cd ccm-terraform
source 99_execute.sh
cd ..