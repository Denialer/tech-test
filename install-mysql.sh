#!/bin/bash
source ./vars/config.cfg

if [ "$mysql_source" == "source" ] || [ "$mysql_source" == "repo"  ] 
then
  if [ "$mysql_source" == "source"  ] 
  then 
    ansible-playbook -i hosts mysql-install.yml  --extra-vars "version=$mysql_version" --tags $mysql_source -u centos --private-key=$private_key_path
  else
    mysql_version=${mysql_version//.}
    ansible-playbook -i hosts mysql-install.yml  --extra-vars "version=$mysql_version" --tags $mysql_source -u centos --private-key=$private_key_path
  fi
else
  echo "Need parameters - 'repo' to build mysql from repositories - 'source' - to build from source in file vars/config.cfg"
  exit 1
fi
