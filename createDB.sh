#!/usr/bin/bash
if [ -d ./databases ]
then
	echo "Enter the name of the database"
else
	mkdir ./databases
    echo "Enter the name of the database"
fi
read dbName
if [ -d ./databases/$dbName ]
then
	echo "invalid database name"
else
	mkdir ./databases/$dbName
	echo "$dbName database was created"
fi