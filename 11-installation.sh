#!/bin/bash

USERID=$(id -u)

if [ $USERID == 0 ]
then
    echo "root user"
else
    echo "you are not the root user"
fi