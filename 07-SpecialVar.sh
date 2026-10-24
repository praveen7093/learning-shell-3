#!/bin/bash

echo "all the args passed to he script : $@"
echo "no of args passed to the script: $#"
echo "first variable passed: $1"
echo "script name :$0"
echo "Realpath $(realpath $0)"
echo  "who is running current script: $USER"
echo "directoty of current running script : $PWD"
echo "home directory of current user : $HOME"
echo "process instance id os current script: $$"
sleep 10 &
echo "to get process instance id of the command in background: $!"
wait $! 
echo "Line Number: $LINENO"
echo "previous commad exits status: $?"
echo "total time executed for this script : $SECONDS"

