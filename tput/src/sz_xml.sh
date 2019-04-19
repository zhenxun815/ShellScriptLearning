#!/bin/bash
#author: Yiheng
#description: 
#create: 4/18/2019

find $(pwd)/CN_*  -maxdepth 2 -mindepth 2 -type d > find.txt
echo "find xml dir complete..."

for line in $(cat ./find.txt) ; do
    echo "file to zip is $line"
    source_dir_path=${line%/*}
    source_dir_name=${line##*/}

    zip_file_dir=${source_dir_path##*/}
    zip_file_name=${source_dir_name}

    zip_file_path=$(pwd)/zips/${zip_file_dir}/${zip_file_name}.zip
    echo "zip file path is: $zip_file_path"
    zip -r ${zip_file_path} ${line}
done
echo "zip complete..."

find $(pwd)/zips/ -type f > zip.txt
echo "find zip complete..."

for line in $(cat ./zip.txt) ; do
    echo "zip file to sz is: $line"
    #sz $line
done
echo "sz complete..."


