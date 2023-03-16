#!/bin/bash
# iterating through multiple directories
for file in /home/centos/sabina-dzino-week3/*  /home/centos/sabina-dzino-week3/non-existing
do
if [ -d "$file" ]
then
echo "$file is a directory"
elif [ -f "$file" ]
then
echo "$file is a file"
else
echo "$file doesn't exist"
fi
done
