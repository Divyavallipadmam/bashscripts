#!/bin/bash

### This script prints system info##

 echo "Welcome to bash script"
 echo

echo "########################################" 
#this prints uptime of the system
echo "The uptime of the system is:"
 uptime
 echo

#this prints memory utilization
 echo "########################################"
 echo "Memory ustilization"
 free -m
 echo

#this prints disl utilization
 echo "#######################################"
 echo "Disk Utilization"
 df -h
