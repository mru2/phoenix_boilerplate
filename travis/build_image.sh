#!/usr/bin/env bash

# Build the image
docker build -t mru2/phoenix-test:latest .

# Push it
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker push mru2/phoenix-test:latest
