AWS Assignment Day-4


Task 1

Lauch 3 instances with the following tags respectively


Name: nginx, boot-order: 1
Name: myapp, boot-order: 2
Name: mydb, boot-order: 3


Task 2

write a script that would start/stop these instances in the order you specified, i.e.


instance with boot-order: 3 tag should boot/start first and likewise rest of them
instance with boot-order: 1 tag should stop first and likewise rest of them


Task 3

Launch an ec2 instance with user-data having ansible role to host a website - [like previous assignment]


Figure out a way to launch this instance in your friend's AWS account


NOTE!

Make Documentation  

------------------------------------------------------------------------    

Task 1 and 2:  

Script execution Output:-  

https://gitlab.com/tarun.kumar2/abhisheksachan/blob/abhishek/AWS%20Assignments/AWS_Assignment_4_Script.sh  

1) sh AWS_Assignment_4_Script.sh start (When all are already start)  

```
Nginx Instance Status & ID: [running][i-0c217c6076ba00e78]
Myapp Instance Status & ID : [running][i-0f0addd171a316cfa]
Mydb Instance Status & ID : [running][i-05678febf2308a817]
Mydb instance is already running.
Myapp instance is already running.
Nginx instance is already running.
```
2) sh AWS_Assignment_4_Script.sh stop (When all are already start)  

```
Nginx Instance Status & ID: [running][i-0c217c6076ba00e78]
Myapp Instance Status & ID : [running][i-0f0addd171a316cfa]
Mydb Instance Status & ID : [running][i-05678febf2308a817]
stop nginx instance...
{
    "StoppingInstances": [
        {
            "InstanceId": "i-0c217c6076ba00e78",
            "CurrentState": {
                "Code": 64,
                "Name": "stopping"
            },
            "PreviousState": {
                "Code": 16,
                "Name": "running"
            }
        }
    ]
}
stop myapp instance...
{
    "StoppingInstances": [
        {
            "InstanceId": "i-0f0addd171a316cfa",
            "CurrentState": {
                "Code": 64,
                "Name": "stopping"
            },
            "PreviousState": {
                "Code": 16,
                "Name": "running"
            }
        }
    ]
}
stop mydb instance...
{
    "StoppingInstances": [
        {
            "InstanceId": "i-05678febf2308a817",
            "CurrentState": {
                "Code": 64,
                "Name": "stopping"
            },
            "PreviousState": {
                "Code": 16,
                "Name": "running"
            }
        }
    ]
}
```
3) sh AWS_Assignment_4_Script.sh stop (When all are already stopped)  

```
Nginx Instance Status & ID: [stopped][i-0c217c6076ba00e78]
Myapp Instance Status & ID : [stopped][i-0f0addd171a316cfa]
Mydb Instance Status & ID : [stopped][i-05678febf2308a817]
Nginx instance is already stopped.
Myapp instance is already stopped.
Mydb instance is already stopped.
```

4) sh AWS_Assignment_4_Script.sh start (When all are already stopped)  

```
Nginx Instance Status & ID: [stopped][i-0c217c6076ba00e78]
Myapp Instance Status & ID : [stopped][i-0f0addd171a316cfa]
Mydb Instance Status & ID : [stopped][i-05678febf2308a817]
start mydb instance...
{
    "StartingInstances": [
        {
            "InstanceId": "i-05678febf2308a817",
            "CurrentState": {
                "Code": 0,
                "Name": "pending"
            },
            "PreviousState": {
                "Code": 80,
                "Name": "stopped"
            }
        }
    ]
}
start myapp instance...
{
    "StartingInstances": [
        {
            "InstanceId": "i-0f0addd171a316cfa",
            "CurrentState": {
                "Code": 0,
                "Name": "pending"
            },
            "PreviousState": {
                "Code": 80,
                "Name": "stopped"
            }
        }
    ]
}
start nginx instance...
{
    "StartingInstances": [
        {
            "InstanceId": "i-0c217c6076ba00e78",
            "CurrentState": {
                "Code": 0,
                "Name": "pending"
            },
            "PreviousState": {
                "Code": 80,
                "Name": "stopped"
            }
        }
    ]
}
```



