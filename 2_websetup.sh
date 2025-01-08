#!/bin/bash

#Installing Dependencies
echo "#####################################"
echo "Installing packages."
echo "#####################################"
sudo yum install wget unzip httpd -y > /dev/null
echo 

# start & enable Service
echo "#####################################"
echo "Start & Enable HTTPD SErvice"
echo "####################################"
sudo systemctl start httpd
sydo systemctl enable httpd
echo

#Creating Temp Directory
echo "####################################"
echo "Starting Artifact Deployment"
echo "####################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo 

wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
echo

#Bounce Service
echo "######################################"
echo "Restarting HTTPD service"
echo "######################################"
systemctl restart httpd
echo

#Clean up
echo "#####################################3"
echo "REmoving temporary files"
echo "######################################"
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html
