#!/bin/bash
#author: Yiheng
#description: 搜索传入路径下所有题目文件
#create: 3/8/2019

questionDir=/home/tqhy/ip_data/question
answerDir=/home/tqhy/ip_data/answer

if [[ $# -gt 0 ]]; then
    while [[ $1 != "" ]];do
        echo "current argument is: $1"
        case $1 in
            -q | --question-dir )
                shift
                questionDir=$1
                echo "set question dir is: $questionDir"
                ;;
            -a | --answer-dir )
                shift
                answerDir=$1
                echo "set answer dir is: $answerDir"
                ;;

        esac
        shift
    done
else
    echo "Missing argument to exec!"
fi


for dir in $(find ${questionDir}  -maxdepth 1 -mindepth 1 -type d | grep -v "\.") ; do
    echo "dir to is: $dir"
    wget -t1 -b -q -O - "localhost:8764/search/local?questionDir=$dir&answerDir=$answerDir" > /dev/null 2>&1
done
