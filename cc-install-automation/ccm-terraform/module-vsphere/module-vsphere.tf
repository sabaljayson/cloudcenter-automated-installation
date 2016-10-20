#PHASE 2
#cluster_name/Resources/resource_pool_name
#variable "pool" {}
#variable "linked_clone" { default = false }
#variable "ssh_user" {}
#variable "ssh_key" {}
#variable "consul_dc" {}

#ENV NETWORK
variable "domain" { default = "ceclabs.local" }
variable "dns_server1" {}
variable "dns_server2" {}
variable "network_label" {}

#VCENTER
variable "datacenter" {}
variable "cluster" {}
variable "template" {}

#DEPLOY PROPERTIES
variable "short_name" {}
variable "long_name" {}
variable "folder" {}

#COUNT
variable "ccm_count" {default = 1}
variable "ccmon_count" {default = 1}

#VM CPU
variable "ccm_cpu" { default = 1 }
variable "ccmon_cpu" { default = 1 }

#VM RAM
variable "ccm_ram" { default = 4096 }
variable "ccmon_ram" { default = 4096 }

#VM VOLUME
variable "datastore" {}
variable "ccm_volume_size" {default = 20}
variable "ccmon_volume_size" {default = 20}

#CCM VM
resource "vsphere_virtual_machine" "ccm" {
  name = "${var.short_name}-manager"
  datacenter = "${var.datacenter}"
  cluster = "${var.cluster}"
  folder = "${var.folder}"
  vcpu = "${var.ccm_cpu}"
  memory = "${var.ccm_ram}"

  disk {
    template = "${var.template}"
    datastore = "${var.datastore}"
  }

  network_interface {
    label = "${var.network_label}"
  }

  domain = "${var.domain}"
  dns_servers = ["${var.dns_server1}", "${var.dns_server2}"]

  connection = {
      #user = "${var.ssh_user}"
      #key_file = "${var.ssh_key}"
      host = "${self.network_interface.0.ipv4_address}"
  }

  count = "${var.ccm_count}"
}

output "ccm" {
  value = "${join(",", vsphere_virtual_machine.ccm.*.network_interface.0.ipv4_address)}"
}

#CCMON VM (Monitor)
resource "vsphere_virtual_machine" "ccmon" {
  name = "${var.short_name}-monitor"
  datacenter = "${var.datacenter}"
  cluster = "${var.cluster}"
  folder = "${var.folder}"
  vcpu = "${var.ccmon_cpu}"
  memory = "${var.ccmon_ram}"

  disk {
    template = "${var.template}"
    datastore = "${var.datastore}"
  }

  network_interface {
    label = "${var.network_label}"
  }

  domain = "${var.domain}"
  dns_servers = ["${var.dns_server1}", "${var.dns_server2}"]

  connection = {
      #user = "${var.ssh_user}"
      #key_file = "${var.ssh_key}"
      host = "${self.network_interface.0.ipv4_address}"
  }

  count = "${var.ccmon_count}"
}

output "ccmon" {
  value = "${join(",", vsphere_virtual_machine.ccmon.*.network_interface.0.ipv4_address)}"
}


