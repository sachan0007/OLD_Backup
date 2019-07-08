* Use ansible to list out files & folders in */tmp* directory.
* Install python on target machine using ansible.
* Use ansible to Create a *user ninja*
* Use ansible to create a file */tmp/ninja.txt* using ninja user.
* Change your default execution from *command* to *ping*.
* Fetch and display to STDOUT Ansible facts using the `setup` module.
* Fetch and display only the "virtual" subset of facts for each host.
* Fetch and display the value of fully qualified domain name (FQDN) of each host from their Ansible facts.  
----------------------------------------------------------------------------------------------------------------  
**Use ansible to list out files & folders in */tmp* directory.**
ansible -m find -a "path=/tmp recurse=no file_type=any get_checksum=yes" host2  





**Install python on target machine using ansible.**  
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

