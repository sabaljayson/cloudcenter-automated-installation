#!/bin/bash
USERNAME=$1
USERPASSWORD=$2

curl ftp://straube.ch:21/00_cc-host-install-start.sh -u "$USERNAME:$USERPASSWORD" -O --quote "DELE 00_cc-host-install-start.sh"
curl -T ../00_cc-host-install-start.sh ftp://straube.ch --user $USERNAME:$USERPASSWORD

curl ftp://straube.ch:21/01_execute-installation.sh -u "$1:$2" -O --quote "DELE 01_execute-installation.sh"
curl -T ../01_execute-installation.sh ftp://straube.ch --user $USERNAME:$USERPASSWORD
