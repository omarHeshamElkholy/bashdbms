#!/usr/bin/bash
echo enter table name :
read name1
if [ -f $name1  ]
then
		echo already found .
else
		echo enter number columes :
		read number
		echo your columes :
        for i in $(seq $number)
		do
			read answer
			echo $answer:>>filesystem
		done
		cat filesystem | tr -d "[:space:]" | paste -sd' ' >$name1
		rm filesystem
		echo done .
fi