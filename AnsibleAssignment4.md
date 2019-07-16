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



