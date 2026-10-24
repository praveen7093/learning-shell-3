#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "please run the script with suod access"
fi

dnf install nginx -y
