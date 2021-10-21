#!/usr/bin/bash
arrMASTER_NAMES=($1)
arrWORKER_NAMES=($2)
arrMASTER_IPS=($3)
arrWORKER_IPS=($4)
USER_K3S=$5
K3S_VERSION=$6
K3S_CONTEXT=$7

curl -sLS https://get.k3sup.dev | sh
sudo install k3sup /usr/local/bin/
# I'm only installing one master node, I haven't looked into multi-master nodes for HA
k3sup install --ip ${arrMASTER_IPS[0]} --local-path ~/.kube/config --k3s-version ${K3S_VERSION} --context ${K3S_CONTEXT} --user ${USER_K3S}
sleep 20

for (( i=1; i<${#arrMASTER_IPS[@]}; i++ ))
    do  
        k3sup join --ip ${arrMASTER_IPS[i]} --server-ip ${arrMASTER_IPS[0]} --user ${USER_K3S} --server-user $USER --k3s-version ${K3S_VERSION} --server || true
    done
sleep 20
for (( i=0; i<${#arrWORKER_IPS[@]}; i++ ))
    do  
        k3sup join --ip ${arrWORKER_IPS[i]} --server-ip ${arrMASTER_IPS[0]} --user ${USER_K3S} --k3s-version ${K3S_VERSION} || true
    done

sleep 20
kubectl get nodes -owide
kubectl taint nodes ${arrMASTER_NAMES[0]} key=value:NoSchedule || true