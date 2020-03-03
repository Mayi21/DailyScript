#!/usr/bin/env bash
path=`pwd`
ls $path | while read line
do
    if [ -f $line ];then
        echo "${line}是文件"
    else
        echo "${line}是文件夹"
    fi
done
