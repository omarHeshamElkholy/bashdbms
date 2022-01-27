#!/usr/bin/bash
PS3="mysql>"
echo "Welcome to the Database managment system!"

select choice in "create database" "List database" "connect to databse" "drop database" "exit"
do 
    case $choice in 
        "create database")
			. ./createDB.sh 
			;;
		"List database") 
			. ./listDB.sh
            ;;
		 "connect to databse")
     		. ./connectDB.sh
            ;;

 		"drop database")
			. ./dropDB.sh 
            ;;
        "exit")
            exit
            ;;
		*)
			echo "not valid option, please try again"
			;;
    esac 
done    