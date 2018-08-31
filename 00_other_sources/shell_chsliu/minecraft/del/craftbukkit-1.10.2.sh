#!/bin/bash

FULL=$(readlink -e $0)
DP0=$(dirname $FULL)

. $DP0/config.sh

echo -e -e ${GREEN}
echo -e ===================================
echo -e Restore from Lastest ZIP to RAMDISK
echo -e ===================================
echo -e -e ${NC}

FILE=$(basename $FULL)
NAME="${FILE%.*}"
DSTDIR=/tmp/$NAME
# name=$(echo -e $FILE | cut -f 2- -d '.')
# name=$(basename $FILE .sh)
# echo -e $name

# echo -e $NAME

ZIPFILE=$(ls -at $ZIPDIR/$NAME*.zip|head -1)

# echo -e $ZIPFILE

echo -e -e ${GREEN}
echo -e Restore from $ZIPFILE
echo -e Restore to   $DSTDIR
echo -e -e ${NC}

IGNORE=logs*

unzip -o $ZIPFILE -x "$IGNORE" -d $DSTDIR


echo -e -e ${GREEN}
echo -e ==========
echo -e Run Server
echo -e ==========
echo -e -e ${NC}

chmod +x /tmp/$NAME/run.sh
/tmp/$NAME/run.sh


echo -e -e ${GREEN}
echo -e ==============
echo -e Backup to ZIP?
echo -e ==============
echo -e -e ${NC}

read -p "Press [Enter] key to start backup..."

chmod +x /tmp/$NAME/backup.sh
/tmp/$NAME/backup.sh

