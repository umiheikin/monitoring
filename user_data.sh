#!/bin/bash




#Create ssh user
sudo echo -e "$remote_pass\nremote_pass" | passwd ec2-user
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo echo "AllowUsers ec2-user" >> /etc/ssh/sshd_config
sudo systemctl restart sshd

#Install Docker

echo "Starting to install docker"

sudo yum install -y update
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
sudo usermod -aG docker $(whoami)
sudo usermod -aG docker ec2-user
sudo systemctl enable docker.service
sudo systemctl start docker.service

#Install Docker Compose

echo "Starting to install Docker Compose"

sudo yum install -y epel-release
sudo yum install -y python-pip
sudo pip install -y docker-compose
sudo yum upgrade python*
docker-compose version

