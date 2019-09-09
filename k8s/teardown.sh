#!/usr/bin/env bash

kubectl delete -f ./explorer-ingress.yaml
kubectl delete -f ./explorer-api-service.yaml
kubectl delete -f ./explorer-api-deployment.yaml
kubectl delete -f ./explorer-client-service.yaml
kubectl delete -f ./explorer-client-deployment.yaml
