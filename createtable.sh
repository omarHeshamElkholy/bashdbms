#!/usr/bin/bash
re='^[0-9]+$'
echo enter table name :
read name1
if [ -f $name1  ]
then
		echo already found .
else
		echo enter number columes :
		read number
		if ! [[ $number =~ $re ]] ; then
   			echo "you entered an invalid entry please enter a number" 
		else
			echo your columes :
        	for i in $(seq $number)
			do
				echo 'enter the column name'				
				read answer
				echo $answer:>>filesystem
				echo "enter data type"
				type=""
				type+=$answer
				select choice in "Integer" "String"
    			do
    			case $REPLY in
        			1) type+=:'int'
        			break
        			;;
        			2) type+=:'string'
        			break
        			;;
        		esac
    			done
				echo $type >> .$name1
			done
			cat filesystem | tr -d "[:space:]" | paste -sd' ' >$name1
			rm filesystem
			echo done .
		fi
fi