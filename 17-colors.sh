#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
logs_file="${logs_folder}/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $user_id -ne 0 ]; then
    echo "please run the script with suod access" &>> $logs_file
    exit 1
fi

mkdir -p $logs_folder

echo "script started executing at $(date +"%F %T")" &>> $logs_file

validate(){
    if [ $1 -ne 0 ]; then
        echo -e "${2}.. is ${R}failed${N}" | tee -a $logs_file
        exit 1
    else 
        echo -e "${2}  is ${G}sucess${N}" | tee -a $logs_file
    fi
}

for package in $@
do 
    dnf list installed $package &>> $logs_file
    if [ $? -ne 0 ] ;then
        echo "going to install :${package}"
        dnf install $package -y &>> $logs_file
        validate  $? "installing ${package}"
    else
        echo -e "already ${package} installed so ${Y}skipping${N}"
    fi
done


