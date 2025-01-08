#!/bin/bash 

value=$(ip addr show | grep -v link/loopback | grep -ic mtu)

if [ $value -eq 1 ]
then
	echo "! Active Network Interface found."
elif [ $value -gt 1 ] 
then
	echo "Found Multiple Active Interface."
else
	echo "No Active Interface found."
fi
