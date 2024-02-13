#!/bin/bash

# Cluster name 
CLUSTER_NAME="mycluster"

# Create a Kind cluster
kind create cluster --name $CLUSTER_NAME

# Directory to store the kubeconfig file (Directory already exist)
KUBECONFIG_DIR="$HOME/.kube"

# Set the kubeconfig context to the new cluster
kubectl cluster-info --context kind-$CLUSTER_NAME

# Verify the cluster is runninng
kubectl get nodes

# Saving the kubeconfig for later use
kind get kubeconfig --name $CLUSTER_NAME > $KUBECONFIG_DIR/kind-config-mycluster