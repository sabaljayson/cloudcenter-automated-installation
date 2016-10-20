#!/bin/bash
USERNAME=$1
USERPASSWORD=$2

source 01_upload-cc-host-install-start.sh $USERNAME $USERPASSWORD
source 02_upload-cc-install-automation.sh $USERNAME $USERPASSWORD
source 03_upload-cc-host-install.sh $USERNAME $USERPASSWORD
source 04_upload-cc-binary.sh $USERNAME $USERPASSWORD
source 05_upload-upload.sh $USERNAME $USERPASSWORD