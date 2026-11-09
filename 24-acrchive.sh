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
fi

if [ ! -d "$destination_dir" ];then
    echo "source directory : $destination_dir does not exisit"
fi
