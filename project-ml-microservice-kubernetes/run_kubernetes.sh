#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="truclemsoft"

# Step 2
# Run the Docker Hub container with kubernetes
docker_image="uda-cloud-devops-project-ml"
docker_tag="latest"
kubectl create deploy deployment-project-ml --image="$dockerpath/$docker_image:$docker_tag"


# Step 3:
# List kubernetes pods
kubectl get pods
sleep 60
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment.apps/deployment-project-ml 8000:80
