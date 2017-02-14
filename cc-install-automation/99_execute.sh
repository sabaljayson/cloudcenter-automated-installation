#!/bin/bash
# init
function pause(){
   read -p "$*"
}

pwd
source 00_terraform-ccm.sh
source 01_terraform-cco.sh
source 02_ansible-ccm.sh
source 03_ansible-cco.sh