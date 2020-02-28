#!/usr/bin/env bash
yum -y update
if [ ! -d "/root/env" ];then
        mkdir /root/env/
fi
cd /root/env/
# 安装包问题还没有解决
# wget "https://download.oracle.com/otn/java/jdk/8u241-b07/1f5b5a70bf22433b84d0e960903adac8/jdk-8u241-linux-x64.tar.gz"
tar -zxvf jdk-8u181-linux-x64.tar.gz
mv jdk1.8.0_181 jdk
rm -rf jdk-8u181-linux-x64.tar.gz
echo "export JAVA_HOME=/root/env/jdk
export PATH=\$JAVA_HOME/bin:\$PATH
export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
source /etc/profile
java -version
