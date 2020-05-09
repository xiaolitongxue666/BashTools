#!/bin/sh

#creat a new file
touch $1

echo "/* File: $1 */" > $1
echo "/* Author: YOU NAME */" >> $1
echo "/* Date: `date` */" >> $1

filename="${1%.*}"
suffix="${1##*.}"

echo "File name is $filename"
echo "Suffix is $suffix"

if [ $suffix = "h" ];then
    temp_string=$(echo $filename | tr a-z A-Z)
    echo "#ifndef _${temp_string}_H_" >> $1
    echo "#define _${temp_string}_H_" >> $1
    echo "\n" >> $1
    echo "#endif" >> $1
fi		
