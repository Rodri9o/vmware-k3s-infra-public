#!/usr/bin/bash
MASTER_COUNT=1
WORKER_COUNT=3
MASTER_1_NAME=master-test-1
WORKER_1_NAME=worker-test-1
WORKER_2_NAME=worker-test-2
WORKER_3_NAME=worker-test-3
MASTER_1_IP="192.168.1.93"
WORKER_1_IP="192.168.1.94"
WORKER_2_IP="192.168.1.95"
WORKER_3_IP="192.168.1.96"
cat > ips.auto.tfvars <<-EOF
master_nodes = {
    ${MASTER_1_NAME} = ${MASTER_1_IP}
}
worker_nodes = {
    for (( i=0; i<${WORKER_COUNT}; i++ ))
    do  
        echo ${WORKER_1_NAME} = ${WORKER_1_IP}
    done
    ${WORKER_1_NAME} = ${WORKER_1_IP}
    ${WORKER_2_NAME} = ${WORKER_2_IP}
    ${WORKER_3_NAME} = ${WORKER_3_IP}
}
EOF