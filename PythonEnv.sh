#!/usr/bin/env bash
if [ ! -d "/root/env" ];then
        mkdir /root/env/
fi
yum -y groupinstall "Development tools"
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel
cd /root
wget https://www.python.org/ftp/python/3.7.6/Python-3.7.6.tar.xz
xz -d Python-3.7.6.tar.xz
tar xvf  Python-3.7.6.tar
cd Python-3.7.6
./configure prefix=/root/env/python3
make && make install
# 判断 /usr/bin/python 是否存在
# 如果不存在，直接操作
# 如果存在，就判断python2存在不，存在就直接删除python，否则就将python改名为ptyhon2
if [ -f "/usr/bin/python" ];then
    if [ -f '/usr/bin/python2' ];then
        rm -rf /usr/bin/python
    else
        mv /usr/bin/python /usr/bin/python2
    fi
fi
ln -s /root/env/python3/bin/python3 /usr/bin/python
source='#!/usr/bin/python'
target='#!/usr/bin/python2'
sed -i 's/${source}/${target}'/usr/bin/yum
sed -i 's/${source}/${target}'/usr/libexec/urlgrabber-ext-down
if [ -f "/usr/bin/pip" ];then
    rm -rf /usr/bin/pip
fi
ln -s /root/env/python3/bin/pip3 /usr/bin/pip
echo 'installed complete'
python -V