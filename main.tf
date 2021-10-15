# =================== #
# Deploying VMware VM #
# =================== #
terraform {
  backend "remote" {
    organization = "HashiCorp-Sam"
    token        = "${TFC_TOKEN}"

    workspaces {
      name = "vmware-k3s-infra"
    }
  }
}

# Master VM
module "vsphere_vm_master" {
  source  = "app.terraform.io/HashiCorp-Sam/vsphere_vm-public/vsphere"
  version = "0.0.8"
  vsphere_user           = var.vsphere_user
  vsphere_password       = var.vsphere_password
  vsphere_vcenter        = var.vsphere_vcenter
  ssh_username           = var.ssh_username
  ssh_password           = var.ssh_password
  vm_count               = var.master_vm_count
  name                   = var.master_name
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
  ipv4_address           = var.master_ipv4_address
  ipv4_gateway           = var.ipv4_gateway
  ipv4_netmask           = var.ipv4_netmask
}

# Worker VM
module "vsphere_vm_worker" {
  source  = "app.terraform.io/HashiCorp-Sam/vsphere_vm-public/vsphere"
  version = "0.0.8"
  vsphere_user           = var.vsphere_user
  vsphere_password       = var.vsphere_password
  vsphere_vcenter        = var.vsphere_vcenter
  ssh_username           = var.ssh_username
  ssh_password           = var.ssh_password
  vm_count               = var.worker_vm_count
  name                   = var.worker_name
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
  ipv4_address           = var.worker_ipv4_address
  ipv4_gateway           = var.ipv4_gateway
  ipv4_netmask           = var.ipv4_netmask
}
