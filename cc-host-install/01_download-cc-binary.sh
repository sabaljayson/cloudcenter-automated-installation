#!/bin/bash
# init

if [ $# -ne 3 ]; then
 echo 'please provide login credentials of the cloudcenter artifact server'
 echo '1.[user name]'
 echo '2.[user password]'
 echo '3.[cc binary url]'
 exit 1
fi

export CC_BINARY_FOLDER=/tmp/cc-binary/cloudcenter-release-4.7.2-20170223.1-installer-artifacts

USERNAME=$1
USERPASSWORD=$2
CC_BINARY_URL=$3

mkdir $CC_BINARY_FOLDER
############### DOWNLOAD CC INSTALL FILES TO HOST ###################
sudo wget -P $CC_BINARY_FOLDER ftp://$USERNAME:$USERPASSWORD@$CC_BINARY_URL/cco-installer.jar
sudo wget -P $CC_BINARY_FOLDER ftp://$USERNAME:$USERPASSWORD@$CC_BINARY_URL/cco-response.xml
sudo wget -P $CC_BINARY_FOLDER ftp://$USERNAME:$USERPASSWORD@$CC_BINARY_URL/core_installer.bin
sudo wget -P $CC_BINARY_FOLDER ftp://$USERNAME:$USERPASSWORD@$CC_BINARY_URL/ccm-installer.jar
sudo wget -P $CC_BINARY_FOLDER ftp://$USERNAME:$USERPASSWORD@$CC_BINARY_URL/ccm-response.xml
sudo wget -P $CC_BINARY_FOLDER ftp://$USERNAME:$USERPASSWORD@$CC_BINARY_URL/conn_broker-response.xml
sudo wget -P $CC_BINARY_FOLDER ftp://$USERNAME:$USERPASSWORD@$CC_BINARY_URL/worker_installer.bin
chmod +x $CC_BINARY_FOLDER/*.bin