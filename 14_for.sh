#!/bin/bash

Myusers="alpha beta gamma"
for usr in $Myusers
do
	echo "Adding user $usr"
	useradd $usr
	id $usr
	echo "################################"
done
