# Overview

Deploy master and worker nodes for k3s

## Test

The pipeline will create a k3s cluster and store the kube config in Vault. Run the commands below to test the new cluster.

```sh
export VAULT_TOKEN=<your_token>
export VAULT_ADDR=http://vault.home
vault kv get -field k3s_config_base64 external/k3sdemo | base64 --decode > mytestconfig
export KUBECONFIG=mytestconfig
kg nodes -owide
```