#!/bin/sh


// Then I should make the above script executable chmod +x <script_name>. 
// Then to use it, I could type: 
// ./install <package_name>. 
// Example: ./install my_apps.sh

 
# To get the latest package lists
sudo apt-get update

sudo add-apt-repository -y ppa:hnakamur/golang-1.9
sudo apt-get update
sudo apt-get install golang-1.9* -y
sudo apt-get install mysql-server -y
sudo apt-get install git -y
sudo apt-get install openssh-server -y
sudo apt-get install mysql-workbench -y
sudo apt-get install curl -y
sudo apt-get install npm -y


docker@ime-Docker:~$ mysql -u root -p


mysql> create schema hub;
mysql> create schema hub;
mysql> exit;


install docker & docker compose





52  sudo apt-get mysql-server
53  sudo apt-get install mysql-server
55  cd Desktop/
56  git clone https://gitlab.ringler.ch/dr-tax-pocket/Auth.git
57  git clone https://gitlab.ringler.ch/dr-tax-pocket/Hub.git
58  mysql -u root -p
59  cd Hub/
60  ./resetScript.sh 
61  docker logs -f auth 
62  git checkout development 
63  ./resetScript.sh 

52  cd ..
53  cd Auth/
54  ./resetScript.sh 
55  docker ps 
56  docker logs -f auth 
57  docker logs -f hub
58  git checkout developement
59  git checkout development 
60  ./resetScript.sh 
61  history
