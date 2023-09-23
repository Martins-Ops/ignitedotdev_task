#!/bin/bash

# Cluster name 
CLUSTER_NAME="cluster"

# Directory to store the kubeconfig file
KUBECONFIG_DIR="$HOME/.kube"

# Create a Kind cluster
kind create cluster --name $CLUSTER_NAME

# Set the kubeconfig context to the new cluster
kubectl cluster-info --context kind-$CLUSTER_NAME

# Verify the cluster is running
kubectl get nodes

# Copy the kubeconfig to a specified Directory
kubectl config view --minify --flatten --context="kind-$CLUSTER_NAME" > $KUBECONFIG_DIR/config-kind

