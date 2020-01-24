#! /bin/ash
# K8S_CLUSTER_ENDPOINT 
# K8S_CLUSTER_CA
# K8S_USER_TOKEN


echo $K8S_CLUSTER_CA >> ca.crt
kubectl config set-cluster work-cluster --server=$K8S_CLUSTER_ENDPOINT --embed-certs --certificate-authority=./ca.crt
kubectl config set-credentials user_work-cluster --token=$K8S_USER_TOKEN
kubectl config set-context work-cluster --cluster=work-cluster --user=user_work-cluster
kubectl config use-context work-cluster 