#!/bin/bash
R=" \e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
days=${2:-14}  # if user is not passing day we will take by default 14

usuage(){
    echo -e "${R}USAGE :: $0 [SOURCE_DIR] [days(optional,default to 14 days)]${N}"
    exit 1
}
if [ -z "$source_dir" ]; then
    echo "ERROR :: missing parameters"
    usuage
fi

if [ -d "$source_dir" ];then
    echo "directory ${source_dir} ${R}exist"
else 
    echo "${R}ERROR ${source_dir} directory does not exist"

fi
echo "scanning files older than $days in $source_dir"
files_to_delete =${find $source_dir -name "*.log" -type f -mtime +$days}

if [ -z $files_to_delete ];then
    echo "no log files found older than 14 days"
    exit 0
fi


while IFS= read -r line
do 
    echo "file is going to be deleted : $line"
done <<< $files_to_delete


# <  -> for filr inputs
# <<< -> variable as input
