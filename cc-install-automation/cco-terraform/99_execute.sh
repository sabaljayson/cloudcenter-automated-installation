#!/bin/bash
# init
function pause(){
   read -p "$*"
}

source 00_terraform-cco.sh
python 01_terraform-ansible-host-cco.py