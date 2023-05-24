#!/bin/bash

# **************************************
# Initial developement setup for Linux *
# **************************************

# To Make the above script executable chmod +x <script_name>. 
# To use the script type: ./<script_name>. 
# Example: ./my_apps.sh


echo -e "\n\n----------------------------------------------------------------"
echo -e "-------------------------  Variables  --------------------------"
echo -e "----------------------------------------------------------------"


#Install Location

# Username of the user that is performing the installation
LINUX_USER=ime

# Target folder name (absolute path) to which you want your tar.gz type of apps to be installed/unpacked 
INSTALL_LOCATION=~/Applications


# **************************************
# This conditional checks if theres existing INSTALL_LOCATION folder, and if not it creates it
# Also, folder is chown to home user privilages - user is defined in LINUX_USER variable

if [ ! -d "$INSTALL_LOCATION" ]; 
then
	mkdir -p $INSTALL_LOCATION
fi

chown $LINUX_USER $INSTALL_LOCATION

# **************************************


# Add PPA sources
echo -e "\n\n----------------------------------------------------------------"
echo -e "----------------------  Adding PPA Sources  --------------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  JAVA PPA  #####################\n"
sudo add-apt-repository -y ppa:webupd8team/java

echo -e "\n\n######################  Brackets PPA  #####################\n"
sudo add-apt-repository -y ppa:webupd8team/brackets

echo -e "\n\n######################  Atom PPA  #####################\n"
sudo add-apt-repository -y ppa:webupd8team/atom

echo -e "\n\n######################  LibreOffice PPA  #####################\n"
sudo add-apt-repository -y ppa:libreoffice/ppa

echo -e "\n\n######################  DOCKER apt repo  #####################\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

echo -e "\n\n######################  Weather Indicator via PPA  #####################\n"
sudo add-apt-repository -y ppa:kasra-mp/ubuntu-indicator-weather




# To get the latest package lists
echo -e "\n\n######################  Updating Repositories  #####################\n"
sudo apt-get update

# Upgrade to latest package lists
echo -e "\n\n######################  Packages Upgrade  #####################\n"
sudo apt-get -y upgrade




# Installation cleanup
sudo apt-get -y autoclean
sudo apt-get -y clean
sudo apt-get -y autoremove
sudo apt-get -y install -f
sudo apt-get update --fix-missing



# Install Essential tools
echo -e "\n\n----------------------------------------------------------------"
echo -e "-----------------  Installing Essential tools  -----------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing build-essential  #####################\n"
sudo apt-get install -y build-essential

echo -e "\n\n######################  Installing software-properties-common  #####################\n"
sudo apt-get install -y software-properties-common

echo -e "\n\n######################  Installing openssh-server & openssh-client  #####################\n"
sudo apt-get install -y openssh-server openssh-client

echo -e "\n\n######################  Installing openssl  #####################\n"
sudo apt-get install -y openssl
# sudo apt-get install -y zlib1g zlib1g-dev libpcre3 libpcre3-dev libssl-dev

echo -e "\n\n######################  Installing GIT  #####################\n"
sudo apt-get install -y git

echo -e "\n\n######################  Installing Curl  #####################\n"
sudo apt-get install -y curl wget gpg

echo -e "\n\n######################  Installing python-pip  #####################\n"
sudo apt-get install -y python3-pip
pip3 -V


echo -e "\n\n----------------------------------------------------------------"
echo -e "------------------  Installing HTTPS Addons  -------------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing python-pip  #####################\n"
sudo apt-get install -y python3-pip
sudo pip install -y virtualenv



echo -e "\n\n----------------------------------------------------------------"
echo -e "------------------  Installing HTTPS Addons  -------------------"
echo -e "----------------------------------------------------------------"

# Install Packages to allow apt to use a repository over HTTPS
echo -e "\n\n######################  Installing apt-transport-https #####################\n"
sudo apt-get install -y apt-transport-https

echo -e "\n\n######################  Installing ca-certificates #####################\n"
sudo apt-get install -y ca-certificates



# Multimedia
echo -e "\n\n----------------------------------------------------------------"
echo -e "----------------  Installing Multimedia tools  -----------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing ubuntu-restricted-extras  #####################\n"
sudo apt install -y ubuntu-restricted-extras

# echo -e "\n\n######################  Installing VLC Player  #####################\n"
# sudo apt install -y vlc

# echo -e "\n\n######################  Installing SMPlayer  #####################\n"
# sudo apt install -y smplayer




echo -e "\n\n----------------------------------------------------------------"
echo -e "---------------  Installing Compression Tools  -----------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing General Compression tools #####################\n"
sudo apt-get install -y p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller


wget https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.5.9/aws-iam-authenticator_0.5.9_linux_amd64 --output-file aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/local/bin/
sudo chmod +x /usr/local/bin/aws-iam-authenticator




# Install Various Tools
echo -e "\n\n----------------------------------------------------------------"
echo -e "------------------  Installing Tools & Soft  -------------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing Gparted with dependencies #####################\n"
sudo apt-get install -y gparted
sudo apt-get install -y udftools
sudo apt-get install -y reiser4progs
sudo apt-get install -y hfsutils
sudo apt-get install -y f2fs-tools
sudo apt-get install -y f2fs-tools
sudo apt-get install -y nilfs-tools
sudo apt-get install -y exfat-utils exfat-fuse


echo -e "\n\n######################  Installing HardInfo #####################\n"
sudo apt-get install -y hardinfo

echo -e "\n\n######################  Installing Shutter #####################\n"
sudo apt-get install -y shutter

echo -e "\n\n######################  Installing Konsole #####################\n"
sudo apt-get install -y konsole

echo -e "\n\n######################  Installing Terminator #####################\n"
sudo apt-get install -y terminator



# Install Samba share
echo -e "\n\n----------------------------------------------------------------"
echo -e "------------------  Installing SAMBA share  ---_----------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing Samba #####################\n"
sudo apt-get install -y samba samba-common python-dnspython

echo -e "\n\n######################  WhereIs Samba #####################\n"
whereis samba




# Install Editors
echo -e "\n\n----------------------------------------------------------------"
echo -e "-----------------  Installing Editors & IDEs  ------------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing Geany editor #####################\n"
sudo apt-get install -y geany
sudo apt-get install -y geany-plugins




echo -e "\n\n----------------------------------------------------------------"
echo -e "-------------- Installing Snap package manager  ----------------"
echo -e "----------------------------------------------------------------"

# Database
echo -e 'export PATH="$PATH:/snap/bin"' >> ~/.bashrc 






# Installation cleanup
sudo apt-get -y autoclean
sudo apt-get -y clean
sudo apt-get -y autoremove
sudo apt-get -y install -f
sudo apt-get update --fix-missing




echo -e "\n\n----------------------------------------------------------------"
echo -e "--------------------  Installing Browsers  ---------------------"
echo -e "----------------------------------------------------------------"

# Install Browsers
echo -e "\n\n######################  Installing CHROMIUM #####################\n"
sudo apt-get install -y chromium-browser

echo -e "\n\n######################  Installing OPERA #####################\n"
sudo apt-get install -y opera

echo -e "\n\n######################  Installing CHROME #####################\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb


echo -e "\n\n---------------------------------------------------------------------------"
echo -e "-----------------------------  Conti software  --------------------------------"
echo -e "-------------------------------------------------------------------------------"

sudo apt install -y krb5-multidev libkrb5-dev
sudo pip install aws-adfs










# Postman
echo -e "\n\n----------------------------------------------------------------"
echo -e "----------------------  Installing IDEs  -----------------------"
echo -e "----------------------------------------------------------------\n\n"

echo -e "----------------------  Installing POSTMAN  -----------------------"

echo -e "\n\n######################  Downloading POSTMAN #####################\n"
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz

echo -e "\n\n######################  Extracting POSTMAN #####################\n"
sudo tar -xzf postman.tar.gz -C $INSTALL_LOCATION/
sudo chown -R $LINUX_USER:$LINUX_USER $INSTALL_LOCATION/Post*

rm postman.tar.gz
sudo ln -s $INSTALL_LOCATION/Postman/Postman /usr/bin/postman






echo -e "\n\n----------------------------------------------------------------"
echo -e "------------------  Post-Installation Cleanup  ---------------------"
echo -e "----------------------------------------------------------------\n\n"

# Installation cleanup
sudo apt-get -y autoclean
sudo apt-get -y clean
sudo apt-get -y autoremove
sudo apt-get -y install -f
sudo apt-get update --fix-missing
