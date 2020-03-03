#!/usr/bin/env bash
if [ ! -d "/root/env" ];then
    mkdir /root/env/
fi
cd /root
# 安装
rpm -Uvh https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
yum -y install mysql-community-server
# 启动服务
systemctl start mysqld.service
# 查看初始密码
str=`grep "password" /var/log/mysqld.log`
array=(${str// / })
oldPas=${array[-1]}
read -p "new password" newPas
mysql -u root -p <<EOF
$oldPas
show databases;
EOF
