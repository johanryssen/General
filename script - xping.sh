#!/bin/bash

# Usage:
# xping.sh file_containing_hosts.txt

for i in `cat $1`
do

    /bin/ping -q -c 1 -w 1 $i &>/dev/null

    if [ $? -ne 0 ] ; then
     echo "$i is DOWN <------"
      else
     echo "$i is alive"
    fi

done