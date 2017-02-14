#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### ANSIBLE ###################
source 00_ansible-ccm.sh
source 01_ansible-ccmon.sh

