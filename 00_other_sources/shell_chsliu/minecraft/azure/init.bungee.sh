#!/bin/bash

### 
addto_root_crontab() {
	su - root -c "(crontab -l; echo -e \"$*\") | crontab -"
}

### 
addto_root_crontab "0 23 * * * /sbin/poweroff"
# ~/script/init.d/inst.as.sh ~/script/init.d/bungee.d bungeestart
~/script/init.d/inst.as.sh ~/script/init.d/start.mc.d startmc

### 
~/script/minecraft/azure/init.sh
sudo mkdir /mnt/backup/65-bungeeCord-azure
sudo chown sita:sita /mnt/backup/65-bungeeCord-azure

cp ~/script/init.d/start.mc.sh ~/
echo -e !!!!!!!!!!!!!!
echo -e vi start.mc.sh
echo -e 65
echo -e mcrestore
echo -e !!!!!!!!!!!!!!
