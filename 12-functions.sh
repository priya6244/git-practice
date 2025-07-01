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
    if [ $1 -ne 0 ]
    then
        echo "$2 is...FAILED"
        exit 1
    else
        echo "$2 is...SUCCESS"
    fi
}

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Nginx is not installed, going to install it.."
    dnf install nginx -y
    VALIDATE $? "Installing Nginx"
else
    echo "Nginx is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed...going to install"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed..nothing to do"
fi

# VALIDATE(){
#     if [ $1 != 0 ]
#     then
#         echo -e "$R Not yet installed, Going to install it.. $N"
#         dnf install nginx -y
#     else
#         echo -e "$G Already Installed $N"
#     fi  
# }

# if [ $USERID != 0 ]
# then
#     echo "Please run this script with root privileges"
#     exit 1
# fi

# dnf list installed nginx

# VALIDATE $? "Installing nginx"



# # if [ $? -ne 0 ]
# # then
# #     echo "nginx is not installed...going to install"
# #     dnf install nginx -y
# #     VALIDATE $?
# # else
# #     echo "MySQL is already installed..nothing to do"
# # fi

# # if [ $? != 0 ]
# # then
# #     echo "Not yet installed, Going to install it.."
# #     dnf install mysql -y
# #     if [ $? != 0 ]
# #     then
# #         echo "Not successful, pls check"
# #         exit 1    
# #     else
# #         echo "Installation is successful"
# #     fi
# # else
# #     echo "Already Installed"  
# # fi
