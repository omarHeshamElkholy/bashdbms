#!/usr/bin/bash
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

		echo $ans:>>filesystem
	done
	cat filesystem | tr -d "[:space:]" | paste -sd' ' >>$list_tables
	rm filesystem
	echo done .
else
	echo not found this table name .
fi 