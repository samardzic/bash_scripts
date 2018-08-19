#!/bin/sh


# Add Java team PPA repo and Install Oracle Java
# Author: Nenad Samardzic



# Make the above script executable chmod +x <script_name>. 
# To use the script type: ./<script_name>. 
# Example: ./my_apps.sh

# To get the latest package lists
sudo apt-get update

# Install dependency package​s
sudo apt-get install python-software-properties -y
sudo apt-get install module-assistant -y

# Add PPA repo and update
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update -y

# Install Oracle Java
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default