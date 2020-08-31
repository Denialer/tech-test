#!/bin/bash
source ./vars/config.cfg
installation_type=$1

if [ "$1" == "source" ] || [ "$1" == "repo"  ] 
then
  if [ "$1" == "source"  ] 
  then 
    ansible-playbook -i hosts mysql-install.yml  --extra-vars "version=$mysql_version" --tags $installation_type -u centos --private-key=$private_key_path
  else
    mysql_version=${mysql_version//.}
    ansible-playbook -i hosts mysql-install.yml  --extra-vars "version=$mysql_version" --tags $installation_type -u centos --private-key=$private_key_path
  fi
else
  echo "Need parameters - 'repo' to build mysql from repositories - 'source' - to build from source - AS EXAMPLE: ./install-mysql.sh repo"
  exit 1
fi
