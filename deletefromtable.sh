#!/usr/bin/bash
echo "Enter the table you wish to select from"
read table
cat $table
echo "Enter row PK to select"
read rowPK
num=$(awk -v row_num=$rowPK 'BEGIN{ FS = ":"}{ if( row_num == $1 ){ print } }' ./$table)
sed -i ''/$num/'d' ./$table