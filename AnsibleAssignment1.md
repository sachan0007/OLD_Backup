* Use ansible to list out files & folders in */tmp* directory.
* Install python on target machine using ansible.
* Use ansible to Create a *user ninja*
* Use ansible to create a file */tmp/ninja.txt* using ninja user.
* Change your default execution from *command* to *ping*.
* Fetch and display to STDOUT Ansible facts using the `setup` module.
* Fetch and display only the "virtual" subset of facts for each host.
* Fetch and display the value of fully qualified domain name (FQDN) of each host from their Ansible facts.  
----------------------------------------------------------------------------------------------------------------  
**Task: Use ansible to list out files & folders in */tmp* directory.**  
ansible -m find -a "path=/tmp recurse=no file_type=any get_checksum=yes" host2  





**Task: Install python on target machine using ansible.**  
Ad-Hoc command: ansible -m package -a "name=python state=present" host2  

Console output:  
```
[root@ip-172-31-22-206 ec2-user]# ansible -m package -a "name=python state=present" host2  
host2 | SUCCESS => {
    "changed": false,
    "failed": false,
    "msg": "",
    "rc": 0,
    "results": [
        "python-2.7.14-58.amzn2.0.4.x86_64 providing python is already installed"  
    ]
}
```
**Task: Use ansible to Create a 'user ninja'**  
Ad-Hoc command: ansible -m user -a "name=ninja comment=Abhishek_ninja group=root shell=/bin/bash" host2 -b  
                ansible -m copy -a "src=/root/.ssh/id_rsa.pub dest=/home/ninja/.ssh/authorized_keys" host2 -b
Console Output:  
```
[root@ip-172-31-22-206 ec2-user]# ansible -m user -a "name=ninja comment=Abhishek_ninja group=root shell=/bin/bash" host2 -b
host2 | SUCCESS => {
    "changed": true,
    "comment": "Abhishek_ninja",
    "createhome": true,
    "failed": false,
    "group": 0,
    "home": "/home/ninja",
    "name": "ninja",
    "shell": "/bin/bash",
    "state": "present",
    "system": false,
    "uid": 1011
}
```
**Task: Use ansible to create a file */tmp/ninja.txt* using ninja user.**   
Update ansible host file  
```
[appserver]
host2 ansible_host=13.126.138.153

[appserver:vars]
ansible_ssh_user=ninja
ansible_ssh_private_key_file=/root/.ssh/id_rsa
ansible_port=22
```
create file now:  
Ad-hock command: ansible -m file -a "path=/tmp/ninja.txt state=touch mode=u+rw,g-wx,o-rwx owner=ninja group=root" host2  

Console output:  
```
[root@ip-172-31-22-206 .ssh]# ansible -m file -a "path=/tmp/ninja.txt state=touch mode=u+rw,g-wx,o-rwx owner=ninja group=root" host2
host2 | SUCCESS => {
    "changed": true,
    "dest": "/tmp/ninja.txt",
    "failed": false,
    "gid": 0,
    "group": "root",
    "mode": "0640",
    "owner": "ninja",
    "size": 0,
    "state": "file",
    "uid": 1011
}
```

