#!/bin/bash

#variable declaration
#PACKAGE="httpd wget unzip"
#SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
TMPDIR='/tmp/webfiles'

yum --help &> /dev/null

if [ $? -eq 0 ]
then
        PACKAGE="httpd wget unzip"
        SVC="httpd"
	echo "Running Setup on CentOs"

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
        sudo systemctl enable $SVC
        echo

        #Creating Temp Directory
        echo "####################################"
        echo "Starting Artifact Deployment"
        echo "####################################"
        mkdir -p $TMPDIR
        cd $TMPDIR
        echo 

        wget $URL > /dev/null
        unzip $ART_NAME.zip > /dev/null
        sudo cp -r $ART_NAME/* /var/www/html/
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

else
        #Set variables for ubuntu
        PACKAGE="apache2 wget unzip"
        SVC="apache2"
        echo "Running Setup on CentOs"

        #Installing Dependencies
        echo "#####################################"
        echo "Installing packages."
        echo "#####################################"
	sudo apt update
        sudo apt install $PACKAGE -y > /dev/null
        echo

        # start & enable Service
        echo "#####################################"
        echo "Start & Enable HTTPD SErvice"
        echo "####################################"
        sudo systemctl start $SVC
        sudo systemctl enable $SVC
        echo

        #Creating Temp Directory
        echo "####################################"
        echo "Starting Artifact Deployment"
        echo "####################################"
        mkdir -p $TMPDIR
        cd $TMPDIR
        echo

        wget $URL > /dev/null
        unzip $ART_NAME.zip > /dev/null
        sudo cp -r $ART_NAME/* /var/www/html/
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
fi
	
