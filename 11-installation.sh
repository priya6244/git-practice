#!/bin/bash

if [ $(id -u) == 0]
then
    echo "root user"
else
    echo "you are not the root user"
fi