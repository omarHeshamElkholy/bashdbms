#!/usr/bin/bash
echo "Enter table name you wish to delete"
read $tablename
if [ -f $tablename ]
then
	rm $tablename
else
	echo "No such table exists in this database"
fi