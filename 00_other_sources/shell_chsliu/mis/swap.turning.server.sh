#!/bin/bash

addto_sysctl() {
	fsfile=/etc/sysctl.conf

	if ! sudo grep -Fxq "$*" $fsfile; then
		echo -e $* | sudo tee -a $fsfile
	fi
}

delfrom_sysctl() {
	sudo sed -i "/$1/d" /etc/sysctl.conf
}

#server
echo -e swappiness
cat /proc/sys/vm/swappiness
echo -e vfs_cache_pressure
cat /proc/sys/vm/vfs_cache_pressure
# echo -e 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
delfrom_sysctl vm.swappiness
addto_sysctl vm.swappiness=10
sudo sysctl vm.swappiness=10
# echo -e 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
delfrom_sysctl vm.vfs_cache_pressure
addto_sysctl vm.vfs_cache_pressure=50
sudo sysctl vm.vfs_cache_pressure=50
