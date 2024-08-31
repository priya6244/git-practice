#!/bin/bash

USERID=$(id -u)

echo "user id is: $USERID"

# if [ $USERID == 0 ]
# then
#     echo "root user"
# else
#     echo "you are not the root user"
# fi

if [ $USERID != 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi

#dnf install git -y
dnf list installed git

if [ $? == 0 ]
then
    echo "Installed"
fi