#!/usr/bin/env bash
echo "Deploying explorer app resources to Kubernetes..."
kubectl apply -f ./explorer-client-deployment.yaml
kubectl apply -f ./explorer-client-service.yaml
kubectl apply -f ./explorer-api-deployment.yaml
kubectl apply -f ./explorer-api-service.yaml
kubectl apply -f ./explorer-ingress.yaml
echo "Done."
exit 1