#!/bin/bash

USERID=$(id -u)

echo "user id is: $USERID"

# if [ $USERID == 0 ]
# then
#     echo "root user"
# else
#     echo "you are not the root user"
# fi

if [ $USERID != 0 ] #checks userID not equals to 0 or not
then
    echo "Please run this script with root privileges" # print this if userId notEquals to 0
    exit 1
fi
#PACKAGE=$1

#dnf install git -y
dnf list installed mysql #lists the mysql if it is already installed

if [ $? == 0 ]           # $? gives the exit status of the previous command, here it gives the exit status of the dnf list installed mysql command
then
    echo "Already Installed"   # print this if S? == 0, means success -> mysql already installed
else
    echo "Not yet installed, Going to install it.." # print this if S? != 0, means failure -> mysql not installed yet
    dnf install mysql -y       # install mysql
    if [ $? == 0 ]        # $? gives the exit status of the previous command, here it gives the exit status of the dnf install mysql command
    then
        echo "Mysql Installation is successful" # print this if $? = 0, means success
    else
        echo "Mysql Instllation is not successful, please check"  # print this if $? != 0, means failure
        exit 1
    fi   
fi

#dnf status $PACKAGE -y
#dnf enable $PACKAGE -y

dnf list installed nginx

if [ $? == 0 ]
then
    echo "Already Installed"
else
    echo "Not yet installed, Going to install it.."
    dnf Install nginx -y
    if [ $? -eq 0 ]
    then
        echo "nginx Installation is success"
    else
        echo "nginx Installation is failure, please check"
    exit 1
    fi
fi
