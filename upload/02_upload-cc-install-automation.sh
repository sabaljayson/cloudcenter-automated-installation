#!/bin/bash
USERNAME=$1
USERPASSWORD=$2

zip -r cc-install-automation.zip ../cc-install-automation
curl ftp://straube.ch:21/cc-install-automation/cc-install-automation.zip -u "$USERNAME:$USERPASSWORD" -O --quote "DELE cc-install-automation/cc-install-automation.zip"
curl -T cc-install-automation.zip ftp://straube.ch/cc-install-automation/ --user $USERNAME:$USERPASSWORD
rm -rf cc-install-automation.zip