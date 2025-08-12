#!/bin/bash

SOURCE_DIR="/home/ec2-user/files"

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ -d $SOURCE_DIR ] # True if source_dir exists
then
    echo -e "$SOURCE_DIR $G exists $N"
else
    echo -e "$SOURCE_DIR $R does not exists $N"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14) #finding the files in mentioned Source_dir with .log extension which are older than 14 days
echo "files: $FILES"

# don't use line, it is reserved word
while IFS= read -r file # IFS, Internal Field Separator, empty->ignore white space, -r -> not to ignore special characters like /
do
    echo "Deleting line : $file "
    rm -rf $file
done <<< $FILES



