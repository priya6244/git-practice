#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "user id is: $USERID"

if [ $USERID != 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi

VALIDATE(){
    if [ $1 != 0 ]
    then
        echo -e "$2 is $R failed $N"
        exit 1
    else
        echo -e "$2 is $G success $N"
    fi   
}

#package=mysql

for PACKAGE in $@
do
    dnf list installed $PACKAGE
    if [ $? != 0 ]
    then
        echo "$PACKAGE is not installed, going to install it"
        dnf install $PACKAGE -y
        VALIDATE $? "Installing $PACKAGE"
    else
        echo "$PACKAGE is already installed"
    fi
done