#!/usr/bin/env bash
yum -y update
if [ ! -d "/root/env" ];then
        mkdir /root/env/
fi
cd /root/env/
wget "https://download.oracle.com/otn/java/jdk/8u241-b07/1f5b5a70bf22433b84d0e960903adac8/jdk-8u241-linux-x64.tar.gz"
tar -zxvf "FileName"
mv "FileName" "java"
echo "export JAVA_HOME=/root/env/java
export PATH=$JAVA_HOME/bin:$PATH 
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile
source /etc/profile
java -version
