#!/usr/bin/env bash

## Complete the following steps to get Docker running locally
docker_image="uda-cloud-devops-project-ml"
docker_tag="v1.0"

# Step 1:
# Build image and add a descriptive tag
docker build --tag ${docker_image}:${docker_tag} .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker run --detach --publish 8000:80 ${docker_image}:${docker_tag}