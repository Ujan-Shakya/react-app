#!/bin/sh

sudo docker build -t $GITHUB_REPOSITORY:latest -f Dockerfile-dev .
