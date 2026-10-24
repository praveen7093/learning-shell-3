#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "please run the script with suod access"
    exit 1
fi

echo "procedding...next"

dnf install nginx -y
