#!/usr/bin/env bash
if [ ! -d "/root/env" ];then
    mkdir /root/env/
fi
cd /root/env
# 安装
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
wget https://www.johanadam.workers.dev/StudySource/mysql-community-server-8.0.19-1.el6.x86_64.rpm
rpm -Uvh mysql80-community-release-el7-3.noarch.rpm
rpm -Uvh mysql-community-server-8.0.19-1.el6.x86_64.rpm
yum -y install mysql-community-server
# 启动服务
systemctl start mysqld.service
# 查看初始密码
str=`grep "password" /var/log/mysqld.log`
array=(${str// / })
oldPas=${array[-1]}
echo $oldPas