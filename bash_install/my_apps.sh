#!/bin/sh


# Docker related envinronment setup
# Author: Nenad Samardzic



# TMake the above script executable chmod +x <script_name>. 
# To use the script type: ./<script_name>. 
# Example: ./my_apps.sh

# To get the latest package lists
sudo apt-get update


# Terminal tools
sudo apt-get install konsole -y
sudo apt-get install terminator -y
// sudo apt-get install tilda -y
// sudo apt-get install guake -y
// sudo apt-get install gnome-terminal -y

# Add NUMIX PPA repo and install Numix GTX theme
sudo add-apt-repository -y ppa:numix/ppa
sudo apt-get update -y
sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle -y


# CLI tools
sudo apt-get install pico -y
sudo apt-get install nano -y
sudo apt-get install jed -y
sudo apt-get install vim -y

sudo apt-get install top -y
sudo apt-get install htop -y
sudo apt-get install atop -y
sudo apt-get install apachetop -y
sudo apt-get install ftptop -y
sudo apt-get install mytop -y
sudo apt-get install powertop -y
sudo apt-get install iotop -y
sudo apt-get install iftop -y
sudo apt-get install ntopng -y
sudo apt-get install jnettop -y


sudo apt-get install dstat -y
sudo apt-get install vnstat -y
sudo apt-get install netstat -y
sudo apt-get install pktstat -y
sudo apt-get install ifstat -y
sudo apt-get install vmstat -y
sudo apt-get install mpstat -y
sudo apt-get install iostat -y
sudo apt-get install darkstat -y
sudo apt-get install wavemon -y
sudo apt-get install mycli -y

