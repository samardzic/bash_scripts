#!/bin/sh


# Docker related envinronment setup
# Author: Nenad Samardzic



# TMake the above script executable chmod +x <script_name>. 
# To use the script type: ./<script_name>. 
# Example: ./my_apps.sh

# To get the latest package lists
sudo apt-get update


sudo apt-get install build-essential -y
sudo apt-get install linux-headers-$(uname -r) -y
sudo apt-get install dkms -y
cd /Addones/
sudo chmod 755 VBoxLinuxAdditions.run
sudo ./VBoxLinuxAdditions.run -y
