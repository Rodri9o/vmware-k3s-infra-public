# =================== #
# Deploying VMware VM #
# =================== #
terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.0.2"
    }
  }
  backend "remote" {
    organization = "HashiCorp-Sam"
    token        = TFC_TOKEN

    workspaces {
      name = "vmware-k3s-infra"
    }
  }
}

# Connect to VMware vSphere vCenter
provider "vsphere" {
  vim_keep_alive = 30
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_vcenter

  # If you have a self-signed cert
  allow_unverified_ssl = var.vsphere-unverified-ssl
}

# Master VM
module "vsphere_vm_master" {
  count            = var.master_vm_count
  source           = "app.terraform.io/HashiCorp-Sam/vsphere_vm-public/vsphere"
  version          = "0.1.11"
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  vsphere_vcenter  = var.vsphere_vcenter
  ssh_username     = var.ssh_username
  ssh_password     = var.ssh_password
  # vm_count               = var.master_vm_count
  name                   = "${var.master_name}-${count.index + 1}"
  cpu                    = var.master_cpu
  cores-per-socket       = var.master_cores-per-socket
  ram                    = var.master_ram
  thin_provisioned       = var.master_thin_provisioned
  vm-template-name       = var.master_vm-template-name
  vm-guest-id            = var.vm-guest-id
  vsphere-unverified-ssl = var.vsphere-unverified-ssl
  vsphere-datacenter     = var.vsphere-datacenter
  vsphere-cluster        = var.vsphere-cluster
  vm-datastore           = var.vm-datastore
  vm-network             = var.vm-network
  vm-domain              = var.vm-domain
  dns_server_list        = var.dns_server_list
  ipv4_address           = var.master_ipv4_address[count.index]
  ipv4_gateway           = var.ipv4_gateway
  ipv4_netmask           = var.ipv4_netmask
}

# Worker VM
module "vsphere_vm_worker" {
  count            = var.worker_vm_count
  source           = "app.terraform.io/HashiCorp-Sam/vsphere_vm-public/vsphere"
  version          = "0.1.11"
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  vsphere_vcenter  = var.vsphere_vcenter
  ssh_username     = var.ssh_username
  ssh_password     = var.ssh_password
  # vm_count               = var.worker_vm_count
  name                   = "${var.worker_name}-${count.index + 1}"
  cpu                    = var.worker_cpu
  cores-per-socket       = var.worker_cores-per-socket
  ram                    = var.worker_ram
  thin_provisioned       = var.worker_thin_provisioned
  vm-template-name       = var.worker_vm-template-name
  vm-guest-id            = var.vm-guest-id
  vsphere-unverified-ssl = var.vsphere-unverified-ssl
  vsphere-datacenter     = var.vsphere-datacenter
  vsphere-cluster        = var.vsphere-cluster
  vm-datastore           = var.vm-datastore
  vm-network             = var.vm-network
  vm-domain              = var.vm-domain
  dns_server_list        = var.dns_server_list
  ipv4_address           = var.worker_ipv4_address[count.index]
  ipv4_gateway           = var.ipv4_gateway
  ipv4_netmask           = var.ipv4_netmask
}
