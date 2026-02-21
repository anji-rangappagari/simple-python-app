#!/bin/bash
set -e

# Define the full image name (adjust if not Docker Hub, e.g., for ECR use '123456789012.dkr.ecr.us-east-1.amazonaws.com/anjirangappagari1/simple-python-flask-app:latest')
IMAGE="docker.io/anjirangappagari1/simple-python-flask-app:latest"

echo "Pulling the latest image: $IMAGE"
docker pull "$IMAGE"  # This works with Podman emulation

echo "Stopping and removing any existing container (if running)..."
docker stop simple-flask-app || true  # '|| true' ignores errors if no container exists
docker rm simple-flask-app || true

echo "Starting the new container..."
docker run -d \
  --name simple-flask-app \
  -p 5000:5000 \  # Maps host port 5000 to container port 5000 (matches your Dockerfile and app.py)
  "$IMAGE"

echo "Container started successfully. Access at http://<EC2-IP>:5000/"