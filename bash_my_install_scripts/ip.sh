#!/bin/sh


# WAN ip detection - dig command for determining my public IP address:
# Author: Nenad Samardzic


# OpenDNS scenario
dig +short myip.opendns.com @resolver1.opendns.com

# Google scenario
dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}'

# store my IP address in a shell variable
myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo -e "My WAN/Public IP address: ${myip}"


# Use 3rd party web-sites to get your IP
curl ipecho -e.net/plain

# Finding Public/WAN IP address on a router
# A few ADSL/Cable router allows you to login to your router using telnet or ssh:
telnet your-router-ip-here
ssh user@your-router-ip-here
telnet 192.168.0.254
ssh admin@192.168.1.254
[admin@dd-wrt ~]#  ifconfig eth1 | grep 'inet addr:' 
[admin@dd-wrt ~]#  ip addr show nas01