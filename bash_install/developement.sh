#!/bin/sh

# **************************************
# Initial developement setup for Linux *
# **************************************

# Author: Nenad Samardzic



# TMake the above script executable chmod +x <script_name>. 
# To use the script type: ./<script_name>. 
# Example: ./my_apps.sh

#Install Location
INSTALL_LOCATION=~/Applications


# To get the latest package lists
sudo apt-get update

# To get the latest package lists
sudo apt-get upgrade

# Install Essential tools
sudo apt-get install build-essential -y
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
sudo apt-get install openssh-server openssh-client -y
sudo apt-get install git -y
sudo apt-get install curl -y


sudo apt install ubuntu-restricted-extras -y


# MQTT
sudo apt-get install mosquitto mosquitto-clients -y
# paho install is advised

# Add PPA sources
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/brackets
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update

# Install Oracle Java
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default

# Install Packages to allow apt to use a repository over HTTPS
sudo apt-get install apt-transport-https -y
sudo apt-get install ca-certificates -y

# Install Editors
sudo apt-get install geany -y
sudo apt-get install mc -y
sudo apt-get install atom -y
sudo apt-get install brackets -y

# Database
sudo apt-get install mysql-server -y
sudo apt-get install mysql-workbench -y

# Install Browsers
sudo apt install chromium-browser -y
sudo apt install opera -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb -y

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman

# Installation cleanup
sudo apt autoremove -y



