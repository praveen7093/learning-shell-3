#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir =$1
day=${2:-14}

usuage(){
    echo -e "${R}USAGE :: $0 [SOURCE_DIR] [days(optional,default to 14 days)]${N}"
}
if [ -z "$source_dir" ]; then
    echo "ERROR :: missing parameters"
    usuage
fir

if [ -d "$source_dir" ];then
    echo "directory ${source_dir} ${R}exist"
else 
    echo "directory does not exist"

fi