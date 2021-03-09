echo '开发环境集合安装 [v0.01] by xaohii.com'

## 检查系统
checkSystem(){
    if [[ -f /etc/redhat-release ]]; then
        release="centos"
    elif cat /etc/issue | grep -q -E -i "debian"; then
        release="debian"
    elif cat /etc/issue | grep -q -E -i "ubuntu"; then
        release="ubuntu"
    elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
        release="centos"
    elif cat /proc/version | grep -q -E -i "debian"; then
        release="debian"
    elif cat /proc/version | grep -q -E -i "ubuntu"; then
        release="ubuntu"
    elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
        release="centos"
    fi
    ARCH=`uname -m`
    [ $(command -v dpkg) ] && dpkgARCH=$(dpkg --print-architecture | awk -F- '{ print $NF }')
}


## 初始化系统
init(){
    ## 默认root用户
    if [ ${release} == 'centos' ]; then
        yum -y install epel-release
        yum -y update
        yum -y install wget vim ncurses unzip
    elif [ ${release} == 'ubuntu' ]; then
        apt -y update
        apt -y upgrade
        apt -y install wget vim unzip
    elif [ ${release} == 'debian' ]; then
        apt -y update
        apt -y upgrade
        apt -y install wget vim unzip
    fi
    clear
    echo "初始化完成"
}
## 安装python3.7
installPython(){
    if [ ${release} == 'centos' ]; then
        if [ -d '/root/env/python3' ]; then
            cd /root/env/python3
        else
            mkdir -p /root/env/python3 && cd /root/env/python3
        fi
        yum -y groupinstall "Development tools"
        yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel
        wget https://www.python.org/ftp/python/3.7.8/Python-3.7.8.tgz
        tar -zxvf Python-3.7.8.tgz
        rm -rf Python-3.7.8.tgz
        cd Python-3.7.8
        ./configure prefix=/root/env/python3
        make && make install
        rm -rf /root/env/python3/Python-3.7.8
        echo 'export PYTHON_HOME=/root/env/python3' >> /etc/profile
        echo 'export PATH=PYTHON_HOME/bin:$PATH' >> /etc/profile
        source /etc/profile
    elif [ ${release} == 'ubuntu' ]; then
        apt -y install python3
        apt -y install python3-pip
    elif [ ${release} == 'debian' ]; then
        apt -y install python3.7
        apt -y install python3-pip
    fi
    clear
    python3 -V
    echo "安装python完成"
}
## 安装jdk1.8
installJDK(){
    if [ -d '/root/env' ]; then
        cd /root/env
    else
        mkdir -p /root/env && cd /root/env
    fi
    wget https://www.johanadam.workers.dev/StudySource/jdk-8u181-linux-x64.tar.gz
    tar -zxvf jdk-8u181-linux-x64.tar.gz
    mv jdk1.8.0_181 jdk
    rm -rf jdk-8u181-linux-x64.tar.gz
    echo 'export JAVA_HOME=/root/env/jdk' >> /etc/profile
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
    echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' >> /etc/profile
    source /etc/profile
    clear
    java -version
    echo "安装JDK完成"
}
## 安装GO1.16
installGO(){
    if [ -d '/root/env' ]; then
        cd /root/env
    else
        mkdir -p /root/env && cd /root/env
    fi
    wget https://golang.org/dl/go1.16.linux-amd64.tar.gz
    tar -zxvf go1.16.linux-amd64.tar.gz
    rm -rf go1.16.linux-amd64.tar.gz
    echo 'export GO_HOME=/root/env/go' >> /etc/profile
    echo 'export PATH=$GO_HOME/bin:$PATH' >> /etc/profile
    source /etc/profile
    clear
    go version
    echo "安装GO完成"

}
## 菜单
menu(){
    echo "环境集成安装脚本。目前已经支持python(3.7),JDK(1.8),GO(1.16)"
    echo "1.安装Python(1.install python)"
    echo "2.安装JDK(2.instal jdk)"
    echo "3.安装GO(3.install GO)"
    echo "4.退出(exit)"
}
main(){
    menu
    ## 读取用户输入
    read -p "请选择:" choice
    case "$choice" in
    1)
        init
        installPython
        source /etc/profile
        main
        ;;
    2)
        init
        installJDK
        source /etc/profile
        main
        ;;
    3)
        init
        installGO
        source /etc/profile
        main
        ;;
    4)
        echo "退出程序"
        source /etc/profile
        exit
        ;;
    *)
        echo -e "请输入正确的数字"
        ;;
    esac
}
checkSystem
main