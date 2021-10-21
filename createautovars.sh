#!/usr/bin/bash
# ./createautovars.sh "master-test-1" "worker-test-1 worker-test-2 worker-test-3" "192.168.1.93" "192.168.1.94 192.168.1.95 192.168.1.96"
# MASTER_NAMES="master-test-1"
# WORKER_NAMES="worker-test-1 worker-test-2 worker-test-3"
# MASTER_IPS="192.168.1.93"
# WORKER_IPS="192.168.1.94 192.168.1.95 192.168.1.96"

arrMASTER_NAMES=($1)
arrWORKER_NAMES=($2)
arrMASTER_IPS=($3)
arrWORKER_IPS=($4)

echo master_nodes = { > ips.auto.tfvars
for (( i=0; i<${#arrMASTER_NAMES[@]}; i++ ))
    do  
        echo ${arrMASTER_NAMES[i]} = \"${arrMASTER_IPS[i]}\" >> ips.auto.tfvars
    done
echo } >> ips.auto.tfvars
echo worker_nodes = { >> ips.auto.tfvars
for (( i=0; i<${#arrWORKER_NAMES[@]}; i++ ))
    do  
        echo ${arrWORKER_NAMES[i]} = \"${arrWORKER_IPS[i]}\" >> ips.auto.tfvars
    done
echo } >> ips.auto.tfvars

