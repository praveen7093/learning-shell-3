#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir="$1"
days=${2:-14}  # Default is 14 days

usage() {
    echo -e "${R}USAGE :: $0 [SOURCE_DIR] [days(optional,default to 14 days)]${N}"
    exit 1
}

if [ -z "$source_dir" ]; then
    echo "ERROR :: missing parameters"
    usage
fi

if [ -d "$source_dir" ]; then
    echo "Directory ${source_dir} exists"
else
    echo -e "${R}ERROR :: ${source_dir} directory does not exist${N}"
    exit 1
fi

echo "Scanning files older than $days days in $source_dir"

files_to_delete=$(find "$source_dir" -name "*.log" -type f -mtime +"$days")

if [ -z "$files_to_delete" ]; then
    echo "No log files found older than $days days"
    exit 0
fi

while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -f -- "$line"
done <<< "$files_to_delete"

echo "Cleanup completed successfully"
```