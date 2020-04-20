#!/usr/bin/env bash
systemctl disable firewalld
systemctl stop firewalld
mkdir /data
ssh-keygen << EOF



EOF
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
chmod 644 ~/.ssh/authorized_keys
javaPath=$(whereis java)
paths=${javaPath//:/ }
pathLength=${#paths[@]}
# install jdk
if ["$pathLength" == "1"];then
    wget https://raw.githubusercontent.com/Mayi21/DailyScript/master/JavaEnv.sh && bash JavaEnv.sh
fi

cd /data
wget https://www.johanadam.workers.dev/StudySource/hadoop-2.7.7.tar.gz && tar -zxvf hadoop-2.7.7.tar.gz
