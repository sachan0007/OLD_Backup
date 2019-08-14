Assignment 1

Run a docker container from "hello-world" image.
Pull "alpine" image from docker registry and see if image is available in your local image list.
Pull some specific version of docker "alpine" image from docker registry.
Run a docker container from local image "alpine" and run an inline command "ls -l" while running container.
Try to take login to container created using "alpine" image.
Detach yourself from the container without making it exit/container kill.
Check running containers and see if you can find out the stopped containers.
Stop running container.
Start container that was stopped earlier.
Try to remove "alpine" image from your local system.

-------------------------------------------------------------------------  

[root@ip-172-31-28-135 docker]# docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete
Digest: sha256:6540fc08ee6e6b7b63468dc3317e3303aae178cb8a45ed3123180328bcc1d20f
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/




[root@ip-172-31-28-135 docker]# docker pull alpine
Using default tag: latest
latest: Pulling from library/alpine
050382585609: Pull complete
Digest: sha256:6a92cd1fcdc8d8cdec60f33dda4db2cb1fcdcacf3410a8e05b3741f44a9b5998
Status: Downloaded newer image for alpine:latest
[root@ip-172-31-28-135 docker]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine              latest              b7b28af77ffe        4 weeks ago         5.58MB
hello-world         latest              fce289e99eb9        7 months ago        1.84kB







[root@ip-172-31-28-135 docker]# docker pull alpine:3.9
3.9: Pulling from library/alpine
e7c96db7181b: Pull complete
Digest: sha256:7746df395af22f04212cd25a92c1d6dbc5a06a0ca9579a229ef43008d4d1302a
Status: Downloaded newer image for alpine:3.9
[root@ip-172-31-28-135 docker]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine              latest              b7b28af77ffe        4 weeks ago         5.58MB
alpine              3.9                 055936d39205        3 months ago        5.53MB
hello-world         latest              fce289e99eb9        7 months ago        1.84kB





[root@ip-172-31-28-135 docker]# docker run alpine ls -l
total 56
drwxr-xr-x    2 root     root          4096 Jul 11 17:29 bin
drwxr-xr-x    5 root     root           340 Aug 13 12:53 dev
drwxr-xr-x    1 root     root          4096 Aug 13 12:53 etc
drwxr-xr-x    2 root     root          4096 Jul 11 17:29 home
drwxr-xr-x    5 root     root          4096 Jul 11 17:29 lib
drwxr-xr-x    5 root     root          4096 Jul 11 17:29 media
drwxr-xr-x    2 root     root          4096 Jul 11 17:29 mnt
drwxr-xr-x    2 root     root          4096 Jul 11 17:29 opt
dr-xr-xr-x  106 root     root             0 Aug 13 12:53 proc
drwx------    2 root     root          4096 Jul 11 17:29 root
drwxr-xr-x    2 root     root          4096 Jul 11 17:29 run
drwxr-xr-x    2 root     root          4096 Jul 11 17:29 sbin
drwxr-xr-x    2 root     root          4096 Jul 11 17:29 srv
dr-xr-xr-x   13 root     root             0 Aug 13 12:53 sys
drwxrwxrwt    2 root     root          4096 Jul 11 17:29 tmp
drwxr-xr-x    7 root     root          4096 Jul 11 17:29 usr
drwxr-xr-x   11 root     root          4096 Jul 11 17:29 var




[root@ip-172-31-28-135 docker]# docker run -it alpine /bin/sh
/ #



[root@ip-172-31-28-135 docker]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
[root@ip-172-31-28-135 docker]# docker run -it alpine /bin/sh
/ # [root@ip-172-31-28-135 docker]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
39801d09689a        alpine              "/bin/sh"           7 seconds ago       Up 6 seconds                            gracious_jepsen




[root@ip-172-31-28-135 docker]# docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                            PORTS               NAMES
39801d09689a        alpine              "/bin/sh"           46 seconds ago      Up 45 seconds                                         gracious_jepsen
02367ac410fc        alpine              "/bin/sh"           2 minutes ago       Exited (137) 2 minutes ago                            trusting_euclid
a6d8ac5d2600        alpine              "/bin/sh"           3 minutes ago       Exited (137) About a minute ago                       suspicious_bhabha
2e134bcf8372        alpine              "/bin/sh"           3 minutes ago       Exited (137) About a minute ago                       objective_liskov
cd99e7eac81c        alpine              "/bin/sh"           3 minutes ago       Exited (137) About a minute ago                       laughing_torvalds
fff5e8ee9805        alpine              "/bin/sh"           3 minutes ago       Exited (137) About a minute ago                       kind_ptolemy
bffe18573bfa        alpine              "/bin/sh"           4 minutes ago       Exited (137) 4 minutes ago                            peaceful_spence
5e41d87cd70c        alpine              "/bin/sh"           8 minutes ago       Exited (130) 4 minutes ago                            laughing_gates
2fe3a19ed0c1        alpine              "/bin/sh"           9 minutes ago       Exited (126) 9 minutes ago                            gifted_brahmagupta
9e42f0a43b0e        alpine              "/bin/sh"           10 minutes ago      Exited (130) 10 minutes ago                           romantic_volhard
f3c5def21427        alpine              "/bin/sh /"         10 minutes ago      Exited (0) 10 minutes ago                             cranky_engelbart
efec2edbb34f        alpine              "/bin/sh /#"        11 minutes ago      Exited (2) 11 minutes ago                             suspicious_spence
cf087072c306        alpine              "/#"                11 minutes ago      Created                                               friendly_curran
1cc3d68d6481        alpine              "ls -l /#"          11 minutes ago      Exited (1) 11 minutes ago                             angry_williams
f357d574853b        alpine              "/bin/sh"           12 minutes ago      Exited (0) 11 minutes ago                             practical_mahavira
0824b8c75ee7        alpine              "/bin/bash"         13 minutes ago      Created                                               angry_bell
a303a54b88b6        alpine              "ls -l"             15 minutes ago      Exited (0) 15 minutes ago                             sleepy_lewin
8739d0dc5929        alpine              "ls -l"             15 minutes ago      Exited (0) 15 minutes ago                             elated_montalcini
49a2cb86d5cb        alpine              "/bin/sh"           21 minutes ago      Exited (0) 21 minutes ago                             zen_shockley
c47ccda0bcb4        alpine              "ls -l"             25 minutes ago      Exited (0) 25 minutes ago                             pensive_chatterjee
b3ec42baa307        hello-world         "/hello"            30 minutes ago      Exited (0) 30 minutes ago                             naughty_khorana






[root@ip-172-31-28-135 docker]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
39801d09689a        alpine              "/bin/sh"           4 minutes ago       Up 4 minutes                            gracious_jepsen
[root@ip-172-31-28-135 docker]# docker stop 39801d09689a
39801d09689a
[root@ip-172-31-28-135 docker]# docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                        PORTS               NAMES
39801d09689a        alpine              "/bin/sh"           5 minutes ago       Exited (137) 16 seconds ago                       gracious_jepsen
[root@ip-172-31-28-135 docker]# docker start 39801d09689a
39801d09689a
[root@ip-172-31-28-135 docker]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
39801d09689a        alpine              "/bin/sh"           5 minutes ago       Up 4 seconds                            gracious_jepsen
[root@ip-172-31-28-135 docker]# docker stop 39801d09689a
39801d09689a
[root@ip-172-31-28-135 docker]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine              latest              b7b28af77ffe        4 weeks ago         5.58MB
[root@ip-172-31-28-135 docker]# docker rmi b7b28af77ffe
Error response from daemon: conflict: unable to delete b7b28af77ffe (must be forced) - image is being used by stopped container 39801d09689a
[root@ip-172-31-28-135 docker]# docker rmi -f b7b28af77ffe
Untagged: alpine:latest
Untagged: alpine@sha256:6a92cd1fcdc8d8cdec60f33dda4db2cb1fcdcacf3410a8e05b3741f44a9b5998
Deleted: sha256:b7b28af77ffec6054d13378df4fdf02725830086c7444d9c278af25312aa39b9
