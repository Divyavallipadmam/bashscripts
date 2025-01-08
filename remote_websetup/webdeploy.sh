#!/bin/bash

USR='devops'
for host in `cat remote_hosts`
do
	echo "################################"
	echo "Connecting to $host"
	echo "Pushing script to $host"
	scp mutlios_websetup.sh $USR@$host:/tmp/
	echo "Executing Script on $host"
	ssh $USR@$host  /tmp/mutlios_websetup.sh
        ssh $USR@$host sudo rm -rf /tmp/mutlios_websetup.sh
	echo "################################"
	echo
done
