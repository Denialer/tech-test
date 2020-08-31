# INSTRUCTION

1. Requrements.
   * ansible
   * python with mysql and boot3 modules

2. Execution.
   * execute script to install necessary packages
    
   ./install-packages.sh
   
   * Execute ansible playbook to create Security group and EC2 instance
 
   ansible-playbook create-instance.yml
   
    this will generate "hosts" file inside folder with IP of server  
