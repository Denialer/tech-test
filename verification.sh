#!/bin/bash
source ./vars/config.cfg
hostip=`cat hosts`

#Verify mysqld service installed and enabled

service_installed=`ssh centos@$hostip -i $private_key_path 'systemctl is-enabled mysqld'`

if [ "$service_installed" == "enabled" ]
then
 echo "Service installed and enabled"
else
 echo "Something wrong was during installation"
fi

service_running=`ssh centos@$hostip -i $private_key_path 'systemctl is-active mysqld'`


if [ "$service_running" == "active" ]
then
 echo "Service up and running"
else
 echo "Service not running. Maybe need to login to server and try to start it"
fi



service_port=`ssh centos@$hostip -i $private_key_path 'sudo netstat -tnlp | grep mysqld'`
service_port=`echo $service_port | awk '{print $4}' | cut -d':' -f 2`

if [ "$service_port" == "3306" ]
then
 echo "Port 3306 listening by mysqld service"
else
 echo "I cannot find 3306 port listening by mysql. If service up - check configuration. Maybe port is wrong"
fi

log_file_path=`ssh centos@$hostip -i $private_key_path 'cat /etc/my.cnf | grep log-error'`
pid_file_path=`ssh centos@$hostip -i $private_key_path 'cat /etc/my.cnf | grep pid-file'`

if [ "$log_file_path" == "log-error=/tmp/mysql-error.log" ] && [ "$pid_file_path" == "pid-file=/tmp/mysql.pid" ]
then
 echo "Default configuration was changed succesfully"
else
 echo "I cannot find necessary configuration"
fi


mysql_installed_version=`python test-service.py`

if [ "$mysql_installed_version" == "$mysql_version" ]
then
 echo "Necessary version was installed"
else
 echo "Version not matched or I cannot connect to MySQL server. Please, check - is it up and runnign and at the correct port"
fi

