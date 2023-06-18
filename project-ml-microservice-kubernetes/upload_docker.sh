#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`
docker_image="uda-cloud-devops-project-ml"
docker_tag="v1.0" # latest version of image

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="truclemsoft"

# Step 2:  
# Authenticate & tag
# https://docs.docker.com/engine/reference/commandline/login/
echo "Docker ID and Image: $dockerpath"
# have to export variable dockerhub_password in terminal beforing running this script
echo "$dockerhub_password" | docker login --username $docker_path --password-stdin

docker image tag "$docker_image:$docker_tag" "$dockerpath/$docker_image:latest"

# Step 3:
# Push image to a docker repository
docker image push "$dockerpath/$docker_image:latest"