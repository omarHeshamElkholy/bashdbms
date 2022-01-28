#!/usr/bin/bash
re='^[0-9]+$'
ls
echo "Enter table name fot update"
read table
if [ ! -f $table ]
then
	echo "the table you entered does not exist"    
else 
	cat $table
	echo "Enter row PK to updata"
	read rowPK
	num=$(awk -v row_num=$rowPK 'BEGIN{ FS = ":"}{ if( row_num == $1 ){ print } }' $table)
	if [ "$num" == "" ]
	then 
	    echo "can't find the record you're looking for"
	else     
		sed -i ''/$num/'d' $table
		####
		num2=$(awk 'BEGIN {FS=":"} ; END{print NF-1}' $table)
		for n in $(seq $num2)
		do
			echo Insert your data
			read ans
			columnType=$(awk -v i="$n" -F: '{if(NR == i) print $2}' .$table)
			if  [[ $columnType == "int" ]]
			then 
				if ! [[ $ans =~ $re  ]]
				then
					echo "entry needs to be an integer"
					break
				else
               	 entry+=$ans:
            	fi	
			else
            	        entry+=$ans:
						echo $entry >> $table
			fi	
		done
		echo done .
		entry=""
	fi
fi