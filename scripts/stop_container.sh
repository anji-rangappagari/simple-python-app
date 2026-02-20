#!/bin/bash
set -e

#Stop the running container (if any)
docker stop $(docker ps -q --filter ancestor=anjirangappagari1/simple-python-flask-app:latest) || true