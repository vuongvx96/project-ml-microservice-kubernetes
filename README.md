[![CircleCI](https://circleci.com/gh/vuongvx96/project-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/vuongvx96/project-ml-microservice-kubernetes/?branch=master)

## Project Overview

Deploy a Machine Learning Microservice API using Python, Docker, and Kubernetes.

This is an application that serves out predictions (inferences) about housing prices through API calls. It uses a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on.

### Project Tasks

The project's goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project I did:
* Test project code using linting
* Complete a Dockerfile to containerize this application
* Deploy containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that the code has been tested

### Get Started Immediately
#### Setup the Environment

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

#### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

#### Kubernetes Steps

1. Setup and Configure Docker locally
    * Install `docker` by following instructions [link](https://docs.docker.com/desktop/linux/install/ubuntu/)
    * Run `./run_docker.sh`
    * Run `docker ps` to check whether docker is running.
    * Run `./make_prediction.sh` to make a prediction and copy/paste the logging info at the terminal to  `output_txt_files/docker_out.txt`
2. Setup and Configure Kubernetes locally
    * Setup Kubernetes using [Enable Kubernetes](https://docs.docker.com/desktop/kubernetes/) or the [Kubernetes docs](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/).
    * Install minikube as described in the [link](https://minikube.sigs.k8s.io/docs/start/)
    * Run `minikube start` to start a local cluster
    * Run `./make_prediction.sh` to make prediction and copy/paste the logging info at terminal to `output_txt_files/docker_out.txt`
3. Create Flask app in Container
    * Run `./run_docker.sh` to build and start the Flask app container.
    * Run `./upload_docker.sh` to upload the container to docker hub.
4. Run via kubectl
    * Run `./run_kubernetes.sh` to run Flask app on Kubernetes.
    * Run `kubectl get pods` to see which pods are running.
    * Run `./make_prediction.sh` to make prediction and copy/paste the logging info at terminal to `output_txt_files/kubernetes_out.txt`