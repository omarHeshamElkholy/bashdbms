#!/usr/bin/bash
echo "enter the database you wish to connect to"
read dbName
if [ -d ./databases/$dbName ]
then
	cd databases/$dbName
    echo "you just connected to the database $dbName"
else
	echo "no such database"
fi
select choice in "create table" "List table" "Drop table" "Insert into table" "Select from table" "Delete from table" "Update table" "exit"
do 
    case $choice in 
        "create table")
			. ./createtable.sh 
			;;
		"List table") 
			ls 
            ;;
		 "Drop table")
     		echo "Enter table name you wish to delete"
            read tablename
            if [ -f $tablename ]
            then
            	rm $tablename
                echo "table $tablename was removed"
            else
	            echo "No such table exists in this database"
            fi
            ;;

 		"Insert into table")
			. ./insertintotable.sh 
            ;;

        "Select from table")
			. ./selectfromtable.sh 
            ;;

        "Delete from table")
			. ./deletefromtable.sh 
            ;;        

        "Update table")
			. ./updatetable.sh 
            ;;       
        "exit")
            exit
            ;;
		*)
			echo "not valid option, please try again"
			;;
    esac 
done  