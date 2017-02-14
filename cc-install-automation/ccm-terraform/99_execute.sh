#!/bin/bash
# init
function pause(){
   read -p "$*"
}

source 00_terraform-ccm.sh
python 01_terraform-ansible-host-ccm.py