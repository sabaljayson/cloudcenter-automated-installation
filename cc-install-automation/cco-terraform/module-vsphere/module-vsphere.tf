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
variable "folder_worker1" {}

#COUNT
variable "cco_count" {default = 1}
variable "cca_count" {default = 1}
variable "ccworker1_count" {default = 1}

#VM CPU
variable "cco_cpu" { default = 1 }
variable "cca_cpu" { default = 1 }
variable "ccworker1_cpu" { default = 1 }

#VM RAM
variable "cco_ram" { default = 4096 }
variable "cca_ram" { default = 4096 }
variable "ccworker1_ram" { default = 4096 }

#VM VOLUME
variable "datastore" {}
variable "cco_volume_size" {default = 20}
variable "cca_volume_size" {default = 20}
variable "ccworker1_volume_size" {default = 20}

#CCM VM
resource "vsphere_virtual_machine" "cco" {
  name = "${var.short_name}-orchestrator-${format("%02d", count.index+1)}"
  datacenter = "${var.datacenter}"
  cluster = "${var.cluster}"
  folder = "${var.folder}"
  vcpu = "${var.cco_cpu}"
  memory = "${var.cco_ram}"

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

  count = "${var.cco_count}"
}

output "cco" {
  value = "${join(",", vsphere_virtual_machine.cco.*.network_interface.0.ipv4_address)}"
}

#CCA VM (Rabbit MQ)
resource "vsphere_virtual_machine" "cca" {
  name = "${var.short_name}-amqp-${format("%02d", count.index+1)}"
  datacenter = "${var.datacenter}"
  cluster = "${var.cluster}"
  folder = "${var.folder}"
  vcpu = "${var.cca_cpu}"
  memory = "${var.cca_ram}"

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

  count = "${var.cca_count}"
}

output "cca" {
  value = "${join(",", vsphere_virtual_machine.cca.*.network_interface.0.ipv4_address)}"
}

#CCWORKER1 VM
resource "vsphere_virtual_machine" "ccworker1" {
  name = "${var.short_name}-ccworker1-${format("%02d", count.index+1)}"
  datacenter = "${var.datacenter}"
  cluster = "${var.cluster}"
  folder = "${var.folder_worker1}"
  vcpu = "${var.ccworker1_cpu}"
  memory = "${var.ccworker1_ram}"

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

  count = "${var.ccworker1_count}"
}

output "ccworker1" {
  value = "${join(",", vsphere_virtual_machine.ccworker1.*.network_interface.0.ipv4_address)}"
}



