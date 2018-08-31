#!/bin/bash

loop=150000
blocksize=1M

isroot() {                                                     
  if [ $(whoami) = "root" ]; then return 0; else return 1; fi  
}                                                              

diskflush() {

echo -e Flushing Disk Cache
sudo sync
sudo sync
sudo sync

echo -e Original Setting in /proc/sys/vm/drop_caches
cat /proc/sys/vm/drop_caches

# if isroot; then 
  # echo -e 3 > /proc/sys/vm/drop_caches
# else 
  # echo -e 3 | sudo tee /proc/sys/vm/drop_caches
# fi


# And free up caches
#
echo -e Freeing the page cache:
# echo -e 1 > /proc/sys/vm/drop_caches
sudo sysctl -w vm.drop_caches=1

echo -e Free dentries and inodes:
# echo -e 2 > /proc/sys/vm/drop_caches
sudo sysctl -w vm.drop_caches=2

echo -e Free the page cache, dentries and the inodes:
# echo -e 3 > /proc/sys/vm/drop_caches
sudo sysctl -w vm.drop_caches=3

}

benchmark() {
diskflush

testfile=zerofile.tmp
result=$(dd if=/dev/zero of=$testfile bs=$blocksize count=$loop 2>&1)
rm $testfile


result=$(echo -e $result | sed "s/dd: error writing $(echo -e -ne '\u2018')zerofile.tmp$(echo -e -ne '\u2019'): No space left on device//")
speed=$(echo -e $result | awk '{print $14}') 
unit=$(echo -e $result | awk '{print $15}') 
count=$(echo -e $result | awk '{print $1}') 
totalsec=$(echo -e $result | awk '{print $12}') 
iops=$(awk "BEGIN {print ($count)/$totalsec}")


echo -e $result
echo -e ------------------------------------
echo -e Write: $speed $unit
echo -e IOPS: $iops
}

# echo -e Flushing Disk Cache
# diskflush

echo -e Testing IOPS with 150GB, $loop of $blocksize writes
echo -e ====================================
echo -e Computer: $(hostname)
echo -e ====================================
benchmark
echo -e ====================================
benchmark
echo -e ====================================
benchmark

