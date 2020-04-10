#!/usr/bin/env bash
systemctl disable firewalld
systemctl stop firewalld
mkdir /data
ssh-keygen << EOF



EOF
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
chmod 644 ~/.ssh/authorized_keys
wget https://raw.githubusercontent.com/Mayi21/DailyScript/master/JavaEnv.sh && bash JavaEnv.sh
cd /data
wget https://www.johanadam.workers.dev/StudySource/hadoop-2.7.7.tar.gz && tar -zxvf hadoop-2.7.7.tar.gz
