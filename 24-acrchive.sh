#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir=$1
destination_dir=$2
days=${3:-14}

usage() {
    echo -e "${R}USAGE :: $0 [SOURCE_DIR] [DEST_DIR] [days(optional,default to 14 days)]${N}"
    exit 1
}

if [ -z "$source_dir" ] || [ -z "$destination_dir" ]; then
    echo "either of the source/destination dir is missing"
    usage
fi

if [ ! -d "$source_dir" ]; then
    echo "source directory : $source_dir does not exisit"
    exit 1
fi

if [ ! -d "$destination_dir" ];then
    echo "source directory : $destination_dir does not exisit"
    exit 1
fi


echo "Scanning files older than $days days in $source_dir"
files_to_archive=$(find "$source_dir" -name "*.log" -type f -mtime +"$days")

if [ -z "$files_to_archive" ]; then
    echo "No log files found older than $days days"
    exit 0
fi
timestamp=$(date +%Y-%m-%d-%H-%M-%S)

file_name="$destination_dir/logs-$timestamp.tar.gz"

tar -czf $file_name $files_to_archive

if [ $? -ne 0 ]; then
    echo "logs archival is failed"
    exit 1
else 
    echo "logs are archevied : $file_name"
    while IFS= read -r line
    do
        echo "Deleting file in one step : $line"
        rm -f -- "$line"
        echo "file deleted : $line"
    done <<< "$files_to_archive"
fi
