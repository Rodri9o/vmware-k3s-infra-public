master_vm_count = 1
# master_name             = "master-test"
master_cpu              = 4
master_cores-per-socket = 1
master_ram              = 4096
master_disksize         = 100 # in GB
# master_ipv4_address     = ["192.168.1.93"]
master_nodes = {
  master-test-1 = "192.168.1.93"
}

worker_vm_count = 1
# worker_name             = "worker-test"
worker_cpu              = 4
worker_cores-per-socket = 1
worker_ram              = 4096
worker_disksize         = 650 # in GB
# worker_ipv4_address     = ["192.168.1.94", "192.168.1.95", "192.168.1.96"]
worker_nodes = {
  worker-test-1 = "192.168.1.94"
  worker-test-2 = "192.168.1.95"
  worker-test-3 = "192.168.1.96"
}

vm-guest-id            = "ubuntu64Guest"
vsphere-unverified-ssl = "true"
vsphere-datacenter     = "Datacenter"
vsphere-cluster        = "Cluster01"
vm-datastore           = "Datastore1_SSD"
vm-network             = "VM Network"
vm-domain              = "home"
dns_server_list        = ["192.168.1.80", "8.8.8.8"]
ipv4_gateway           = "192.168.1.254"
ipv4_netmask           = "24"
vm-template-name       = "Ubuntu-2004-Template-100GB-Thin"