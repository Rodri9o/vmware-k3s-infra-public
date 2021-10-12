master_vm_count            = 1
master_name             = "master-test"
master_cpu              = 4
master_cores-per-socket = 1
master_ram              = 4096
master_thin_provisioned = true
master_vm-template-name = "Ubuntu-2004-Template-100GB-Thin"
master_ipv4_address     = ["192.168.110.93"]

worker_vm_count            = 1
worker_name             = "worker-test"
worker_cpu              = 4
worker_cores-per-socket = 1
worker_ram              = 4096
worker_thin_provisioned = true
worker_vm-template-name = "Ubuntu-2004-Template-650GB-Thin"
worker_ipv4_address     = ["192.168.110.94"]

vm-guest-id            = "ubuntu64Guest"
vsphere-unverified-ssl = "true"
vsphere-datacenter     = "Datacenter"
vsphere-cluster        = "Cluster01"
vm-datastore           = "Datastore1_SSD"
vm-network             = "VM Network"
vm-domain              = "home"
dns_server_list        = ["192.168.110.2", "8.8.8.8"]
ipv4_gateway           = "192.168.110.1"
ipv4_netmask           = "24"
