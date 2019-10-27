#!/bin/sh

#creat a new file
touch $1

echo -e "/* File: $1 */" > $1
echo -e "/* Author: YOU NAME */" >> $1
echo -e "/* Date: `date` */" >> $1

filename="${1%.*}"
suffix="${1##*.}"

echo "File name is $filename"
echo "Suffix is $suffix"

if [ $suffix = "h" ];then
    temp_string=$(echo $filename | tr a-z A-Z)
    echo -e "#ifndef _${temp_string}_H_" >> $1
    echo -e "#define _${temp_string}_H_" >> $1
    echo -e "\n" >> $1
    echo -e "#endif" >> $1
fi		
