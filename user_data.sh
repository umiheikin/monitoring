#!/bin/bash

#Install Docker

echo "Starting to install docker"

sudo yum install -y update
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y --nobest docker-ce
sudo usermod -aG docker $(whoami)
sudo usermod -aG docker ec2-user
sg docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

echo "Install python and interpritators"
sudo yum install -y python3
pip3 install docker --user
pip3 install docker-compose --user

echo "Docker has been installed with version $(docker version)"

#Install Docker Compose

echo "Starting to install Docker Compose"

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "The docker compose installed with version $(docker-compose version)"
echo "Script has been finished"
sg docker
