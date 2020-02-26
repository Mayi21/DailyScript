#!/usr/bin/env bash
if [ ! -d "/root/env" ];then
        mkdir /root/env/
fi
yum -y groupinstall "Development tools"
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel
cd /root/env/
wget https://www.python.org/ftp/python/3.7.6/Python-3.7.6.tar.xz
tar -zxjf  Python-3.7.6.tar.xz
cd Python-3.7.6
./configure prefix=/usr/local/python3/
make && make install
if [ ! -d "/usr/bin/python" ];then
    ln -s /usr/local/python3/bin/python3 /usr/bin/python
else
    if [ ! -d "/usr/bin/python2" ];then
        mv /usr/bin/python /usr/bin/python2
    else
        rm -rf /usr/bin/python
    fi
fi
source='#!/usr/bin/python'
target='#!/usr/bin/python2'
sed -i 's/${source}/${target}'/usr/bin/yum
sed -i 's/${source}/${target}'/usr/libexec/urlgrabber-ext-down
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip
echo 'installed complete'
python -V