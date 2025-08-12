#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root priveleges $N" | tee -a $LOG_FILE
        exit 1
    fi
}
USAGE(){
    echo -e "$R It should be like sh 15-redirectors.sh package1 package2 .. $N "
    exit 1
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"  | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is... $G SUCCESS $N" | tee -a $LOG_FILE # postfix come to this, it shows success
    fi
}

echo "Script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@ # $@ refers to all arguments passed to it, 1st i gave git here, 2nd gave postfix
do
    dnf list installed $package &>>$LOG_FILE #checks whether git installed or not, installed. so it'll success -> exit 0, means $1 ->0
    # checks whether postfix installed or not, it will not there, so it is failure, returns exit code as 1-> $1 -> 1
    if [ $? -ne 0 ]  # $? -> 0 -> $1 == 0 -> it becomes false
                     # it becomes true in the case of postfix
    then
        echo "$package is not installed, going to install it.." | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE # postfix will install here => if success returns exit 0
        VALIDATE $? "Installing $package" # $2 -> 0
    else
        echo -e "$package is already $Y installed..nothing to do $N" | tee -a $LOG_FILE
    fi
done
