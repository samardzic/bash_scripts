#!/bin/sh


// Then I should make the above script executable chmod +x <script_name>. 
// Then to use it, I could type: 
// ./install <package_name>. 
// Example: ./install my_apps.sh

 
# To get the latest package lists
sudo apt-get update


sudo apt-get install build-essential -y
sudo apt-get install linux-headers-$(uname -r) -y
sudo apt-get install dkms -y
cd /Addones/
sudo chmod 755 VBoxLinuxAdditions.run
sudo ./VBoxLinuxAdditions.run -y
