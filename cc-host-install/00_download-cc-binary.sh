#!/bin/bash
# init

function pause(){
   read -p "$*"
}

if [ $# -ne 3 ]; then
 echo 'please provide login credentials of the cloudcenter artifact server'
 echo '1.[user name]'
 echo '2.[user password]'
 echo '3.[cc binary path]'
 exit 1
fi

USERNAME=$1
USERPWASSWORD=$2
CC_BINARY_PATH=$3
WORKING_FOLDER=/tmp/cc-binary

mkdir /tmp/cc-binary
############### DOWNLOAD CC INSTALL FILES TO HOST ###################
sudo wget -P $WORKING_FOLDER ftp://$USERNAME:$USERPWASSWORD@$CC_BINARY_PATH/cco-installer.jar
sudo wget -P $WORKING_FOLDER ftp://$USERNAME:$USERPWASSWORD@$CC_BINARY_PATH/cco-response.xml
sudo wget -P $WORKING_FOLDER ftp://$USERNAME:$USERPWASSWORD@$CC_BINARY_PATH/core_installer.bin
sudo wget -P $WORKING_FOLDER ftp://$USERNAME:$USERPWASSWORD@$CC_BINARY_PATH/ccm-installer.jar
sudo wget -P $WORKING_FOLDER ftp://$USERNAME:$USERPWASSWORD@$CC_BINARY_PATH/ccm-response.xml
sudo wget -P $WORKING_FOLDER ftp://$USERNAME:$USERPWASSWORD@$CC_BINARY_PATH/conn_broker-response.xml
sudo wget -P $WORKING_FOLDER ftp://$USERNAME:$USERPWASSWORD@$CC_BINARY_PATH/worker_installer.bin
chmod +x $WORKING_FOLDER/*.bin