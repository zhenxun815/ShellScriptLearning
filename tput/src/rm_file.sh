#!/bin/bash
#author: Yiheng
#description: 删除路径下所有子文件夹中.ok与.rst文件
#create: 3/1/2019

echo "base dir is: $1"
for element in `ls $1`
do
    dir_or_file=$1"/"${element}
    if [[ -d ${dir_or_file} ]]
    then
        echo ${dir_or_file}
        cd ${dir_or_file}
        rm *.ok
        echo "rm .ok ..."
        rm *.rst
        echo "rm .rst ..."
    fi
done
echo "all file removed..."