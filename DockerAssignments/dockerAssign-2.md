Assignment 2  

Again pull "alpine" image from docker registry.  
Take interactive login to bash while running docker container from "alpine" image.  
Run command inside container:  
echo "hello world" > hello.txt  
ls  
Take exit from same container without killing the container.  
Run another container using below command and check if you can find hello.txt within this container. You should find container isolations from step 3-5.  
docker container run alpine ls  
Stop a container using Container ID.  
Start same container using ID and exec a command "echo 'hello world!'" in docker container without instantiating a new container.  
Inspect already downloaded "alpine" docker image using docker inspect command.  
Tag your local "alpine" image with name "myimage" along with version 1.0  

-----------------------------------------------------------------------    

**[root@ip-172-31-28-135 docker]# docker pull alpine**
**Using default tag: latest
latest: Pulling from library/alpine
050382585609: Pull complete
Digest: sha256:6a92cd1fcdc8d8cdec60f33dda4db2cb1fcdcacf3410a8e05b3741f44a9b5998
Status: Downloaded newer image for alpine:latest
[root@ip-172-31-28-135 docker]# docker run -i -t alpine /bin/bash
docker: Error response from daemon: OCI runtime create failed: container_linux.go:348: starting container proile or directory": unknown.**

**[root@ip-172-31-28-135 docker]# docker run -i -t alpine /bin/sh**
**/ # echo "hello world" > hello.txt
/ # ls**

```
bin        etc        home       media      opt        root       sbin       sys        usr
dev        hello.txt  lib        mnt        proc       run        srv        tmp        var
/ #   
```
**[root@ip-172-31-28-135 docker]# docker ps**
```
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS
cceaa50d3cf3        alpine              "/bin/sh"           42 seconds ago      Up 41 seconds
```

**[root@ip-172-31-28-135 docker]# docker container run alpine ls**
```
bin
dev
etc
home
lib
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
```

**[root@ip-172-31-28-135 docker]# docker ps**
```
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS
cceaa50d3cf3        alpine              "/bin/sh"           2 minutes ago       Up 2 minutes
```

**[root@ip-172-31-28-135 docker]# docker stop cceaa50d3cf3**  
cceaa50d3cf3
**[root@ip-172-31-28-135 docker]# docker ps**  
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS
**[root@ip-172-31-28-135 docker]# docker start cceaa50d3cf3**  
cceaa50d3cf3
**[root@ip-172-31-28-135 docker]# docker ps**  
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS
cceaa50d3cf3        alpine              "/bin/sh"           3 minutes ago       Up 2 seconds
**[root@ip-172-31-28-135 docker]# docker exec -it cceaa50d3cf3 echo 'hello world!'**  
hello world!
**[root@ip-172-31-28-135 docker]# docker ps**  
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
cceaa50d3cf3        alpine              "/bin/sh"           35 minutes ago      Up 32 minutes                           jolly_elion



**[root@ip-172-31-28-135 docker]# docker inspect b7b28af77ffe**
```
[
    {
        "Id": "sha256:b7b28af77ffec6054d13378df4fdf02725830086c7444d9c278af25312aa39b9",
        "RepoTags": [
            "alpine:latest"
        ],
        "RepoDigests": [
            "alpine@sha256:6a92cd1fcdc8d8cdec60f33dda4db2cb1fcdcacf3410a8e05b3741f44a9b5998"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2019-07-11T22:20:52.375286404Z",
        "Container": "a0625bb53d38b712d9fe7e307c53a5b1f2528189d694a29ba37b7a27bee20029",
        "ContainerConfig": {
            "Hostname": "a0625bb53d38",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"/bin/sh\"]"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:f248cae16d3e1b44bf474ad89815438f10c395f8e532153e4fcd32cbbb150fb3",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "18.06.1-ce",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:f248cae16d3e1b44bf474ad89815438f10c395f8e532153e4fcd32cbbb150fb3",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 5581746,
        "VirtualSize": 5581746,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/97825741ca73c6922c1e52583a669a4db87136f16dc5e827bbf161b22ef9ab18/merged",
                "UpperDir": "/var/lib/docker/overlay2/97825741ca73c6922c1e52583a669a4db87136f16dc5e827bbf161b22ef9ab18/diff",
                "WorkDir": "/var/lib/docker/overlay2/97825741ca73c6922c1e52583a669a4db87136f16dc5e827bbf161b22ef9ab18/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:1bfeebd65323b8ddf5bd6a51cc7097b72788bc982e9ab3280d53d3c613adffa7"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
```



**[root@ip-172-31-28-135 docker]# docker tag b7b28af77ffe alpine:version1.0
[root@ip-172-31-28-135 docker]# docker images**

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine              latest              b7b28af77ffe        4 weeks ago         5.58MB
alpine              version1.0          b7b28af77ffe        4 weeks ago         5.58MB
```

**[root@ip-172-31-28-135 docker]# docker tag b7b28af77ffe alpine:version1.1
[root@ip-172-31-28-135 docker]# docker images**

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine              latest              b7b28af77ffe        4 weeks ago         5.58MB
alpine              version1.0          b7b28af77ffe        4 weeks ago         5.58MB
alpine              version1.1          b7b28af77ffe        4 weeks ago         5.58MB
```

**[root@ip-172-31-28-135 docker]# docker tag b7b28af77ffe alpine/new:version1.1
[root@ip-172-31-28-135 docker]# docker images**

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine/new          version1.1          b7b28af77ffe        4 weeks ago         5.58MB
alpine              latest              b7b28af77ffe        4 weeks ago         5.58MB
alpine              version1.0          b7b28af77ffe        4 weeks ago         5.58MB
alpine              version1.1          b7b28af77ffe        4 weeks ago         5.58MB
```
