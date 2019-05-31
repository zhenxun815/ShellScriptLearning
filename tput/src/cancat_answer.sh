#!/bin/bash
#author: Yiheng
#description: 拼接答案文件
#create: 5/31/2019

answer_fragments=$(pwd)
answer_association=$(pwd)/answer.txt

function concat_file() {
    local frag_arr=("$@")

    if [[ ! -f ${answer_association} ]]; then
        echo -n "association answer file $answer_association not exist,"
        echo -e "will create it automatically\n"
        touch ${answer_association}
    fi

    for frag in ${frag_arr[@]} ; do
        echo -e "concat $frag to $answer_association \n"
        cat ${frag} >> ${answer_association}
        sed -i '/^$/d' ${answer_association}
    done
}

if [[ $# -gt 0 ]]; then
    while [[ $1 != "" ]];do
        #echo "current argument is: $1"
        case $1 in
            -f | --fragments )
                shift
                answer_fragments=$1
                ;;
            -a | --association )
                shift
                answer_association=$1
                ;;
        esac
        shift
    done
else
    echo -e "use default argument to exec!\n"
fi

echo -e "set answer fragments is: $answer_fragments"
echo -e "set answer association is: $answer_association \n"

if [[ $(pwd) = "$answer_fragments" ]]; then
    echo -e "start collect pwd answer files..."
    frag_arr=$(find $(pwd) -type f | grep -e "txt$")
else
    echo -e "collect cmd answer files..."
    IFS=':' read -ra arr <<< "$answer_fragments"
    frag_arr=${arr[@]}
fi

concat_file ${frag_arr}

echo "work done!"