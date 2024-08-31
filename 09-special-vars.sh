#!/bin/bash

echo "all variables : $@"
echo "number of variables : $#"
echo "script name : $0"
echo "current working directory : $PWD"
echo "home directory : $HOME"
echo "PID of the script executing now : $$"
echo "PID of the last background command : $!"
echo "don't know : $*"