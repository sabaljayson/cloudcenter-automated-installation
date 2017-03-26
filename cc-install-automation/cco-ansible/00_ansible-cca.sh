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
USERPASSWORD=$2
CC_BINARY_URL=$3
#$USERNAME $USERPASSWORD $CC_BINARY_URL

############### ANSIBLE ###################
ansible-playbook playbooks/vmware-cca.yml --extra-vars "user=$USERNAME password=$USERPASSWORD cc_binary_url=$CC_BINARY_URL"

