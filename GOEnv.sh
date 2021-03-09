# linux安装GO
yum -y update
yum -y install wget
mkdir -p /root/env/go && cd /root/env/go
wget https://golang.org/dl/go1.16.linux-amd64.tar.gz
tar -zxvf 
export PATH=$PATH:/root/env/go/go/bin
go version