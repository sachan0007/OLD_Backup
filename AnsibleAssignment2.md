**Prerequisites**  
For this assignment you have to simulate an infrastructure where you have below simulated machines, it can be one machine as well.

Three users should be present on your machine web, app and db.
Place ubuntu key-pair in web home directory and user should be able to do password less login.
Generate key pair for app user and it should be using its key for doing ssh.
Same as well db there should be a seperate key pair for doing ssh.


**Assignments**  
For this assignment you have to simulate an infrastructure where you have below simulated machines, it can be one machine as well

web server 1 in zone A, reachable by web user from your machine
web server 2 in zone B, reachable by web user from your machine
app server 1 in zone A, reachable by app user from your machine, using app.pem key.
app server 2 in zone B, reachable by app user from your machine, using app.pem key
db server 1 in zone A, reachable by db user from your machine, using db.pem key and ssh port would be 2022

db server 2 in zone B, reachable by db user from your machine, using db.pem key and ssh port would be 2022



**Must Do**  

Try to reach out all web servers using ansible ping command
Try to reach out all app servers using ansible ping command
Try to reach out all db servers using ansible ping command
Try to reach out all zone A servers using ansible ping command
Try to reach out all Zone B servers using ansible ping command
Submit your inventory file as solution    

---------------------------------------------------------------------------------------------------------------------------------  
**Hosts**  
```
[webserver_zone_A]
host1 ansible_host=13.234.66.243 ansible_ssh_user=web ansible_port=22

[webserver_zone_B]
host2 ansible_host=13.234.66.243 ansible_ssh_user=web ansible_port=22

[appserver_zone_A]
host3 ansible_host=13.234.66.243 ansible_ssh_user=app ansible_ssh_private_key_file=/root/.ssh/app.pem ansible_port=22

[appserver_zone_B]
host4 ansible_host=13.234.66.243 ansible_ssh_user=app ansible_ssh_private_key_file=/root/.ssh/app.pem ansible_port=22

[dbserver_zone_A]
host5 ansible_host=13.234.66.243 ansible_ssh_user=db ansible_ssh_private_key_file=/root/.ssh/db.pem ansible_port=22

[dbserver_zone_B]
host6 ansible_host=13.234.66.243 ansible_ssh_user=db ansible_ssh_private_key_file=/root/.ssh/db.pem ansible_port=22

[webserver:children]
webserver_zone_A
webserver_zone_B

[appserver:children]
appserver_zone_A
appserver_zone_B

[dbserver:children]
dbserver_zone_A
dbserver_zone_B

[zone_A:children]
webserver_zone_A
appserver_zone_A
dbserver_zone_A

[zone_B:children]
webserver_zone_B
appserver_zone_B
dbserver_zone_B
```



**Console output: **   

```
[root@ip-172-31-22-206 .ssh]# ansible webserver
host1 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
host2 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
[root@ip-172-31-22-206 .ssh]# ansible appserver
host3 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
host4 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
[root@ip-172-31-22-206 .ssh]# ansible dbserver
host5 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
host6 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
[root@ip-172-31-22-206 .ssh]# ansible zone_A
host5 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
host1 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
host3 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
[root@ip-172-31-22-206 .ssh]# ansible zone_B
host2 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
host6 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
host4 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
```
