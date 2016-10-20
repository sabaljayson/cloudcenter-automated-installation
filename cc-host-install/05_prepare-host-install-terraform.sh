#!/bin/bash
# init
function pause(){
   read -p "$*"
}

############### TERRAFORM VM STAGING ###################
#install terraform
sudo wget -P /tmp https://releases.hashicorp.com/terraform/0.7.4/terraform_0.7.4_linux_amd64.zip
sudo unzip -o /tmp/terraform_0.7.4_linux_amd64 -d /tmp/cc-install-automation/ccm-terraform
sudo unzip -o /tmp/terraform_0.7.4_linux_amd64 -d /tmp/cc-install-automation/cco-terraform





