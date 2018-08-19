#!/bin/sh


# Docker related envinronment setup
# Author: Nenad Samardzic



# TMake the above script executable chmod +x <script_name>. 
# To use the script type: ./<script_name>. 
# Example: ./my_apps.sh

# To get the latest package lists
sudo apt-get update

# Clear existing docker installations
sudo apt-get remove docker docker-engine docker.io -y
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get install linux-image-extra-virtual -y
sudo apt-get update


# Install Packages to allow apt to use a repository over HTTPS
sudo apt-get install apt-transport-https -y
sudo apt-get install ca-certificates -y
sudo apt-get install software-properties-common -y
sudo apt-get install curl -y
sudo apt-get install openssh-server openssh-client -y
sudo apt-get install mosquitto mosquitto-clients -y

# Install docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update
sudo apt-get install docker-ce -y

# Verify
docker version
sudo docker run hello-world

# MySqlServer
sudo apt-get install mysql-server -y




