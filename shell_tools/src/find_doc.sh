#!/bin/bash
#author: Yiheng
#description: 查找所有文件名对应文件并复制到指定文件夹
#create: 3/14/2019

echo "find list file is: $1, copy dest dir is: $2"

for line in `cat $1` ; do
    echo "file to find is $line"
    file_path=$(find "$(pwd)"  -name "$line" )
    echo "find file path $file_path"
    cp ${file_path} $2
    echo "copy $line complete.."
done

echo "task complete..."


