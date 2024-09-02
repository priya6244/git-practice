#!/bin/bash

$SOURCE_DIR="/home/ec2-user/files"

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR exists"
else
    echo "$SOURCE_DIR does not exists"
fi

# FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
# echo "files: $FILES"



