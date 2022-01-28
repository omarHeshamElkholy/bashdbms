#!/usr/bin/bash
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
		up=$(awk 'BEGIN {FS=":"} ; END{print NF-1}' $table)
		for q in $(seq $up)
		do
		    echo Insert your data
		    read anss

		    echo $anss:>>filesystem
		done
		cat filesystem | tr -d "[:space:]" | paste -sd' ' >>$table
		rm filesystem
		echo done .
	fi
fi