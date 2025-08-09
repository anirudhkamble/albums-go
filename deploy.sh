#! /bin/bash

# Build the Docker image for the albums service
echo "Building docker image..."
docker build -t albums:latest .

# Create a Kubernetes namespace for the albums service
echo "Creating namespace"
kubectl create namespace albums

# Label the namespace to enable automatic Istio sidecar injection
echo "Label namespace for istio injection"
kubectl label namespace albums istio-injection=enabled

# Deploy the application to the Kubernetes cluster using the deployment manifest
echo "Deploying to Kubernetes cluster"
kubectl apply -f deploy/deployment.yaml

# Configure the Istio gateway for external access
echo "Configuring istio gateway"
kubectl apply -f deploy/istio-gateway.yaml

# Annotate the Istio gateway to use ClusterIP service type
echo "Annotate gateway to use ClusterIP"
kubectl -n albums annotate gateway albums
