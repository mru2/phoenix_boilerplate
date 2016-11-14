#! /usr/bin/env sh
set -e

# Build the release
docker build -t build-img -f Dockerfile.build .
BUILD_CONT=$(docker create build-img)
docker cp $BUILD_CONT:/src/rel/api/releases/0.0.1/api.tar.gz ./rel/api.tar.gz
docker rm $BUILD_CONT

# Unpack it
tar -xzf rel/api.tar.gz -C rel
rm rel/api.tar.gz

# Put it in the release image
docker build -t mru2/phoenix-test:latest .

# Cleanup
rm -rf rel/*
