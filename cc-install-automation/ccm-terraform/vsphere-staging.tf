provider "vsphere" {
vsphere_server = "10.16.0.189"
user = "cc_autodeploy@vsphere.local"
password = "C1sco123"
allow_unverified_ssl = "true"
}

module "module-vsphere" {
source = "./module-vsphere"
datacenter = "hx-datacenter"
cluster = "hx-cluster"
template = "sestraub/automation/tmpl-centos-7-terraform"
long_name = "cloudcenter"
short_name = "cc"
folder = "sestraub/automation/ccm"
network_label = "VLAN2400"
dns_server1 = "10.15.0.51"
dns_server2 = "10.15.0.51"
datastore = "ds01"
}
