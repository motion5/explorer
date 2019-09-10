#!/usr/bin/env bash

echo "Tearing down explorer app resources from Kubernetes..."
kubectl delete -f ./explorer-ingress.yaml
kubectl delete -f ./explorer-api-service.yaml
kubectl delete -f ./explorer-api-deployment.yaml
kubectl delete -f ./explorer-client-service.yaml
kubectl delete -f ./explorer-client-deployment.yaml
echo "Done."
exit 1
