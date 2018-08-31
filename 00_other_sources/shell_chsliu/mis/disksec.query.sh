#!/bin/sh

need_su() {
	if [ ! "root" = $(whoami) ]; then
		echo -e "only work while been root"
		exit
	fi
}

smart1() {
	echo -e smartctl -a /dev/$1 				>$2
	sudo smartctl -a /dev/$1 				>>$2
}

smart2() {
	echo -e smartctl -d sat -a /dev/$1 		>$2
	sudo smartctl -d sat -a /dev/$1 		>>$2
}

smart3() {
	echo -e smartctl -d scsi -a /dev/$1 		>$2
	sudo smartctl -d scsi -a /dev/$1 		>>$2
}

smart() {
	smart1 $1 $2
	grep -q "START OF READ SMART DATA SECTION" $2
	if [ $? -eq 0 ]; then return; fi
	
	smart2 $1 $2
	grep -q "START OF READ SMART DATA SECTION" $2
	if [ $? -eq 0 ]; then return; fi
	
	smart3 $1 $2
	grep -q "START OF READ SMART DATA SECTION" $2
	if [ $? -eq 0 ]; then return; fi
}

need_su

lsblk | grep -P ^sd | cut -d" " -f 1 | while read line; do
	tempfile=/tmp/tempfile
	smart $line $tempfile
	echo -e ---------------------------------
	cat $tempfile | grep '/dev/sd'
	echo -e ---------------------------------
	cat $tempfile | egrep "Model:|Number:|Capacity:|Sector Size"
	rm $tempfile
done
