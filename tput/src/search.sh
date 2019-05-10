#!/bin/bash
#author: Yiheng
#description: 
#create: 5/10/2019

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
                ;;
            -a | --answer-dir )
                answerDir=1
                ;;
            -h | --help )
                exit
                ;;
            * )
                exit 1
        esac
        shift
    done

    for dir in $@ ; do
    echo "dir to is: $dir"
    wget -t1 -b -q -O - "localhost:8764/search/local?questionDir=$questionDir/q$dir&answerDir=$answerDir" > /dev/null 2>&1
    done
else
    echo "Missing argument to exec!"
fi

