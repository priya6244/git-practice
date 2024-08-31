#!/bin/bash

USERID=$(id -u)

echo "user id is: $USERID"

VALIDATE(){
    if[ $1 != 0 ]
    echo "exit status: $1"
}
if [ $USERID != 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi

VALIDATE $?