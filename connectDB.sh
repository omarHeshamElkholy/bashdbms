#!/usr/bin/bash
echo "enter the database you wish to connect to"
read dbName
if [ -d ./databases/$dbName ]
then
	cd databases/$dbName
    echo "you just connected to the database $dbName"
    select choice in "create table" "List table" "Drop table" "Insert into table" "Select from table" "Show table" "Delete from table" "Update table" "back to main" "exit"
do 
    case $choice in 
        "create table")
			. ../../createtable.sh 
			;;
		"List table") 
			ls 
            ;;
		 "Drop table")
     		. ../../Droptable.sh
            ;;

 		"Insert into table")
			. ../../insertintotable.sh 
            ;;

        "Select from table")
			. ../../selectfromtable.sh 
            ;;

        "Show table")
            . ../../showtable.sh    
            ;;    

        "Delete from table")
			. ../../deletefromtable.sh 
            ;;        

        "Update table")
			. ../../updatetable.sh 
            ;;       
        "back to main")
            cd ../../
            . ./mainmenu.sh   
            ;;
        "exit")
            exit
            ;;
		*)
			echo "not valid option, please try again"
			;;
    esac 
done  
else
	echo "no such database"
fi
