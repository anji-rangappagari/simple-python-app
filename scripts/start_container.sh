#!/bin/bash
set -e
#oull the Docker images from the Docker hub
docker pull anjirangappagari1/simple-python-flask-app:latest

#Run the Docker image as a container
docker run -d -p 5000:5000 anjirangappagari1/simple-python-flask-app:latest