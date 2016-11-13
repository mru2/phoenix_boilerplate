#!/usr/bin/env bash

# Fetch dependencies
mix local.hex --force
mix deps.get

# Build the app
MIX_ENV=prod mix compile
MIX_ENV=prod mix release

# Build the image
docker build -t mru2/phoenix-test .

# Push it
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push mru2/phoenix-test
