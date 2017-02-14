#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### ANSIBLE ###################
source 00_ansible-cca.sh
source 01_ansible-cco.sh
