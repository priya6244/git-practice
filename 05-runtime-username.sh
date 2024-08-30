#!/bin/bash

echo "Please enter your username : "

read USERNAME #interrupts and takes input from user and whatever the user enters it is visible to us

echo "Username entered is : $USERNAME "

echo "Please enter ur password : "

read -s PASSWORD #whatever user enters here is invisible to us, becoz we have used -s here.

echo "Password entered is : $PASSWORD "
