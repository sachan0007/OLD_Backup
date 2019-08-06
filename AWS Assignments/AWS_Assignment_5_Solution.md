Task 1

Launch below infrastructure in your aws account using ansible's aws cloud modules


create a key pair using ansible
create one security group that would allow you to ssh into the instance
using the key that you created, launch an instance in default vpc of N.virginia region with tags of your choice


NOTE!

Make Documentation


Optional

Apply nginx role to the instance using dynamic inventory

-------------------------------------------------------------------------    

```
---
- name: Create AWS resources
  hosts: localhost
  connection: local
  gather_facts: False
  tasks:
  - name: Create a new EC2 key
    ec2_key:
        name: aws-key-ec2
        region: ap-south-1
    register: ec2_key_result
  - name: Save private key
    copy: content="{{ ec2_key_result.key.private_key }}" dest="./aws-key-ec2.pem" mode=0600
    when: ec2_key_result.changed
  - name: Create a security group
    ec2_group:
      name: ansible
      description: "Ansible Security Group"
      region: ap-south-1
      vpc_id: vpc-c3eecdab
      rules:
        - proto: tcp
          from_port: 22
          to_port: 22
          cidr_ip: 0.0.0.0/0
      rules_egress:
        - proto: all
          cidr_ip: 0.0.0.0/0
    register: firewall
  - name: Create an EC2 instance
    ec2:
      key_name: aws-key-ec2
      region: ap-south-1
      instance_type: t2.micro
      image: ami-0b3046001e1ba9a99
      group: ansible
      vpc_subnet_id: subnet-22551d4a
      assign_public_ip: yes
      wait: yes
      instance_tags:
         Name: aws-demo
```



*  **ansible-playbook aws.yml** 

```
PLAY [Create AWS resources] ****************************************************

TASK [Create a new EC2 key] ****************************************************
ok: [localhost]

TASK [Save private key] ********************************************************
skipping: [localhost]

TASK [Create a security group] *************************************************
ok: [localhost]

TASK [Create an EC2 instance] **************************************************
changed: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0

[root@ip-172-31-22-206 ansible]#
[root@ip-172-31-22-206 ansible]# ansible-playbook aws.yml

PLAY [Create AWS resources] ****************************************************

TASK [Create a new EC2 key] ****************************************************
changed: [localhost]

TASK [Save private key] ********************************************************
changed: [localhost]

TASK [Create a security group] *************************************************
changed: [localhost]

TASK [Create an EC2 instance] **************************************************
changed: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=4    changed=4    unreachable=0    failed=0

```

*  **ssh -i aws-key-ec2.pem ec2-user@13.234.78.69**
  

```
Warning: Permanently added '13.234.78.69' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 9 available
Run "sudo yum update" to apply all updates.
```

------------------------------------------------------------------------  

Optional task:  

Create 2 files at /etc/ansible  
[ec2.ini](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/AWS%20Assignments/ec2.ini)  
[ec2.ini](https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/AWS%20Assignments/ec2.py)    

