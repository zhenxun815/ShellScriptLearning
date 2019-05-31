#!/bin/bash
#author: Yiheng
#description: 定时任务,光标重定位
#create: 2018/12/6

start=$(date +%s)
echo -n Count:
tput sc
count=0
while true;do
    if [[ ${count} -lt 4 ]];then
        let count++;
        sleep 1;
        tput rc
        tput ed
        echo -n ${count};
    else
        end=$(date +%s)
        difference=`expr ${end} - ${start}`
        echo -e "\n time taken to execute is: $difference."
    fi
done
