<include a CircleCI status badge, here>
[![ledoantruc](https://circleci.com/gh/ledoantruc/udacityCloudDevops_P4_DevOps_Microservices.svg?style=svg)](https://app.circleci.com/pipelines/github/ledoantruc/udacityCloudDevops_P4_DevOps_Microservices)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
    * Follow the guide to install Docker Engine: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
    * Verify installation by `docker --version` 
* Setup and Configure Kubernetes locally
    * Follow the guide to install minikube: https://minikube.sigs.k8s.io/docs/start/
    * Note that have to install Docker before installing minikube
    * Start minikube:
        minikube config set driver docker
        minikube start --driver=docker
* Set up and Configure Kubernetes on AWS
    * Install eksctl: https://github.com/weaveworks/eksctl/blob/main/README.md#installation
    * Crete new EKS Cluster: 
        eksctl create cluster --name EKS-Cluster-P4-ML --region=us-east-1
        (have to export AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY beforing install eks via eksctl)
        https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
    * Udate kube config file
        aws eks update-kubeconfig --region us-east-1  --name EKS-Cluster-P4-ML
        https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html
* Create Flask app in Container
    * Build new image with all files for Flask app then start the container from this image
        ./run_docker.sh
    
* Run via kubectl
    * update kubeconfig then run scipt below
        ./run_kubenetes.sh

### Description of the files
* app.py : the Flask app that use for predicting house pricing
* Dockerfile: build container for Flask app above
* make_prediction.sh: script to call Flask app
* Makefile: instruction file to set up environment, install dependencies, test and lint
* README.md: a text file that contains information for the users/ other developers about the project
* requirements.txt: contains all dependencies
* run_docker.sh: create image for Flask app, then run it locally
* upload_docker.sh: tag image and push it to Docker hub
* run_kubernetes.sh: create deployment for Flask app in Kubernetes
