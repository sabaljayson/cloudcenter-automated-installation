#!/bin/bash
USERNAME=$1
USERPASSWORD=$2

zip -r upload.zip .
curl ftp://straube.ch:21/upload/upload.zip -u "$USERNAME:$USERPASSWORD" -O --quote "DELE upload/upload.zip"
curl -T upload.zip ftp://straube.ch/upload/ --user $USERNAME:$USERPASSWORD
rm -rf upload.zip

