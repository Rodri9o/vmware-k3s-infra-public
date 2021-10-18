# Overview

Deploy master and worker nodes for k3s on vSphere using a Packer image already built. You can find a reference to the Packer [GitLab repo here.](https://gitlab.com/public-projects3/infrastructure-vmware-public/vmware-packer-ubuntu20-04-public/-/tree/main)

This repo uses a [Terraform module to deploy VMs](https://gitlab.com/all-my-projects1/infrastructure-vmware/terraform-vsphere-vsphere_vm) in vSphere. The module uses Cloud-Init for customization.

## Test

The pipeline will create a k3s cluster and store the kube config in Vault. Run the commands below to test the new cluster.

```sh
export VAULT_TOKEN=<your_token>
export VAULT_ADDR=http://vault.home
vault kv get -field k3s_config_base64 external/k3sdemo | base64 --decode > mytestconfig
export KUBECONFIG=mytestconfig
kg nodes -owide
```