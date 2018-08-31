#/bin/bash

for szFile in /proc/*/status ; do 

  awk '/VmSwap|Name/{printf $2 "\t" $3}END{ print "" }' $szFile 

done | sort --key 2 --numeric | uniq

echo -e =====================================
sudo swapon --show

echo -e =====================================
echo -e swappiness
cat /proc/sys/vm/swappiness
echo -e vfs_cache_pressure
cat /proc/sys/vm/vfs_cache_pressure
