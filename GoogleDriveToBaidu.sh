baiduPath="/storage/download/"
# read user input
read -p "input google drive folder/file path:" path
# download file/folder from google drive
rclone copy GoogleDrive:$path $baiduPath
# upload folder/file to baidu
/root/baidu/BaiduPCS-Go upload $baiduPath /
# delete folder/file
rm -rf $baiduPath