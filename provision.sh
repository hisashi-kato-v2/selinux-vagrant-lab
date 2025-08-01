#!/bin/bash

# 基本パッケージのインストール
dnf install -y epel-release
dnf install -y policycoreutils policycoreutils-python-utils setroubleshoot-server httpd

# SELinuxをenforcingモードに設定（永続）
sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config
setenforce 1

# Apacheを起動・自動起動
systemctl enable httpd
systemctl start httpd

# ドキュメントルートにテストファイルを作成
echo "SELinux Test Page" > /var/www/html/index.html

# firewalldは停止（学習用）
systemctl stop firewalld
systemctl disable firewalld

# 状態出力
echo "=== SELinux Mode ==="
getenforce
echo "=== SELinux status ==="
sestatus
echo "=== httpd Status ==="
systemctl status httpd
