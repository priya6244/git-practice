#!/bin/bash

USERID=$(id -u)

echo "user id is: $USERID"

VALIDATE(){
    echo "exit status: $1"
}

if [ $USERID != 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi

dnf list installed git

VALIDATE $?