#!/bin/bash

# **************************************
# Initial developement setup for Linux *
# **************************************

# Author: Nenad Samardzic



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






# Install Essential tools
echo -e "\n\n----------------------------------------------------------------"
echo -e "-----------------  Installing Essential tools  -----------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing build-essential  #####################\n"
sudo apt-get install -y build-essential

echo -e "\n\n######################  Installing software-properties-common  #####################\n"
sudo apt-get install -y software-properties-common

echo -e "\n\n######################  Installing python-software-properties  #####################\n"
sudo apt-get install -y python-software-properties

echo -e "\n\n######################  Installing openssh-server & openssh-client  #####################\n"
sudo apt-get install -y openssh-server openssh-client

echo -e "\n\n######################  Installing openssl  #####################\n"
sudo apt-get install -y openssl
sudo apt-get install -y zlib1g zlib1g-dev libpcre3 libpcre3-dev libssl-dev

echo -e "\n\n######################  Installing GIT  #####################\n"
sudo apt-get install -y git

echo -e "\n\n######################  Installing Curl  #####################\n"
sudo apt-get install -y curl

echo -e "\n\n######################  Installing python-pip  #####################\n"
sudo apt-get install -y python-pip
pip -V

sudo apt-get install -y python3-pip
pip3 -V

# Multimedia
echo -e "\n\n----------------------------------------------------------------"
echo -e "----------------  Installing Multimedia tools  -----------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing ubuntu-restricted-extras  #####################\n"
sudo apt install -y ubuntu-restricted-extras

echo -e "\n\n######################  Installing flashplugin-installer  #####################\n"
sudo apt-get install -y flashplugin-installer

echo -e "\n\n######################  Installing DVD libdvdread4  #####################\n"
sudo apt-get install -y libdvdcss2 libdvdread4 libdvdnav4
sudo /usr/share/doc/libdvdread4/install-css.sh

echo -e "\n\n######################  Installing VLC Player  #####################\n"
sudo apt install -y vlc

echo -e "\n\n######################  Installing SMPlayer  #####################\n"
sudo apt install -y smplayer




# MQTT tools
echo -e "\n\n----------------------------------------------------------------"
echo -e "---------------=---  Installing MQTT Tools  --------------------"
echo -e "----------------------------------------------------------------"
echo -e "\n\n######################  Installing mosquitto & mosquitto-clients  #####################\n"
sudo apt-get install mosquitto mosquitto-clients -y

echo -e "\n\n######################  Installing paho-mqtt  #####################\n"
sudo -H pip install paho-mqtt



# Install Oracle Java
echo -e "\n\n----------------------------------------------------------------"
echo -e "-------------------  Installing Oracle JAVA  -------------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing Oracle Java  #####################\n"
sudo apt-get install -y oracle-java8-installer

echo -e "\n\n######################  Installing Java Set-default #####################\n"
sudo apt-get install -y oracle-java8-set-default

echo -e "\n-------------------  Java version details -------------------"
java -version
which java




echo -e "\n\n----------------------------------------------------------------"
echo -e "---------------  Installing Compression Tools  -----------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing General Compression tools #####################\n"
sudo apt-get install -y p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller



echo -e "\n\n----------------------------------------------------------------"
echo -e "------------------  Installing HTTPS Addons  -------------------"
echo -e "----------------------------------------------------------------"

# Install Packages to allow apt to use a repository over HTTPS
echo -e "\n\n######################  Installing apt-transport-https #####################\n"
sudo apt-get install -y apt-transport-https

echo -e "\n\n######################  Installing ca-certificates #####################\n"
sudo apt-get install -y ca-certificates





# Install Various Tools
echo -e "\n\n----------------------------------------------------------------"
echo -e "------------------  Installing Tools & Soft  -------------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Installing dconf #####################\n"
sudo apt-get install -y dconf-cli dconf-editor

echo -e "\n\n######################  Installing KeePassX #####################\n"
sudo apt-get install -y keepassx

echo -e "\n\n######################  Installing DropBox #####################\n"
sudo apt-get install -y dropbox


echo -e "\n\n######################  Installing Krusader #####################\n"
sudo apt-get install -y krusader
sudo apt-get install -y krename

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

echo -e "\n\n######################  Installing ScreenFetch #####################\n"
sudo apt-get install -y screenfetch

echo -e "\n\n######################  Installing Shutter #####################\n"
sudo apt-get install -y shutter

echo -e "\n\n######################  Installing SreenRuller #####################\n"
sudo apt-get install -y screenruler

echo -e "\n\n######################  Installing Konsole #####################\n"
sudo apt-get install -y konsole

echo -e "\n\n######################  Installing Terminator #####################\n"
sudo apt-get install -y terminator

echo -e "\n\n######################  Installing Konsole #####################\n"
sudo apt-get install -y lynx

echo -e "\n\n######################  Installing indicator-weather #####################\n"
sudo apt-get install -y indicator-weather

sudo apt-get install -y indicator-cpufreq

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

echo -e "\n\n######################  Installing MC Editor #####################\n"
sudo apt-get install -y mc

echo -e "\n\n######################  Installing ATOM Editor #####################\n"
sudo apt-get install -y atom

echo -e "\n\n######################  Installing Brackets editor #####################\n"
sudo apt-get install -y brackets

echo -e "\n\n######################  Installing Visual Code editor #####################\n"
echo -e "-----------------  VS Curl Download  ------------------"
# curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" > vscode_package.deb

echo -e "-----------------  VS wget Download  ------------------"
wget -r -l1 --no-parent --no-directories -e robots=off '*amd64.deb' https://go.microsoft.com/fwlink/?LinkID=760868 
mv index.html* vscode_package.deb

sudo dpkg -i vscode_package.deb
rm vscode_package.deb




echo -e "\n\n----------------------------------------------------------------"
echo -e "-----------------  Installing DataBase Toosl  ------------------"
echo -e "----------------------------------------------------------------"

# Database
echo -e "\n\n######################  Installing mysql-server #####################\n"
sudo apt-get install -y mysql-server

echo -e "\n\n######################  Installing mysql-workbench #####################\n"
sudo apt-get install -y mysql-workbench



# DOCKER
echo -e "\n\n----------------------------------------------------------------"
echo -e "------------  Installing Docker & Docker Compose  --------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Removing previous Docker Instllations  #####################\n"
sudo apt-get remove docker docker-engine docker.io

echo -e "\n\n######################  Installing docker-ce docker-compose  #####################\n"
sudo apt-get install -y docker-ce docker-compose



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
echo -e "--------------------  Installing Skype, Viber, Slack  ---------------------"
echo -e "---------------------------------------------------------------------------"

echo -e "\n\n######################  Installing Skype #####################\n"
wget https://go.skype.com/skypeforlinux-64.deb -O skype_amd64.deb
sudo dpkg -i skype_amd64.deb
rm skype_amd64.deb

echo -e "\n\n----------------------  Installing Slack  --------------------------"
echo -e "\n\n######################  Generating Slack Download link #####################\n"
SLACK_LINK=$(lynx --dump https://slack.com/downloads/instructions/ubuntu | grep amd64.deb | sed 's/^.*http/http/')
echo -e $SLACK_LINK

echo -e "\n\n######################  Downloading Slack #####################\n"
wget $SLACK_LINK -O slack_amd64.deb

echo -e "\n\n######################  Installing Slack #####################\n"
sudo dpkg -i slack_amd64.deb
rm slack_amd64.deb



echo -e "\n\n----------------------  Installing Viber  --------------------------"
echo -e "\n\n######################  Generating Viber Download link #####################\n"
VIBER_LINK=$(lynx --dump https://www.viber.com/download/ | grep viber.deb | sed 's/^.*http/http/')
echo -e $VIBER_LINK

echo -e "\n\n######################  Downloading Viber #####################\n"
wget $VIBER_LINK -O viber.deb

echo -e "\n\n######################  Installing Viber #####################\n"
sudo dpkg -i viber.deb
rm viber.deb




# NODE.js setup
echo -e "\n\n----------------------------------------------------------------"
echo -e "-----------------------  NODE.js setup  ------------------------"
echo -e "----------------------------------------------------------------"

echo -e "\n\n######################  Downloading NODE.js #####################\n"
wget -r -l1 --no-parent --no-directories -e robots=off -A '*linux-x64.tar.gz' https://nodejs.org/download/release/latest/

echo -e "\n\n######################  Extracting NODE.js to INSTALL_LOCATION #####################\n"
sudo tar -xzf *linux-x64.tar.gz -C $INSTALL_LOCATION/

echo -e "\n\n######################  Renaming to  NODE_INSTALL #####################\n"
mv $INSTALL_LOCATION/node-* $INSTALL_LOCATION/node_install

sudo chown -R $LINUX_USER:$LINUX_USER $INSTALL_LOCATION/node* 

echo -e "\n\n######################  Deleting NODEjs Download #####################\n"
rm *linux-x64.tar.gz

echo -e 'export APP=/opt/tinyos-2.x/apps' >> ~/.bashrc 
echo -e 'export PATH="$PATH:~/Applications/node_install/bin"' >> ~/.bashrc #edit this location per your folder settilgs

echo -e "-----  Check NODE path 7 version  ------"
node -v







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


echo -e "\n\n----------------------  Installing Android Studio  -----------------------\n"

echo -e "\n\n######################  Generating Android Studio Download link #####################\n"
ANDROID_STUDIO_LINK=$(lynx --dump https://developer.android.com/studio/#downloads | grep -w linux.zip | grep https://dl.google.com | sed 's/^.*http/http/')
echo -e $ANDROID_STUDIO_LINK

echo -e "\n\n######################  Downloading Android Studio #####################\n"
wget $ANDROID_STUDIO_LINK -O android_studio.zip

echo -e "\n\n######################  Extracting Android Studio #####################\n"
unzip android_studio.zip -d "$INSTALL_LOCATION/"
chown -R $LINUX_USER $INSTALL_LOCATION/android* 

rm android_studio.zip


# CLI tools
sudo apt-get install dstat -y
sudo apt-get install vnstat -y
sudo apt-get install htop -y




echo -e "\n\n----------------------------------------------------------------"
echo -e "------------------  Post-Installation Cleanup  ---------------------"
echo -e "----------------------------------------------------------------\n\n"

# Installation cleanup
sudo apt-get -y autoclean
sudo apt-get -y clean
sudo apt-get -y autoremove
sudo apt-get -y install -f
sudo apt-get update --fix-missing
