#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "please run the script with suod access"
    exit 1
fi

echo "procedding...next"

dnf install nginxxxxxx -y
if [ $? -ne 0 ]; then
    echo "nginix installation is failed"
    exit 1
else 
    echo "nginx installation is sucess"
fi
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "mysql client installation is failed"
    exit 1
else 
echo "mysql installtion i sucess"
fi

echo still proceed
