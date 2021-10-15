#!/usr/bin/bash
# this is a script to force static IPs for the VM as customization still uses the old /etc/network/interfaces to populate the static ip. So if we don't run this, the VM will come up with a DHCP IP.
# Below is no longer used since we now use Cloud-init with TF

# cat > /etc/netplan/10-netcfg.yaml <<-EOF
# network:
#   version: 2
#   ethernets:
#     ens192:
#       addresses: [$1/24]
#       gateway4: $2
#       nameservers:
#         addresses: [$3, $4]
# EOF
# rm /etc/netplan/00-installer-config.yaml
# netplan apply
# exit 0