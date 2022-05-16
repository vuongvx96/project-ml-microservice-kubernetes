#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=vuongvx/housing-price-predication

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run housing-price-predication --image=$dockerpath:v1.0.0 --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/housing-price-predication --address 0.0.0.0 8000:80
