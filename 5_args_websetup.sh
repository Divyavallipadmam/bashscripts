#!/bin/bash

#variable declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
#URL='https://www.tooplate.com/zip-templates/2098_health.zip'
#ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

#Installing Dependencies
echo "#####################################"
echo "Installing packages."
echo "#####################################"
sudo yum install $PACKAGE -y > /dev/null
echo 

# start & enable Service
echo "#####################################"
echo "Start & Enable HTTPD SErvice"
echo "####################################"
sudo systemctl start $SVC
sydo systemctl enable $SVC
echo

#Creating Temp Directory
echo "####################################"
echo "Starting Artifact Deployment"
echo "####################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo 

wget $1 > /dev/null
unzip $2.zip > /dev/null
sudo cp -r $2/* /var/www/html/
echo

#Bounce Service
echo "######################################"
echo "Restarting HTTPD service"
echo "######################################"
systemctl restart $SVC
echo

#Clean up
echo "#####################################3"
echo "REmoving temporary files"
echo "######################################"
rm -rf $TMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html
