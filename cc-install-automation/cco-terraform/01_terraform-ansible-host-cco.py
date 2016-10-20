#!/usr/bin/env python
ENCODING='utf-8'
import configobj
import json
import argparse

parser = argparse.ArgumentParser()
#parser.add_argument("monitorid", help="monitorId must be unique to identify the monitor instance so that multiple monitor instances can use the same cloud accounts to do health check without interfering with each other")
args = parser.parse_args()

# /etc/ansible/hosts
ansibleHostsFile = '/etc/ansible/hosts'
terraformStateFile = 'terraform.tfstate'
etcHostsFile = '/etc/hosts'

with open(terraformStateFile) as data_file:    
 dataJson = json.load(data_file)
 resourcesJson = dataJson['modules'][1]['resources'];
 
myDictAnsible = {
'['+resourcesJson['vsphere_virtual_machine.cco']['primary']['attributes']['name']+']' : resourcesJson['vsphere_virtual_machine.cco']['primary']['attributes']['network_interface.0.ipv4_address']+' ansible_ssh_user=root ansible_ssh_pass="C1sco123"',
'['+resourcesJson['vsphere_virtual_machine.cca']['primary']['attributes']['name']+']' : resourcesJson['vsphere_virtual_machine.cca']['primary']['attributes']['network_interface.0.ipv4_address']+' ansible_ssh_user=root ansible_ssh_pass="C1sco123"',
'['+resourcesJson['vsphere_virtual_machine.ccworker1']['primary']['attributes']['name']+']' : resourcesJson['vsphere_virtual_machine.ccworker1']['primary']['attributes']['network_interface.0.ipv4_address']+' ansible_ssh_user=root ansible_ssh_pass="C1sco123"',
}

with open(ansibleHostsFile, 'a') as f:
 f.writelines('{}\n{}\n'.format(k,v) for k, v in myDictAnsible.items())

myDictHosts = {
resourcesJson['vsphere_virtual_machine.cco']['primary']['attributes']['network_interface.0.ipv4_address'] : resourcesJson['vsphere_virtual_machine.cco']['primary']['attributes']['name'],
resourcesJson['vsphere_virtual_machine.cca']['primary']['attributes']['network_interface.0.ipv4_address'] : resourcesJson['vsphere_virtual_machine.cca']['primary']['attributes']['name'],
resourcesJson['vsphere_virtual_machine.ccworker1']['primary']['attributes']['network_interface.0.ipv4_address'] : resourcesJson['vsphere_virtual_machine.ccworker1']['primary']['attributes']['name'],
}

with open(etcHostsFile , 'a') as f:
 f.writelines('{}\t{}\n'.format(k,v) for k, v in myDictHosts.items())