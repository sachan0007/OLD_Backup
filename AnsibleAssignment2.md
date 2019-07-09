



Console output:  

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
