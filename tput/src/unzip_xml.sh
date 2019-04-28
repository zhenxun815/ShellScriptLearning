#!/bin/bash
#author: Yiheng
#description: 解压指定路径下zip压缩文件至其同级文件夹下
#create: 4/18/2019

echo "start to collect all zip file path..."
cd $1
find $(pwd)/ -type f | grep -i -w zip > ./zipPath.txt

echo "collecting all zip file path complete..."

for line in $(cat ./zipPath.txt) ; do
    echo -e "\n"
    echo "start to unzip $line ..."

    source_dir_path=${line%/*}
    echo "file will be unzip to $source_dir_path ..."
    unzip -o ${line} -d ${source_dir_path}
done

echo -e "\n"
echo "all unzip tasks complete.."