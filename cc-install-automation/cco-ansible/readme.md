# Cisco CloudCenter deployment with Ansible

## Prerequisites:

 - 4 VMs for deloyment of components
 - CPU: 2 vCPUs
 - RAM: 4096
 - HDD:	100 GB, Thin Provisioning
 - NIC: 1
 - OS:	CentOS 7
 - Packages: yum install libselinux-python


# Preparation

## Preparation of VMs for CloudCenter functionality
 - Provision VM
 - Install OS
 - Configure IP address
 - Install: yum install libselinux-python

## Preparation of Ansible server
- Add all config files, scripts, playbooks and Cloud Center artifacts to /cc-scripts/
- Update config files under /cc-scripts/
- Install Ansible if not already installed
	yum install ansible
- Update /etc/ansible/hosts
- Update ansible configuration file if the ansible deployment is new
	/etc/ansible/ansible.cfg
	retry_files_enabled = False



# Prepare ansible playbook
- Update host to execute playbook
- Update host IP in handler

## Execute Playbook
e.g. execute: /cc-scripts/ansible-playbook ansible-vmware-install-ccm.yml