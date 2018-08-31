#!/bin/bash
##################################################
# Name: basic-info.sh
# Description: Grabs basic info about the server
# Script Maintainer: Jacob Amey
#
# Last Updated: July 9th 2013
##################################################
# 
echo -e "Info about the server:" > /blah/docs/Info.txt
echo -e "##############################" >> /blah/docs/Info.txt
uname -a >> /blah/docs/Info.txt
echo -e "##############################" >> /blah/docs/Info.txt
cat /etc/sysconfig/network-scripts/ifcfg-eth0 >> /blah/docs/Info.txt
echo -e "##############################" >> /blah/docs/Info.txt
route >> /blah/docs/Info.txt
echo -e "##############################" >> /blah/docs/Info.txt
