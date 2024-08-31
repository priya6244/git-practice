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
#PACKAGE=$1

#dnf install git -y
dnf list installed mysql

if [ $? == 0 ]
then
    echo "Already Installed"
else
    echo "Not yet installed, Going to install it.."
    dnf install mysql -y
    if [ $? == 0 ]
    then
        echo "Installation is successful"
    else
        echo "Not successful, pls check"
        exit 1
    fi   
fi

#dnf status $PACKAGE -y
#dnf enable $PACKAGE -y

# dnf list installed git

# if [ $? == 0 ]
# then
#     echo "Already Installed"
# else
#     echo "Not yet installed, Going to install it.."
#     dnf Install mysql -y
# fi
