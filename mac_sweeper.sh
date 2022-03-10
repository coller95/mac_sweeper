#!/bin/bash
scanipmac()
{
	ip=$1
	getip=$(ping -c 1 -i 0.5 $ip | grep "64 bytes" | cut -d " " -f 4 | cut -d ":" -f 1)
	if [ ! -z "$getip" ]
	then
		arp -n | grep $getip | grep -v "(incomplete)"
	fi
}


for ip in `seq 1 254`; do
	scanipmac $1.$ip &
done
