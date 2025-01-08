#!/bin/bash

echo "#########################################"
date
ls /var/run/httpd/httpd.pid &> /dev/null
if [ $? -eq 0 ]
then 
	echo "Httpd proces is running"
else
	echo "Httpd process is NOT running."
	echo "Starting the process."
	systemctl start httpd
        if [ $? -eq 0 ]
	then
		echo "The process started successfully."
	else
		echo "The process Failed .Contact the admin."
	fi
fi
echo "#########################################"
