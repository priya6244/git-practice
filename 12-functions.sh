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

dnf list installed nginx

VALIDATE $?

# if [ $? != 0 ]
# then
#     echo "Not yet installed, Going to install it.."
#     dnf install mysql -y
#     if [ $? != 0 ]
#     then
#         echo "Not successful, pls check"
#         exit 1    
#     else
#         echo "Installation is successful"
#     fi
# else
#     echo "Already Installed"  
# fi
