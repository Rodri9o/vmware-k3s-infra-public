# output "master_ips" {
#   value = {
#     for vm in module.vsphere_vm_master.ip :
#     vm.name => vm.guest_ip_addresses[0]
#   }
# }

# # {
# #       for vm in vsphere_virtual_machine.vm:
# #         vm.name => vm.guest_ip_addresses[0]
# #   }

# output "worker_ips" {
#   value = module.vsphere_vm_worker.ips
# }
