#!/bin/bash
# init
function pause(){
   read -p "$*"
}


############### TERRAFORM CCM STAGING ###################
./terraform get module-vsphere
./terraform get
./terraform plan
#pause 'Press [Enter] key to continue...'
./terraform apply
