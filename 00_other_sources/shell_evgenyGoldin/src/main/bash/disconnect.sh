#!/bin/bash

set -e

echo -e '==================='
date
echo -e '==================='

result_file=~/Temp/whoer.txt
wget='/usr/local/bin/wget'
resource='http://whoer.net/'
provider='Comcast'

if [ "$(\ps -Af | grep -i torrent | grep -v grep | wc -l | awk '{print $1}')" == "0" ]; then
  echo -e '===> Torrents are not running'
else
  echo -e '===> Torrents are running'
  rm -f "$result_file"
  "$wget" --timeout=5 -nv "$resource" -O "$result_file"
  if [ "$(grep "$provider" "$result_file" | wc -l | awk '{print $1}')" == "0" ]; then
    echo -e "===> $provider not found in '$result_file'"
  else
    echo -e "===> !!! $provider found in '$result_file', turning the network off"
    scselect Off
  fi
fi
