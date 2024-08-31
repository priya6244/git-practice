#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "user id is: $USERID"

VALIDATE(){
    if [ $1 != 0 ]
    then
        echo -e "$R Not yet installed, Going to install it.. $N"
    else
        echo -e "$G Installed $N"
    fi   
}

if [ $USERID != 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi

VALIDATE $?

for PACKAGE in $@
do
    dnf list installed $PACKAGE
    if [ $? != 0 ]
    then
        echo "$PACKAGE is noyt installed, going to install it"
        dnf install $PACKAGE -y
        VALIDATE $? "Installing $PACKAGE
    else
        echo "$PACKAGE is already installed"
    dnf install $PACKAGE -y

done