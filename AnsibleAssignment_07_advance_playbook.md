**Create a playbook that will:
Install apache
Create a apache home page with your name and System Information.
Reload apache
Update above playbook to reload apache only when content of home page get's updated.
Update above playbook to install git, vim, ntp...
Update above playbook to create a user passed as parameter.
Update above playbook to add ninja & sensei user to opstree group else to devops group.
Update above playbook to prompt for user details to be created
Update above playbook create all the users attending current training.
Update your playbook to externalise your tasks.**

```
---
- hosts: ninjas
  vars_prompt:
    - name: "user_name"
      prompt: "Which user you want to create?"
  vars:
    users: [abhishek, devesh, srishti]
  tasks:
  - name: ensure apache is at the latest version
    yum:
      name: httpd
      state: latest
    become: yes
  - name: write the apache index.html file
    template:
      src: /etc/ansible/apache.index.html.j2
      dest: /var/www/html/index.html
    become: yes
    notify: restart apache
  - name: install git, vim and ntp
    yum:
      name: "{{ item }}"
      state: latest
    with_items:
       - git
       - vim
       - ntp
    become: yes
  - name: Add the user "{{ user_name }}"
    user:
      name: "{{ user_name }}"
      state: present
    become: yes
  - name: Check if group exists
    shell: /usr/bin/getent group | awk -F":" '{print $1}'
    register: etc_groups
  - name: Add "{{user_name}}" and ninja to opstree if group exists
    user: name="{{item}}" groups=opstree append=yes
    when: "'opstree' in etc_groups.stdout_lines"
    with_items:
        - "{{user_name}}"
        - ninja1
    become: yes
  - name: Ensure group "devops" exists
    group:
      name: devops
      state: present
    become: yes
    when: "'opstree' not in etc_groups.stdout_lines"
  - name: Add ninja and "{{user_name}}" to devops
    user: name="{{item}}" groups=devops append=yes
    when: "'opstree' not in etc_groups.stdout_lines"
    with_items:
        - "{{user_name}}"
        - ninja1
    become: yes
  - name: Add the users "{{ users }}"
    user:
      name: "{{ item }}"
      state: present
    with_items: "{{ users }}"
    become: yes
  handlers:
    - name: restart apache
      service:
        name: httpd
        state: restarted
      become: yes
```
Consol output:-  

```
[root@ip-172-31-22-206 ansible]# ansible-playbook playbook4.yml
Which user you want to create?:

PLAY [ninjas] ******************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ninjas]

TASK [ensure apache is at the latest version] **********************************
ok: [ninjas]

TASK [write the apache index.html file] ****************************************
ok: [ninjas]

TASK [install git, vim and ntp] ************************************************
ok: [ninjas] => (item=[u'git', u'vim', u'ntp'])

TASK [Add the user "sensei"] ***************************************************
ok: [ninjas]

TASK [Check if group exists] ***************************************************
changed: [ninjas]

TASK [Add "sensei" and ninja to opstree if group exists] ***********************
skipping: [ninjas] => (item=sensei)
skipping: [ninjas] => (item=ninja1)

TASK [Ensure group "devops" exists] ********************************************
ok: [ninjas]

TASK [Add ninja and "sensei" to devops] ****************************************
ok: [ninjas] => (item=sensei)
ok: [ninjas] => (item=ninja1)

TASK [Add the users "[u'abhishek', u'devesh', u'srishti']"] ********************
ok: [ninjas] => (item=abhishek)
ok: [ninjas] => (item=devesh)
ok: [ninjas] => (item=srishti)

PLAY RECAP *********************************************************************
ninjas                     : ok=9    changed=1    unreachable=0    failed=0

```


To Externalise (include/import):  

