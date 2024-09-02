#!/bin/bash

SOURCE_DIR="/home/ec2-user/files"

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR $G exists $N"
else
    echo -e "$SOURCE_DIR $R does not exists $N"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "files: $FILES"

while IFS= read -r line # IFS, Internal Field Separator, empty->ignore white space, -r -> not to ignore special character
do
    echo "Deleting line : $line "
done <<< $FILES



