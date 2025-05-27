# CentOS7更换阿里云repo源脚本
这是一个用于 CentOS 7 更换 repo 源为阿里云的 Bash 脚本
使用说明：

将上述脚本保存为 change_to_aliyun_repo.sh

给脚本添加执行权限：
chmod +x change_to_aliyun_repo.sh

以root用户执行脚本：
sudo ./change_to_aliyun_repo.sh 
或直接 
./change_to_aliyun_repo.sh（如果已经是root用户）


脚本功能：

自动备份原有repo文件到/etc/yum.repos.d/backup目录

下载并配置阿里云的基础repo和EPEL repo

清理并重建yum缓存

可选系统更新（默认注释掉了）

注意事项：

执行前请确保网络连接正常

如果系统有特殊配置或自定义repo，可能需要手动处理

如果需要更新系统，可以取消脚本最后部分的注释
