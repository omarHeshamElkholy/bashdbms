#!/usr/bin/bash
echo "Enter the name of the database you wish to drop"
read dbName
if [ -d ./databases/$dbName ]
then
        rm -r ./databases/$dbName
	echo "$dbName database was dropped"
else
        echo "there in no such a database in our records"
fi