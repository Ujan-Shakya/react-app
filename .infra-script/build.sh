#!/bin/sh

echo "Docker build"
sudo docker build -t $GITHUB_REPOSITORY:latest -f Dockerfile-dev .
