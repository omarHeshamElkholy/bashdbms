#!/usr/bin/bash
ls
echo "Enter table name you wish to delete"
            read tablename
            if [ -f $tablename ]
            then
            	rm $tablename
                echo "table $tablename was removed"
            else
	            echo "No such table exists in this database"
            fi
