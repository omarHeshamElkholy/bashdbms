#!/usr/bin/bash
re='^[0-9]+$'
ls
echo enter table :
read list_tables 
if [ -f $list_tables ]
then
	num=$(awk 'BEGIN {FS=":"} ; END{print NF-1}' $list_tables)
	for n in $(seq $num)
	do
		echo Insert your data
		read ans
		columnType=$(awk -v i="$n" -F: '{if(NR == i) print $2}' .$list_tables)
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
					echo $entry >> $list_tables
		fi	
	done
	echo done .
else
	echo not found this table name .
fi 