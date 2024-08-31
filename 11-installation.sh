#!/bin/bash

USERID=$(id -u)

echo "user id is: $USERID"

# if [ $USERID == 0 ]
# then
#     echo "root user" #root user
# else
#     echo "you are not the root user"
# fi