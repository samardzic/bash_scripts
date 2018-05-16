#!/bin/sh


// Then I should make the above script executable chmod +x <script_name>. 
// Then to use it, I could type: 
// ./install <package_name>. 
// Example: ./install my_apps.sh

# To get the latest package lists
sudo apt-get update

sudo apt-get install python-software-properties -y
sudo apt-get install module-assistant -y


sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update -y
apt-get install -y oracle-java8-installer
apt-get install -y oracle-java8-set-default