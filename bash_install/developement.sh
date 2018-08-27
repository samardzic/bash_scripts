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


# Add PPA sources
echo "----------------------------------------------------------------"
echo "----------------------  Adding PPA Sources  --------------------"
echo "----------------------------------------------------------------"

echo "######################  JAVA PPA  #####################"
sudo add-apt-repository -y ppa:webupd8team/java

echo "######################  Brackets PPA  #####################"
sudo add-apt-repository -y ppa:webupd8team/brackets

echo "######################  Atom PPA  #####################"
sudo add-apt-repository -y ppa:webupd8team/atom

echo "######################  LibreOffice PPA  #####################"
sudo add-apt-repository -y ppa:libreoffice/ppa


# To get the latest package lists
echo "######################  Updating Repositories  #####################"
sudo apt-get update

# To get the latest package lists
echo "######################  Packages Upgrade  #####################"
sudo apt-get upgrade




# Install Essential tools
echo "----------------------------------------------------------------"
echo "-----------------  Installing Essential tools  -----------------"
echo "----------------------------------------------------------------"

echo "######################  Installing build-essential  #####################"
sudo apt-get install build-essential -y

echo "######################  Installing software-properties-common  #####################"
sudo apt-get install software-properties-common -y

echo "######################  Installing python-software-properties  #####################"
sudo apt-get install python-software-properties -y

echo "######################  Installing openssh-server & openssh-client  #####################"
sudo apt-get install openssh-server openssh-client -y

echo "######################  Installing GIT  #####################"
sudo apt-get install git -y

echo "######################  Installing Curl  #####################"
sudo apt-get install curl -y

echo "######################  Installing python-pip  #####################"
sudo apt-get install python-pip -y
pip -V


# Multimedia
echo "----------------------------------------------------------------"
echo "----------------  Installing Multimedia tools  -----------------"
echo "----------------------------------------------------------------"
echo "######################  Installing ubuntu-restricted-extras  #####################"
sudo apt install ubuntu-restricted-extras -y

echo "######################  Installing flashplugin-installer  #####################"
sudo apt-get install flashplugin-installer -y

echo "######################  Installing DVD libdvdread4  #####################"
sudo apt-get install -y libdvdread4
sudo /usr/share/doc/libdvdread4/install-css.sh

echo "######################  Installing VLC Player  #####################"
sudo apt install vlc -y

echo "######################  Installing SMPlayer  #####################"
sudo apt install smplayer -y




# MQTT tools
echo "----------------------------------------------------------------"
echo "---------------=---  Installing MQTT Tools  --------------------"
echo "----------------------------------------------------------------"
echo "######################  Installing mosquitto & mosquitto-clients  #####################"
sudo apt-get install mosquitto mosquitto-clients -y

echo "######################  Installing paho-mqtt  #####################"
pip install -y paho-mqtt



# Install Oracle Java
echo "----------------------------------------------------------------"
echo "-------------------  Installing Oracle JAVA  -------------------"
echo "----------------------------------------------------------------"
echo "######################  Installing Oracle Java  #####################"
sudo apt-get install -y oracle-java8-installer

echo "######################  Installing Java Set-default #####################"
sudo apt-get install -y oracle-java8-set-default
echo "----------------------------------------------------------------"
java -version
which java

echo "######################  Installing General Compression tools #####################"
sudo apt-get install -y p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-rolle




# Install Packages to allow apt to use a repository over HTTPS
echo "######################  Installing apt-transport-https #####################"
sudo apt-get install apt-transport-https -y

echo "######################  Installing ca-certificates #####################"
sudo apt-get install ca-certificates -y




# Install Editors
echo "----------------------------------------------------------------"
echo "-----------------  Installing Editors & IDEs  ------------------"
echo "----------------------------------------------------------------"

echo "######################  Installing Geany editor #####################"
sudo apt-get install geany -y

echo "######################  Installing MC Editor #####################"
sudo apt-get install mc -y

echo "######################  Installing ATOM Editor #####################"
sudo apt-get install atom -y

echo "######################  Installing Brackets editor #####################"
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



