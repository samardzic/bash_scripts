#!/bin/bash

###
addto_root_crontab() {
	! sudo crontab -l | grep -Fxq "$*" && su - root -c "(crontab -l; echo -e \"$*\") | crontab -"
}

###
case "$1" in
  install)
	addto_root_crontab "#iptable load"
	addto_root_crontab "@reboot /bin/bash $(readlink -e $0) load"
    exit
    ;;
    
  save)
    echo -e Saving iptables
    sudo iptables-save | sudo tee /etc/iptables.conf
    sudo ip6tables-save | sudo tee /etc/ip6tables.conf
    exit
    ;;
    
  load)
    [ -f /etc/iptables.conf ] && echo -e Loading iptables && sudo iptables-restore < /etc/iptables.conf
    [ -f /etc/ip6tables.conf ] && echo -e Loading ip6tables && sudo ip6tables-restore < /etc/ip6tables.conf
    exit
    ;;
    
  *)
	echo -e "Usage: $0 {install|save|load}"
	exit 1
	;;
    
esac
