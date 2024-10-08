#!/bin/bash


# LOG_FOLDER="/var/log/shell-script"
# SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
# TIME=$(date +%Y-%m-%d-%H-%M-%S)
# LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME.log"
# mkdir -p $LOG_FOLDER

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 != 0 ]
    then
        echo -e "$R $PACKAGE is not installed, going to install it.. $N"
        dnf install $PACKAGE -y
    else
        echo -e "$G $PACKAGE is already Installed, nothing to do.. $N"
    fi   
}

if [ $USERID != 0 ]
then
    echo "$R Please run this script with root privileges $N"
    exit 1
fi

VALIDATE $? "Installing $PACKAGE"

for PACKAGE in $@ # 1st time git
do
    dnf list installed $PACKAGE # git installed, exit status 0
    # if [ $? != 0 ]
    # then
    #     echo "$PACKAGE is not installed, going to install it"
    #     dnf install $PACKAGE -y
    #     VALIDATE $? "Installing $PACKAGE"
    # else
    #     echo "$PACKAGE is already installed"
done