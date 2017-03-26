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
CC_BINARY_URL=$3
#$USERNAME $USERPWASSWORD $CC_BINARY_URL

############### ANSIBLE ###################
ansible-playbook playbooks/vmware-cca.yml --extra-vars "user=$USERNAME password=$USERPWASSWORD cc-binary-url=$CC_BINARY_URL"

