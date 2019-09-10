#!/usr/bin/env bash
# Build the images
docker-compose -f "docker-compose.yml" up -d --build
# calculate what the created container ids were
docker images | egrep -o "explorer_explorer-client.*" | head -n1 | egrep -o "[a-fA-F0-9]{12}"
CLIENT_CONTAINER_ID=$(docker images | egrep -o "explorer_explorer-client.*" | head -n1 | egrep -o "[a-fA-F0-9]{12}")
docker images | egrep -o "explorer_explorer-api.*" | head -n1 | egrep -o "[a-fA-F0-9]{12}"
API_CONTAINER_ID=$(docker images | egrep -o "explorer_explorer-api.*" | head -n1 | egrep -o "[a-fA-F0-9]{12}")
# tag those container ids
echo "Tagging image id's.."
docker tag "$(echo $CLIENT_CONTAINER_ID)" 155651965374.dkr.ecr.eu-west-2.amazonaws.com/explorer-client
docker tag $(echo $API_CONTAINER_ID) 155651965374.dkr.ecr.eu-west-2.amazonaws.com/explorer-api
# login with the ecr
echo "Logging into the ECR..."
login() {
  $(aws ecr get-login --no-include-email)
}
login 2>&1
# push the container ids up to the ecr
echo "Pushing images to ECR..."
docker push 155651965374.dkr.ecr.eu-west-2.amazonaws.com/explorer-client
docker push 155651965374.dkr.ecr.eu-west-2.amazonaws.com/explorer-api
# run the deploy scripts
echo "Deploying to Kubernetes..."
cd k8s
./deploy.sh
echo "Scaling deployments..."
kubectl scale deployment explorer-client --replicas=0; kubectl scale deployment explorer-client --replicas=2;
kubectl scale deployment explorer-api --replicas=0; kubectl scale deployment explorer-api --replicas=2;
# watch for pods to be ready
kubectl get pods -l app=explorer --all-namespaces -w -o wide &
echo "Complete!"
exit 1
