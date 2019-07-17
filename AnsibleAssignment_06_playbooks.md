**Write a playbook to create a user along with below steps.  
Home directory as /home/username  
Provide shell /bin/bash  
Create a group and add user into that group.**
---
- hosts: ninjas
  vars:
    http_port: 80
  tasks:
  - name: Create user test with shell and home
    user:
      name: test
      shell: /bin/bash
      home: /home/test
    become: yes
  - name: create new group test1
    group:
      name: test1
      state: present
    become: yes
  - name: Add test user to test1 group
    user:
      name: test
      group: test1
    become: yes
  


Write a playbook to fetch system info like  
Hostname  
IP addresses (public, private)  
Operating System  
RAM information (total, used, free)  
Disk information (total,used, free)  
Available Network Devices.  


Write a playbook to install nginx along with below steps.  
Start nginx service  
Stop nginx service  
Along with hosting a custom HTML Page on it displaying your Name and system information which we are fetching above.  
Restart nginx service  

-------------------------------------------------------------------------------    
