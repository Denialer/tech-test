# INSTRUCTION

1. Requrements.
   * ansible
   * python with mysql and boot3 modules
   * Supported MysQL version (tested) - 5.5, 5.6, 5.7 - latest versions. (revisions not supported)
   * OS - RedHat or Cent OS 7.X
   * Python 2.7   

2. Folder structure
   
   * create-instance.yml - ansible playbook to create instance
   * mysql-install.yml - ansible playbook to install Percona mysql service
   * vars/config.cfg -  configuration file. There are you need to setup version from supported list, path to secret key
   * secrets/aws_cred.yml - keys for AWS account
   * my.cnf - Default MySQL configuration file which will be copied to the server and modify there
   * mysqld_service.j2 - Ansibl template to setup MySQL service if select "source" option
   * install-packages.sh - Install necessary packages at the local machine to be able to execute all necessary scripts.
   * install-mysql.sh - shell script to install Percona MySQL server
   * test-service.py - python script to get MySQL server version
   * verification.sh - test to verify installed service

3. Execution.
   * execute script to install necessary packages (Optional - if all packages alrfeady there´)
   ``` 
   ./install-packages.sh
   ```
   
   * Execute ansible playbook to create Security group and EC2 instance - this will generate "hosts" file inside folder with IP of server
   ```
   ansible-playbook create-instance.yml
   ```   
   
   * Check that all parameters correct in vars/config.cfg
  
   * Run shell script - wait when it wil lbe finished. If selected "source" and verions 5.6 and 5.7 - can take rather lot of time 
   ```
   ./install-mysql.sh
   ```
   
   * Execute test script - Look at the messages.
   ```
   ./verification.sh
   ```
