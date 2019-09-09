#!/usr/bin/env bash

kubectl apply -f ./explorer-client-deployment.yaml
kubectl apply -f ./explorer-client-service.yaml
kubectl apply -f ./explorer-api-deployment.yaml
kubectl apply -f ./explorer-api-service.yaml
kubectl apply -f ./explorer-ingress.yaml
