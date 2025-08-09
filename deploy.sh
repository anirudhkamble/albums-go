#! /bin/bash

# echo "Building docker image..."
# docker build -t albums:latest .

# echo "Creating namespace"
# kubectl create namespace albums

echo "Label namespace for istio injection"
kubectl label namespace albums istio-injection=enabled

echo "Deploying to Kubernetes cluster"
kubectl apply -f deploy/deployment.yaml

echo "Configuring istio gateway"
kubectl apply -f deploy/istio-gateway.yaml

echo "Annotate gateway to use ClusterIP"
kubectl -n albums annotate gateway albums-gateway networking.istio.io/service-type=ClusterIP