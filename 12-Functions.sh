#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "please run the script with suod access"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}.. is failed"
        exit 1
    else 
        echo "${2} installation is sucess"
    fi
}

echo "procedding...next"

dnf install nginx -y
validate $? "Ngninx installation"

dnf install nginx -y
validate $? "mysql installation"


echo "still proceeded.."
