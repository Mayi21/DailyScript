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


## 安装ffmpeg
install(){
    ## 默认root用户
    if [ ${release} == 'centos' ]; then
        yum -y install epel-release
        yum -y update
        yum -y install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
        yum -y install http://rpmfind.net/linux/epel/7/x86_64/Packages/s/SDL2-2.0.14-2.el7.x86_64.rpm
        yum -y install ffmpeg ffmpeg-devel
    elif [ ${release} == 'ubuntu' ]; then
        apt -y update
        apt -y upgrade
        apt -y install ffmpeg
    elif [ ${release} == 'debian' ]; then
        apt -y update
        apt -y upgrade
        apt -y install ffmpeg
    fi
    clear
    echo "初始化完成"
}
checkSystem
install