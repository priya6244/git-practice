#!/bin/bash

#script to know the entered number is greater than 20 or not

NUMBER=$1
if[$NUMBER -gt 20]
then
    echo "$NUMBER is greater than 20"
else
    echo "$NUMBER is less than 20"
fi