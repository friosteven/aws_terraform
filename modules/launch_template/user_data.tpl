#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Hello World from $(hostname -f)" > /var/www/html/index.html

# for stress test
yum install -y stress

#for mysql

# rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
# yum install -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
# yum install -y mysql-community-client

yum install -y telnet