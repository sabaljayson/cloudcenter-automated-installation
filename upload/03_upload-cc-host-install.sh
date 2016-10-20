#!/bin/bash
USERNAME=$1
USERPASSWORD=$2

zip -r cc-host-install.zip ../cc-host-install
curl ftp://straube.ch:21/cc-host-install/cc-host-install.zip -u "$USERNAME:$USERPASSWORD" -O --quote "DELE cc-host-install/cc-host-install.zip"
curl -T cc-host-install.zip ftp://straube.ch/cc-host-install/ --user $USERNAME:$USERPASSWORD
rm -rf cc-host-install.zip
