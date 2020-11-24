#!/bin/bash

fdt="%-10s %-20s %-30s %15s\n"

printf "$fdt" PID USER NAME COMM

for proc in `ls  /proc/ | egrep "^[0-9]" | sort -n`
    do
    test="/proc/$proc"
   if [[ -d "$test" ]]
    then
    user=`awk '/Uid/{print $2}' /proc/$proc/status`

    comm=`cat /proc/$proc/comm`

    if [[ User -eq 0 ]] 
    then
    user_name='root'
    else
    user_name=`grep $User /etc/passwd | awk -F ":" '{print $1}'`
    fi

    files=`readlink /proc/$proc/map_files/*; readlink /proc/$proc/cwd`
    if ! [[ -z "$files" ]]
    then
    for item in $files
    do
    printf "$fdt" $proc $user_name $item $comm
    done
    fi

   fi
done


