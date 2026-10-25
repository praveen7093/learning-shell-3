#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
logs_file="${logs_folder}/${0}.log"

if [ $user_id -ne 0 ]; then
    echo "please run the script with suod access"
    exit 1
fi

mkdir -p $logs_folder

echo "script started executing at $(date + "%F %T")"

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}.. is failed" | tee -a $logs_file
        exit 1
    else 
        echo "${2}  is sucess" | tee -a $logs_file
    fi
}

echo "procedding...next"
dnf install nginx -y &>> $logs_file
validate $? "Ngninx installation"


dnf install nginx -y
validate $? "mysql installation"


echo "script compelted time and date  at $(date + "%F %T")"
