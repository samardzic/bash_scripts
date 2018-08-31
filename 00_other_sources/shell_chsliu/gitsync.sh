#!/bin/bash 

#=================================
if [ "root" = $(whoami) ]; then
	echo -e "no sync while been root"
	exit
fi

#=================================
DIR=$(readlink -e "$0")
DP0=$(dirname "$DIR")

#=================================
[ ! -f $DP0/gitconf.sh ] || $DP0/gitconf.sh

#=================================
if [ -z "$1" ]; then
	# echo -e Working in $DP0
	pushd "$DP0"
else
	# echo -e Working in $1
	pushd "$1"
fi

#=================================
git pull

git add .
git commit -a -m "Automated commit at $(date +"%D") $(date +"%T") on $(hostname)" 
git push
