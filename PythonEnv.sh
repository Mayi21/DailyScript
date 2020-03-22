#!/usr/bin/env bash
if [ ! -d "/root/env" ];then
        mkdir /root/env/
fi
yum -y groupinstall "Development tools"
yum -y install zlib-devel bzip2-devel openssl-devel 
yum -y install ncurses-devel sqlite-devel readline-devel 
yum -y install tk-devel gdbm-devel db4-devel libpcap-devel 
yum -y install xz-devel libffi-devel vim
cd /root
wget https://www.python.org/ftp/python/3.7.6/Python-3.7.6.tar.xz
xz -d Python-3.7.6.tar.xz
tar xvf  Python-3.7.6.tar
rm -rf Python-3.7.6.tar
cd Python-3.7.6
./configure prefix=/root/env/python3
make && make install
if [ -f '/root/Python-3.7.6.tar' ];then
    rm -rf Python-3.7.6.tar
fi
if [ -d '/root/Python-3.7.6' ];then
    rm -rf /root/Python-3.7.6
fi
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
sed -i '1c #!/usr/bin/python2' /usr/bin/yum
sed -i '1c #!/usr/bin/python2' /usr/libexec/urlgrabber-ext-down
if [ -f "/usr/bin/pip" ];then
    rm -rf /usr/bin/pip
fi
ln -s /root/env/python3/bin/pip3 /usr/bin/pip
echo "export PYTHON_ENV=/root/env/python3
export PATH=\$PYTHON_ENV/bin:\$PATH" >> /etc/profile
source /etc/profile
echo 'installed complete'
python -V

