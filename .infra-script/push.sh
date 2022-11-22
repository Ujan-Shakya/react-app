#!/bin/sh

sudo aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && sudo aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY

sudo aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin $ECR_LOGIN_PASSWORD

sudo docker tag :latest $ECR_REPOSITORY_URL:$GITHUB_REF_NAME

sudo docker push $ECR_REPOSITORY_URL:$GITHUB_REF_NAME

sudo docker image prune -f
