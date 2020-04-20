# DailyScript
some script for daily use
# 一些日常使用的环境安装脚本(Centos7)
* ### python 环境安装
执行  
```sh
wget --no-check-certificate https://raw.githubusercontent.com/Mayi21/DailyScript/master/PythonEnv.sh && bash PythonEnv.sh
```  
然后即可安装上python3.7
* ### jdk1.8环境安装
执行
```sh
wget --no-check-certificate https://raw.githubusercontent.com/Mayi21/DailyScript/master/JavaEnv.sh && bash JavaEnv.sh
```
* ### Google Drive转存文件到百度云
执行
首先具备环境:
* `rclone`:配置好,脚本中固定名字为`GoogleDrive`
```sh
wget --no-check-certificate https://raw.githubusercontent.com/Mayi21/DailyScript/master/GoogleDriveToBaidu.sh && bash GoogleDriveToBaidu.sh
```