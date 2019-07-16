**Write a playbook to create a user along with below steps.  
Home directory as /home/username  
Provide shell /bin/bash  
Create a group and add user into that group.**

```
---
- hosts: ninjas
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
```
Verify:  
```
[root@ip-172-31-13-124 nginx]# id test
uid=1007(test) gid=1008(test1) groups=1008(test1)
```
-------------------------------------------------------------------------------  
**Write a playbook to fetch system info like
Hostname
IP addresses (public, private)
Operating System
RAM information (total, used, free)
Disk information (total,used, free)
Available Network Devices.**




