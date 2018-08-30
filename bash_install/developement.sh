#!/bin/bash

# **************************************
# Initial developement setup for Linux *
# **************************************

# Author: Nenad Samardzic



# To Make the above script executable chmod +x <script_name>. 
# To use the script type: ./<script_name>. 
# Example: ./my_apps.sh


echo "\n\n----------------------------------------------------------------"
echo "-------------------------  Variables  --------------------------"
echo "----------------------------------------------------------------"


#Install Location

LINUX_USER=ime

INSTALL_LOCATION=~/Applications


# **************************************
# This conditional checks if theres existing POSTMAN LOCATION folder, and if not it creates it
# Also, folder is chown to home user privilages - user is defined in LINUX_USER varijable

if [ ! -d "$POSTMAN_LOCATION" ]; 
then
	mkdir -p $POSTMAN_LOCATION
fi

chown $LINUX_USER $POSTMAN_LOCATION

# **************************************


# Add PPA sources
echo "\n\n----------------------------------------------------------------"
echo "----------------------  Adding PPA Sources  --------------------"
echo "----------------------------------------------------------------"

echo "\n\n######################  JAVA PPA  #####################\n"
sudo add-apt-repository -y ppa:webupd8team/java

echo "\n\n######################  Brackets PPA  #####################\n"
sudo add-apt-repository -y ppa:webupd8team/brackets

echo "\n\n######################  Atom PPA  #####################\n"
sudo add-apt-repository -y ppa:webupd8team/atom

echo "\n\n######################  LibreOffice PPA  #####################\n"
sudo add-apt-repository -y ppa:libreoffice/ppa

echo "\n\n######################  DOCKER apt repo  #####################\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"


# To get the latest package lists
echo "\n\n######################  Updating Repositories  #####################\n"
sudo apt-get update

# Upgrade to latest package lists
echo "\n\n######################  Packages Upgrade  #####################\n"
# sudo apt-get -y upgrade






# Install Essential tools
echo "\n\n----------------------------------------------------------------"
echo "-----------------  Installing Essential tools  -----------------"
echo "----------------------------------------------------------------"

echo "\n\n######################  Installing build-essential  #####################\n"
sudo apt-get install -y build-essential

echo "\n\n######################  Installing software-properties-common  #####################\n"
sudo apt-get install -y software-properties-common

echo "\n\n######################  Installing python-software-properties  #####################\n"
sudo apt-get install -y python-software-properties

echo "\n\n######################  Installing openssh-server & openssh-client  #####################\n"
sudo apt-get install -y openssh-server openssh-client

echo "\n\n######################  Installing openssl  #####################\n"
sudo apt-get install -y openssl
sudo apt-get install -y zlib1g zlib1g-dev libpcre3 libpcre3-dev libssl-dev

echo "\n\n######################  Installing GIT  #####################\n"
sudo apt-get install -y git

echo "\n\n######################  Installing Curl  #####################\n"
sudo apt-get install -y curl

echo "\n\n######################  Installing python-pip  #####################\n"
sudo apt-get install -y python-pip
pip -V


# Multimedia
echo "\n\n----------------------------------------------------------------"
echo "----------------  Installing Multimedia tools  -----------------"
echo "----------------------------------------------------------------"

echo "\n\n######################  Installing ubuntu-restricted-extras  #####################\n"
sudo apt install -y ubuntu-restricted-extras

echo "\n\n######################  Installing flashplugin-installer  #####################\n"
sudo apt-get install -y flashplugin-installer

echo "\n\n######################  Installing DVD libdvdread4  #####################\n"
sudo apt-get install -y libdvdcss2 libdvdread4 libdvdnav4
sudo /usr/share/doc/libdvdread4/install-css.sh

echo "\n\n######################  Installing VLC Player  #####################\n"
sudo apt install -y vlc

echo "\n\n######################  Installing SMPlayer  #####################\n"
sudo apt install -y smplayer




# MQTT tools
echo "\n\n----------------------------------------------------------------"
echo "---------------=---  Installing MQTT Tools  --------------------"
echo "----------------------------------------------------------------"
echo "\n\n######################  Installing mosquitto & mosquitto-clients  #####################\n"
sudo apt-get install mosquitto mosquitto-clients -y

echo "\n\n######################  Installing paho-mqtt  #####################\n"
sudo -H pip install paho-mqtt



# Install Oracle Java
echo "\n\n----------------------------------------------------------------"
echo "-------------------  Installing Oracle JAVA  -------------------"
echo "----------------------------------------------------------------"

echo "\n\n######################  Installing Oracle Java  #####################\n"
sudo apt-get install -y oracle-java8-installer

echo "\n\n######################  Installing Java Set-default #####################\n"
sudo apt-get install -y oracle-java8-set-default
echo "------------------------------------------------------"
java -version
which java




echo "\n\n----------------------------------------------------------------"
echo "---------------  Installing Compression Tools  -----------------"
echo "----------------------------------------------------------------"

echo "\n\n######################  Installing General Compression tools #####################\n"
sudo apt-get install -y p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller



echo "\n\n----------------------------------------------------------------"
echo "------------------  Installing HTTPS Addons  -------------------"
echo "----------------------------------------------------------------"

# Install Packages to allow apt to use a repository over HTTPS
echo "\n\n######################  Installing apt-transport-https #####################\n"
sudo apt-get install -y apt-transport-https

echo "\n\n######################  Installing ca-certificates #####################\n"
sudo apt-get install -y ca-certificates





# Install Various Tools
echo "\n\n----------------------------------------------------------------"
echo "-----------------  Installing Tools & Soft  ------------------"
echo "----------------------------------------------------------------"

echo "\n\n######################  Installing dconf #####################\n"
sudo apt-get install -y dconf-cli dconf-editor

echo "\n\n######################  Installing KeePassX #####################\n"
sudo apt-get install -y keepassx

echo "\n\n######################  Installing DropBox #####################\n"
sudo apt-get install -y dropbox


echo "\n\n######################  Installing Krusader #####################\n"
sudo apt-get install -y krusader
sudo apt-get install -y krename

echo "\n\n######################  Installing Gparted #####################\n"
sudo apt-get install -y gparted
sudo apt-get install -y udftools
sudo apt-get install -y reiser4progs
sudo apt-get install -y hfsutils
sudo apt-get install -y f2fs-tools
sudo apt-get install -y f2fs-tools
sudo apt-get install -y nilfs-tools
sudo apt-get install -y exfat-utils exfat-fuse


echo "\n\n######################  Installing HardInfo #####################\n"
sudo apt-get install -y hardinfo

echo "\n\n######################  Installing ScreenFetch #####################\n"
sudo apt-get install -y screenfetch

echo "\n\n######################  Installing Shutter #####################\n"
sudo apt-get install -y shutter

echo "\n\n######################  Installing SreenRuller #####################\n"
sudo apt-get install -y screenruler

echo "\n\n######################  Installing Konsole #####################\n"
sudo apt-get install -y konsole

echo "\n\n######################  Installing Terminator #####################\n"
sudo apt-get install -y terminator




# Install Editors
echo "\n\n----------------------------------------------------------------"
echo "-----------------  Installing Editors & IDEs  ------------------"
echo "----------------------------------------------------------------"

echo "\n\n######################  Installing Geany editor #####################\n"
sudo apt-get install -y geany

echo "\n\n######################  Installing MC Editor #####################\n"
sudo apt-get install -y mc

echo "\n\n######################  Installing ATOM Editor #####################\n"
sudo apt-get install -y atom

echo "\n\n######################  Installing Brackets editor #####################\n"
sudo apt-get install -y brackets

echo "\n\n######################  Installing Visual Code editor #####################\n"
echo "-----------------  VS Curl Download  ------------------"
# curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" > vscode_package.deb

echo "-----------------  VS wget Download  ------------------"
wget -r -l1 --no-parent --no-directories -e robots=off '*amd64.deb' https://go.microsoft.com/fwlink/?LinkID=760868 
mv index.html* vscode_package.deb

sudo dpkg -i vscode_package.deb
rm vscode_package.deb




echo "\n\n----------------------------------------------------------------"
echo "-----------------  Installing DataBase Toosl  ------------------"
echo "----------------------------------------------------------------"

# Database
echo "\n\n######################  Installing mysql-server #####################\n"
sudo apt-get install -y mysql-server

echo "\n\n######################  Installing mysql-workbench #####################\n"
sudo apt-get install -y mysql-workbench



# DOCKER
echo "\n\n----------------------------------------------------------------"
echo "------------  Installing Docker & Docker Compose  --------------"
echo "----------------------------------------------------------------"

echo "\n\n######################  Removing previous Docker Instllations  #####################\n"
sudo apt-get remove docker docker-engine docker.io

echo "\n\n######################  Installing docker-ce docker-compose  #####################\n"
sudo apt-get install -y docker-ce docker-compose



echo "\n\n----------------------------------------------------------------"
echo "--------------------  Installing Browsers  ---------------------"
echo "----------------------------------------------------------------"

# Install Browsers
echo "\n\n######################  Installing CHROMIUM #####################\n"
sudo apt-get install -y chromium-browser

echo "\n\n######################  Installing OPERA #####################\n"
sudo apt-get install -y opera

echo "\n\n######################  Installing CHROME #####################\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

echo "\n\n######################  Installing OPERA #####################\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb


# NODE.js setup
echo "\n\n----------------------------------------------------------------"
echo "----------------------  NODE.js setup  -----------------------"
echo "----------------------------------------------------------------"

echo "\n\n######################  Downloading NODE.js #####################\n"
wget -r -l1 --no-parent --no-directories -e robots=off -A '*linux-x64.tar.gz' https://nodejs.org/download/release/latest/

echo "\n\n######################  Extracting NODE.js to INSTALL_LOCATION #####################\n"
sudo tar -xzf *linux-x64.tar.gz -C $POSTMAN_LOCATION/

echo "\n\n######################  Renaming to  NODE_INSTALL #####################\n"
mv $POSTMAN_LOCATION/node-* $POSTMAN_LOCATION/node_install

chown -R $LINUX_USER $POSTMAN_LOCATION/node* 

echo "\n\n######################  Deleting POSTMAN #####################\n"
rm *linux-x64.tar.gz
#sudo ln -s $POSTMAN_LOCATION/Postman/Postman /usr/bin/postman








# Postman
echo "\n\n----------------------------------------------------------------"
echo "----------------------  Installing IDEs  -----------------------"
echo "----------------------------------------------------------------"

echo "\n\n######################  Downloading POSTMAN #####################\n"
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz

echo "\n\n######################  Extracting POSTMAN #####################\n"
sudo tar -xzf postman.tar.gz -C $POSTMAN_LOCATION/
rm postman.tar.gz
sudo ln -s $POSTMAN_LOCATION/Postman/Postman /usr/bin/postman

# echo "\n\n######################  Downloading Android Studio #####################\n"
# wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
# https://dl.google.com/dl/android/studio/ide-zips/3.1.4.0/android-studio-ide-173.4907809-linux.zip

# echo "\n\n######################  Extracting Android Studio #####################\n"



# Installation cleanup
sudo apt autoremove -y
sudo apt-get -y autoclean


