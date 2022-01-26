#!/usr/bin/bash
echo "enter the database you wish to connect to"
read dbName
if [ -d ./databases/$dbName ]
then
	cd databases/$dbName
    echo "you just connected to the database $dbName"
    pwd
else
	echo "no such database"
fi
select choice in "create table" "List table" "Drop table" "Insert into table" "Select from table" "Show table" "Delete from table" "Update table" "exit"
do 
    case $choice in 
        "create table")
			. ./createtable.sh 
			;;
		"List table") 
			ls 
            ;;
		 "Drop table")
     		. ../../Droptable.sh
            ;;

 		"Insert into table")
			. ./insertintotable.sh 
            ;;

        "Select from table")
			. ../../selectfromtable.sh 
            ;;

        "Show table")
			echo "Enter table name you wish to view"
            read tablename
            cat $tablename 
            ;;    

        "Delete from table")
			. ../../deletefromtable.sh 
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