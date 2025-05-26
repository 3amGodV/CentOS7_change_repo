#!/bin/bash

# CentOS 7 更换阿里云repo源脚本
# 使用方法：以root用户执行此脚本

# 检查是否为root用户
if [ "$(id -u)" -ne 0 ]; then
    echo "错误：此脚本需要以root用户权限运行。"
    exit 1
fi

# 备份原有repo文件
echo "正在备份原有repo文件..."
mkdir -p /etc/yum.repos.d/backup
mv /etc/yum.repos.d/CentOS-* /etc/yum.repos.d/backup/ 2>/dev/null

# 下载阿里云repo文件
echo "正在下载阿里云repo文件..."
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo || {
    echo "错误：下载阿里云repo文件失败。"
    exit 1
}

# 下载阿里云EPEL repo（可选）
echo "正在下载阿里云EPEL repo..."
curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo || {
    echo "警告：下载阿里云EPEL repo失败，但不会影响基本使用。"
}

# 清理并重建yum缓存
echo "清理并重建yum缓存..."
yum clean all
yum makecache

# 更新系统（可选，取消下面行的注释以自动更新）
# echo "正在更新系统..."
# yum update -y

echo "----------------------------------------------------------------"
echo "阿里云repo源已成功配置！"
echo "您可以通过以下命令测试："
echo "yum makecache"
echo "或者"
echo "yum install <package-name>"
echo "----------------------------------------------------------------"