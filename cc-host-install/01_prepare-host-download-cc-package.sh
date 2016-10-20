#!/bin/bash
# init

USERNAME=$1
USERPWASSWORD=$2

function pause(){
   read -p "$*"
}

############### DOWNLOAD CC INSTALL FILES TO HOST ###################
sudo wget -P /tmp ftp://$USERNAME:$USERPWASSWORD@straube.ch/cc-install-automation/cc-install-automation.zip
sudo mkdir /tmp/cc-install-automation
sudo unzip /tmp/cc-install-automation.zip -d /tmp

sudo wget -P /tmp ftp://$USERNAME:$USERPWASSWORD@straube.ch/cc-binary/cloudcenter-release-4.6.0-20161002.1-installer-artifacts.tar
sudo mkdir /tmp/cc-binary
sudo tar -xvf /tmp/cloudcenter-release-4.6.0-20161002.1-installer-artifacts.tar -C /tmp/cc-binary

