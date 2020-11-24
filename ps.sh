#!/bin/bash

fdt="%-30s%-30s%-85s%-10s%-10s\n"
printf "$fdt" PID USER COMM STAT RSS

for proc in `ls /proc/ | egrep "^[0-9]" | sort -n`
do

    if [[ -f /proc/$proc/status ]]
        then
        PID=$proc

    comm=`cat /proc/$proc/cmdline`
    if  [[ -z "$COMM" ]]
        then
        comm="[`awk '/Name/{print $2}' /proc/$proc/status`]"
    else
        comm=`cat /proc/$proc/cmdline`
    fi

    user=`awk '/Uid/{print $2}' /proc/$proc/status`
    stat=`cat /proc/$proc/status | awk '/State/{print $2}'`
    rss=`cat /proc/$proc/status | awk '/VmRSS/{print $2}'`
    if [[ User -eq 0 ]]
       then
       user_name='root'
    else
       user_name=`grep $User /etc/passwd | awk -F ":" '{print $1}'`
    fi
    printf "$fdt" $PID $user_name "$comm" $stat $rss
    fi
done


