#!/bin/bash
source ./vars/config.cfg
hostip=`cat hosts`

#Verify mysqld service installed and enabled

service_installed=`ssh centos@$hostip -i $private_key_path 'systemctl is-enabled mysqld'`
echo $service_installed

service_running=`ssh centos@$hostip -i $private_key_path 'systemctl is-active mysqld'`
echo $service_running

service_port=`ssh centos@$hostip -i $private_key_path 'sudo netstat -tnlp | grep mysqld'`
service_port=`echo $service_port | awk '{print $4}' | cut -d':' -f 2`
echo $service_port

log_file_path=`ssh centos@$hostip -i $private_key_path 'cat /etc/my.cnf | grep log-error'`
echo $log_file_path

pid_file_path=`ssh centos@$hostip -i $private_key_path 'cat /etc/my.cnf | grep pid-file'`
echo $pid_file_path

mysql_installed_version=`python test-service.py`
echo ${mysql_installed_version:0:3}
