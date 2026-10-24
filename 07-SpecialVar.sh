#!/bin/bash

echo "all the args passed to he script : $@"
echo "no of args passed to the script: $#"
echo "first variable passed: $1"
echo "script name :$0"
echo "Realpath $(realpath $0)"
echo  "who is running current script: $USER"
