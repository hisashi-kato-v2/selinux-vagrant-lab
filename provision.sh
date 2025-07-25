#!/bin/bash

# SELinux 必須パッケージのインストール
yum install -y policycoreutils policycoreutils-python setroubleshoot

# SELinuxをEnforcingに設定（永続）
sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config

# 今すぐEnforcingに変更（再起動不要）
setenforce 1

# firewalld停止（開発環境用）
systemctl stop firewalld
systemctl disable firewalld

# 確認用出力
echo "=== SELinux status ==="
getenforce
sestatus
