#!/bin/bash
echo "Total Time Logged in:"
last|grep `whoami`|grep -v logged|cut -c61-71|sed -e 's/[()]//g'|awk '{ sub("\\+", 
":");split($1,a,":");if(a[3]){print a[1]*60*60+a[2]*60+a[3]} else {print a[1]*60+a[2] }; 
}'|paste -s -d+ -|bc|awk '{printf "%dh:%dm:%ds\n",$1/(60*60),$1%(60*60)/60,$1%60}'

