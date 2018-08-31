#!/bin/bash

# Run a cmd on all servers from a file with each IP in a line
# Author: Zhiqiang Ma http://www.ericzma.com

if [ $# -lt 2 ]
then
    printf "usage: $0 file cmd\n"
    printf "Each host in one line in the file\n"
    exit 0
fi

infile=$1
shift
cmd=$1

echo -e "To invoke cmd: $cmd"

for line in `cat $infile`;
do
    echo -e "$line "; 
    ssh $line "$cmd";
done

