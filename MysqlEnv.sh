#!/usr/bin/env bash
if [ ! -d "/root/env" ];then
    mkdir /root/env/
fi
cd /root
rpm -Uvh https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
yum -y install mysql80-community-release-el7-3.noarch.rpm
