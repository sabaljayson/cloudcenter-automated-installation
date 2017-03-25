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


############### ANSIBLE ###################
source 00_ansible-cca.sh $USERNAME $USERPWASSWORD $CC_BINARY_PATH
source 01_ansible-cco.sh $USERNAME $USERPWASSWORD $CC_BINARY_PATH
