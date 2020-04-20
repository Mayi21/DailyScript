baiduPath="/storage/download/"
pcsPath="/root/baidu/BaiduPCS-Go"
# judge path
if [ ! -d $baiduPath ];then
    mkdir -p $baiduPath
fi
# install baidupcs-go
if [ ! -f $pcsPath ];then
    cd /root
    yum -y install unzip
    wget "https://github.com/iikira/BaiduPCS-Go/releases/download/v3.6.2/BaiduPCS-Go-v3.6.2-linux-amd64.zip"
    unzip BaiduPCS-Go-v3.6.2-linux-amd64.zip
    rm -rf BaiduPCS-Go-v3.6.2-linux-amd64.zip
    mv BaiduPCS-Go-v3.6.2-linux-amd64 baidu
fi
# get login status
status=$($pcsPath who)
status=${status// /}
status=(${status//,/ })
status=(${status//:/ })
status=${status[1]}
# not login
if [ $status == "0"];then
read -p "input bduss:" bduss
$pcsPath login -bduss=$bduss << EOF
exit
EOF
fi
# read user input
read -p "input google drive folder/file path(example:/Film/):" path
# download file/folder from google drive
rclone copy GoogleDrive:$path $baiduPath
# upload folder/file to baidu
/root/baidu/BaiduPCS-Go upload $baiduPath /
# delete folder/file
rm -rf $baiduPath