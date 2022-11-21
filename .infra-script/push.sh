#!/bin/sh

echo"AWS Configure"
sudo aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && sudo aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
echo"Docker login"
sudo aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin $ECR_LOGIN_PASSWORD
echo"Docker tag"
sudo docker tag $GITHUB_REPOSITORY:latest $ECR_REPOSITORY_URL:$GITHUB_REF_NAME
echo"Docker push"
sudo docker push $ECR_REPOSITORY_URL:$GITHUB_REF_NAME
echo"Docker prune"
sudo docker image prune -f
