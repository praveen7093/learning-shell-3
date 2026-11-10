#!/bin/bash
disk_usuage=$(df -hT | grep -v Filesystem)
usage_threshold=20
while IFS= read -r line 
do
    usage=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    partition=$(echo $line | awk '{print $7}')
    if [ "$usage" -ge "$usage_threshold" ]; then
        message="High disk usuage on $partition : $usage \n"
    fi
done <<< "$disk_usuage"
echo -e "$message"